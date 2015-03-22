package be.chickNorris.helper;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class EmailSender {

	public void sendEmail(ServletContext context, String sender, List<String> addresses, String subject, String templateName,
			String mailBody) {

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
				return new PasswordAuthentication("maximeryckmans@gmail.com", "xxxxxx");
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

			Writer out = new StringWriter();
			template.process(rootMap, out);
			// freemarker stuff ends.

			/* you can add html tags in your text to decorate it. */
			body.setContent(out.toString(), "text/html");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(body);

			// body = new MimeBodyPart();

			// To add sources, might be usefull
			/*
			 * String filename = "hello.txt"; DataSource source = new FileDataSource(filename); body.setDataHandler(new
			 * DataHandler(source)); body.setFileName(filename); multipart.addBodyPart(body);
			 */

			message.setContent(multipart, "text/html");

			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
