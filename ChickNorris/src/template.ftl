<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Chick Norris - Newsletter</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" href="<@spring.url '/EmailTemplate.css'/>"/>
</head>
<body>
	<table align="center" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td id="header" align="center">
				<img id="logo" src="${imgLogoAsBase64}" alt="Chick Norris" />
			</td>
		</tr>
		<tr>
			<td id="bodyText" align="center">
				${body}
			</td>
		</tr>
		<tr>
			<td id="footer">
				<table id="tableFooter" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td id="footerLeft">
							&reg; Pulinx Wim, Maasmechelen 2015<br/>
 							<a id="unsubscribe" href="#">Unsubscribe</a> to this newsletter instantly.
						</td>
						<td align="right">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td><a href="http://www.twitter.com/"> <img id="twitter" src="${imgTwitterAsBase64}" alt="Twitter" border="0" />
									</a></td>
									<td style="font-size: 0; line-height: 0;" width="20">&nbsp;</td>
									<td><a href="http://www.facebook.com/"> <img id="facebook" src="${imgFacebookAsBase64}" alt="Facebook" border="0" />
									</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>