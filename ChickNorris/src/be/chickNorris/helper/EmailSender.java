package be.chickNorris.helper;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;

import be.chickNorris.models.Customer;
import be.chickNorris.models.Order;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class EmailSender {

	public void sendEmail(ServletContext context, String sender, String password, List<String> addresses, String subject,
			String templateName, String mailBody) {

		String logo = context.getRealPath("/resources/images/logo.png");
		String fb = context.getRealPath("/resources/images/facebook.png");

		// here we need to load our settings for things like smtp host,...
		Properties props = new Properties();
		try {
			props.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("settings.properties"));

		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		// if we need to authenticate, otherwise null instead of new authenticator
		Session session = Session.getDefaultInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		try {
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(sender));
			message.setRecipients(Message.RecipientType.TO, emailAddresses(addresses));
			// subject of the mail
			message.setSubject(subject);

			BodyPart body = new MimeBodyPart();
			// freemarker stuff.
			Configuration cfg = new Configuration();
			cfg.setClassForTemplateLoading(this.getClass(), "/");
			// cfg.setDirectoryForTemplateLoading(new File(""));
			// templateName = name of the .ftl template that needs to be injected
			Template template = cfg.getTemplate(templateName);
			/*
			 * rootmap of the template in which you have all the objects which you used in the template Have to think
			 * about how to use this what you see now will be changed with our objects
			 */

			Map<String, Object> rootMap = new HashMap<String, Object>();

			rootMap.put("body", mailBody);
			rootMap.put("imgLogoAsBase64", "<img src=\"cid:image\">");
			rootMap.put("imgFacebookAsBase64", "<img src=\"cid:fb\">");

			Writer out = new StringWriter();
			template.process(rootMap, out);
			// freemarker stuff ends.
			/* you can add html tags in your text to decorate it. */
			body.setContent(out.toString(), "text/html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(body);

			// first part (the html)
			// BodyPart messageBodyPart = new MimeBodyPart();
			// String htmlText = "<img src=\"cid:image\">";
			// messageBodyPart.setContent(htmlText, "text/html");
			// add it
			// multipart.addBodyPart(messageBodyPart);
			// second part (the image)
			body = new MimeBodyPart();
			DataSource fds = new FileDataSource(logo);

			body.setDataHandler(new DataHandler(fds));
			body.setFileName("logo.png");
			body.setDisposition(MimeBodyPart.INLINE);
			body.setHeader("Content-ID", "<image>");

			// add image to the multipart
			multipart.addBodyPart(body);

			body = new MimeBodyPart();
			fds = new FileDataSource(fb);

			body.setDataHandler(new DataHandler(fds));
			body.setFileName("fb.png");
			body.setDisposition(MimeBodyPart.INLINE);
			body.setHeader("Content-ID", "<fb>");

			// add image to the multipart
			multipart.addBodyPart(body);

			// To add sources, might be usefull
			/*
			 * String filename = "hello.txt"; DataSource source = new FileDataSource(filename); body.setDataHandler(new
			 * DataHandler(source)); body.setFileName(filename); multipart.addBodyPart(body);
			 */

			message.setContent(multipart, "text/html");

			Transport.send(message);

		} catch (MessagingException | IOException | TemplateException e) {
			e.printStackTrace();
		}

	}

	public void sendOrderEmail(ServletContext context, String sender, String password, List<String> addresses, String subject,
			String templateName, Customer customer, Order order, String eventDate) {

		String logo = context.getRealPath("/resources/images/logo.png");
		String fb = context.getRealPath("/resources/images/facebook.png");

		// here we need to load our settings for things like smtp host,...
		Properties props = new Properties();
		try {
			props.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("settings.properties"));

		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		// if we need to authenticate, otherwise null instead of new authenticator
		Session session = Session.getDefaultInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		try {
			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(sender));
			message.setRecipients(Message.RecipientType.TO, emailAddresses(addresses));
			// subject of the mail
			message.setSubject(subject);

			BodyPart body = new MimeBodyPart();
			// freemarker stuff.
			Configuration cfg = new Configuration();
			cfg.setClassForTemplateLoading(this.getClass(), "/");
			// cfg.setDirectoryForTemplateLoading(new File(""));
			// templateName = name of the .ftl template that needs to be injected
			Template template = cfg.getTemplate(templateName);
			/*
			 * rootmap of the template in which you have all the objects which you used in the template Have to think
			 * about how to use this what you see now will be changed with our objects
			 */

			Map<String, Object> rootMap = new HashMap<String, Object>();

			rootMap.put("customer", customer);
			rootMap.put("order", order);

			rootMap.put("date", eventDate);
			rootMap.put("imgLogoAsBase64", "<img src=\"cid:image\">");
			rootMap.put("imgFacebookAsBase64", "<img src=\"cid:fb\">");

			Writer out = new StringWriter();
			template.process(rootMap, out);
			// freemarker stuff ends.
			/* you can add html tags in your text to decorate it. */
			body.setContent(out.toString(), "text/html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(body);

			// first part (the html)
			// BodyPart messageBodyPart = new MimeBodyPart();
			// String htmlText = "<img src=\"cid:image\">";
			// messageBodyPart.setContent(htmlText, "text/html");
			// add it
			// multipart.addBodyPart(messageBodyPart);
			// second part (the image)
			body = new MimeBodyPart();
			DataSource fds = new FileDataSource(logo);

			body.setDataHandler(new DataHandler(fds));
			body.setFileName("logo.png");
			body.setDisposition(MimeBodyPart.INLINE);
			body.setHeader("Content-ID", "<image>");

			// add image to the multipart
			multipart.addBodyPart(body);

			body = new MimeBodyPart();
			fds = new FileDataSource(fb);

			body.setDataHandler(new DataHandler(fds));
			body.setFileName("fb.png");
			body.setDisposition(MimeBodyPart.INLINE);
			body.setHeader("Content-ID", "<fb>");

			// add image to the multipart
			multipart.addBodyPart(body);

			// body = new MimeBodyPart();

			// To add sources, might be usefull
			/*
			 * String filename = "hello.txt"; DataSource source = new FileDataSource(filename); body.setDataHandler(new
			 * DataHandler(source)); body.setFileName(filename); multipart.addBodyPart(body);
			 */

			message.setContent(multipart, "text/html");

			Transport.send(message);

		} catch (MessagingException | IOException | TemplateException e) {
			e.printStackTrace();
		}

	}

	private InternetAddress[] emailAddresses(List<String> addresses) throws AddressException {

		InternetAddress[] internetAddresses = new InternetAddress[addresses.size()];

		for (int i = 0; i < addresses.size(); i++) {
			internetAddresses[i] = new InternetAddress(addresses.get(i));
		}
		return internetAddresses;

	}

}
