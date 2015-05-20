<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Chick Norris</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
	<table align="center" border="1" cellpadding="0" cellspacing="0">
		<tr style="background-color: #85150f;">
			<td id="header" align="center">
				${imgLogoAsBase64}
			</td>
		</tr>
		<tr>
			<td id="bodyText" align="center" style="background-color: #dbd1c2;">
				Nieuw order: <br/>
				Voornaam: ${customer.name} <br/>
				Naam: ${customer.surName} <br/>
				Bedrijf: ${customer.companyName} <br/>
				Adres: ${customer.address} <br/>
				BTW-nr: ${customer.VATNumber} <br/>
				Tel-nr: ${customer.telNR} <br/>
				Email: ${customer.email} <br/>
				Gelegenheid: ${order.occasion} <br/>
				Datum: ${date} <br/>
				Aanvangsuur evenement: ${order.eventTime?time} <br/>
				Formule: ${order.formula}<br/>
		
				
			</td>
		</tr>
		<tr>
			<td id="footer" style="background-color: #363636; color: white;">
				<table id="tableFooter" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td id="footerLeft">
							&reg; Pulinx Wim, Maasmechelen 2015<br/>
						</td>
						<td align="right">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									
									<td style="font-size: 0; line-height: 0;" width="20">&nbsp;</td>
						 			<td><a href="http://www.facebook.com/"> ${imgFacebookAsBase64}
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