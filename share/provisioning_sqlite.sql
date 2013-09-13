PRAGMA foreign_keys=OFF;
CREATE TABLE "provisioning"."language_strings" (
  "id" integer  NOT NULL ,
  "code" varchar(63) NOT NULL,
  "language" char(2) NOT NULL,
  "string" text,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."language_strings" VALUES(1,'Client.Billing.MalformedAmount','de','Bitte geben Sie einen ganzzahligen Betrag ein.');
INSERT INTO "provisioning"."language_strings" VALUES(2,'Client.Billing.MalformedAmount','en','Please specify the amount as an integral number.');
INSERT INTO "provisioning"."language_strings" VALUES(3,'Client.Billing.MalformedAmount','es','Por favor, especifique la cantidad como un número entero.');
INSERT INTO "provisioning"."language_strings" VALUES(4,'Client.Billing.MalformedAmount','fr','Spécifiez la quantité comme un numéro intégral.');
INSERT INTO "provisioning"."language_strings" VALUES(5,'Client.Billing.NoPayType','de','Bitte wählen Sie eine Zahlungsweise aus.');
INSERT INTO "provisioning"."language_strings" VALUES(6,'Client.Billing.NoPayType','en','Please choose a payment type.');
INSERT INTO "provisioning"."language_strings" VALUES(7,'Client.Billing.NoPayType','es','Por favor, elija un método de pago.');
INSERT INTO "provisioning"."language_strings" VALUES(8,'Client.Billing.NoPayType','fr','Choisissez un type de paiement.');
INSERT INTO "provisioning"."language_strings" VALUES(9,'Client.Syntax.Date','de','Bitte geben Sie ein gültiges Datum ein.');
INSERT INTO "provisioning"."language_strings" VALUES(10,'Client.Syntax.Date','en','Invalid date format.');
INSERT INTO "provisioning"."language_strings" VALUES(11,'Client.Syntax.Date','es','Formato de fecha inválido.');
INSERT INTO "provisioning"."language_strings" VALUES(12,'Client.Syntax.Date','fr','Format date invalide.');
INSERT INTO "provisioning"."language_strings" VALUES(13,'Client.Syntax.Email','de','Ungültige E-Mail Adresse.');
INSERT INTO "provisioning"."language_strings" VALUES(14,'Client.Syntax.Email','en','Invalid e-mail address.');
INSERT INTO "provisioning"."language_strings" VALUES(15,'Client.Syntax.Email','es','Dirección de correo inválida.');
INSERT INTO "provisioning"."language_strings" VALUES(16,'Client.Syntax.Email','fr','Adresse électronique Invalide.');
INSERT INTO "provisioning"."language_strings" VALUES(17,'Client.Syntax.MalformedDomain','de','Ungültige Zeichen in der Domain.');
INSERT INTO "provisioning"."language_strings" VALUES(18,'Client.Syntax.MalformedDomain','en','Invalid characters in domain.');
INSERT INTO "provisioning"."language_strings" VALUES(19,'Client.Syntax.MalformedDomain','es','Caracteres inválidos en dominio.');
INSERT INTO "provisioning"."language_strings" VALUES(20,'Client.Syntax.MalformedDomain','fr','Caractères Invalides dans domaine.');
INSERT INTO "provisioning"."language_strings" VALUES(21,'Client.Syntax.MalformedUsername','de','Ungültige Zeichen im Usernamen.');
INSERT INTO "provisioning"."language_strings" VALUES(22,'Client.Syntax.MalformedUsername','en','Invalid characters in username.');
INSERT INTO "provisioning"."language_strings" VALUES(23,'Client.Syntax.MalformedUsername','es','Caracteres inválidos en el nombre de usuario.');
INSERT INTO "provisioning"."language_strings" VALUES(24,'Client.Syntax.MalformedUsername','fr','Nom d''utilisateur Invalides.');
INSERT INTO "provisioning"."language_strings" VALUES(25,'Client.Syntax.MissingDomain','de','Bitte geben Sie Ihren Usernamen inklusive Domain ein.');
INSERT INTO "provisioning"."language_strings" VALUES(26,'Client.Syntax.MissingDomain','en','Please enter username including domain.');
INSERT INTO "provisioning"."language_strings" VALUES(27,'Client.Syntax.MissingDomain','es','Por favor, introduzca el nombre de usuario incluyendo el dominio.');
INSERT INTO "provisioning"."language_strings" VALUES(28,'Client.Syntax.MissingDomain','fr','Entrez nom d''utilisateur incluant le domaine.');
INSERT INTO "provisioning"."language_strings" VALUES(29,'Client.Syntax.MissingParam','en','A mandatory parameter is missing.');
INSERT INTO "provisioning"."language_strings" VALUES(30,'Client.Syntax.MissingParam','de','Ein verplichtender Parameter fehlt.');
INSERT INTO "provisioning"."language_strings" VALUES(31,'Client.Syntax.MissingParam','es','Falta un campo obligatorio.');
INSERT INTO "provisioning"."language_strings" VALUES(32,'Client.Syntax.MissingParam','fr','Il manque un paramètre obligatoire.');
INSERT INTO "provisioning"."language_strings" VALUES(33,'Client.Syntax.MalformedUri','en','Invalid SIP URI.');
INSERT INTO "provisioning"."language_strings" VALUES(34,'Client.Syntax.MalformedUri','de','Ungültige SIP URI.');
INSERT INTO "provisioning"."language_strings" VALUES(35,'Client.Syntax.MalformedUri','es','Caracteres inválidos en el URI SIP.');
INSERT INTO "provisioning"."language_strings" VALUES(36,'Client.Syntax.MalformedUri','fr','SIP URI Invalides.');
INSERT INTO "provisioning"."language_strings" VALUES(37,'Client.Syntax.MissingUsername','de','Bitte geben Sie einen Usernamen ein.');
INSERT INTO "provisioning"."language_strings" VALUES(38,'Client.Syntax.MissingUsername','en','Please enter a username.');
INSERT INTO "provisioning"."language_strings" VALUES(39,'Client.Syntax.MissingUsername','es','Por favor,introduzca un nombre de usuario.');
INSERT INTO "provisioning"."language_strings" VALUES(40,'Client.Syntax.MissingUsername','fr','Entrez un nom d''utilisateur.');
INSERT INTO "provisioning"."language_strings" VALUES(41,'Client.Syntax.VoiceBoxPin','de','Bitte geben Sie 4 Ziffern ein oder lassen Sie das Feld leer.');
INSERT INTO "provisioning"."language_strings" VALUES(42,'Client.Syntax.VoiceBoxPin','en','Please enter 4 digits, or leave the textfield empty.');
INSERT INTO "provisioning"."language_strings" VALUES(43,'Client.Syntax.VoiceBoxPin','es','Por favor, introduzca 4 dígitos o deje el campo en blanco.');
INSERT INTO "provisioning"."language_strings" VALUES(44,'Client.Syntax.VoiceBoxPin','fr','Entrez 4 chiffres, ou laissez le champ texte vide.');
INSERT INTO "provisioning"."language_strings" VALUES(45,'Client.Voip.AssignedExtension','de','Die gewählte Durchwahl ist bereits vergeben.');
INSERT INTO "provisioning"."language_strings" VALUES(46,'Client.Voip.AssignedExtension','en','This extension is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(47,'Client.Voip.AssignedExtension','es','Esta extensión ya se encuentra en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(48,'Client.Voip.AssignedExtension','fr','Cette extension est déjà utilisée.');
INSERT INTO "provisioning"."language_strings" VALUES(49,'Client.Voip.AssignedNumber','de','Die Telefonnummer ist nicht mehr verfügbar.');
INSERT INTO "provisioning"."language_strings" VALUES(50,'Client.Voip.AssignedNumber','en','The specified telephone number is not available any more.');
INSERT INTO "provisioning"."language_strings" VALUES(51,'Client.Voip.AssignedNumber','es','Este número ya no se encuentra disponible.');
INSERT INTO "provisioning"."language_strings" VALUES(52,'Client.Voip.AssignedNumber','fr','Le numéro de téléphone indiqué n''est désormais plus disponible.');
INSERT INTO "provisioning"."language_strings" VALUES(53,'Client.Voip.AuthFailed','de','Login fehlgeschlagen, bitte überprüfen Sie Ihren Usernamen und Ihr Passwort.');
INSERT INTO "provisioning"."language_strings" VALUES(54,'Client.Voip.AuthFailed','en','Login failed, please verify username and password.');
INSERT INTO "provisioning"."language_strings" VALUES(55,'Client.Voip.AuthFailed','es','Acceso denegado. Por favor, compruebe el nombre de usuario y la contraseña.');
INSERT INTO "provisioning"."language_strings" VALUES(56,'Client.Voip.AuthFailed','fr','L''établissement de la connexion a échoué, vérifiez le nom d’utilisateur et le mot de passe.');
INSERT INTO "provisioning"."language_strings" VALUES(57,'Client.Voip.ChooseNumber','de','Bitte wählen Sie eine Nummer aus der Liste.');
INSERT INTO "provisioning"."language_strings" VALUES(58,'Client.Voip.ChooseNumber','en','Please select a number from the list.');
INSERT INTO "provisioning"."language_strings" VALUES(59,'Client.Voip.ChooseNumber','es','Por favor, seleccione un número de la lista.');
INSERT INTO "provisioning"."language_strings" VALUES(60,'Client.Voip.ChooseNumber','fr','Choisissez s''il vous plaît un numéro de la liste.');
INSERT INTO "provisioning"."language_strings" VALUES(61,'Client.Voip.DeniedNumber','de','Die Telefonnummer ist nicht mehr verfügbar.');
INSERT INTO "provisioning"."language_strings" VALUES(62,'Client.Voip.DeniedNumber','en','The specified telephonenumber is not available.');
INSERT INTO "provisioning"."language_strings" VALUES(63,'Client.Voip.DeniedNumber','es','Este número no se encuentra disponible.');
INSERT INTO "provisioning"."language_strings" VALUES(64,'Client.Voip.DeniedNumber','fr','Le numéro de téléphone indiqué n''est pas disponible.');
INSERT INTO "provisioning"."language_strings" VALUES(65,'Client.Voip.ExistingSubscriber','de','Dieser Username ist nicht mehr verfügbar.');
INSERT INTO "provisioning"."language_strings" VALUES(66,'Client.Voip.ExistingSubscriber','en','This username is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(67,'Client.Voip.ExistingSubscriber','es','El nombre de usuario ya se encuentra en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(68,'Client.Voip.ExistingSubscriber','fr','Ce nom d''utilisateur est déjà utilisé');
INSERT INTO "provisioning"."language_strings" VALUES(69,'Client.Voip.ForwardSelect','de','Bitte wählen Sie unter welchen Umständen ein Anruf weitergeleitet werden soll.');
INSERT INTO "provisioning"."language_strings" VALUES(70,'Client.Voip.ForwardSelect','en','Please select when to forward a call.');
INSERT INTO "provisioning"."language_strings" VALUES(71,'Client.Voip.ForwardSelect','es','Por favor, seleccione cuándo desea reenviar llamadas.');
INSERT INTO "provisioning"."language_strings" VALUES(72,'Client.Voip.ForwardSelect','fr','Choisissez quand transféré un appel.');
INSERT INTO "provisioning"."language_strings" VALUES(73,'Client.Voip.IncorrectPass','de','Das Passwort ist nicht korrekt, bitte überprüfen Sie die Eingabe.');
INSERT INTO "provisioning"."language_strings" VALUES(74,'Client.Voip.IncorrectPass','en','Wrong password, please verify your input.');
INSERT INTO "provisioning"."language_strings" VALUES(75,'Client.Voip.IncorrectPass','es','Contraseña incorrecta. Por favor, verifique que la ha escrito correctamente.');
INSERT INTO "provisioning"."language_strings" VALUES(76,'Client.Voip.IncorrectPass','fr','Mauvais mot de passe, vérifiez votre saisie.');
INSERT INTO "provisioning"."language_strings" VALUES(77,'Client.Voip.InputErrorFound','de','Fehlende oder fehlerhafte Eingabedaten gefunden.');
INSERT INTO "provisioning"."language_strings" VALUES(78,'Client.Voip.InputErrorFound','en','Missing or invalid input found.');
INSERT INTO "provisioning"."language_strings" VALUES(79,'Client.Voip.InputErrorFound','es','Entrada inválida o ausente.');
INSERT INTO "provisioning"."language_strings" VALUES(80,'Client.Voip.InputErrorFound','fr','La saisie trouvée est invalide.');
INSERT INTO "provisioning"."language_strings" VALUES(81,'Client.Voip.MalformedAc','de','Ungültige Ortsvorwahl, bitte geben Sie nur Ziffern, ohne führende Null ein.');
INSERT INTO "provisioning"."language_strings" VALUES(82,'Client.Voip.MalformedAc','en','Invalid area code, please use digits only and don''t enter a leading zero.');
INSERT INTO "provisioning"."language_strings" VALUES(83,'Client.Voip.MalformedAc','es','Código de área erroneo. Por favor, use dígitos únicamente y no introduzca un cero inicial.');
INSERT INTO "provisioning"."language_strings" VALUES(84,'Client.Voip.MalformedAc','fr','L''indicatif invalide, utilisez uniquement des chiffres et n''entrez pas dans un zéro principal.');
INSERT INTO "provisioning"."language_strings" VALUES(85,'Client.Voip.MalformedCc','de','Ungültige Ländervorwahl, bitte geben Sie nur Ziffern, ohne führende Nullen ein.');
INSERT INTO "provisioning"."language_strings" VALUES(86,'Client.Voip.MalformedCc','en','Invalid country code, please use digits only, without leading zeros.');
INSERT INTO "provisioning"."language_strings" VALUES(87,'Client.Voip.MalformedCc','es','Código de país erroneo. Por favor, use dígitos únicamente y no introduzca un cero inicial.');
INSERT INTO "provisioning"."language_strings" VALUES(88,'Client.Voip.MalformedCc','fr','Le code du pays est invalide, utilisez uniquement des chiffres, sans zéros principaux.');
INSERT INTO "provisioning"."language_strings" VALUES(89,'Client.Voip.MalformedSn','de','Ungültige Rufnummer, bitte geben Sie nur Ziffern ein. (Die Nummer darf nicht mit Null beginnen.)');
INSERT INTO "provisioning"."language_strings" VALUES(90,'Client.Voip.MalformedSn','en','Invalid subscriber number, please use digits only. (The number can not start with a zero.)');
INSERT INTO "provisioning"."language_strings" VALUES(91,'Client.Voip.MalformedSn','es','Número de suscriptor inválido. Por favor, use dígitos unicamente. (El número no puede empezar por cero).');
INSERT INTO "provisioning"."language_strings" VALUES(92,'Client.Voip.MalformedSn','fr','Le numéro de l''abonné est invalide, utilisez uniquement des chiffres. (Le numéro ne peut pas commencer par un zéro).');
INSERT INTO "provisioning"."language_strings" VALUES(93,'Client.Voip.MalformedNumber','de','Ungültige Eingabe, bitte geben Sie Rufnummern numerisch und inklusive Vorwahl an.');
INSERT INTO "provisioning"."language_strings" VALUES(94,'Client.Voip.MalformedNumber','en','Invalid number, please use digits only and include the area code.');
INSERT INTO "provisioning"."language_strings" VALUES(95,'Client.Voip.MalformedNumber','es','Número inválido. Por favor, use dígitos únicamente e incluya el código de área.');
INSERT INTO "provisioning"."language_strings" VALUES(96,'Client.Voip.MalformedNumber','fr','Le numéro est invalide, utilisez uniquement des chiffres et incluez l''indicatif.');
INSERT INTO "provisioning"."language_strings" VALUES(97,'Client.Voip.MalformedNumberPattern','de','Ungültiger Eintrag, bitte verwenden Sie nur Ziffern und "?" bzw. "*" als Platzhalter für ein, bzw. beliebig viele Zeichen.');
INSERT INTO "provisioning"."language_strings" VALUES(98,'Client.Voip.MalformedNumberPattern','en','Invalid entry, please use numbers only and "?" or "*" as placeholder for one or an arbitrary number of digits.');
INSERT INTO "provisioning"."language_strings" VALUES(99,'Client.Voip.MalformedNumberPattern','es','Entrada inválida. Por favor, use dígitos únicamente y "?" o "*" como comodines para uno o un número arbitrario de dígitos.');
INSERT INTO "provisioning"."language_strings" VALUES(100,'Client.Voip.MalformedNumberPattern','fr','Saisie invalide, utilisez uniquement des numéros et "?" Ou "*" comme détenteur d’endroit pour un ou un numéro arbitraire de chiffres.');
INSERT INTO "provisioning"."language_strings" VALUES(101,'Client.Voip.MalformedTargetClass','de','Bitte wählen Sie ein Ziel.');
INSERT INTO "provisioning"."language_strings" VALUES(102,'Client.Voip.MalformedTargetClass','en','Please choose a target.');
INSERT INTO "provisioning"."language_strings" VALUES(103,'Client.Voip.MalformedTargetClass','es','Por favor, escoja un objetivo.');
INSERT INTO "provisioning"."language_strings" VALUES(104,'Client.Voip.MalformedTargetClass','fr','Choisissez une destination (cible).');
INSERT INTO "provisioning"."language_strings" VALUES(105,'Client.Voip.MalformedTarget','de','Ungültige Zielangabe, bitte verwenden Sie entweder nur Ziffern, oder geben Sie einen gültigen SIP User ein.');
INSERT INTO "provisioning"."language_strings" VALUES(106,'Client.Voip.MalformedTarget','en','Invalid destination, please use digits only or enter a valid SIP URI.');
INSERT INTO "provisioning"."language_strings" VALUES(107,'Client.Voip.MalformedTarget','es','Destino inválido. Por favor, use dígitos exclusivamente o introduzca una SIP URI válida.');
INSERT INTO "provisioning"."language_strings" VALUES(108,'Client.Voip.MalformedTarget','fr','La destination invalide, utilisez uniquement des chiffres ou entrez dans une SIP URI valide');
INSERT INTO "provisioning"."language_strings" VALUES(109,'Client.Voip.MalformedTimeout','de','Ungültiger Timeout, bitte verwenden Sie nur Ziffern.');
INSERT INTO "provisioning"."language_strings" VALUES(110,'Client.Voip.MalformedTimeout','en','Invalid timeout, please use digits only.');
INSERT INTO "provisioning"."language_strings" VALUES(111,'Client.Voip.MalformedTimeout','es','Invalid timeout, please use digits only.');
INSERT INTO "provisioning"."language_strings" VALUES(112,'Client.Voip.MalformedTimeout','fr','Invalid timeout, please use digits only.');
INSERT INTO "provisioning"."language_strings" VALUES(113,'Client.Voip.MissingName','de','Bitte geben Sie zumindest Vor- oder Nachnamen ein.');
INSERT INTO "provisioning"."language_strings" VALUES(114,'Client.Voip.MissingName','en','Please enter at least a first or last name.');
INSERT INTO "provisioning"."language_strings" VALUES(115,'Client.Voip.MissingName','es','Por favor, introduzca al menos un nombre o un apellido.');
INSERT INTO "provisioning"."language_strings" VALUES(116,'Client.Voip.MissingName','fr','Entrez au moins un prénom ou nom de famille.');
INSERT INTO "provisioning"."language_strings" VALUES(117,'Client.Voip.MissingOldPass','de','Bitte geben Sie Ihr aktuelles Passwort ein.');
INSERT INTO "provisioning"."language_strings" VALUES(118,'Client.Voip.MissingOldPass','en','Please enter your current password.');
INSERT INTO "provisioning"."language_strings" VALUES(119,'Client.Voip.MissingOldPass','es','Por favor, introduzca su contraseña actual.');
INSERT INTO "provisioning"."language_strings" VALUES(120,'Client.Voip.MissingOldPass','fr','Entrez votre mot de passe actuel.');
INSERT INTO "provisioning"."language_strings" VALUES(121,'Client.Voip.MissingPass2','de','Bitte geben Sie das Passwort in beide Felder ein.');
INSERT INTO "provisioning"."language_strings" VALUES(122,'Client.Voip.MissingPass2','en','Please enter the password in both fields.');
INSERT INTO "provisioning"."language_strings" VALUES(123,'Client.Voip.MissingPass2','es','Por favor, introduzca la contraseña en ambos campos.');
INSERT INTO "provisioning"."language_strings" VALUES(124,'Client.Voip.MissingPass2','fr','Entrez le mot de passe dans les deux champs.');
INSERT INTO "provisioning"."language_strings" VALUES(125,'Client.Voip.MissingPass','de','Bitte geben Sie ein Passwort ein.');
INSERT INTO "provisioning"."language_strings" VALUES(126,'Client.Voip.MissingPass','en','Please enter a password.');
INSERT INTO "provisioning"."language_strings" VALUES(127,'Client.Voip.MissingPass','es','Por favor, introduzca una contraseña.');
INSERT INTO "provisioning"."language_strings" VALUES(128,'Client.Voip.MissingPass','fr','Entrez votre mot de passe.');
INSERT INTO "provisioning"."language_strings" VALUES(129,'Client.Voip.MissingRingtimeout','de','Bitte wählen Sie die Zeitdauer nach der Anrufe weitergeleitet werden sollen. (In Sekunden, von 5 bis 300).');
INSERT INTO "provisioning"."language_strings" VALUES(130,'Client.Voip.MissingRingtimeout','en','Please specify a timeout for incoming calls. (In seconds from 5 to 300).');
INSERT INTO "provisioning"."language_strings" VALUES(131,'Client.Voip.MissingRingtimeout','es','Por favor, especifique un tiempo límite para llamadas entrantes. (En segundos, en el rango de 5 a 300).');
INSERT INTO "provisioning"."language_strings" VALUES(132,'Client.Voip.MissingRingtimeout','fr','Spécifiez un temps mort pour des appels entrants. (En secondes 5 à 300).');
INSERT INTO "provisioning"."language_strings" VALUES(133,'Client.Voip.NoSuchDomain','de','Die angegebene Domain existiert nicht in der Datenbank.');
INSERT INTO "provisioning"."language_strings" VALUES(134,'Client.Voip.NoSuchDomain','en','The specified domain does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(135,'Client.Voip.NoSuchDomain','es','El dominio especificado no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(136,'Client.Voip.NoSuchDomain','fr','Le domaine indiqué n''existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(137,'Client.Voip.NoSuchNumber','de','Die Telefonnummer ist nicht verfügbar.');
INSERT INTO "provisioning"."language_strings" VALUES(138,'Client.Voip.NoSuchNumber','en','The specified telephonenumber is not available.');
INSERT INTO "provisioning"."language_strings" VALUES(139,'Client.Voip.NoSuchNumber','es','El número especificado no se encuentra disponible.');
INSERT INTO "provisioning"."language_strings" VALUES(140,'Client.Voip.NoSuchNumber','fr','Le numéro de téléphone indiqué n''est pas disponible.');
INSERT INTO "provisioning"."language_strings" VALUES(141,'Client.Voip.PassLength','de','Das Passwort ist zu kurz, bitte verwenden Sie mindestens 6 Zeichen.');
INSERT INTO "provisioning"."language_strings" VALUES(142,'Client.Voip.PassLength','en','The password is too short, please use 6 characters at least.');
INSERT INTO "provisioning"."language_strings" VALUES(143,'Client.Voip.PassLength','es','La contraseña es demasiado corta. Por favor use una de al menos 6 caracteres.');
INSERT INTO "provisioning"."language_strings" VALUES(144,'Client.Voip.PassLength','fr','Le mot de passe est trop court, utilisez au moins 6 caractères.');
INSERT INTO "provisioning"."language_strings" VALUES(145,'Client.Voip.PassNoMatch','de','Die Passwörter stimmen nicht überein, bitte überprüfen Sie die Eingabe.');
INSERT INTO "provisioning"."language_strings" VALUES(146,'Client.Voip.PassNoMatch','en','Passwords do not match, please try again.');
INSERT INTO "provisioning"."language_strings" VALUES(147,'Client.Voip.PassNoMatch','es','Las contraseñas no coinciden. Por favor, inténtelo de nuevo.');
INSERT INTO "provisioning"."language_strings" VALUES(148,'Client.Voip.PassNoMatch','fr','Les mots de passe ne correspondent pas, essayez de nouveau.');
INSERT INTO "provisioning"."language_strings" VALUES(149,'Client.Voip.ToManyPreference','de','Maximale Anzahl von Einträgen erreicht.');
INSERT INTO "provisioning"."language_strings" VALUES(150,'Client.Voip.ToManyPreference','en','Maximum number of entries reached.');
INSERT INTO "provisioning"."language_strings" VALUES(151,'Client.Voip.ToManyPreference','es','Alcanzado el número máximo de entradas.');
INSERT INTO "provisioning"."language_strings" VALUES(152,'Client.Voip.ToManyPreference','fr','Le nombre maximal d''entrées est atteint.');
INSERT INTO "provisioning"."language_strings" VALUES(153,'Server.Billing.Success','de','Ihr Konto wurde erfolgreich aufgeladen.');
INSERT INTO "provisioning"."language_strings" VALUES(154,'Server.Billing.Success','en','Your account has been topped up successfully.');
INSERT INTO "provisioning"."language_strings" VALUES(155,'Server.Billing.Success','es','Su cobro se ha realizado correctamente.');
INSERT INTO "provisioning"."language_strings" VALUES(156,'Server.Billing.Success','fr','Votre compte a été rechargé avec succès.');
INSERT INTO "provisioning"."language_strings" VALUES(157,'Server.Internal','de','Ein interner Systemfehler ist aufgetreten, bitte versuchen Sie es später wieder.');
INSERT INTO "provisioning"."language_strings" VALUES(158,'Server.Internal','en','Internal error, please try again later.');
INSERT INTO "provisioning"."language_strings" VALUES(159,'Server.Internal','es','Se ha detectado un error interno. Por favor, inténtelo de nuevo más tarde.');
INSERT INTO "provisioning"."language_strings" VALUES(160,'Server.Internal','fr','Erreur interne, essayez de nouveau plus tard.');
INSERT INTO "provisioning"."language_strings" VALUES(161,'Server.Paypal.Error','de','Bitte folgen Sie den Anweisungen auf der PayPal Webseite um die Überweisung durchzuführen.');
INSERT INTO "provisioning"."language_strings" VALUES(162,'Server.Paypal.Error','en','Please follow the instrutions on the PayPal website to transfer the credit.');
INSERT INTO "provisioning"."language_strings" VALUES(163,'Server.Paypal.Error','es','Por favor, siga las instrucciones en la web de PayPal para realizar la transferencia.');
INSERT INTO "provisioning"."language_strings" VALUES(164,'Server.Paypal.Error','fr','Suivez s''il vous plaît les instructions sur le site Web PayPal pour transférer le crédit.');
INSERT INTO "provisioning"."language_strings" VALUES(165,'Server.Paypal.Fault','de','Fehler in der Kommunikation mit PayPal, bitte versuchen Sie es etwas später noch einmal.');
INSERT INTO "provisioning"."language_strings" VALUES(166,'Server.Paypal.Fault','en','Communication error with PayPal server, please try again later.');
INSERT INTO "provisioning"."language_strings" VALUES(167,'Server.Paypal.Fault','es','No se puede comunicar con el servidor de PayPal. Por favor, inténtelo de nuevo más tarde.');
INSERT INTO "provisioning"."language_strings" VALUES(168,'Server.Paypal.Fault','fr','Erreur de communication avec le serveur PayPal, essayez de nouveau plus tard.');
INSERT INTO "provisioning"."language_strings" VALUES(169,'Server.Paypal.Invalid','de','Fehler in der Kommunikation mit PayPal, bitte versuchen Sie es etwas später noch einmal.');
INSERT INTO "provisioning"."language_strings" VALUES(170,'Server.Paypal.Invalid','en','Communication error with PayPal server, please try again later.');
INSERT INTO "provisioning"."language_strings" VALUES(171,'Server.Paypal.Invalid','es','Ha ocurrido un error de comunicación con el servidor de PayPal. Por favor, inténtelo de nuevo más tarde.');
INSERT INTO "provisioning"."language_strings" VALUES(172,'Server.Paypal.Invalid','fr','Erreur de communication avec le serveur PayPal, essayez de nouveau plus tard.');
INSERT INTO "provisioning"."language_strings" VALUES(173,'Server.Voip.RemovedContact','de','Der Kontakteintrag wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(174,'Server.Voip.RemovedContact','en','The contact entry has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(175,'Server.Voip.RemovedContact','es','El contacto ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(176,'Server.Voip.RemovedContact','fr','Le contact saisi a été supprimée.');
INSERT INTO "provisioning"."language_strings" VALUES(177,'Server.Voip.RemovedRegisteredContact','de','Die Registrierung wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(178,'Server.Voip.RemovedRegisteredContact','en','The registered contact has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(179,'Server.Voip.RemovedRegisteredContact','es','El contacto ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(180,'Server.Voip.RemovedRegisteredContact','fr','Le contact enregistré a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(181,'Server.Voip.AddedRegisteredContact','de','Permanenter Registrierungseintrag wurde hinzugefügt.');
INSERT INTO "provisioning"."language_strings" VALUES(182,'Server.Voip.AddedRegisteredContact','en','Permanent registration contact has been added.');
INSERT INTO "provisioning"."language_strings" VALUES(183,'Server.Voip.AddedRegisteredContact','es','Contacto permanente guardado correctamente.');
INSERT INTO "provisioning"."language_strings" VALUES(184,'Server.Voip.AddedRegisteredContact','fr','Le contact enregistré a été ajouté.');
INSERT INTO "provisioning"."language_strings" VALUES(185,'Server.Voip.RemovedVoicemail','de','Die Sprachnachricht wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(186,'Server.Voip.RemovedVoicemail','en','The voicemail has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(187,'Server.Voip.RemovedVoicemail','es','El buzón de voz ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(188,'Server.Voip.RemovedVoicemail','fr','La boîte vocale a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(189,'Server.Voip.SavedContact','de','Der Kontakteintrag wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(190,'Server.Voip.SavedContact','en','The contact entry bas been saved.');
INSERT INTO "provisioning"."language_strings" VALUES(191,'Server.Voip.SavedContact','es','Contacto guardado correctamente.');
INSERT INTO "provisioning"."language_strings" VALUES(192,'Server.Voip.SavedContact','fr','Le contact saisi a été enregistré.');
INSERT INTO "provisioning"."language_strings" VALUES(193,'Server.Voip.SavedPass','de','Ihr Passwort wurde erfolgreich geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(194,'Server.Voip.SavedPass','en','The password has been changed successfully.');
INSERT INTO "provisioning"."language_strings" VALUES(195,'Server.Voip.SavedPass','es','Su contraseña ha sido modificada correctamente.');
INSERT INTO "provisioning"."language_strings" VALUES(196,'Server.Voip.SavedPass','fr','Le mot de passe a été changé avec succès.');
INSERT INTO "provisioning"."language_strings" VALUES(197,'Server.Voip.SavedSettings','de','Ihre Einstellungen wurden gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(198,'Server.Voip.SavedSettings','en','Your settings have been saved.');
INSERT INTO "provisioning"."language_strings" VALUES(199,'Server.Voip.SavedSettings','es','Sus preferencias han sido guardadas.');
INSERT INTO "provisioning"."language_strings" VALUES(200,'Server.Voip.SavedSettings','fr','Vos paramètres ont été enregistrés.');
INSERT INTO "provisioning"."language_strings" VALUES(201,'Server.Voip.SubscriberCreated','de','Der Benutzer wurde gespeichert und kann jetzt konfiguriert werden.');
INSERT INTO "provisioning"."language_strings" VALUES(202,'Server.Voip.SubscriberCreated','en','The user has been saved and may be configured.');
INSERT INTO "provisioning"."language_strings" VALUES(203,'Server.Voip.SubscriberCreated','es','El usuario ha sido guardado y puede ser configurado.');
INSERT INTO "provisioning"."language_strings" VALUES(204,'Server.Voip.SubscriberCreated','fr','L''utilisateur a été enregistré et peut être configuré.');
INSERT INTO "provisioning"."language_strings" VALUES(205,'Server.Voip.SubscriberDeleted','de','Der Benutzer wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(206,'Server.Voip.SubscriberDeleted','en','The user has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(207,'Server.Voip.SubscriberDeleted','es','El usuario ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(208,'Server.Voip.SubscriberDeleted','fr','L''utilisateur a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(209,'Server.System.RRDOpenError','en','Failed to open RRD file.');
INSERT INTO "provisioning"."language_strings" VALUES(210,'Server.System.RRDOpenError','de','Fehler beim Öffnen der RRD-Datei.');
INSERT INTO "provisioning"."language_strings" VALUES(211,'Server.System.RRDOpenError','es','No se ha podido abrir el ficherp RRD.');
INSERT INTO "provisioning"."language_strings" VALUES(212,'Server.System.RRDOpenError','fr','Tentative d’ouverture du fichier RRD à échoué.');
INSERT INTO "provisioning"."language_strings" VALUES(213,'Server.System.RRDBinmodeError','en','Failed to switch to BIN mode in RRD file.');
INSERT INTO "provisioning"."language_strings" VALUES(214,'Server.System.RRDBinmodeError','de','Fehler beim Wechsel auf BIN mode in RRD-Datei.');
INSERT INTO "provisioning"."language_strings" VALUES(215,'Server.System.RRDBinmodeError','es','No se ha podido pasar a modo BIN en el fichero RRD.');
INSERT INTO "provisioning"."language_strings" VALUES(216,'Server.System.RRDBinmodeError','fr','Echec de switch en mode BIN dans le fichier RRD.');
INSERT INTO "provisioning"."language_strings" VALUES(217,'Server.System.RRDReadError','en','Failed to read RRD file.');
INSERT INTO "provisioning"."language_strings" VALUES(218,'Server.System.RRDReadError','de','Fehler beim Lesen der RRD-Datei.');
INSERT INTO "provisioning"."language_strings" VALUES(219,'Server.System.RRDReadError','es','No se ha podido leer el fichero RRD.');
INSERT INTO "provisioning"."language_strings" VALUES(220,'Server.System.RRDReadError','fr','Tentative de lecture du fichier RRD à échoué.');
INSERT INTO "provisioning"."language_strings" VALUES(221,'Web.Addressbook.Fax','de','Fax');
INSERT INTO "provisioning"."language_strings" VALUES(222,'Web.Addressbook.Fax','en','Fax');
INSERT INTO "provisioning"."language_strings" VALUES(223,'Web.Addressbook.Fax','es','Fax');
INSERT INTO "provisioning"."language_strings" VALUES(224,'Web.Addressbook.Fax','fr','Fax');
INSERT INTO "provisioning"."language_strings" VALUES(225,'Web.Addressbook.Home','de','Privat');
INSERT INTO "provisioning"."language_strings" VALUES(226,'Web.Addressbook.Home','en','Home');
INSERT INTO "provisioning"."language_strings" VALUES(227,'Web.Addressbook.Home','es','Domicilio');
INSERT INTO "provisioning"."language_strings" VALUES(228,'Web.Addressbook.Home','fr','Domicile');
INSERT INTO "provisioning"."language_strings" VALUES(229,'Web.Addressbook.Mobile','de','Mobil');
INSERT INTO "provisioning"."language_strings" VALUES(230,'Web.Addressbook.Mobile','en','Mobile');
INSERT INTO "provisioning"."language_strings" VALUES(231,'Web.Addressbook.Mobile','es','Móvil');
INSERT INTO "provisioning"."language_strings" VALUES(232,'Web.Addressbook.Mobile','fr','Portable');
INSERT INTO "provisioning"."language_strings" VALUES(233,'Web.Addressbook.Office','de','Büro');
INSERT INTO "provisioning"."language_strings" VALUES(234,'Web.Addressbook.Office','en','Office');
INSERT INTO "provisioning"."language_strings" VALUES(235,'Web.Addressbook.Office','es','Trabajo');
INSERT INTO "provisioning"."language_strings" VALUES(236,'Web.Addressbook.Office','fr','Travail');
INSERT INTO "provisioning"."language_strings" VALUES(237,'Web.MissingRedInput','de','Bitte füllen Sie alle rot umrandeten Felder aus.');
INSERT INTO "provisioning"."language_strings" VALUES(238,'Web.MissingRedInput','en','Please fill in at least all red bordered input fields.');
INSERT INTO "provisioning"."language_strings" VALUES(239,'Web.MissingRedInput','es','Por favor, rellene al menos todos los campos con borde rojo.');
INSERT INTO "provisioning"."language_strings" VALUES(240,'Web.MissingRedInput','fr','Remplissez au moins tous les champs de saisie de bordure rouges.');
INSERT INTO "provisioning"."language_strings" VALUES(241,'Web.Months.01','de','Jänner');
INSERT INTO "provisioning"."language_strings" VALUES(242,'Web.Months.01','en','January');
INSERT INTO "provisioning"."language_strings" VALUES(243,'Web.Months.01','es','Enero');
INSERT INTO "provisioning"."language_strings" VALUES(244,'Web.Months.01','fr','Janvier');
INSERT INTO "provisioning"."language_strings" VALUES(245,'Web.Months.02','de','Februar');
INSERT INTO "provisioning"."language_strings" VALUES(246,'Web.Months.02','en','February');
INSERT INTO "provisioning"."language_strings" VALUES(247,'Web.Months.02','es','Febrero');
INSERT INTO "provisioning"."language_strings" VALUES(248,'Web.Months.02','fr','Février');
INSERT INTO "provisioning"."language_strings" VALUES(249,'Web.Months.03','de','März');
INSERT INTO "provisioning"."language_strings" VALUES(250,'Web.Months.03','en','March');
INSERT INTO "provisioning"."language_strings" VALUES(251,'Web.Months.03','es','Marzo');
INSERT INTO "provisioning"."language_strings" VALUES(252,'Web.Months.03','fr','Mars');
INSERT INTO "provisioning"."language_strings" VALUES(253,'Web.Months.04','de','April');
INSERT INTO "provisioning"."language_strings" VALUES(254,'Web.Months.04','en','April');
INSERT INTO "provisioning"."language_strings" VALUES(255,'Web.Months.04','es','Abril');
INSERT INTO "provisioning"."language_strings" VALUES(256,'Web.Months.04','fr','Avril');
INSERT INTO "provisioning"."language_strings" VALUES(257,'Web.Months.05','de','Mai');
INSERT INTO "provisioning"."language_strings" VALUES(258,'Web.Months.05','en','May');
INSERT INTO "provisioning"."language_strings" VALUES(259,'Web.Months.05','es','Mayo');
INSERT INTO "provisioning"."language_strings" VALUES(260,'Web.Months.05','fr','Mai');
INSERT INTO "provisioning"."language_strings" VALUES(261,'Web.Months.06','de','Juni');
INSERT INTO "provisioning"."language_strings" VALUES(262,'Web.Months.06','en','June');
INSERT INTO "provisioning"."language_strings" VALUES(263,'Web.Months.06','es','Junio');
INSERT INTO "provisioning"."language_strings" VALUES(264,'Web.Months.06','fr','Juin');
INSERT INTO "provisioning"."language_strings" VALUES(265,'Web.Months.07','de','Juli');
INSERT INTO "provisioning"."language_strings" VALUES(266,'Web.Months.07','en','July');
INSERT INTO "provisioning"."language_strings" VALUES(267,'Web.Months.07','es','Julio');
INSERT INTO "provisioning"."language_strings" VALUES(268,'Web.Months.07','fr','Juillet');
INSERT INTO "provisioning"."language_strings" VALUES(269,'Web.Months.08','de','August');
INSERT INTO "provisioning"."language_strings" VALUES(270,'Web.Months.08','en','August');
INSERT INTO "provisioning"."language_strings" VALUES(271,'Web.Months.08','es','Agosto');
INSERT INTO "provisioning"."language_strings" VALUES(272,'Web.Months.08','fr','Août');
INSERT INTO "provisioning"."language_strings" VALUES(273,'Web.Months.09','de','September');
INSERT INTO "provisioning"."language_strings" VALUES(274,'Web.Months.09','en','September');
INSERT INTO "provisioning"."language_strings" VALUES(275,'Web.Months.09','es','Septiembre');
INSERT INTO "provisioning"."language_strings" VALUES(276,'Web.Months.09','fr','Septembre');
INSERT INTO "provisioning"."language_strings" VALUES(277,'Web.Months.10','de','Oktober');
INSERT INTO "provisioning"."language_strings" VALUES(278,'Web.Months.10','en','October');
INSERT INTO "provisioning"."language_strings" VALUES(279,'Web.Months.10','es','Octubre');
INSERT INTO "provisioning"."language_strings" VALUES(280,'Web.Months.10','fr','Octobre');
INSERT INTO "provisioning"."language_strings" VALUES(281,'Web.Months.11','de','November');
INSERT INTO "provisioning"."language_strings" VALUES(282,'Web.Months.11','en','November');
INSERT INTO "provisioning"."language_strings" VALUES(283,'Web.Months.11','es','Noviembre');
INSERT INTO "provisioning"."language_strings" VALUES(284,'Web.Months.11','fr','Novembre');
INSERT INTO "provisioning"."language_strings" VALUES(285,'Web.Months.12','de','Dezember');
INSERT INTO "provisioning"."language_strings" VALUES(286,'Web.Months.12','en','December');
INSERT INTO "provisioning"."language_strings" VALUES(287,'Web.Months.12','es','Diciembre');
INSERT INTO "provisioning"."language_strings" VALUES(288,'Web.Months.12','fr','Decembre');
INSERT INTO "provisioning"."language_strings" VALUES(289,'Client.Syntax.AccountID','de','Ungültige ID, bitte verwenden Sie nur Ziffern.');
INSERT INTO "provisioning"."language_strings" VALUES(290,'Client.Syntax.AccountID','en','Invalid ID, please use numbers only.');
INSERT INTO "provisioning"."language_strings" VALUES(291,'Client.Syntax.AccountID','es','ID inválido. Por favor use dígitos exclusivamente.');
INSERT INTO "provisioning"."language_strings" VALUES(292,'Client.Syntax.AccountID','fr','Identifiant invalide utilisé uniquement des numéros.');
INSERT INTO "provisioning"."language_strings" VALUES(293,'Client.Syntax.CashValue','de','Ungültiger Betrag, bitte geben Sie nur Ziffern ein, mit Beistrich oder Punkt als Dezimaltrenner.');
INSERT INTO "provisioning"."language_strings" VALUES(294,'Client.Syntax.CashValue','en','Invalid amount, please use numbers only, with comma or dot as decimal separator.');
INSERT INTO "provisioning"."language_strings" VALUES(295,'Client.Syntax.CashValue','es','Cantidad inválida. Por favor, use dígitos exclusivamente, con coma o punto como separador decimal.');
INSERT INTO "provisioning"."language_strings" VALUES(296,'Client.Syntax.CashValue','fr','La quantité (somme) est invalide, utilisez des numéros uniquement des nombres, avec la virgule ou le point comme le séparateur décimal.');
INSERT INTO "provisioning"."language_strings" VALUES(297,'Client.Syntax.TimeValue','de','Ungültige Eingabe, bitte geben Sie eine ganze Zahl ein.');
INSERT INTO "provisioning"."language_strings" VALUES(298,'Client.Syntax.TimeValue','en','Invalid input, please use numbers only.');
INSERT INTO "provisioning"."language_strings" VALUES(299,'Client.Syntax.TimeValue','es','Entrada inválida. Por favor, use dígitos exclusivamente.');
INSERT INTO "provisioning"."language_strings" VALUES(300,'Client.Syntax.TimeValue','fr','La saisie est invalide, utilisez uniquement des nombres.');
INSERT INTO "provisioning"."language_strings" VALUES(301,'Client.Syntax.LoginMissingUsername','de','Bitte geben Sie Ihren Usernamen ein.');
INSERT INTO "provisioning"."language_strings" VALUES(302,'Client.Syntax.LoginMissingUsername','en','Please enter your username.');
INSERT INTO "provisioning"."language_strings" VALUES(303,'Client.Syntax.LoginMissingUsername','es','Por favor, introduzca su nombre de usuario.');
INSERT INTO "provisioning"."language_strings" VALUES(304,'Client.Syntax.LoginMissingUsername','fr','Entrer votre nom d’utilisateur.');
INSERT INTO "provisioning"."language_strings" VALUES(305,'Client.Syntax.LoginMissingPass','de','Bitte geben Sie Ihr Passwort ein.');
INSERT INTO "provisioning"."language_strings" VALUES(306,'Client.Syntax.LoginMissingPass','en','Please enter your password.');
INSERT INTO "provisioning"."language_strings" VALUES(307,'Client.Syntax.LoginMissingPass','es','Por favor, introduzca su contraseña.');
INSERT INTO "provisioning"."language_strings" VALUES(308,'Client.Syntax.LoginMissingPass','fr','Entrer votre mot de passe.');
INSERT INTO "provisioning"."language_strings" VALUES(309,'Client.Voip.NoSuchAccount','de','Der Account existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(310,'Client.Voip.NoSuchAccount','en','This account does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(311,'Client.Voip.NoSuchAccount','es','La cuenta no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(312,'Client.Voip.NoSuchAccount','fr','Ce compte n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(313,'Client.Voip.ExistingDomain','de','Diese Domain existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(314,'Client.Voip.ExistingDomain','en','This domain already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(315,'Client.Voip.ExistingDomain','es','El dominio ya existe.');
INSERT INTO "provisioning"."language_strings" VALUES(316,'Client.Voip.ExistingDomain','fr','Ce domaine existe déjà.');
INSERT INTO "provisioning"."language_strings" VALUES(317,'Web.Domain.Created','de','Die Domain wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(318,'Web.Domain.Created','en','The domain has been saved.');
INSERT INTO "provisioning"."language_strings" VALUES(319,'Web.Domain.Created','es','El dominio ha sido guardado.');
INSERT INTO "provisioning"."language_strings" VALUES(320,'Web.Domain.Created','fr','Le domaine a été enregistré.');
INSERT INTO "provisioning"."language_strings" VALUES(321,'Web.Domain.Deleted','de','Die Domain wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(322,'Web.Domain.Deleted','en','The domain has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(323,'Web.Domain.Deleted','es','El dominio ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(324,'Web.Domain.Deleted','fr','Le domaine a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(325,'Client.Admin.ExistingAdmin','de','Dieser username ist bereits in Verwendung.');
INSERT INTO "provisioning"."language_strings" VALUES(326,'Client.Admin.ExistingAdmin','en','This username is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(327,'Client.Admin.ExistingAdmin','es','El nombre de usuario ya se encuentra en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(328,'Client.Admin.ExistingAdmin','fr','Ce nom d’utilisateur existe déjà.');
INSERT INTO "provisioning"."language_strings" VALUES(329,'Client.Admin.NoSuchAdmin','de','Dieser Administrator existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(330,'Client.Admin.NoSuchAdmin','en','This administrator does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(331,'Client.Admin.NoSuchAdmin','es','El administrador no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(332,'Client.Admin.NoSuchAdmin','fr','Cet administrateur n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(333,'Client.Syntax.MalformedLogin','de','Ungültig Zeichen im Loginnamen. Bitte verwenden Sie nur Buchstaben und Zahlen.');
INSERT INTO "provisioning"."language_strings" VALUES(334,'Client.Syntax.MalformedLogin','en','Invalid characters in login name. Please use alphanumeric characters only.');
INSERT INTO "provisioning"."language_strings" VALUES(335,'Client.Syntax.MalformedLogin','es','Caracteres inválidos en nombre de usuario. Por favor use únicamente caracteres alfanuméricos.');
INSERT INTO "provisioning"."language_strings" VALUES(336,'Client.Syntax.MalformedLogin','fr','Caractères invalides de nom d''établissement de la connexion. Utilisez uniquement caractères alphanumériques.');
INSERT INTO "provisioning"."language_strings" VALUES(337,'Web.Admin.Created','de','Der Administrator wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(338,'Web.Admin.Created','en','The administrator has been saved.');
INSERT INTO "provisioning"."language_strings" VALUES(339,'Web.Admin.Created','es','El administrador ha sido guardado.');
INSERT INTO "provisioning"."language_strings" VALUES(340,'Web.Admin.Created','fr','L''administrateur a été enregistré.');
INSERT INTO "provisioning"."language_strings" VALUES(341,'Web.Admin.Deleted','de','Der Administrator wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(342,'Web.Admin.Deleted','en','The administrator has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(343,'Web.Admin.Deleted','es','El administrador ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(344,'Web.Admin.Deleted','fr','L''administrateur a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(345,'Web.Account.Created','de','Der Account wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(346,'Web.Account.Created','en','The account has been saved.');
INSERT INTO "provisioning"."language_strings" VALUES(347,'Web.Account.Created','es','La cuenta ha sido guardada.');
INSERT INTO "provisioning"."language_strings" VALUES(348,'Web.Account.Created','fr','Le compte a été enregistré.');
INSERT INTO "provisioning"."language_strings" VALUES(349,'Web.Payment.UnknownError','de','Bei der Initialisierung des Zahlvorgangs ist ein Fehler aufgetreten. Bitte versuchen Sie es etwas späeter nochmals und überprüfen Sie Ihre Eingaben.');
INSERT INTO "provisioning"."language_strings" VALUES(350,'Web.Payment.UnknownError','en','Failed to initialize the transaction. Please try again later and verify your input.');
INSERT INTO "provisioning"."language_strings" VALUES(351,'Web.Payment.UnknownError','es','Se ha detectado un error al inicial la transacción. Por favor, verifique los datos e inténtelo de nuevo más tarde.');
INSERT INTO "provisioning"."language_strings" VALUES(352,'Web.Payment.UnknownError','fr','Echec d’initialisation de la transaction. Essayez de nouveau plus tard et vérifiez votre saisie.');
INSERT INTO "provisioning"."language_strings" VALUES(353,'Web.Payment.HttpFailed','de','Der Payment Server konnte nicht erreicht werden. Bitte versuchen Sie es etwas später nochmals.');
INSERT INTO "provisioning"."language_strings" VALUES(354,'Web.Payment.HttpFailed','en','The payment server could not be reached. Please try again later.');
INSERT INTO "provisioning"."language_strings" VALUES(355,'Web.Payment.HttpFailed','es','Se ha detectado un error al intertar conectar con el servidor de pagos. Por favor, inténtelo de nuevo más tarde.');
INSERT INTO "provisioning"."language_strings" VALUES(356,'Web.Payment.HttpFailed','fr','Le serveur de paiement ne pouvait pas être atteint. Essayez de nouveau plus tard.');
INSERT INTO "provisioning"."language_strings" VALUES(357,'Web.Syntax.Numeric','de','Ungültige Zahlenangabe, bitte verwenden Sie nur Ziffern.');
INSERT INTO "provisioning"."language_strings" VALUES(358,'Web.Syntax.Numeric','en','Invalid number, please use numerics only.');
INSERT INTO "provisioning"."language_strings" VALUES(359,'Web.Syntax.Numeric','es','Número inválido. Por favor, use números exclusivamente.');
INSERT INTO "provisioning"."language_strings" VALUES(360,'Web.Syntax.Numeric','fr','Numéro invalide, utilisez des données numériques uniquement.');
INSERT INTO "provisioning"."language_strings" VALUES(361,'Web.MissingContactInfo','de','Bitte selektieren Sie das Kästchen "wie oben", oder füllen Sie alle anderen Eingabefelder aus.');
INSERT INTO "provisioning"."language_strings" VALUES(362,'Web.MissingContactInfo','en','Please check the box "like above" or fill in all additional input fields.');
INSERT INTO "provisioning"."language_strings" VALUES(363,'Web.MissingContactInfo','es','Por favor, compruebe la casilla "como arriba" o rellene todos los campos adicionales.');
INSERT INTO "provisioning"."language_strings" VALUES(364,'Web.MissingContactInfo','fr','Vérifiez la boîte " like above " ou remplissez tous les champs de saisie supplémentaires.');
INSERT INTO "provisioning"."language_strings" VALUES(365,'Web.MissingInput','de','Bitte füllen Sie alle Eingabefelder aus.');
INSERT INTO "provisioning"."language_strings" VALUES(366,'Web.MissingInput','en','Please fill in all input fields.');
INSERT INTO "provisioning"."language_strings" VALUES(367,'Web.MissingInput','es','Por favor, rellene todos los campos.');
INSERT INTO "provisioning"."language_strings" VALUES(368,'Web.MissingInput','fr','Remplissez tous les champs de saisie.');
INSERT INTO "provisioning"."language_strings" VALUES(369,'Web.Subscriber.Lockforeign','de','Der Subscriber ist für ausgehende Anrufe die das System verlassen gesperrt.');
INSERT INTO "provisioning"."language_strings" VALUES(370,'Web.Subscriber.Lockforeign','en','The subscriber is locked for calls that leave the system.');
INSERT INTO "provisioning"."language_strings" VALUES(371,'Web.Subscriber.Lockforeign','es','El suscriptor tiene restringidas las llamadas salientes hacia fuera del sistema.');
INSERT INTO "provisioning"."language_strings" VALUES(372,'Web.Subscriber.Lockforeign','fr','L''abonné est locké pour les appels qui sort du système.');
INSERT INTO "provisioning"."language_strings" VALUES(373,'Web.Subscriber.Lockoutgoing','de','Der Subscriber ist für ausgehende Anrufe gesperrt.');
INSERT INTO "provisioning"."language_strings" VALUES(374,'Web.Subscriber.Lockoutgoing','en','The subscriber is locked for outgoing calls.');
INSERT INTO "provisioning"."language_strings" VALUES(375,'Web.Subscriber.Lockoutgoing','es','El suscriptor tiene restringidas las llamadas salientes.');
INSERT INTO "provisioning"."language_strings" VALUES(376,'Web.Subscriber.Lockoutgoing','fr','L’abonné est locké pour les appels sortant.');
INSERT INTO "provisioning"."language_strings" VALUES(377,'Web.Subscriber.Lockincoming','de','Der Subscriber ist für eingehende und ausgehende Anrufe gesperrt.');
INSERT INTO "provisioning"."language_strings" VALUES(378,'Web.Subscriber.Lockincoming','en','The subscriber is locked for incoming and outgoing calls.');
INSERT INTO "provisioning"."language_strings" VALUES(379,'Web.Subscriber.Lockincoming','es','El suscriptor tiene restringidas las llamadas entrantes y salientes.');
INSERT INTO "provisioning"."language_strings" VALUES(380,'Web.Subscriber.Lockincoming','fr','L''abonné est locké pour les appels entrants et sortants.');
INSERT INTO "provisioning"."language_strings" VALUES(381,'Web.Subscriber.Lockglobal','de','Der Subscriber ist für alle Services gesperrt.');
INSERT INTO "provisioning"."language_strings" VALUES(382,'Web.Subscriber.Lockglobal','en','The subscriber is locked for all services.');
INSERT INTO "provisioning"."language_strings" VALUES(383,'Web.Subscriber.Lockglobal','es','El suscriptor tiene restringidos todos los servicios.');
INSERT INTO "provisioning"."language_strings" VALUES(384,'Web.Subscriber.Lockglobal','fr','L''abonné est locké pour tous les services des appels sortants.');
INSERT INTO "provisioning"."language_strings" VALUES(385,'Web.Payment.ExternalError','de','Der Zahlvorgang ist fehlgeschlagen. Bitte versuchen Sie es etwas späeter nochmals und befolgen Sie alle Anweisungen der externen Webseite.');
INSERT INTO "provisioning"."language_strings" VALUES(386,'Web.Payment.ExternalError','en','The transaction failed. Please try again later and follow all instructions on the external website.');
INSERT INTO "provisioning"."language_strings" VALUES(387,'Web.Payment.ExternalError','es','Se ha detectado un error externo al realizar la transacción. Por favor, inténtelo de nuevo más tarde y siga las instrucciones de la web externa.');
INSERT INTO "provisioning"."language_strings" VALUES(388,'Web.Payment.ExternalError','fr','La transaction a échoué. Essayez de nouveau plus tard et suivez toutes les instructions sur le site Web externe.');
INSERT INTO "provisioning"."language_strings" VALUES(389,'Client.Voip.NoGroupName','de','Bitte geben Sie einen Gruppennamen ein.');
INSERT INTO "provisioning"."language_strings" VALUES(390,'Client.Voip.NoGroupName','en','Please provide a group name.');
INSERT INTO "provisioning"."language_strings" VALUES(391,'Client.Voip.NoGroupName','es','Por favor, introduzca un nombre de grupo.');
INSERT INTO "provisioning"."language_strings" VALUES(392,'Client.Voip.NoGroupName','fr','Fournissez un nom de groupe.');
INSERT INTO "provisioning"."language_strings" VALUES(393,'Client.Voip.NoGroupExt','de','Bitte geben Sie eine numerische Gruppendurchwahl ein.');
INSERT INTO "provisioning"."language_strings" VALUES(394,'Client.Voip.NoGroupExt','en','Please provide a numeric group extension.');
INSERT INTO "provisioning"."language_strings" VALUES(395,'Client.Voip.NoGroupExt','es','Por favor, introduzca una extensión numérica de grupo.');
INSERT INTO "provisioning"."language_strings" VALUES(396,'Client.Voip.NoGroupExt','fr','Fournissez une extension de groupe numérique.');
INSERT INTO "provisioning"."language_strings" VALUES(397,'Client.Voip.MacInUse','en','MAC address is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(398,'Client.Voip.MacInUse','de','MAC Adresse wird bereits verwendet.');
INSERT INTO "provisioning"."language_strings" VALUES(399,'Client.Voip.MacInUse','es','La dirección MAC ya se encuentra en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(400,'Client.Voip.MacInUse','fr','L''adresse de MAC est déjà en cours d''utilisation.');
INSERT INTO "provisioning"."language_strings" VALUES(401,'Web.MissingSystem','de','Bitte wählen Sie die Nebenstellenanlage die Sie verwenden möchten.');
INSERT INTO "provisioning"."language_strings" VALUES(402,'Web.MissingSystem','en','Please choose the IP PBX you want to use.');
INSERT INTO "provisioning"."language_strings" VALUES(403,'Web.MissingSystem','es','Por favor, escoja la IP PBX que desea utilizar.');
INSERT INTO "provisioning"."language_strings" VALUES(404,'Web.MissingSystem','fr','Choisissez PBX IP que vous voulez utiliser.');
INSERT INTO "provisioning"."language_strings" VALUES(405,'Web.MissingAGB','de','Sie müssen den Allgemeinen Geschäftsbedingungen zustimmen.');
INSERT INTO "provisioning"."language_strings" VALUES(406,'Web.MissingAGB','en','Please agree to our general terms and conditions.');
INSERT INTO "provisioning"."language_strings" VALUES(407,'Web.MissingAGB','es','Por favor, acepte los términos y condiciones generales.');
INSERT INTO "provisioning"."language_strings" VALUES(408,'Web.MissingAGB','fr','Soyez en accord avec nos conditions générales.');
INSERT INTO "provisioning"."language_strings" VALUES(409,'Web.Account.Activated','de','Der account wurde aktiviert.');
INSERT INTO "provisioning"."language_strings" VALUES(410,'Web.Account.Activated','en','The account has been activated.');
INSERT INTO "provisioning"."language_strings" VALUES(411,'Web.Account.Activated','es','La cuenta ha sido activada.');
INSERT INTO "provisioning"."language_strings" VALUES(412,'Web.Account.Activated','fr','Le compte a été activé.');
INSERT INTO "provisioning"."language_strings" VALUES(413,'Client.Billing.AuthFailed','de','Login fehlgeschlagen, bitte überprüfen Sie Ihren Usernamen und Ihr Passwort.');
INSERT INTO "provisioning"."language_strings" VALUES(414,'Client.Billing.AuthFailed','en','Login failed, please verify your username and password.');
INSERT INTO "provisioning"."language_strings" VALUES(415,'Client.Billing.AuthFailed','es','Acceso fallido. Por favor, compruebe su usuario y contraseña.');
INSERT INTO "provisioning"."language_strings" VALUES(416,'Client.Billing.AuthFailed','fr','L''établissement de la connexion a échoué, vérifiez votre nom d’utilisateur et le mot de passe.');
INSERT INTO "provisioning"."language_strings" VALUES(417,'Web.MissingSearchString','de','Bitte geben Sie einen Suchstring ein.');
INSERT INTO "provisioning"."language_strings" VALUES(418,'Web.MissingSearchString','en','Please enter a search string.');
INSERT INTO "provisioning"."language_strings" VALUES(419,'Web.MissingSearchString','es','Por favor, introduzca un término de búsqueda.');
INSERT INTO "provisioning"."language_strings" VALUES(420,'Web.MissingSearchString','fr','Entrez s''il vous plaît dans une série de recherche.');
INSERT INTO "provisioning"."language_strings" VALUES(421,'Client.Billing.ContactIncomplete','de','Bitte geben Sie zumindest einen Vornamen, Nachnamen oder Firmennamen ein.');
INSERT INTO "provisioning"."language_strings" VALUES(422,'Client.Billing.ContactIncomplete','en','Please enter at least a firstname, lastname or company name.');
INSERT INTO "provisioning"."language_strings" VALUES(423,'Client.Billing.ContactIncomplete','es','Por favor, introduzca el menos un nombre, un apellido o una compañía.');
INSERT INTO "provisioning"."language_strings" VALUES(424,'Client.Billing.ContactIncomplete','fr','Entrez au moins dans un nom, prénom ou nom de l’entreprise.');
INSERT INTO "provisioning"."language_strings" VALUES(425,'Client.Billing.ExistingShopuser','de','Dieser Benutzername ist bereits in Verwendung.');
INSERT INTO "provisioning"."language_strings" VALUES(426,'Client.Billing.ExistingShopuser','en','This username is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(427,'Client.Billing.ExistingShopuser','es','Este usuario ya se encuentra en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(428,'Client.Billing.ExistingShopuser','fr','Ce nom d’utilisateur est déjà utilisé.');
INSERT INTO "provisioning"."language_strings" VALUES(429,'Client.Billing.ExistingProduct','de','Ein Produkt mit diesem Produkt-Identifikator existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(430,'Client.Billing.ExistingProduct','en','A product with this product-handle already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(431,'Client.Billing.ExistingProduct','es','Ya existe un producto con este identificador.');
INSERT INTO "provisioning"."language_strings" VALUES(432,'Client.Billing.ExistingProduct','fr','A produit avec cet identifiant "product-handle" exist dejà.');
INSERT INTO "provisioning"."language_strings" VALUES(433,'Client.Billing.NoSuchProduct','de','Das Produkt mit dem angegebenen Produkt-Identifikator wurde nicht gefunden.');
INSERT INTO "provisioning"."language_strings" VALUES(434,'Client.Billing.NoSuchProduct','en','No product with the specified product-handle found.');
INSERT INTO "provisioning"."language_strings" VALUES(435,'Client.Billing.NoSuchProduct','es','No se han encontrado productos con el identificador especificado.');
INSERT INTO "provisioning"."language_strings" VALUES(436,'Client.Billing.NoSuchProduct','fr','Aucun produit trouvé avec l''identifiant spécifié "product-handle".');
INSERT INTO "provisioning"."language_strings" VALUES(437,'Client.Billing.ExistingProfile','de','Ein Billing Profil mit dem angegebenen Profil-Identifikator existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(438,'Client.Billing.ExistingProfile','en','A billing profile with the specified profile-handle already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(439,'Client.Billing.ExistingProfile','es','Ya existe un perfil de facturación con este identificador.');
INSERT INTO "provisioning"."language_strings" VALUES(440,'Client.Billing.ExistingProfile','fr','A profile de facturation avec l''identifiant spécifié "profile-handle" exist dejà.');
INSERT INTO "provisioning"."language_strings" VALUES(441,'Client.Billing.NoSuchProfile','de','Das Billing Profil mit dem angegebenen Profil-Identifikator wurde nicht gefunden.');
INSERT INTO "provisioning"."language_strings" VALUES(442,'Client.Billing.NoSuchProfile','en','No billing profile with the specified profile-handle found.');
INSERT INTO "provisioning"."language_strings" VALUES(443,'Client.Billing.NoSuchProfile','es','No se han encontrado perfiles de facturación con el identificador especificado.');
INSERT INTO "provisioning"."language_strings" VALUES(444,'Client.Billing.NoSuchProfile','fr','Aucun profile de facturation trouvé avec l''identifiant spécifié "profile-handle".');
INSERT INTO "provisioning"."language_strings" VALUES(445,'Web.Product.Created','de','Der Produkt-Eintrag wurde erstellt.');
INSERT INTO "provisioning"."language_strings" VALUES(446,'Web.Product.Created','en','The product entry has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(447,'Web.Product.Created','es','El producto ha sido creado.');
INSERT INTO "provisioning"."language_strings" VALUES(448,'Web.Product.Created','fr','Le produit saisi a été créée.');
INSERT INTO "provisioning"."language_strings" VALUES(449,'Web.Product.Updated','de','Der Produkt-Eintrag wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(450,'Web.Product.Updated','en','The product entry has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(451,'Web.Product.Updated','es','El producto ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(452,'Web.Product.Updated','fr','Le produit saisi a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(453,'Web.Product.Deleted','de','Der Produkt-Eintrag wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(454,'Web.Product.Deleted','en','The product entry has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(455,'Web.Product.Deleted','es','El producto ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(456,'Web.Product.Deleted','fr','Le produit saisi a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(457,'Web.Bilprof.Created','de','Das Billing Profil wurde erstellt.');
INSERT INTO "provisioning"."language_strings" VALUES(458,'Web.Bilprof.Created','en','The billing profile has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(459,'Web.Bilprof.Created','es','El perfil de facturación ha sido creado.');
INSERT INTO "provisioning"."language_strings" VALUES(460,'Web.Bilprof.Created','fr','Le profil de facturation a été créé.');
INSERT INTO "provisioning"."language_strings" VALUES(461,'Web.Bilprof.Updated','de','Das Billing Profil wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(462,'Web.Bilprof.Updated','en','The billing profile has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(463,'Web.Bilprof.Updated','es','El perfil de facturación ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(464,'Web.Bilprof.Updated','fr','Le profil de facturation a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(465,'Web.Bilprof.Deleted','de','Das Billing Profil wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(466,'Web.Bilprof.Deleted','en','The billing profile has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(467,'Web.Bilprof.Deleted','es','El perfil de facturación ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(468,'Web.Bilprof.Deleted','fr','Le profil de facturation a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(469,'Web.Fees.MissingFilename','de','Bitte geben Sie einen Dateinamen an.');
INSERT INTO "provisioning"."language_strings" VALUES(470,'Web.Fees.MissingFilename','en','Please enter a filename.');
INSERT INTO "provisioning"."language_strings" VALUES(471,'Web.Fees.MissingFilename','es','Por favor, inserte un nombre de fichero.');
INSERT INTO "provisioning"."language_strings" VALUES(472,'Web.Fees.MissingFilename','fr','Entrez un nom de fichier.');
INSERT INTO "provisioning"."language_strings" VALUES(473,'Web.Fees.Fieldcount','de','Falsche Anzahl von Feldern');
INSERT INTO "provisioning"."language_strings" VALUES(474,'Web.Fees.Fieldcount','en','Wrong number of elements');
INSERT INTO "provisioning"."language_strings" VALUES(475,'Web.Fees.Fieldcount','es','Número incorrecto de elementos');
INSERT INTO "provisioning"."language_strings" VALUES(476,'Web.Fees.Fieldcount','fr','Mauvais numéro d''éléments');
INSERT INTO "provisioning"."language_strings" VALUES(477,'Web.Fees.FieldsFoundRequired','de','Felder gefunden/benötigt:');
INSERT INTO "provisioning"."language_strings" VALUES(478,'Web.Fees.FieldsFoundRequired','en','Elements found/required:');
INSERT INTO "provisioning"."language_strings" VALUES(479,'Web.Fees.FieldsFoundRequired','es','Elementos encontrados/requeridos:');
INSERT INTO "provisioning"."language_strings" VALUES(480,'Web.Fees.FieldsFoundRequired','fr','Éléments trouvés/exigés: ');
INSERT INTO "provisioning"."language_strings" VALUES(481,'Web.Fees.InvalidDestination','de','Ungültiger Ziel-Präfix / -Suffix');
INSERT INTO "provisioning"."language_strings" VALUES(482,'Web.Fees.InvalidDestination','en','Invalid destination prefix/suffix');
INSERT INTO "provisioning"."language_strings" VALUES(483,'Web.Fees.InvalidDestination','es','Prefijo/sufijo de destino inválido.');
INSERT INTO "provisioning"."language_strings" VALUES(484,'Web.Fees.InvalidDestination','fr','Préfixe/suffixe de destination invalide');
INSERT INTO "provisioning"."language_strings" VALUES(485,'Client.Billing.NoSuchCustomer','de','Der angegebene Kunde existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(486,'Client.Billing.NoSuchCustomer','en','The specified customer does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(487,'Client.Billing.NoSuchCustomer','es','El cliente especificado no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(488,'Client.Billing.NoSuchCustomer','fr','Le client indiqué n''existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(489,'Client.Syntax.MalformedDaytime','de','Ungültige Zeitangabe, bitte geben Sie Stunden, Minuten und Sekunden in der Form HH::MM::SS ein.');
INSERT INTO "provisioning"."language_strings" VALUES(490,'Client.Syntax.MalformedDaytime','en','Invalid time specification, please enter hours, minutes and seconds in the form HH:MM:SS.');
INSERT INTO "provisioning"."language_strings" VALUES(491,'Client.Syntax.MalformedDaytime','es','Formato horario inválido. Por favor, inserte horas, minutos y segundos en la forma HH:MM:SS.');
INSERT INTO "provisioning"."language_strings" VALUES(492,'Client.Syntax.MalformedDaytime','fr','Temps spécifié invalide, entrez des heures, des minutes et des secondes sous forme HH:MM:SS.');
INSERT INTO "provisioning"."language_strings" VALUES(493,'Web.Fees.SavedPeaktimes','de','Die Zeit-Einträge wurden aktualisiert.');
INSERT INTO "provisioning"."language_strings" VALUES(494,'Web.Fees.SavedPeaktimes','en','The time-entries have been updated.');
INSERT INTO "provisioning"."language_strings" VALUES(495,'Web.Fees.SavedPeaktimes','es','Las entradas de tiempos han sido actualizadas.');
INSERT INTO "provisioning"."language_strings" VALUES(496,'Web.Fees.SavedPeaktimes','fr','Les entrées de temps ont été mises à jour.');
INSERT INTO "provisioning"."language_strings" VALUES(497,'Client.Voip.DuplicatedNumber','de','Eine Rufnummer wurde mehr als einmal angegeben.');
INSERT INTO "provisioning"."language_strings" VALUES(498,'Client.Voip.DuplicatedNumber','en','A phone number was specified more than once.');
INSERT INTO "provisioning"."language_strings" VALUES(499,'Client.Voip.DuplicatedNumber','es','Un número de teléfono ha sido especificado más de una vez.');
INSERT INTO "provisioning"."language_strings" VALUES(500,'Client.Voip.DuplicatedNumber','fr','Un numéro de téléphone a été spécifié plus d’une fois.');
INSERT INTO "provisioning"."language_strings" VALUES(501,'Client.Voip.SlotAlreadyExists','de','Der Kurzwahl-Eintrag ist bereits in Verwendung.');
INSERT INTO "provisioning"."language_strings" VALUES(502,'Client.Voip.SlotAlreadyExists','en','The speed dial slot is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(503,'Client.Voip.SlotAlreadyExists','es','La posición de marcación rápida ya está en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(504,'Client.Voip.SlotAlreadyExists','fr','La numérotation abrégée est déjà utilisé.');
INSERT INTO "provisioning"."language_strings" VALUES(505,'Client.Voip.SlotNotExistent','en','The speed dial slot does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(506,'Client.Voip.SlotNotExistent','de','Der Kurzwahl-Eintrag ist nicht vorhanden.');
INSERT INTO "provisioning"."language_strings" VALUES(507,'Client.Voip.SlotNotExistent','es','La posición de marcación rápida no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(508,'Client.Voip.SlotNotExistent','fr','La numérotation abrégée n''existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(509,'Client.Syntax.MalformedSpeedDialDestination','en','The speed dial slot destination is invalid.');
INSERT INTO "provisioning"."language_strings" VALUES(510,'Client.Syntax.MalformedSpeedDialDestination','de','Das Ziel des Kurzwahl-Eintrag ist ungültig.');
INSERT INTO "provisioning"."language_strings" VALUES(511,'Client.Syntax.MalformedSpeedDialDestination','es','La posición de marcación rápida escogida es inválida.');
INSERT INTO "provisioning"."language_strings" VALUES(512,'Client.Syntax.MalformedSpeedDialDestination','fr','Le slot de la numérotation abrégée est invalide.');
INSERT INTO "provisioning"."language_strings" VALUES(513,'Client.Syntax.MalformedVSC','en','The vertical service code (VSC) is invalid.');
INSERT INTO "provisioning"."language_strings" VALUES(514,'Client.Syntax.MalformedVSC','de','Der VSC (vertical service code) ist ungültig.');
INSERT INTO "provisioning"."language_strings" VALUES(515,'Client.Syntax.MalformedVSC','es','El código de servicio vertical (VSC) es inválido.');
INSERT INTO "provisioning"."language_strings" VALUES(516,'Client.Syntax.MalformedVSC','fr','Le code de service vertical (VSC) est invalide.');
INSERT INTO "provisioning"."language_strings" VALUES(517,'Client.Syntax.MalformedIPNet','en','Malformed ipnet, please use dotted decimal notation and specify the mask as number of bits.');
INSERT INTO "provisioning"."language_strings" VALUES(518,'Client.Syntax.MalformedIPNet','de','Ungültiges Netzwerk, bitte verwenden Sie die Dezimalschreibweise mit Punkt und geben Sie die Netzmaske als Anzahl von Bits an.');
INSERT INTO "provisioning"."language_strings" VALUES(519,'Client.Syntax.MalformedIPNet','es','Sintaxis de red inválida. Por favor, use notación decimal y especifique la máscara como número de bits.');
INSERT INTO "provisioning"."language_strings" VALUES(520,'Client.Syntax.MalformedIPNet','fr','Malformed ipnet, please use dotted decimal notation and specify the mask as number of bits.');
INSERT INTO "provisioning"."language_strings" VALUES(521,'Client.Syntax.MalformedIP','en','Malformed ip, please use dotted decimal notation for IPv4 or address without square brackets for IPv6.');
INSERT INTO "provisioning"."language_strings" VALUES(522,'Client.Syntax.MalformedIP','de','Ungültige IP, bitte verwenden Sie dotted decimal Notation für IPv4 bzw. Format ohne eckige Klammern für IPv6.');
INSERT INTO "provisioning"."language_strings" VALUES(523,'Client.Syntax.MalformedIP','es','Sintaxis de IP inválida. Por favor, use notación decimal.');
INSERT INTO "provisioning"."language_strings" VALUES(524,'Client.Syntax.MalformedIP','fr','IP mal construite, utilisez la notation décimale pointillée.');
INSERT INTO "provisioning"."language_strings" VALUES(525,'Server.Voip.PeerGroupDeleted','en','The peering group has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(526,'Server.Voip.PeerGroupDeleted','de','Die Peering-Gruppe wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(527,'Server.Voip.PeerGroupDeleted','es','El grupo de peering ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(528,'Server.Voip.PeerGroupDeleted','fr','Le groupe peering a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(529,'Client.Voip.NoSuchPeerGroup','en','The peering group does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(530,'Client.Voip.NoSuchPeerGroup','de','Die Peering-Gruppe existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(531,'Client.Voip.NoSuchPeerGroup','es','El grupo de peering no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(532,'Client.Voip.NoSuchPeerGroup','fr','Le groupe peering n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(533,'Client.Voip.NoPeerContract','en','No peering contract selected.');
INSERT INTO "provisioning"."language_strings" VALUES(534,'Client.Voip.NoPeerContract','de','Kein Peering Contract ausgewählt.');
INSERT INTO "provisioning"."language_strings" VALUES(535,'Client.Voip.NoPeerContract','es','No se ha seleccionado un contrato de peering.');
INSERT INTO "provisioning"."language_strings" VALUES(536,'Client.Voip.NoPeerContract','fr','Aucun peering contract n’est sélectionné.');
INSERT INTO "provisioning"."language_strings" VALUES(537,'Client.Voip.ExistingPeerGroup','en','The peering group already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(538,'Client.Voip.ExistingPeerGroup','de','Die Peering-Gruppe existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(539,'Client.Voip.ExistingPeerGroup','es','El grupo de peering ya existe.');
INSERT INTO "provisioning"."language_strings" VALUES(540,'Client.Voip.ExistingPeerGroup','fr','Le peering group existe déjà.');
INSERT INTO "provisioning"."language_strings" VALUES(541,'Client.Syntax.MalformedPeerGroupName','en','Invalid characters in peering group name.');
INSERT INTO "provisioning"."language_strings" VALUES(542,'Client.Syntax.MalformedPeerGroupName','de','Ungültige Zeichen im Name der Peering-Gruppe.');
INSERT INTO "provisioning"."language_strings" VALUES(543,'Client.Syntax.MalformedPeerGroupName','es','Encontrados caracteres inválidos en el nombre del grupo de peering.');
INSERT INTO "provisioning"."language_strings" VALUES(544,'Client.Syntax.MalformedPeerGroupName','fr','Caractères invalides dans le peering group name.');
INSERT INTO "provisioning"."language_strings" VALUES(545,'Client.Voip.NoSuchPeerRule','en','The peering rule does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(546,'Client.Voip.NoSuchPeerRule','de','Die Peering-Regel existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(547,'Client.Voip.NoSuchPeerRule','es','La regla de peering no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(548,'Client.Voip.NoSuchPeerRule','fr','Le peering rule n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(549,'Client.Voip.NoSuchPeerHost','en','The peering host does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(550,'Client.Voip.NoSuchPeerHost','de','Der Peering-Server existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(551,'Client.Voip.NoSuchPeerHost','es','El servidor de peering no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(552,'Client.Voip.NoSuchPeerHost','fr','Le peering host n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(553,'Client.Voip.ExistingPeerHost','en','A peering host with this name already exists in this group.');
INSERT INTO "provisioning"."language_strings" VALUES(554,'Client.Voip.ExistingPeerHost','de','Es existiert bereits ein Peering-Host dieses Namens in dieser Gruppe.');
INSERT INTO "provisioning"."language_strings" VALUES(555,'Client.Voip.ExistingPeerHost','es','Ya existe un servidor de peering con este nombre en el grupo.');
INSERT INTO "provisioning"."language_strings" VALUES(556,'Client.Voip.ExistingPeerHost','fr','Un peering host avec ce nom existe déjà dans ce groupe.');
INSERT INTO "provisioning"."language_strings" VALUES(557,'Client.Voip.ExistingPeerIp','en','A peering host with this IP address already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(558,'Client.Voip.ExistingPeerIp','de','Es existiert bereits ein Peering-Host mit dieser IP-Adresse.');
INSERT INTO "provisioning"."language_strings" VALUES(559,'Client.Voip.ExistingPeerIp','es','Ya existe un servidor de peering con esta IP.');
INSERT INTO "provisioning"."language_strings" VALUES(560,'Client.Voip.ExistingPeerIp','fr','Un peering host avec cette adresse IP existe déjà.');
INSERT INTO "provisioning"."language_strings" VALUES(561,'Client.Voip.NoSuchPeerRewriteRule','en','The peering rewrite rule does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(562,'Client.Voip.NoSuchPeerRewriteRule','de','Die Peering-Rewrite-Regel existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(563,'Client.Voip.NoSuchPeerRewriteRule','es','La regla de reescritura de peering no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(564,'Client.Voip.NoSuchPeerRewriteRule','fr','Le peering rewrite rule n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(565,'Client.Voip.NoSuchDomainRewriteRule','en','The domain rewrite rule does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(566,'Client.Voip.NoSuchDomainRewriteRule','de','Die Domain-Rewrite-Regel existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(567,'Client.Voip.NoSuchDomainRewriteRule','es','La regla de reescritura de dominio no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(568,'Client.Voip.NoSuchDomainRewriteRule','fr','Le domaine rewrite rule n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(569,'Client.Voip.NoSuchCfDestSet','en','The call-forward destination set does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(570,'Client.Voip.NoSuchCfDestSet','es','The call-forward destination set does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(571,'Client.Voip.NoSuchCfDestSet','de','Die Rufumleitungs-Gruppe existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(572,'Client.Voip.NoSuchCfDestSet','fr','The call-forward destination set does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(573,'Client.Voip.ExistingCfDestSet','en','The call-forward destination set already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(574,'Client.Voip.ExistingCfDestSet','es','The call-forward destination set already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(575,'Client.Voip.ExistingCfDestSet','de','Die Rufumleitungs-Gruppe existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(576,'Client.Voip.ExistingCfDestSet','fr','The call-forward destination set already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(577,'Client.Voip.NoSuchCfDest','en','The call-forward destination does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(578,'Client.Voip.NoSuchCfDest','es','The call-forward destination does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(579,'Client.Voip.NoSuchCfDest','de','Die Rufumleitung existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(580,'Client.Voip.NoSuchCfDest','fr','The call-forward destination does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(581,'Client.Voip.ExistingCfDest','en','The call-forward destination already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(582,'Client.Voip.ExistingCfDest','es','The call-forward destination already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(583,'Client.Voip.ExistingCfDest','de','Die Rufumleitung existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(584,'Client.Voip.ExistingCfDest','fr','The call-forward destination already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(585,'Client.Voip.NoSuchCfTimeSet','en','The call-forward time set does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(586,'Client.Voip.NoSuchCfTimeSet','es','The call-forward time set does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(587,'Client.Voip.NoSuchCfTimeSet','de','Die Rufumleitungs-Zeit-Gruppe existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(588,'Client.Voip.NoSuchCfTimeSet','fr','The call-forward time set does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(589,'Client.Voip.ExistingCfTimeSet','en','The call-forward time set already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(590,'Client.Voip.ExistingCfTimeSet','es','The call-forward time set already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(591,'Client.Voip.ExistingCfTimeSet','de','Die Rufumleitungs-Zeit-Gruppe existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(592,'Client.Voip.ExistingCfTimeSet','fr','The call-forward time set already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(593,'Client.Voip.NoSuchCfPeriod','en','The call-forward time period does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(594,'Client.Voip.NoSuchCfPeriod','es','The call-forward time period does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(595,'Client.Voip.NoSuchCfPeriod','de','Die Rufumleitungs-Zeitperiode existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(596,'Client.Voip.NoSuchCfPeriod','fr','The call-forward time period does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(597,'Client.Voip.MalformedFaxDestination','en','''destination'' must be an email address or phone number.');
INSERT INTO "provisioning"."language_strings" VALUES(598,'Client.Voip.MalformedFaxDestination','de','''destination'' muss eine E-Mail Adresse oder Telefonnummer enthalten.');
INSERT INTO "provisioning"."language_strings" VALUES(599,'Client.Voip.MalformedFaxDestination','es','''destination'' ha de ser una dirección de correo o un número de teléfono.');
INSERT INTO "provisioning"."language_strings" VALUES(600,'Client.Voip.MalformedFaxDestination','fr','''destination'' doit être une adresse électronique ou un numéro de téléphone.');
INSERT INTO "provisioning"."language_strings" VALUES(601,'Client.Syntax.FaxPassLength','en','The password is to short, please use ${faxpw_min_char} characters at least.');
INSERT INTO "provisioning"."language_strings" VALUES(602,'Client.Syntax.FaxPassLength','de','Das Passwort ist zu kurz, bitte verwenden Sie mindestens ${faxpw_min_char} Zeichen.');
INSERT INTO "provisioning"."language_strings" VALUES(603,'Client.Syntax.FaxPassLength','es','La contraseña es demasiado corta. Por favor use al menos ${faxpw_min_char} caracteres.');
INSERT INTO "provisioning"."language_strings" VALUES(604,'Client.Syntax.FaxPassLength','fr','Le mot de passe est trop court, utilisez le caractères $ {faxpw_min_char} au moins.');
INSERT INTO "provisioning"."language_strings" VALUES(605,'Web.Syntax.ID','en','Invalid ID, please enter a numeric value.');
INSERT INTO "provisioning"."language_strings" VALUES(606,'Web.Syntax.ID','de','Ungültige ID, bitte geben Sie einen numerischen Wert ein.');
INSERT INTO "provisioning"."language_strings" VALUES(607,'Web.Syntax.ID','es','ID inválido. Por favor, introduzca un valor numérico.');
INSERT INTO "provisioning"."language_strings" VALUES(608,'Web.Syntax.ID','fr','ID invalide, entrez dans une valeur numérique.');
INSERT INTO "provisioning"."language_strings" VALUES(609,'Web.Syntax.LNPProvName','en','Please enter a provider name in the text field.');
INSERT INTO "provisioning"."language_strings" VALUES(610,'Web.Syntax.LNPProvName','de','Bitte geben Sie einen Provider-Namen in das Textfeld ein.');
INSERT INTO "provisioning"."language_strings" VALUES(611,'Web.Syntax.LNPProvName','es','Por favor, introduzca el nombre de un proveedor en el campo de texto.');
INSERT INTO "provisioning"."language_strings" VALUES(612,'Web.Syntax.LNPProvName','fr','Entrez un nom de fournisseur dans le champ texte.');
INSERT INTO "provisioning"."language_strings" VALUES(613,'Web.LNPProvider.Created','en','The LNP provider has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(614,'Web.LNPProvider.Created','de','Der LNP Provider wurde erstellt.');
INSERT INTO "provisioning"."language_strings" VALUES(615,'Web.LNPProvider.Created','es','El proveedor LNP ha sido creado.');
INSERT INTO "provisioning"."language_strings" VALUES(616,'Web.LNPProvider.Created','fr','Le fournisseur LNP a été créé.');
INSERT INTO "provisioning"."language_strings" VALUES(617,'Web.LNPProvider.Updated','en','The LNP provider has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(618,'Web.LNPProvider.Updated','de','Der LNP Provider wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(619,'Web.LNPProvider.Updated','es','El proveedor LNP ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(620,'Web.LNPProvider.Updated','fr','Le fournisseur LNP a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(621,'Web.LNPProvider.Deleted','en','The LNP provider has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(622,'Web.LNPProvider.Deleted','de','Der LNP Provider wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(623,'Web.LNPProvider.Deleted','es','El proveedor LNP ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(624,'Web.LNPProvider.Deleted','fr','Le fournisseur LNP a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(625,'Web.LNPNumber.Created','en','The LNP number has been stored.');
INSERT INTO "provisioning"."language_strings" VALUES(626,'Web.LNPNumber.Created','de','Die LNP Nummer wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(627,'Web.LNPNumber.Created','es','El número LNP ha sido guardado.');
INSERT INTO "provisioning"."language_strings" VALUES(628,'Web.LNPNumber.Created','fr','Le numéro LNP a été stocké.');
INSERT INTO "provisioning"."language_strings" VALUES(629,'Web.LNPNumber.Updated','en','The LNP number has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(630,'Web.LNPNumber.Updated','de','Die LNP Nummer wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(631,'Web.LNPNumber.Updated','es','El número LNP ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(632,'Web.LNPNumber.Updated','fr','Le numéro LNP a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(633,'Web.LNPNumber.Deleted','en','The LNP number has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(634,'Web.LNPNumber.Deleted','de','Die LNP Nummer wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(635,'Web.LNPNumber.Deleted','es','El número LNP ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(636,'Web.LNPNumber.Deleted','fr','Le numéro LNP a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(637,'Client.Syntax.MalformedE164Number','en','Invalid E.164 number. Please use numbers only and include the international prefix.');
INSERT INTO "provisioning"."language_strings" VALUES(638,'Client.Syntax.MalformedE164Number','de','Ungültige E.164 Nummer. Bitte verwenden Sie nur Zahlen und geben sie den internationalen Prefix mit an.');
INSERT INTO "provisioning"."language_strings" VALUES(639,'Client.Syntax.MalformedE164Number','es','Número E.164 inválido. Por favor, use dígitos exclusivamente e incluya el prefijo internacional.');
INSERT INTO "provisioning"."language_strings" VALUES(640,'Client.Syntax.MalformedE164Number','fr','Numéro E.164.est invalide Utilisez des nombres uniquement en incluant le préfixe international.');
INSERT INTO "provisioning"."language_strings" VALUES(641,'Client.Syntax.MalformedDate','en','Invalid date, please check your syntax.');
INSERT INTO "provisioning"."language_strings" VALUES(642,'Client.Syntax.MalformedDate','de','Ungültiges Datum, bitte überprüfen Sie die Syntax.');
INSERT INTO "provisioning"."language_strings" VALUES(643,'Client.Syntax.MalformedDate','es','Fecha inválida. Por favor, revise la sintaxis.');
INSERT INTO "provisioning"."language_strings" VALUES(644,'Client.Syntax.MalformedDate','fr','La date est invalide, vérifiez votre syntaxe.');
INSERT INTO "provisioning"."language_strings" VALUES(645,'Client.Syntax.MissingNCOSLevel','en','Please specify an NCOS level identifier string.');
INSERT INTO "provisioning"."language_strings" VALUES(646,'Client.Syntax.MissingNCOSLevel','de','Bitte geben Sie eine Bezeichnung für den NCOS Level an.');
INSERT INTO "provisioning"."language_strings" VALUES(647,'Client.Syntax.MissingNCOSLevel','es','Por favor, especifique una cadena identificadora para el nivel NCOS.');
INSERT INTO "provisioning"."language_strings" VALUES(648,'Client.Syntax.MissingNCOSLevel','fr','Spécifiez une série d''identificateur de niveau de NCOS.');
INSERT INTO "provisioning"."language_strings" VALUES(649,'Client.NCOS.ExistingLevel','en','The NCOS level already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(650,'Client.NCOS.ExistingLevel','de','Die NCOS Level Bezeichnung existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(651,'Client.NCOS.ExistingLevel','es','El nivel NCOS ya existe.');
INSERT INTO "provisioning"."language_strings" VALUES(652,'Client.NCOS.ExistingLevel','fr','Le niveau de NCOS existe déjà.');
INSERT INTO "provisioning"."language_strings" VALUES(653,'Client.NCOS.NoSuchLevel','en','The NCOS level does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(654,'Client.NCOS.NoSuchLevel','de','Die NCOS Level Bezeichnung existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(655,'Client.NCOS.NoSuchLevel','es','El nivel NCOS no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(656,'Client.NCOS.NoSuchLevel','fr','The NCOS level does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(657,'Web.NCOSLevel.Created','en','The NCOS level has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(658,'Web.NCOSLevel.Created','de','Der NCOS Level wurde erstellt.');
INSERT INTO "provisioning"."language_strings" VALUES(659,'Web.NCOSLevel.Created','es','El nivel NCOS ha sido creado.');
INSERT INTO "provisioning"."language_strings" VALUES(660,'Web.NCOSLevel.Created','fr','Le niveau de NCOS a été créé.');
INSERT INTO "provisioning"."language_strings" VALUES(661,'Web.NCOSLevel.Updated','en','The NCOS level has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(662,'Web.NCOSLevel.Updated','de','Der NCOS Level wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(663,'Web.NCOSLevel.Updated','es','El nivel NCOS ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(664,'Web.NCOSLevel.Updated','fr','Le niveau de NCOS a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(665,'Web.NCOSLevel.Deleted','en','The NCOS level has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(666,'Web.NCOSLevel.Deleted','de','Der NCOS Level wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(667,'Web.NCOSLevel.Deleted','es','El nivel NCOS ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(668,'Web.NCOSLevel.Deleted','fr','Le niveau de NCOS a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(669,'Web.NCOSPattern.Created','en','The pattern has been stored.');
INSERT INTO "provisioning"."language_strings" VALUES(670,'Web.NCOSPattern.Created','de','Der Filter wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(671,'Web.NCOSPattern.Created','es','El patrón ha sido guardado.');
INSERT INTO "provisioning"."language_strings" VALUES(672,'Web.NCOSPattern.Created','fr','Le modèle a été stocké.');
INSERT INTO "provisioning"."language_strings" VALUES(673,'Web.NCOSPattern.Updated','en','The pattern has been replaced.');
INSERT INTO "provisioning"."language_strings" VALUES(674,'Web.NCOSPattern.Updated','de','Der Filter wurde ersetzt.');
INSERT INTO "provisioning"."language_strings" VALUES(675,'Web.NCOSPattern.Updated','es','El patrón ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(676,'Web.NCOSPattern.Updated','fr','Le modèle a été remplacé.');
INSERT INTO "provisioning"."language_strings" VALUES(677,'Web.NCOSPattern.Deleted','en','The pattern has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(678,'Web.NCOSPattern.Deleted','de','Der Filter wurde entfernt.');
INSERT INTO "provisioning"."language_strings" VALUES(679,'Web.NCOSPattern.Deleted','es','El patrón ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(680,'Web.NCOSPattern.Deleted','fr','Le modèle a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(681,'Web.NCOSLNP.Created','en','The provider has been added to the list.');
INSERT INTO "provisioning"."language_strings" VALUES(682,'Web.NCOSLNP.Created','de','Der LNP Provider wurde der Liste hinzugefügt.');
INSERT INTO "provisioning"."language_strings" VALUES(683,'Web.NCOSLNP.Created','es','El proveedor ha sido añadido a la lista.');
INSERT INTO "provisioning"."language_strings" VALUES(684,'Web.NCOSLNP.Created','fr','Le fournisseur a été ajouté à la liste.');
INSERT INTO "provisioning"."language_strings" VALUES(685,'Web.NCOSLNP.Updated','en','The provider has been updated.');
INSERT INTO "provisioning"."language_strings" VALUES(686,'Web.NCOSLNP.Updated','de','Der LNP Provider wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(687,'Web.NCOSLNP.Updated','es','El proveedor ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(688,'Web.NCOSLNP.Updated','fr','Le fournisseur a été mis à jour.');
INSERT INTO "provisioning"."language_strings" VALUES(689,'Web.NCOSLNP.Deleted','en','The provider has been removed from the list.');
INSERT INTO "provisioning"."language_strings" VALUES(690,'Web.NCOSLNP.Deleted','de','Der LNP Provider wurde von der Liste entfernt.');
INSERT INTO "provisioning"."language_strings" VALUES(691,'Web.NCOSLNP.Deleted','es','El proveedor ha sido eliminado de la lista.');
INSERT INTO "provisioning"."language_strings" VALUES(692,'Web.NCOSLNP.Deleted','fr','Le fournisseur a été enlevé de la liste.');
INSERT INTO "provisioning"."language_strings" VALUES(693,'Client.Syntax.MalformedNCOSPattern','en','The pattern may not be empty, please specify a regular expression.');
INSERT INTO "provisioning"."language_strings" VALUES(694,'Client.Syntax.MalformedNCOSPattern','de','Der Filter darf nicht leer sein, bitte geben Sie einen regulären Ausdruck an.');
INSERT INTO "provisioning"."language_strings" VALUES(695,'Client.Syntax.MalformedNCOSPattern','es','El patrón podría no estar vacío. Por favor, introduzca una expresión regular.');
INSERT INTO "provisioning"."language_strings" VALUES(696,'Client.Syntax.MalformedNCOSPattern','fr','Le modèle ne peut pas être vide, spécifiez une expression régulière.');
INSERT INTO "provisioning"."language_strings" VALUES(697,'Client.Syntax.MalformedAudioData','en','Invalid audio data, please provide an audio stream in wave format.');
INSERT INTO "provisioning"."language_strings" VALUES(698,'Client.Syntax.MalformedAudioData','de','Ungültige Audio-Daten, bitte geben Sie einen Stream im Wave-Format an.');
INSERT INTO "provisioning"."language_strings" VALUES(699,'Client.Syntax.MalformedAudioData','es','Audio incorrecto. Por favor proporcione un flujo de audio en formato wav.');
INSERT INTO "provisioning"."language_strings" VALUES(700,'Client.Syntax.MalformedAudioData','fr','Données audio invalides, fournissez un format audio courant.');
INSERT INTO "provisioning"."language_strings" VALUES(701,'Client.Voip.ExistingAudioFile','en','The audio file handle is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(702,'Client.Voip.ExistingAudioFile','de','Der Audio-Datei-Identifikator wird bereits verwendet.');
INSERT INTO "provisioning"."language_strings" VALUES(703,'Client.Voip.ExistingAudioFile','es','El fichero de audio ya está en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(704,'Client.Voip.ExistingAudioFile','fr','Le fichier audio traité est déjà dans.');
INSERT INTO "provisioning"."language_strings" VALUES(705,'Client.Voip.NoSuchAudioFile','en','The audio file handle does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(706,'Client.Voip.NoSuchAudioFile','de','Der Audio-Datei-Identifikator existiert noch nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(707,'Client.Voip.NoSuchAudioFile','es','El fichero de audio no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(708,'Client.Voip.NoSuchAudioFile','fr','Le fichier audio traité n''existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(709,'Web.AudioFile.Created','en','The audio file has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(710,'Web.AudioFile.Created','de','Die Audio-Datei wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(711,'Web.AudioFile.Created','es','El fichero de audio ha sido creado.');
INSERT INTO "provisioning"."language_strings" VALUES(712,'Web.AudioFile.Created','fr','Le fichier audio a été créé.');
INSERT INTO "provisioning"."language_strings" VALUES(713,'Web.AudioFile.Updated','en','The audio file has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(714,'Web.AudioFile.Updated','de','Die Audio-Datei wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(715,'Web.AudioFile.Updated','es','El fichero de audio ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(716,'Web.AudioFile.Updated','fr','Le fichier audio a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(717,'Web.AudioFile.Deleted','en','The audio file has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(718,'Web.AudioFile.Deleted','de','Die Audio-Datei wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(719,'Web.AudioFile.Deleted','es','El fichero de audio ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(720,'Web.AudioFile.Deleted','fr','Le fichier audio a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(721,'Client.Syntax.MalformedHandle','en','Invalid handle, please specify an alpha-numeric string.');
INSERT INTO "provisioning"."language_strings" VALUES(722,'Client.Syntax.MalformedHandle','de','Ungültiger Identifikator, bitte geben Sie eine alphanumerische Zeichenkette ein.');
INSERT INTO "provisioning"."language_strings" VALUES(723,'Client.Syntax.MalformedHandle','es','Nombre incorrecto. Por favor use caracteres alfanuméricos exclusivamente.');
INSERT INTO "provisioning"."language_strings" VALUES(724,'Client.Syntax.MalformedHandle','fr','Traitement invalide, spécifiez une série alphanumérique.');
INSERT INTO "provisioning"."language_strings" VALUES(725,'Client.VSC.NoSuchAction','en','The VSC action does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(726,'Client.VSC.NoSuchAction','de','Die VSC Aktion existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(727,'Client.VSC.NoSuchAction','es','La acción VSC no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(728,'Client.VSC.NoSuchAction','fr','L''action VSC n''existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(729,'Client.VSC.ExistingAction','en','The VSC action has already been defined.');
INSERT INTO "provisioning"."language_strings" VALUES(730,'Client.VSC.ExistingAction','de','Die VSC Aktion wurde bereits definiert.');
INSERT INTO "provisioning"."language_strings" VALUES(731,'Client.VSC.ExistingAction','es','La acción VSC ya ha sido definida.');
INSERT INTO "provisioning"."language_strings" VALUES(732,'Client.VSC.ExistingAction','fr','L''action VSC a déjà été définie.');
INSERT INTO "provisioning"."language_strings" VALUES(733,'Client.VSC.ExistingDigits','en','The digits are already in use for another VSC action.');
INSERT INTO "provisioning"."language_strings" VALUES(734,'Client.VSC.ExistingDigits','de','Die Zahlenkombination wird bereits für eine andere VSC Aktion verwendet.');
INSERT INTO "provisioning"."language_strings" VALUES(735,'Client.VSC.ExistingDigits','es','Los dígitos ya se encuentran definidos para otra acción VSC.');
INSERT INTO "provisioning"."language_strings" VALUES(736,'Client.VSC.ExistingDigits','fr','Les chiffres sont déjà en cours d’utilisation pour une autre action de VSC.');
INSERT INTO "provisioning"."language_strings" VALUES(737,'Client.Syntax.MalformedVSCDigits','en','Invalid VSC digits setting, please specify exactly two digits.');
INSERT INTO "provisioning"."language_strings" VALUES(738,'Client.Syntax.MalformedVSCDigits','de','Ungültige Zahlenkombination, bitte geben Sie genau zwei Ziffern an.');
INSERT INTO "provisioning"."language_strings" VALUES(739,'Client.Syntax.MalformedVSCDigits','es','Especificación de dígitos inválida. Por favor, especifica exactamente dos dígitos.');
INSERT INTO "provisioning"."language_strings" VALUES(740,'Client.Syntax.MalformedVSCDigits','fr','La configuration de chiffres VSC est invalide, spécifiez exactement deux chiffres.');
INSERT INTO "provisioning"."language_strings" VALUES(741,'Web.VSC.Created','en','The VSC entry has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(742,'Web.VSC.Created','de','Der VSC Eintrag wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(743,'Web.VSC.Created','es','La entrada VSC ha sido creada.');
INSERT INTO "provisioning"."language_strings" VALUES(744,'Web.VSC.Created','fr','L''entrée VSC a été créée.');
INSERT INTO "provisioning"."language_strings" VALUES(745,'Web.VSC.Updated','en','The VSC entry has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(746,'Web.VSC.Updated','de','Der VSC Eintrag wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(747,'Web.VSC.Updated','es','La entrada VSC ha sido modificada.');
INSERT INTO "provisioning"."language_strings" VALUES(748,'Web.VSC.Updated','fr','L''entrée VSC a été changée.');
INSERT INTO "provisioning"."language_strings" VALUES(749,'Web.VSC.Deleted','en','The VSC entry has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(750,'Web.VSC.Deleted','de','Der VSC Eintrag wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(751,'Web.VSC.Deleted','es','La entrada VSC ha sido eliminada.');
INSERT INTO "provisioning"."language_strings" VALUES(752,'Web.VSC.Deleted','fr','L''entrée VSC a été supprimée.');
INSERT INTO "provisioning"."language_strings" VALUES(753,'Client.Voip.AudioFileInUse','en','The audio file is in use and can''t be deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(754,'Client.Voip.AudioFileInUse','de','Die Audio-Datei wird verwendet und kann nicht gelöscht werden.');
INSERT INTO "provisioning"."language_strings" VALUES(755,'Client.Voip.AudioFileInUse','es','El fichero de audio se encuentra actualmente en uso y no puede ser eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(756,'Client.Voip.AudioFileInUse','fr','Le fichier audio est en cours d''utilisation et ne peut pas être supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(757,'Web.Contract.Created','en','The contract has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(758,'Web.Contract.Created','de','Der Vertrag wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(759,'Web.Contract.Created','es','El contrato ha sido creado.');
INSERT INTO "provisioning"."language_strings" VALUES(760,'Web.Contract.Created','fr','Le contrat a été créé.');
INSERT INTO "provisioning"."language_strings" VALUES(761,'Web.Contract.Updated','en','The contract has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(762,'Web.Contract.Updated','de','Der Vertrag wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(763,'Web.Contract.Updated','es','El contrato ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(764,'Web.Contract.Updated','fr','Le contrat a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(765,'Web.Contract.Deleted','en','The contract has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(766,'Web.Contract.Deleted','de','Der Vertrag wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(767,'Web.Contract.Deleted','es','El contrato ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(768,'Web.Contract.Deleted','fr','Le contrat a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(769,'Web.NCOSLevel.LACSet','en','The caller''s area code has been added to the list.');
INSERT INTO "provisioning"."language_strings" VALUES(770,'Web.NCOSLevel.LACSet','de','Die Vorwahl des Anrufers wurde zur Liste hinzugefügt.');
INSERT INTO "provisioning"."language_strings" VALUES(771,'Web.NCOSLevel.LACSet','es','El código de área de llamante ha sido añadido a la lista.');
INSERT INTO "provisioning"."language_strings" VALUES(772,'Web.NCOSLevel.LACSet','fr','L''indicatif de l''interlocuteur a été ajouté à la liste.');
INSERT INTO "provisioning"."language_strings" VALUES(773,'Web.NCOSLevel.LACUnset','en','The caller''s area code has been removed from the list.');
INSERT INTO "provisioning"."language_strings" VALUES(774,'Web.NCOSLevel.LACUnset','de','Die Vorwahl des Anrufers wurde von der Liste entfernt.');
INSERT INTO "provisioning"."language_strings" VALUES(775,'Web.NCOSLevel.LACUnset','es','El código de área de llamante ha sido eliminado de la lista.');
INSERT INTO "provisioning"."language_strings" VALUES(776,'Web.NCOSLevel.LACUnset','fr','L''indicatif de l''interlocuteur a été enlevé de la liste.');
INSERT INTO "provisioning"."language_strings" VALUES(777,'Web.NumberBlock.Created','en','The number block has been created.');
INSERT INTO "provisioning"."language_strings" VALUES(778,'Web.NumberBlock.Created','de','Der Nummernblock wurde gespeichert.');
INSERT INTO "provisioning"."language_strings" VALUES(779,'Web.NumberBlock.Created','es','El bloque de numeración ha sido creado.');
INSERT INTO "provisioning"."language_strings" VALUES(780,'Web.NumberBlock.Created','fr','Le bloc de numéro a été créé.');
INSERT INTO "provisioning"."language_strings" VALUES(781,'Web.NumberBlock.Updated','en','The number block has been changed.');
INSERT INTO "provisioning"."language_strings" VALUES(782,'Web.NumberBlock.Updated','de','Der Nummernblock wurde geändert.');
INSERT INTO "provisioning"."language_strings" VALUES(783,'Web.NumberBlock.Updated','es','El bloque de numeración ha sido modificado.');
INSERT INTO "provisioning"."language_strings" VALUES(784,'Web.NumberBlock.Updated','fr','Le bloc de numéro a été changé.');
INSERT INTO "provisioning"."language_strings" VALUES(785,'Web.NumberBlock.Deleted','en','The number block has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(786,'Web.NumberBlock.Deleted','de','Der Nummernblock wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(787,'Web.NumberBlock.Deleted','es','El bloque de numeración ha sido eliminado.');
INSERT INTO "provisioning"."language_strings" VALUES(788,'Web.NumberBlock.Deleted','fr','Le bloc de numéro a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(789,'Client.Syntax.MalformedReminderTime','en','Invalid time string, please use ''hh:mm'' format.');
INSERT INTO "provisioning"."language_strings" VALUES(790,'Client.Syntax.MalformedReminderTime','de','Ungültige Zeitangabe, bitte verwenden Sie das ''hh:mm'' Format.');
INSERT INTO "provisioning"."language_strings" VALUES(791,'Client.Syntax.MalformedReminderTime','es','Formato de tiempo inválido. Por favor, utilice el formato ''hh:mm''.');
INSERT INTO "provisioning"."language_strings" VALUES(792,'Client.Syntax.MalformedReminderTime','fr','Série de temps invalide, utiliser le format de ''hh:mm''.');
INSERT INTO "provisioning"."language_strings" VALUES(793,'Web.Fax.ExistingFaxDestination','en','This destination is already on the list.');
INSERT INTO "provisioning"."language_strings" VALUES(794,'Web.Fax.ExistingFaxDestination','de','Dieses Destination steht bereits auf der Liste.');
INSERT INTO "provisioning"."language_strings" VALUES(795,'Web.Fax.ExistingFaxDestination','es','Este destino ya se encuentra en la lista.');
INSERT INTO "provisioning"."language_strings" VALUES(796,'Web.Fax.ExistingFaxDestination','fr','Cette destination est déjà dans la liste.');
INSERT INTO "provisioning"."language_strings" VALUES(797,'Client.Voip.ReservedSubscriber','en','This username is reserved for internal use.');
INSERT INTO "provisioning"."language_strings" VALUES(798,'Client.Voip.ReservedSubscriber','de','Dieser Username ist für interne Verwendung reserviert.');
INSERT INTO "provisioning"."language_strings" VALUES(799,'Client.Voip.ReservedSubscriber','es','El nombre de usuario está reservado para uso interno.');
INSERT INTO "provisioning"."language_strings" VALUES(800,'Client.Voip.ReservedSubscriber','fr','Ce non d’utilisateur est réservé pour l’utilisation interne.');
INSERT INTO "provisioning"."language_strings" VALUES(801,'Server.Voip.NoProxy','de','Es wurde kein SIP Proxy für Click-To-Dial konfiguriert.');
INSERT INTO "provisioning"."language_strings" VALUES(802,'Server.Voip.NoProxy','en','No SIP Proxy has been configured for click-to-dial.');
INSERT INTO "provisioning"."language_strings" VALUES(803,'Server.Voip.NoProxy','es','No se ha configurado ningún proxy SIP para click-to-dial.');
INSERT INTO "provisioning"."language_strings" VALUES(804,'Server.Voip.NoProxy','fr','Aucun SIP Proxy n''a été configuré pour Cliquer et composer le numéro.');
INSERT INTO "provisioning"."language_strings" VALUES(805,'Client.Fees.DuplicateDestination','de','Ein Ziel-Präfix / -Suffix wurde mehrfach angegeben.');
INSERT INTO "provisioning"."language_strings" VALUES(806,'Client.Fees.DuplicateDestination','en','A destination prefix/suffix has been specified twice.');
INSERT INTO "provisioning"."language_strings" VALUES(807,'Client.Fees.DuplicateDestination','es','Prefijo/sufijo de destino duplicado.');
INSERT INTO "provisioning"."language_strings" VALUES(808,'Client.Fees.DuplicateDestination','fr','Un préfixe/suffixe de destination a été spécifié deux fois.');
INSERT INTO "provisioning"."language_strings" VALUES(809,'Client.Billing.ExistingExternalCID','en','This external ID is already in use for another customer.');
INSERT INTO "provisioning"."language_strings" VALUES(810,'Client.Billing.ExistingExternalCID','de','Diese externe ID ist bereits bei einem anderen Kunden in Verwendung.');
INSERT INTO "provisioning"."language_strings" VALUES(811,'Client.Billing.ExistingExternalCID','es','Este ID externo ya está siendo usado por otro cliente.');
INSERT INTO "provisioning"."language_strings" VALUES(812,'Client.Billing.ExistingExternalCID','fr','Cet ID externe est déjà utilisé pour un autre client.');
INSERT INTO "provisioning"."language_strings" VALUES(813,'Client.Billing.ExistingExternalAID','en','This external ID is already in use for another account.');
INSERT INTO "provisioning"."language_strings" VALUES(814,'Client.Billing.ExistingExternalAID','de','Diese externe ID ist bereits bei einem anderen Vertrag in Verwendung.');
INSERT INTO "provisioning"."language_strings" VALUES(815,'Client.Billing.ExistingExternalAID','es','Este ID externo ya está siendo usado por otra cuenta.');
INSERT INTO "provisioning"."language_strings" VALUES(816,'Client.Billing.ExistingExternalAID','fr','Cet ID externe est déjà utilisé pour un autre compte.');
INSERT INTO "provisioning"."language_strings" VALUES(817,'Client.Billing.ExistingExternalSID','en','This external ID is already in use for another subscriber.');
INSERT INTO "provisioning"."language_strings" VALUES(818,'Client.Billing.ExistingExternalSID','de','Diese externe ID ist bereits bei einem anderen Subscriber in Verwendung.');
INSERT INTO "provisioning"."language_strings" VALUES(819,'Client.Billing.ExistingExternalSID','es','Este ID externo ya está siendo usado por otro subscriptor.');
INSERT INTO "provisioning"."language_strings" VALUES(820,'Client.Billing.ExistingExternalSID','fr','Cet ID externe est déjà utilisé pour un autre abonné.');
INSERT INTO "provisioning"."language_strings" VALUES(821,'Web.Syntax.MissingExternalID','en','Please enter an external ID in the search box.');
INSERT INTO "provisioning"."language_strings" VALUES(822,'Web.Syntax.MissingExternalID','de','Bitte geben Sie eine externe ID in das Suchfeld ein.');
INSERT INTO "provisioning"."language_strings" VALUES(823,'Web.Syntax.MissingExternalID','es','Por favor, introduzca un ID externo en el campo de búsqueda.');
INSERT INTO "provisioning"."language_strings" VALUES(824,'Web.Syntax.MissingExternalID','fr','Entrez ID externe dans la boîte de recherche.');
INSERT INTO "provisioning"."language_strings" VALUES(825,'Client.Voip.ExistingRewriteRuleSet','en','The rewrite rule set name is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(826,'Client.Voip.ExistingRewriteRuleSet','de','Der Name ist bereits für ein anderes Regelset in Verwendung.');
INSERT INTO "provisioning"."language_strings" VALUES(827,'Client.Voip.ExistingRewriteRuleSet','es','El nombre de grupo de reglas de reescritura ya está en uso.');
INSERT INTO "provisioning"."language_strings" VALUES(828,'Client.Voip.ExistingRewriteRuleSet','fr','Le groupe rewrite rule est déja utilisé.');
INSERT INTO "provisioning"."language_strings" VALUES(829,'Client.Voip.NoSuchRewriteRuleSet','en','The rewrite rule set does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(830,'Client.Voip.NoSuchRewriteRuleSet','de','Das angegebene Regelset existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(831,'Client.Voip.NoSuchRewriteRuleSet','es','El grupo de reglas de reescritura no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(832,'Client.Voip.NoSuchRewriteRuleSet','fr','Le groupe rewrite rule n’existe pas.');
INSERT INTO "provisioning"."language_strings" VALUES(833,'Client.Voip.NoSuchRewriteRule','en','The rewrite rule does not exist.');
INSERT INTO "provisioning"."language_strings" VALUES(834,'Client.Voip.NoSuchRewriteRule','de','Die angegebene Regel existiert nicht.');
INSERT INTO "provisioning"."language_strings" VALUES(835,'Client.Voip.NoSuchRewriteRule','es','La regla de reescritura no existe.');
INSERT INTO "provisioning"."language_strings" VALUES(836,'Client.Voip.NoSuchRewriteRule','fr','Le rewrite rule n’existe pas');
INSERT INTO "provisioning"."language_strings" VALUES(837,'Web.Rewrite.RuleSetDeleted','en','The rewrite rule set has been deleted.');
INSERT INTO "provisioning"."language_strings" VALUES(838,'Web.Rewrite.RuleSetDeleted','de','Das Regelset wurde gelöscht.');
INSERT INTO "provisioning"."language_strings" VALUES(839,'Web.Rewrite.RuleSetDeleted','es','La regla de reescritura ha sido borrada.');
INSERT INTO "provisioning"."language_strings" VALUES(840,'Web.Rewrite.RuleSetDeleted','fr','Le groupe rewrite rule a été supprimé.');
INSERT INTO "provisioning"."language_strings" VALUES(841,'Web.Fees.InvalidCharset','en','Invalid character set detected, please provide all data in UTF-8 encoding.');
INSERT INTO "provisioning"."language_strings" VALUES(842,'Web.Fees.InvalidCharset','de','Ungültiger Zeichensatz, bitte verwenden Sie für alle Daten die UTF-8 Kodierung.');
INSERT INTO "provisioning"."language_strings" VALUES(843,'Web.Fees.InvalidCharset','es','Detectada codificación de caracter inválida. Por favor, use codificación UTF-8.');
INSERT INTO "provisioning"."language_strings" VALUES(844,'Web.Fees.InvalidCharset','fr','Jeu de caractères non valide détecté, s''il vous plaît fournir toutes les données en UTF-8.');
INSERT INTO "provisioning"."language_strings" VALUES(845,'Web.Fees.InvalidZone','en','Invalid zone specification, should be a non-empty string');
INSERT INTO "provisioning"."language_strings" VALUES(846,'Web.Fees.InvalidZone','de','Ungültige Zonenbeschreibung, bitte geben Sie einen Text ein');
INSERT INTO "provisioning"."language_strings" VALUES(847,'Web.Fees.InvalidZone','es','Zona especificada no válida. Debe ser una cadena de caracteres no vacía.');
INSERT INTO "provisioning"."language_strings" VALUES(848,'Web.Fees.InvalidZone','fr','Zone de la spécification non valide détecté. Doit être une chaîne non vide.');
INSERT INTO "provisioning"."language_strings" VALUES(849,'Web.Fees.InvalidZoneDetail','en','Invalid zone detail specification, should be a non-empty string');
INSERT INTO "provisioning"."language_strings" VALUES(850,'Web.Fees.InvalidZoneDetail','de','Ungültige Zonendetailbeschreibung, bitte geben Sie einen Text ein');
INSERT INTO "provisioning"."language_strings" VALUES(851,'Web.Fees.InvalidZoneDetail','es','Detalle de zona especificada no válida. Debe ser una cadena de caracteres no vacía.');
INSERT INTO "provisioning"."language_strings" VALUES(852,'Web.Fees.InvalidZoneDetail','fr','Invalid Spécification de zone, doit être une chaîne non vide.');
INSERT INTO "provisioning"."language_strings" VALUES(853,'Web.Fees.InvalidRate','en','Invalid rate specification, should be a floating point number');
INSERT INTO "provisioning"."language_strings" VALUES(854,'Web.Fees.InvalidRate','de','Ungültige Gebührenangabe, bitte geben Sie eine Gleitpunktzahl ein');
INSERT INTO "provisioning"."language_strings" VALUES(855,'Web.Fees.InvalidRate','es','Campo rate inválido. Debe ser un número flotante.');
INSERT INTO "provisioning"."language_strings" VALUES(856,'Web.Fees.InvalidRate','fr','Invalid spécification du taux, devrait être un nombre à virgule flottante');
INSERT INTO "provisioning"."language_strings" VALUES(857,'Web.Fees.InvalidInterval','en','Invalid interval specification, should be an integer');
INSERT INTO "provisioning"."language_strings" VALUES(858,'Web.Fees.InvalidInterval','de','Ungültige Intervallangabe, bitte geben Sie eine Ganzzahl ein');
INSERT INTO "provisioning"."language_strings" VALUES(859,'Web.Fees.InvalidInterval','es','Intervalo especificado inválido. Debe ser un número entero.');
INSERT INTO "provisioning"."language_strings" VALUES(860,'Web.Fees.InvalidInterval','fr','Invalide la spécification d''intervalle, doit être un entier');
INSERT INTO "provisioning"."language_strings" VALUES(861,'Client.Syntax.InvalidYear','en','Invalid year.');
INSERT INTO "provisioning"."language_strings" VALUES(862,'Client.Syntax.InvalidYear','de','Ungültiges Jahr.	');
INSERT INTO "provisioning"."language_strings" VALUES(863,'Client.Syntax.InvalidYear','es','Año inválido');
INSERT INTO "provisioning"."language_strings" VALUES(864,'Client.Syntax.InvalidYear','fr','Invalid year.');
INSERT INTO "provisioning"."language_strings" VALUES(865,'Client.Syntax.InvalidMonth','en','Invalid month.');
INSERT INTO "provisioning"."language_strings" VALUES(866,'Client.Syntax.InvalidMonth','de','Ungültiges Monat.');
INSERT INTO "provisioning"."language_strings" VALUES(867,'Client.Syntax.InvalidMonth','es','Mes no válido');
INSERT INTO "provisioning"."language_strings" VALUES(868,'Client.Syntax.InvalidMonth','fr','Invalid month.');
INSERT INTO "provisioning"."language_strings" VALUES(869,'Client.Syntax.InvalidMDay','en','Invalid day of month.');
INSERT INTO "provisioning"."language_strings" VALUES(870,'Client.Syntax.InvalidMDay','de','Ungültiger Tag.	');
INSERT INTO "provisioning"."language_strings" VALUES(871,'Client.Syntax.InvalidMDay','es','Día del mes no válido');
INSERT INTO "provisioning"."language_strings" VALUES(872,'Client.Syntax.InvalidMDay','fr','Invalid day of month.');
INSERT INTO "provisioning"."language_strings" VALUES(873,'Client.Syntax.InvalidWDay','en','Invalid day of week.');
INSERT INTO "provisioning"."language_strings" VALUES(874,'Client.Syntax.InvalidWDay','de','Ungültiger Wochentagl');
INSERT INTO "provisioning"."language_strings" VALUES(875,'Client.Syntax.InvalidWDay','es','Día de la semana no válido');
INSERT INTO "provisioning"."language_strings" VALUES(876,'Client.Syntax.InvalidWDay','fr','Invalid day of week.');
INSERT INTO "provisioning"."language_strings" VALUES(877,'Client.Syntax.InvalidHour','en','Invalid hour.');
INSERT INTO "provisioning"."language_strings" VALUES(878,'Client.Syntax.InvalidHour','de','Ungültige Stunde.');
INSERT INTO "provisioning"."language_strings" VALUES(879,'Client.Syntax.InvalidHour','es','Hora no válida');
INSERT INTO "provisioning"."language_strings" VALUES(880,'Client.Syntax.InvalidHour','fr','Invalid hour.');
INSERT INTO "provisioning"."language_strings" VALUES(881,'Client.Syntax.InvalidMinute','en','Invalid minute.');
INSERT INTO "provisioning"."language_strings" VALUES(882,'Client.Syntax.InvalidMinute','de','Ungültige Minute.');
INSERT INTO "provisioning"."language_strings" VALUES(883,'Client.Syntax.InvalidMinute','es','Minuto no válido');
INSERT INTO "provisioning"."language_strings" VALUES(884,'Client.Syntax.InvalidMinute','fr','Invalid minute.');
INSERT INTO "provisioning"."language_strings" VALUES(885,'Client.Syntax.FromMissing','en','Beginning missing.');
INSERT INTO "provisioning"."language_strings" VALUES(886,'Client.Syntax.FromMissing','de','Beginn fehlt.');
INSERT INTO "provisioning"."language_strings" VALUES(887,'Client.Syntax.FromMissing','es','Falta el inicio');
INSERT INTO "provisioning"."language_strings" VALUES(888,'Client.Syntax.FromMissing','fr','Beginning missing.');
INSERT INTO "provisioning"."language_strings" VALUES(889,'Client.Syntax.FromAfterTo','en','Beginning after End.');
INSERT INTO "provisioning"."language_strings" VALUES(890,'Client.Syntax.FromAfterTo','de','Beginn nach Ende.');
INSERT INTO "provisioning"."language_strings" VALUES(891,'Client.Syntax.FromAfterTo','es','Inicio después de final');
INSERT INTO "provisioning"."language_strings" VALUES(892,'Client.Syntax.FromAfterTo','fr','Beginning after End.');
INSERT INTO "provisioning"."language_strings" VALUES(893,'Client.Syntax.EmptySetName','en','Setname can not be empty.');
INSERT INTO "provisioning"."language_strings" VALUES(894,'Client.Syntax.EmptySetName','de','Setname darf nicht leer sein.');
INSERT INTO "provisioning"."language_strings" VALUES(895,'Client.Syntax.EmptySetName','es','No se ha asignado un nombre');
INSERT INTO "provisioning"."language_strings" VALUES(896,'Client.Syntax.EmptySetName','fr','Setname can not be empty.');
INSERT INTO "provisioning"."language_strings" VALUES(897,'Client.Syntax.MissingDestinationSet','en','Please choose a destination set.');
INSERT INTO "provisioning"."language_strings" VALUES(898,'Client.Syntax.MissingDestinationSet','de','Bitte wählen Sie eine Zielgruppe.');
INSERT INTO "provisioning"."language_strings" VALUES(899,'Client.Syntax.MissingDestinationSet','es','Por favor, elija un grupo de destinos');
INSERT INTO "provisioning"."language_strings" VALUES(900,'Client.Syntax.MissingDestinationSet','fr','Please choose a destination set.');
INSERT INTO "provisioning"."language_strings" VALUES(901,'Client.Syntax.UnknownProtocol','en','Unknown protocol');
INSERT INTO "provisioning"."language_strings" VALUES(902,'Client.Syntax.UnknownProtocol','de','Unbekanntes Protokoll');
INSERT INTO "provisioning"."language_strings" VALUES(903,'Client.Syntax.UnknownProtocol','es','Protocolo desconocido');
INSERT INTO "provisioning"."language_strings" VALUES(904,'Client.Syntax.UnknownProtocol','fr','Unknown protocol');
INSERT INTO "provisioning"."language_strings" VALUES(905,'Client.Voip.InvalidEnum','en','Invalid enum');
INSERT INTO "provisioning"."language_strings" VALUES(906,'Client.Voip.InvalidEnum','de','Ungültiger Wert');
INSERT INTO "provisioning"."language_strings" VALUES(907,'Client.Voip.InvalidEnum','es','Valor inválido');
INSERT INTO "provisioning"."language_strings" VALUES(908,'Client.Voip.InvalidEnum','fr','Invalid enum');
INSERT INTO "provisioning"."language_strings" VALUES(909,'Client.Syntax.UnknownLock','en','Unknown locklevel');
INSERT INTO "provisioning"."language_strings" VALUES(910,'Client.Syntax.UnknownLock','de','Unbekannter Locklevel');
INSERT INTO "provisioning"."language_strings" VALUES(911,'Client.Syntax.UnknownLock','fr','Unknown locklevel');
INSERT INTO "provisioning"."language_strings" VALUES(912,'Client.Syntax.UnknownLock','es','Nivel de bloqueo inválido');
INSERT INTO "provisioning"."language_strings" VALUES(913,'Server.Voip.SoundSetDeleted','en','Soundset deleted');
INSERT INTO "provisioning"."language_strings" VALUES(914,'Server.Voip.SoundSetDeleted','de','Soundset gelöscht');
INSERT INTO "provisioning"."language_strings" VALUES(915,'Server.Voip.SoundSetDeleted','fr','Soundset deleted');
INSERT INTO "provisioning"."language_strings" VALUES(916,'Server.Voip.SoundSetDeleted','es','Grupo de locuciones eliminado');
INSERT INTO "provisioning"."language_strings" VALUES(917,'Server.Voip.SoundSetMapped','en','Soundset still mapped');
INSERT INTO "provisioning"."language_strings" VALUES(918,'Server.Voip.SoundSetMapped','de','Soundset in Verwendung');
INSERT INTO "provisioning"."language_strings" VALUES(919,'Server.Voip.SoundSetMapped','fr','Soundset still mapped');
INSERT INTO "provisioning"."language_strings" VALUES(920,'Server.Voip.SoundSetMapped','es','El grupo de locuciones aún está asignado');
INSERT INTO "provisioning"."language_strings" VALUES(921,'Server.Voip.NoSuchSoundSet','en','Soundset does not exist ');
INSERT INTO "provisioning"."language_strings" VALUES(922,'Server.Voip.NoSuchSoundSet','de','Soundset existiert nicht ');
INSERT INTO "provisioning"."language_strings" VALUES(923,'Server.Voip.NoSuchSoundSet','fr','Soundset does not exist ');
INSERT INTO "provisioning"."language_strings" VALUES(924,'Server.Voip.NoSuchSoundSet','es','El grupo de locuciones no existe');
INSERT INTO "provisioning"."language_strings" VALUES(925,'Client.Syntax.MissingSoundFile','en','Soundfile missing ');
INSERT INTO "provisioning"."language_strings" VALUES(926,'Client.Syntax.MissingSoundFile','de','Soundfile fehlt ');
INSERT INTO "provisioning"."language_strings" VALUES(927,'Client.Syntax.MissingSoundFile','es','Locución no encontrada');
INSERT INTO "provisioning"."language_strings" VALUES(928,'Client.Syntax.MissingSoundFile','fr','Soundfile missing ');
INSERT INTO "provisioning"."language_strings" VALUES(929,'Client.Syntax.InvalidE164Number','en','Invalid E.164 Number');
INSERT INTO "provisioning"."language_strings" VALUES(930,'Client.Syntax.InvalidE164Number','de','Ungültige E.164 Nummer');
INSERT INTO "provisioning"."language_strings" VALUES(931,'Client.Syntax.InvalidE164Number','es','Número E164 inválido');
INSERT INTO "provisioning"."language_strings" VALUES(932,'Client.Syntax.InvalidE164Number','fr','Invalid E.164 Number');
INSERT INTO "provisioning"."language_strings" VALUES(933,'Client.Syntax.InvalidSipUsernamePattern','en','Invalid SIP username pattern, please use numbers, letters, "*", "?" and bracket expressions only. Bracket expressions may contain single characters, ranges and the leading negation. Eg.: [0-9a-z], [^abc].');
INSERT INTO "provisioning"."language_strings" VALUES(934,'Client.Syntax.InvalidSipUsernamePattern','de','Ungültiges SIP username Muster, bitte verwenden Sie nur Ziffern, Buchstaben, "*", "?" und Klammerausdrücke. In Klammerausdrücke erlaubt sind einzelne Zeichen, Bereiche und Negation. Zb: [0-9a-z], [^abc].');
INSERT INTO "provisioning"."language_strings" VALUES(935,'Client.Syntax.InvalidSipUsernamePattern','es','Patrón de usuario SIP no válido. Por favor, use números, letras, "*", "?" y corchetes únicamente. Los corchetes pueden contener caracteres, rangos y negaciones. Ej: [0-9a-z], [^abc]');
INSERT INTO "provisioning"."language_strings" VALUES(936,'Client.Syntax.InvalidSipUsernamePattern','fr','Invalid SIP username pattern, please use numbers, letters, "*", "?" and bracket expressions only. Bracket expressions may contain single characters, ranges and the leading negation. Eg.: [0-9a-z], [^abc].');
INSERT INTO "provisioning"."language_strings" VALUES(937,'Client.Syntax.InvalidSipUsername','en','Invalid sip username');
INSERT INTO "provisioning"."language_strings" VALUES(938,'Client.Syntax.InvalidSipUsername','de','Ungültiger sip username');
INSERT INTO "provisioning"."language_strings" VALUES(939,'Client.Syntax.InvalidSipUsername','es','Usuario SIP no válido');
INSERT INTO "provisioning"."language_strings" VALUES(940,'Client.Syntax.InvalidSipUsername','fr','Invalid sip username');
INSERT INTO "provisioning"."language_strings" VALUES(941,'Client.Voip.ExistingWebUser','en','This webuser is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(942,'Client.Voip.ExistingWebUser','de','Dieser Webuser ist nicht mehr verfügbar.');
INSERT INTO "provisioning"."language_strings" VALUES(943,'Client.Voip.ExistingWebUser','es','El usuario web ya se encuentra en uso');
INSERT INTO "provisioning"."language_strings" VALUES(944,'Client.Voip.ExistingWebUser','fr','This webuser is already in use.');
INSERT INTO "provisioning"."language_strings" VALUES(945,'Server.Voip.SoundFileExists','en','Soundfile already exists');
INSERT INTO "provisioning"."language_strings" VALUES(946,'Server.Voip.SoundFileExists','de','Soundfile existiert bereits');
INSERT INTO "provisioning"."language_strings" VALUES(947,'Server.Voip.SoundFileExists','fr','Soundfile already exists');
INSERT INTO "provisioning"."language_strings" VALUES(948,'Server.Voip.SoundFileExists','es','La locución ya existe');
INSERT INTO "provisioning"."language_strings" VALUES(949,'Server.System.WaveTranscodeFailed','en','Failed to transcode sound file');
INSERT INTO "provisioning"."language_strings" VALUES(950,'Server.System.WaveTranscodeFailed','de','Transkodieren der Sounddatei fehlgeschlagen');
INSERT INTO "provisioning"."language_strings" VALUES(951,'Server.System.WaveTranscodeFailed','es','Ha fallado la transcodificación de la locución');
INSERT INTO "provisioning"."language_strings" VALUES(952,'Server.System.WaveTranscodeFailed','fr','Failed to transcode sound file');
INSERT INTO "provisioning"."language_strings" VALUES(953,'Client.Syntax.InvalidFileType','en','Invalid file type');
INSERT INTO "provisioning"."language_strings" VALUES(954,'Client.Syntax.InvalidFileType','de','Ungültiger Dateityp');
INSERT INTO "provisioning"."language_strings" VALUES(955,'Client.Syntax.InvalidFileType','es','Tipo de fichero inválido');
INSERT INTO "provisioning"."language_strings" VALUES(956,'Client.Syntax.InvalidFileType','fr','Invalid file type');
INSERT INTO "provisioning"."language_strings" VALUES(957,'Client.Voip.DuplicatePeeringRule','en','This peering rule already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(958,'Client.Voip.DuplicatePeeringRule','de','Diese Peering-Regel existiert bereits.');
INSERT INTO "provisioning"."language_strings" VALUES(959,'Client.Voip.DuplicatePeeringRule','es','Regla de peering duplicada');
INSERT INTO "provisioning"."language_strings" VALUES(960,'Client.Voip.DuplicatePeeringRule','fr','This peering rule already exists.');
INSERT INTO "provisioning"."language_strings" VALUES(961,'Client.Voip.NoSuchSubscriber','en','Subscriber does not exist');
INSERT INTO "provisioning"."language_strings" VALUES(962,'Client.Voip.NoSuchSubscriber','de','Subscriber existiert nicht');
INSERT INTO "provisioning"."language_strings" VALUES(963,'Client.Voip.NoSuchSubscriber','es','No existe el subscriber');
INSERT INTO "provisioning"."language_strings" VALUES(964,'Client.Voip.NoSuchSubscriber','fr','Subscriber does not exist');
INSERT INTO "provisioning"."language_strings" VALUES(965,'Client.Billing.MalformedAmount','it','Per favore specificare l''ammontare con un numero intero.');
INSERT INTO "provisioning"."language_strings" VALUES(966,'Client.Billing.NoPayType','it','Per favore scegliere un tipo di pagamento.');
INSERT INTO "provisioning"."language_strings" VALUES(967,'Client.Syntax.Date','it','Formato data non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(968,'Client.Syntax.Email','it','Indirizzo e-mail non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(969,'Client.Syntax.MalformedDomain','it','caratteri non valido nel dominio.');
INSERT INTO "provisioning"."language_strings" VALUES(970,'Client.Syntax.MalformedUsername','it','caratteri non validi nello username.');
INSERT INTO "provisioning"."language_strings" VALUES(971,'Client.Syntax.MissingDomain','it','Per favore immettere lo username e il dominio.');
INSERT INTO "provisioning"."language_strings" VALUES(972,'Client.Syntax.MissingParam','it','Manca un parametro obbligatorio.');
INSERT INTO "provisioning"."language_strings" VALUES(973,'Client.Syntax.MalformedUri','it','SIP URI non valida.');
INSERT INTO "provisioning"."language_strings" VALUES(974,'Client.Syntax.MissingUsername','it','Per favore inserire uno username.');
INSERT INTO "provisioning"."language_strings" VALUES(975,'Client.Syntax.VoiceBoxPin','it','Per favore inserire 4 cifre, oppure lasciare il campo testo vuoto.');
INSERT INTO "provisioning"."language_strings" VALUES(976,'Client.Voip.AssignedExtension','it','L''interno e'' gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(977,'Client.Voip.AssignedNumber','it','Il numero telefono specificato non e'' piu'' disponibile. ');
INSERT INTO "provisioning"."language_strings" VALUES(978,'Client.Voip.AuthFailed','it','Login fallito, prego verificare le credenziali.');
INSERT INTO "provisioning"."language_strings" VALUES(979,'Client.Voip.ChooseNumber','it','Prego selezionare un numero dalla lista.');
INSERT INTO "provisioning"."language_strings" VALUES(980,'Client.Voip.DeniedNumber','it','Il numero di telefono specificato non e'' disponibile.');
INSERT INTO "provisioning"."language_strings" VALUES(981,'Client.Voip.ExistingSubscriber','it','Lo username e'' gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(982,'Client.Voip.ForwardSelect','it','Per favore selezionare quando deviare la chiamata.');
INSERT INTO "provisioning"."language_strings" VALUES(983,'Client.Voip.IncorrectPass','it','Password errata, prego verificare.');
INSERT INTO "provisioning"."language_strings" VALUES(984,'Client.Voip.InputErrorFound','it','Trovato un valore mancato o non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(985,'Client.Voip.MalformedAc','it','Prefisso non valido, prego utilizzare solo cifre e non utilizzare lo zero come prima cifra.');
INSERT INTO "provisioning"."language_strings" VALUES(986,'Client.Voip.MalformedCc','it','Prefisso internazionale non valido, prego utilizzare solo cifre e non utilizzare lo zero come prima cifra.)');
INSERT INTO "provisioning"."language_strings" VALUES(987,'Client.Voip.MalformedSn','it','Numero interno non valido, prego utilizzare solo cifre. (Il numero non deve iniziare con lo zero.)');
INSERT INTO "provisioning"."language_strings" VALUES(988,'Client.Voip.MalformedNumber','it','Numero non valido, prego utilizzare solo cifre ed includere il prefisso.');
INSERT INTO "provisioning"."language_strings" VALUES(989,'Client.Voip.MalformedNumberPattern','it','Valore non valido, prego utilizzare solo numeri e “?” o “*” rispettivamente per una o un numero arbitrario di cifre.');
INSERT INTO "provisioning"."language_strings" VALUES(990,'Client.Voip.MalformedTargetClass','it','Prego scegliere un target.');
INSERT INTO "provisioning"."language_strings" VALUES(991,'Client.Voip.MalformedTarget','it','Destinazione non valida, prego utilizzare solo cifre o inserire una SIP URI valida.');
INSERT INTO "provisioning"."language_strings" VALUES(992,'Client.Voip.MalformedTimeout','it','Timeout non valido, prego utilizzare solo cifre.');
INSERT INTO "provisioning"."language_strings" VALUES(993,'Client.Voip.MissingName','it','Prego immettere almeno il nome o il cognome.');
INSERT INTO "provisioning"."language_strings" VALUES(994,'Client.Voip.MissingOldPass','it','Prego immettere la propria password.');
INSERT INTO "provisioning"."language_strings" VALUES(995,'Client.Voip.MissingPass2','it','Prego immettere la password in entrambi i campi.');
INSERT INTO "provisioning"."language_strings" VALUES(996,'Client.Voip.MissingPass','it','Prego immettere una password.');
INSERT INTO "provisioning"."language_strings" VALUES(997,'Client.Voip.MissingRingtimeout','it','Prego specificare un timeout per le chiamate in ingresso. (In secondi da 5 a 300).');
INSERT INTO "provisioning"."language_strings" VALUES(998,'Client.Voip.NoSuchDomain','it','Il dominio specificato non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(999,'Client.Voip.NoSuchNumber','it','Il numero di telefono speficato non e'' disponibile.');
INSERT INTO "provisioning"."language_strings" VALUES(1000,'Client.Voip.PassLength','it','La password e'' troppo breve, prego usare almeno 6 caratteri.');
INSERT INTO "provisioning"."language_strings" VALUES(1001,'Client.Voip.PassNoMatch','it','Le password non coincidono, prego verificare.');
INSERT INTO "provisioning"."language_strings" VALUES(1002,'Client.Voip.ToManyPreference','it','Massimo numero di valori raggiunto.');
INSERT INTO "provisioning"."language_strings" VALUES(1003,'Server.Billing.Success','it','L''account e'' stato compilato con successo.');
INSERT INTO "provisioning"."language_strings" VALUES(1004,'Server.Internal','it','Errore interno, prego riprovare.');
INSERT INTO "provisioning"."language_strings" VALUES(1005,'Server.Paypal.Error','it','Prego seguire le istruzioni sul sito PayPal per trasferire il credito.');
INSERT INTO "provisioning"."language_strings" VALUES(1006,'Server.Paypal.Fault','it','Errore di comunicazione con il server PayPal, prego riprovare piu'' tardi.');
INSERT INTO "provisioning"."language_strings" VALUES(1007,'Server.Paypal.Invalid','it','Errore di comunicazione con il server PayPal, prego riprovare piu'' tardi.');
INSERT INTO "provisioning"."language_strings" VALUES(1008,'Server.Voip.RemovedContact','it','Il valore contact e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1009,'Server.Voip.RemovedRegisteredContact','it','Il valore contact registrato e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1010,'Server.Voip.AddedRegisteredContact','it','Il valore contact registrato permanentemente e'' stato aggiunto.');
INSERT INTO "provisioning"."language_strings" VALUES(1011,'Server.Voip.RemovedVoicemail','it','Il messaggio vocale e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1012,'Server.Voip.SavedContact','it','Il valore contact e'' stato salvato.');
INSERT INTO "provisioning"."language_strings" VALUES(1013,'Server.Voip.SavedPass','it','La password e'' stata modificata con successo.');
INSERT INTO "provisioning"."language_strings" VALUES(1014,'Server.Voip.SavedSettings','it','Le impostazioni sono state salvate.');
INSERT INTO "provisioning"."language_strings" VALUES(1015,'Server.Voip.SubscriberCreated','it','L''utente e'' stato salvato e puo'' essere configurato.');
INSERT INTO "provisioning"."language_strings" VALUES(1016,'Server.Voip.SubscriberDeleted','it','L''utente e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1017,'Server.System.RRDOpenError','it','Apertura del file RRD fallita');
INSERT INTO "provisioning"."language_strings" VALUES(1018,'Server.System.RRDBinmodeError','it','Switch a BIN del file RRD fallito. ');
INSERT INTO "provisioning"."language_strings" VALUES(1019,'Server.System.RRDReadError','it','Lettura del file RRD fallita.');
INSERT INTO "provisioning"."language_strings" VALUES(1020,'Web.Addressbook.Fax','it','Fax');
INSERT INTO "provisioning"."language_strings" VALUES(1021,'Web.Addressbook.Home','it','Casa');
INSERT INTO "provisioning"."language_strings" VALUES(1022,'Web.Addressbook.Mobile','it','Cellulare');
INSERT INTO "provisioning"."language_strings" VALUES(1023,'Web.Addressbook.Office','it','Ufficio');
INSERT INTO "provisioning"."language_strings" VALUES(1024,'Web.MissingRedInput','it','Prego riempire almeno tutti I campi in rosso.');
INSERT INTO "provisioning"."language_strings" VALUES(1025,'Web.Months.01','it','Gennaio');
INSERT INTO "provisioning"."language_strings" VALUES(1026,'Web.Months.02','it','Febbraio');
INSERT INTO "provisioning"."language_strings" VALUES(1027,'Web.Months.03','it','Marzo');
INSERT INTO "provisioning"."language_strings" VALUES(1028,'Web.Months.04','it','Aprile');
INSERT INTO "provisioning"."language_strings" VALUES(1029,'Web.Months.05','it','Maggio');
INSERT INTO "provisioning"."language_strings" VALUES(1030,'Web.Months.06','it','Giugno');
INSERT INTO "provisioning"."language_strings" VALUES(1031,'Web.Months.07','it','Luglio');
INSERT INTO "provisioning"."language_strings" VALUES(1032,'Web.Months.08','it','Agosto');
INSERT INTO "provisioning"."language_strings" VALUES(1033,'Web.Months.09','it','Settembre');
INSERT INTO "provisioning"."language_strings" VALUES(1034,'Web.Months.10','it','Ottobre');
INSERT INTO "provisioning"."language_strings" VALUES(1035,'Web.Months.11','it','Novembre');
INSERT INTO "provisioning"."language_strings" VALUES(1036,'Web.Months.12','it','Dicembre');
INSERT INTO "provisioning"."language_strings" VALUES(1037,'Client.Syntax.AccountID','it','ID non valido, prego utilizzare solo cifre.');
INSERT INTO "provisioning"."language_strings" VALUES(1038,'Client.Syntax.CashValue','it','Ammontare non valito, prego utilizzare solo numeri, com virgola o punto come separatore decimale.');
INSERT INTO "provisioning"."language_strings" VALUES(1039,'Client.Syntax.TimeValue','it','Valore non valido, prego utilizzare solo numeri.');
INSERT INTO "provisioning"."language_strings" VALUES(1040,'Client.Syntax.LoginMissingUsername','it','Prego immettere il proprio username.');
INSERT INTO "provisioning"."language_strings" VALUES(1041,'Client.Syntax.LoginMissingPass','it','Prego immettere la propria password.');
INSERT INTO "provisioning"."language_strings" VALUES(1042,'Client.Voip.NoSuchAccount','it','Questo utente non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1043,'Client.Voip.ExistingDomain','it','Il dominio esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1044,'Web.Domain.Created','it','Il dominio e'' stato salvato.');
INSERT INTO "provisioning"."language_strings" VALUES(1045,'Web.Domain.Deleted','it','Il dominio e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1046,'Client.Admin.ExistingAdmin','it','Lo username e'' gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(1047,'Client.Admin.NoSuchAdmin','it','L''amministratore non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1048,'Client.Syntax.MalformedLogin','it','Carattere non valido nel nome di Login. Prego utilizzare solo caratteri alfanumerici.');
INSERT INTO "provisioning"."language_strings" VALUES(1049,'Web.Admin.Created','it','L''amministratore e'' stato salvato.');
INSERT INTO "provisioning"."language_strings" VALUES(1050,'Web.Admin.Deleted','it','L''amministratore e'' stato eliminato');
INSERT INTO "provisioning"."language_strings" VALUES(1051,'Web.Account.Created','it','L''utente e'' stato salvato.');
INSERT INTO "provisioning"."language_strings" VALUES(1052,'Web.Payment.UnknownError','it','Fallimento nell''inizializzare la transazione. Prego riprovare piu'' tardi o verificare I valori inseriti.');
INSERT INTO "provisioning"."language_strings" VALUES(1053,'Web.Payment.HttpFailed','it','Il server per il pagamento non puo'' essere raggiunto. Prego riprovare piu'' tardi.');
INSERT INTO "provisioning"."language_strings" VALUES(1054,'Web.Syntax.Numeric','it','Numero non valido, prego usare solo cifre numeriche.');
INSERT INTO "provisioning"."language_strings" VALUES(1055,'Web.MissingContactInfo','it','Prego controllare la casella “come sopra” o riempire tutti I campi addizionali.');
INSERT INTO "provisioning"."language_strings" VALUES(1056,'Web.MissingInput','it','Prego riempire tutti I campi.');
INSERT INTO "provisioning"."language_strings" VALUES(1057,'Web.Subscriber.Lockforeign','it','L''interno e'' bloccato per le chiamate che lasciano il sistema.');
INSERT INTO "provisioning"."language_strings" VALUES(1058,'Web.Subscriber.Lockoutgoing','it','L''interno e'' bloccato per le chiamate in uscita.');
INSERT INTO "provisioning"."language_strings" VALUES(1059,'Web.Subscriber.Lockincoming','it','L''interno e'' bloccato chiamate in uscita e in ingresso.');
INSERT INTO "provisioning"."language_strings" VALUES(1060,'Web.Subscriber.Lockglobal','it','L''interno e'' bloccato per tutti I servizi.');
INSERT INTO "provisioning"."language_strings" VALUES(1061,'Web.Payment.ExternalError','it','La transizione e'' fallita. Prego riprovare piu'' tardi e seguire tutte le istruzioni sul sito web esterno.');
INSERT INTO "provisioning"."language_strings" VALUES(1062,'Client.Voip.NoGroupName','it','Prego immettere un nome per il gruppo.');
INSERT INTO "provisioning"."language_strings" VALUES(1063,'Client.Voip.NoGroupExt','it','Prego immettere un interno numerico per il gruppo.');
INSERT INTO "provisioning"."language_strings" VALUES(1064,'Client.Voip.MacInUse','it','Indirizzo MAC gia'' utilizzato.');
INSERT INTO "provisioning"."language_strings" VALUES(1065,'Web.MissingSystem','it','Prego scegliere il PBX IP che si intende utilizzare.');
INSERT INTO "provisioning"."language_strings" VALUES(1066,'Web.MissingAGB','it','Prego sottoscrivere alle nostre condizioni generali di contratto.');
INSERT INTO "provisioning"."language_strings" VALUES(1067,'Web.Account.Activated','it','L''utente e'' stato attivato.');
INSERT INTO "provisioning"."language_strings" VALUES(1068,'Client.Billing.AuthFailed','it','Login fallito, prego verificare le proprie credenziali.');
INSERT INTO "provisioning"."language_strings" VALUES(1069,'Web.MissingSearchString','it','Prego immettere un valore di ricerca.');
INSERT INTO "provisioning"."language_strings" VALUES(1070,'Client.Billing.ContactIncomplete','it','Prego immettere almeno un nome, cognome o azienda.');
INSERT INTO "provisioning"."language_strings" VALUES(1071,'Client.Billing.ExistingShopuser','it','Questo username e'' gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(1072,'Client.Billing.ExistingProduct','it','Un prodotto con il seguente identificativo esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1073,'Client.Billing.NoSuchProduct','it','Nessun prodotto con il seguente identificativo e'' stato trovato.');
INSERT INTO "provisioning"."language_strings" VALUES(1074,'Client.Billing.ExistingProfile','it','Un profilo di billing con il seguente identificativo esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1075,'Client.Billing.NoSuchProfile','it','Nessun profilo di billing con il seguente identificativo e'' stato trovato.');
INSERT INTO "provisioning"."language_strings" VALUES(1076,'Web.Product.Created','it','Il prodotto inserito e'' stato creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1077,'Web.Product.Updated','it','Il prodotto inserito e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1078,'Web.Product.Deleted','it','Il prodotto inserito e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1079,'Web.Bilprof.Created','it','Il profilo tariffario e'' stato creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1080,'Web.Bilprof.Updated','it','Il profilo tariffario e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1081,'Web.Bilprof.Deleted','it','Il profilo tariffario e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1082,'Web.Fees.MissingFilename','it','Prego immettere un nome file.');
INSERT INTO "provisioning"."language_strings" VALUES(1083,'Web.Fees.Fieldcount','it','Numero di elementi errato');
INSERT INTO "provisioning"."language_strings" VALUES(1084,'Web.Fees.FieldsFoundRequired','it','Elementi trovati/richiesti:');
INSERT INTO "provisioning"."language_strings" VALUES(1085,'Web.Fees.InvalidDestination','it','Prefisso/suffisso di destinazione non valido');
INSERT INTO "provisioning"."language_strings" VALUES(1086,'Client.Billing.NoSuchCustomer','it','Il cliente specificato non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1087,'Client.Syntax.MalformedDaytime','it','Orario inserito non valido, prego immettere ore, minuti e secondi nel formato HH:MM:SS.');
INSERT INTO "provisioning"."language_strings" VALUES(1088,'Web.Fees.SavedPeaktimes','it','Gli orari inseriti sono stati aggiornati.');
INSERT INTO "provisioning"."language_strings" VALUES(1089,'Client.Voip.DuplicatedNumber','it','Un numero di telefono e'' stato specificato piu'' di una volta.');
INSERT INTO "provisioning"."language_strings" VALUES(1090,'Client.Voip.SlotAlreadyExists','it','Il codice di chiamata rapida e'' gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(1091,'Client.Voip.SlotNotExistent','it','Il codice di chiamata rapida non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1092,'Client.Syntax.MalformedSpeedDialDestination','it','La destinazione associata al codice di chiamata rapida non e'' valida.');
INSERT INTO "provisioning"."language_strings" VALUES(1093,'Client.Syntax.MalformedVSC','it','Il codice di servizio (VSC) non e'' valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1094,'Client.Syntax.MalformedIPNet','it','ipnet non valido, prego utilizzare la notazione decimale puntata e specificare la maschera com numero di bits.');
INSERT INTO "provisioning"."language_strings" VALUES(1095,'Client.Syntax.MalformedIP','it','ip non valido, pre utilizzare la notazione decimale puntata per IPv4 o indirizzi senza parentesi quadre per IPv6.');
INSERT INTO "provisioning"."language_strings" VALUES(1096,'Server.Voip.PeerGroupDeleted','it','Il peering group e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1097,'Client.Voip.NoSuchPeerGroup','it','Il peering group non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1098,'Client.Voip.NoPeerContract','it','Nessun peering contract selezionato.');
INSERT INTO "provisioning"."language_strings" VALUES(1099,'Client.Voip.ExistingPeerGroup','it','Il peering group esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1100,'Client.Syntax.MalformedPeerGroupName','it','Carattere non valido nel nome del peering group.');
INSERT INTO "provisioning"."language_strings" VALUES(1101,'Client.Voip.NoSuchPeerRule','it','La regola non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1102,'Client.Voip.NoSuchPeerHost','it','L''host non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1103,'Client.Voip.ExistingPeerHost','it','Un host con questo nome esiste gia'' in questo gruppo.');
INSERT INTO "provisioning"."language_strings" VALUES(1104,'Client.Voip.ExistingPeerIp','it','Un host con questo IP esiste gia'' in questo gruppo.');
INSERT INTO "provisioning"."language_strings" VALUES(1105,'Client.Voip.NoSuchPeerRewriteRule','it','Le regole di riscrittura per questo peering non esistono.');
INSERT INTO "provisioning"."language_strings" VALUES(1106,'Client.Voip.NoSuchDomainRewriteRule','it','Le regole di riscrittura per questo dominio non esistono.');
INSERT INTO "provisioning"."language_strings" VALUES(1107,'Client.Voip.NoSuchCfDestSet','it','La tipologia di destinazione per la deviazione di chiamata non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1108,'Client.Voip.ExistingCfDestSet','it','La tipologia di destinazione per la deviazione di chiamata  esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1109,'Client.Voip.NoSuchCfDest','it','La destinazione per la deviazione di chiamata non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1110,'Client.Voip.ExistingCfDest','it','La destinazione per la deviazione di chiamata  esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1111,'Client.Voip.NoSuchCfTimeSet','it','Le regole temporali per la deviazione di chiamata non esistono.');
INSERT INTO "provisioning"."language_strings" VALUES(1112,'Client.Voip.ExistingCfTimeSet','it','La regole temporali per la deviazione di chiamata  esistono gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1113,'Client.Voip.NoSuchCfPeriod','it','Il periodo temporale per la deviazione di chiamata non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1114,'Client.Voip.MalformedFaxDestination','it','''destination'' deve essere un indirizzo email o un numero di telefono.');
INSERT INTO "provisioning"."language_strings" VALUES(1115,'Client.Syntax.FaxPassLength','it','La password e'' troppo breve, prego usare ${faxpw_min_char} caratteri almeno.');
INSERT INTO "provisioning"."language_strings" VALUES(1116,'Web.Syntax.ID','it','ID non valido, prego immettere un valore numerico.');
INSERT INTO "provisioning"."language_strings" VALUES(1117,'Web.Syntax.LNPProvName','it','Prego immettere un nome per il campo provider.');
INSERT INTO "provisioning"."language_strings" VALUES(1118,'Web.LNPProvider.Created','it','Il provider LNP e'' stato creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1119,'Web.LNPProvider.Updated','it','Il provider LNP e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1120,'Web.LNPProvider.Deleted','it','Il provider LNP e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1121,'Web.LNPNumber.Created','it','Il numero LNP e'' stato memorizzato.');
INSERT INTO "provisioning"."language_strings" VALUES(1122,'Web.LNPNumber.Updated','it','Il numero LNP e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1123,'Web.LNPNumber.Deleted','it','Il numero LNP e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1124,'Client.Syntax.MalformedE164Number','it','Numerazione E.164 non valida. Prego utilizzare solo numeri ed includere il prefisso internazionale.');
INSERT INTO "provisioning"."language_strings" VALUES(1125,'Client.Syntax.MalformedDate','it','Data non valida, prego controllare la sintassi.');
INSERT INTO "provisioning"."language_strings" VALUES(1126,'Client.Syntax.MissingNCOSLevel','it','Prego specificare un livello NCOS.');
INSERT INTO "provisioning"."language_strings" VALUES(1127,'Client.NCOS.ExistingLevel','it','Il livello NCOS esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1128,'Client.NCOS.NoSuchLevel','it','Il livello NCOS non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1129,'Web.NCOSLevel.Created','it','Il livello NCOS e'' stato creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1130,'Web.NCOSLevel.Updated','it','Il livello NCOS e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1131,'Web.NCOSLevel.Deleted','it','Il livello NCOS e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1132,'Web.NCOSPattern.Created','it','Il pattern e'' stato memorizzato.');
INSERT INTO "provisioning"."language_strings" VALUES(1133,'Web.NCOSPattern.Updated','it','Il pattern e'' stato aggiornato.');
INSERT INTO "provisioning"."language_strings" VALUES(1134,'Web.NCOSPattern.Deleted','it','Il pattern e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1135,'Web.NCOSLNP.Created','it','Il provider e'' stato aggiunto alla lista.');
INSERT INTO "provisioning"."language_strings" VALUES(1136,'Web.NCOSLNP.Updated','it','Il provider e'' stato aggiornato.');
INSERT INTO "provisioning"."language_strings" VALUES(1137,'Web.NCOSLNP.Deleted','it','Il provider e'' stato rimosso dalla lista.');
INSERT INTO "provisioning"."language_strings" VALUES(1138,'Client.Syntax.MalformedNCOSPattern','it','Il pattern non puo'' essere vuoto, prego specificare una espressione regolare.');
INSERT INTO "provisioning"."language_strings" VALUES(1139,'Client.Syntax.MalformedAudioData','it','File audio non valido, prego immettere una file audio in formato wav.');
INSERT INTO "provisioning"."language_strings" VALUES(1140,'Client.Voip.ExistingAudioFile','it','Identificativo per il file audio gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(1141,'Client.Voip.NoSuchAudioFile','it','L''dentificativo per il file audio non esiste..');
INSERT INTO "provisioning"."language_strings" VALUES(1142,'Web.AudioFile.Created','it','Il file audio e'' stato creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1143,'Web.AudioFile.Updated','it','Il file audio e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1144,'Web.AudioFile.Deleted','it','Il file audio e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1145,'Client.Syntax.MalformedHandle','it','Identificativo non valido, prego specificare una stringa alfanumerica.');
INSERT INTO "provisioning"."language_strings" VALUES(1146,'Client.VSC.NoSuchAction','it','L''azione per il codice VSC non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1147,'Client.VSC.ExistingAction','it','L''azione per il codice VSC e'' stata gia'' definita.');
INSERT INTO "provisioning"."language_strings" VALUES(1148,'Client.VSC.ExistingDigits','it','Le cifre sono gia'' utilizzate da un altro codice VSC.');
INSERT INTO "provisioning"."language_strings" VALUES(1149,'Client.Syntax.MalformedVSCDigits','it','Codice VSC non valido, prego immettere esattamente due cifre.');
INSERT INTO "provisioning"."language_strings" VALUES(1150,'Web.VSC.Created','it','Codice VSC creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1151,'Web.VSC.Updated','it','Codice VSC modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1152,'Web.VSC.Deleted','it','Codice VSC eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1153,'Client.Voip.AudioFileInUse','it','Il file audio e'' in uso e non puo'' essere eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1154,'Web.Contract.Created','it','Il contract e'' stato creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1155,'Web.Contract.Updated','it','Il contract e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1156,'Web.Contract.Deleted','it','Il contract e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1157,'Web.NCOSLevel.LACSet','it','Il prefisso chiamante e'' stato aggiunto alla lista.');
INSERT INTO "provisioning"."language_strings" VALUES(1158,'Web.NCOSLevel.LACUnset','it','Il prefisso chiamante e'' stato rimosso dalla lista.');
INSERT INTO "provisioning"."language_strings" VALUES(1159,'Web.NumberBlock.Created','it','Il blocco numero e'' stato creato.');
INSERT INTO "provisioning"."language_strings" VALUES(1160,'Web.NumberBlock.Updated','it','Il blocco numero e'' stato modificato.');
INSERT INTO "provisioning"."language_strings" VALUES(1161,'Web.NumberBlock.Deleted','it','Il blocco numero e'' stato eliminato.');
INSERT INTO "provisioning"."language_strings" VALUES(1162,'Client.Syntax.MalformedReminderTime','it','Stringa temporale non valida, prego usare il formato ''hh:mm''');
INSERT INTO "provisioning"."language_strings" VALUES(1163,'Web.Fax.ExistingFaxDestination','it','Questa destinazione e'' gia'' nella lista.');
INSERT INTO "provisioning"."language_strings" VALUES(1164,'Client.Voip.ReservedSubscriber','it','Questo username e'' riservato per uso interno.');
INSERT INTO "provisioning"."language_strings" VALUES(1165,'Server.Voip.NoProxy','it','Nessun SIP Proxy e'' stato configurato per il click-to-dial.');
INSERT INTO "provisioning"."language_strings" VALUES(1166,'Client.Fees.DuplicateDestination','it','Un prefisso/suffisso di destinazione e'' stato specificato due volte.');
INSERT INTO "provisioning"."language_strings" VALUES(1167,'Client.Billing.ExistingExternalCID','it','Questo External ID e'' gia'' in utilizzato da un altro cliente.');
INSERT INTO "provisioning"."language_strings" VALUES(1168,'Client.Billing.ExistingExternalAID','it','Questo External ID e'' gia'' in utilizzato da un altro utente.');
INSERT INTO "provisioning"."language_strings" VALUES(1169,'Client.Billing.ExistingExternalSID','it','Questo External ID e'' gia'' in utilizzato da un altro interno.');
INSERT INTO "provisioning"."language_strings" VALUES(1170,'Web.Syntax.MissingExternalID','it','Prego immettere un external ID nel campo di ricerca.');
INSERT INTO "provisioning"."language_strings" VALUES(1171,'Client.Voip.ExistingRewriteRuleSet','it','Il nome per le regole di riscrittura  e'' gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(1172,'Client.Voip.NoSuchRewriteRuleSet','it','La tipologia di regola di riscrittura non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1173,'Client.Voip.NoSuchRewriteRule','it','La regola di riscrittura non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1174,'Web.Rewrite.RuleSetDeleted','it','La tipologia di regola di riscrittura e'' stata eliminata.');
INSERT INTO "provisioning"."language_strings" VALUES(1175,'Web.Fees.InvalidCharset','it','Gruppo di caratteri non valido, prego immettere tutti I dati codificati UTF-8.');
INSERT INTO "provisioning"."language_strings" VALUES(1176,'Web.Fees.InvalidZone','it','Zona specificata non valida, dovrebbe essere una stringa non vuota.');
INSERT INTO "provisioning"."language_strings" VALUES(1177,'Web.Fees.InvalidZoneDetail','it','Dettaglio zona specificato non valido, dovrebbe essere una stringa non vuota.');
INSERT INTO "provisioning"."language_strings" VALUES(1178,'Web.Fees.InvalidRate','it','Prezzo non valido, dovrebbe essere un numero in virgola mobile.');
INSERT INTO "provisioning"."language_strings" VALUES(1179,'Web.Fees.InvalidInterval','it','Intervallo specificato non valido, dovrebbe essere un numero intero.');
INSERT INTO "provisioning"."language_strings" VALUES(1180,'Client.Syntax.InvalidYear','it','Anno non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1181,'Client.Syntax.InvalidMonth','it','Mese non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1182,'Client.Syntax.InvalidMDay','it','Giorno del mese non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1183,'Client.Syntax.InvalidWDay','it','Giorno della settimana.');
INSERT INTO "provisioning"."language_strings" VALUES(1184,'Client.Syntax.InvalidHour','it','Ora non valida.');
INSERT INTO "provisioning"."language_strings" VALUES(1185,'Client.Syntax.InvalidMinute','it','Minuto non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1186,'Client.Syntax.FromMissing','it','Manca un inizio.');
INSERT INTO "provisioning"."language_strings" VALUES(1187,'Client.Syntax.FromAfterTo','it','Inizio dopo fine.');
INSERT INTO "provisioning"."language_strings" VALUES(1188,'Client.Syntax.EmptySetName','it','Setname non puo'' essere vuoto.');
INSERT INTO "provisioning"."language_strings" VALUES(1189,'Client.Syntax.MissingDestinationSet','it','Prego scegliere una tipologia di destinazione.');
INSERT INTO "provisioning"."language_strings" VALUES(1190,'Client.Syntax.UnknownProtocol','it','Protocollo sconosciuto.');
INSERT INTO "provisioning"."language_strings" VALUES(1191,'Client.Voip.InvalidEnum','it','ENUM non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1192,'Client.Syntax.UnknownLock','it','Locklevel non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1193,'Server.Voip.SoundSetDeleted','it','Tipologia di suoni eliminata.');
INSERT INTO "provisioning"."language_strings" VALUES(1194,'Server.Voip.SoundSetMapped','it','Tipologia di suoni ancora assegnata.');
INSERT INTO "provisioning"."language_strings" VALUES(1195,'Server.Voip.NoSuchSoundSet','it','La tipologia di suoni non esiste.');
INSERT INTO "provisioning"."language_strings" VALUES(1196,'Client.Syntax.MissingSoundFile','it','File audio mancante.');
INSERT INTO "provisioning"."language_strings" VALUES(1197,'Client.Syntax.InvalidE164Number','it','Numerazione E.164 non valida.');
INSERT INTO "provisioning"."language_strings" VALUES(1198,'Client.Syntax.InvalidSipUsernamePattern','it','Pattern specificato per username SIP non valido, prego utilizzare solo numeri, lettere, “*”, “?” e “[n-m]”');
INSERT INTO "provisioning"."language_strings" VALUES(1199,'Client.Syntax.InvalidSipUsername','it','Username SIP non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1200,'Client.Voip.ExistingWebUser','it','L''utente webuser e'' gia'' in uso.');
INSERT INTO "provisioning"."language_strings" VALUES(1201,'Server.Voip.SoundFileExists','it','Il file audio esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1202,'Server.System.WaveTranscodeFailed','it','Transcodifica del file audio fallita.');
INSERT INTO "provisioning"."language_strings" VALUES(1203,'Client.Syntax.InvalidFileType','it','Tipo di file non valido.');
INSERT INTO "provisioning"."language_strings" VALUES(1204,'Client.Voip.DuplicatePeeringRule','it','Questa regola esiste gia''.');
INSERT INTO "provisioning"."language_strings" VALUES(1205,'Client.Voip.FaxQueued','en','Fax is going to be sent');
INSERT INTO "provisioning"."language_strings" VALUES(1206,'Client.Voip.FaxQueued','de','Fax wird gesendet');
INSERT INTO "provisioning"."language_strings" VALUES(1207,'Client.Voip.FaxQueued','es','Fax se transmite');
INSERT INTO "provisioning"."language_strings" VALUES(1208,'Client.Voip.FaxQueued','it','Fax verrà trasmesso');
INSERT INTO "provisioning"."language_strings" VALUES(1209,'Client.Voip.FaxQueued','fr','Fax sera transmis');
INSERT INTO "provisioning"."language_strings" VALUES(1210,'Client.Voip.NoFaxData','en','No Fax content specified');
INSERT INTO "provisioning"."language_strings" VALUES(1211,'Client.Voip.NoFaxData','de','Kein Inhalt zur Fax-Übertragung angegeben');
INSERT INTO "provisioning"."language_strings" VALUES(1212,'Client.Voip.NoFaxData','es','No se especifica el contenido del fax');
INSERT INTO "provisioning"."language_strings" VALUES(1213,'Client.Voip.NoFaxData','it','Nessun contenuto fax è specificato');
INSERT INTO "provisioning"."language_strings" VALUES(1214,'Client.Voip.NoFaxData','fr','Aucun contenu du fax est spécifié');
INSERT INTO "provisioning"."language_strings" VALUES(1215,'Client.Voip.InvalidFaxFileType','en','Invalid File Type for Fax');
INSERT INTO "provisioning"."language_strings" VALUES(1216,'Client.Voip.InvalidFaxFileType','de','Ungültiger Datei-Typ für Fax');
INSERT INTO "provisioning"."language_strings" VALUES(1217,'Client.Voip.InvalidFaxFileType','es','Tipo de archivo no válido para el fax');
INSERT INTO "provisioning"."language_strings" VALUES(1218,'Client.Voip.InvalidFaxFileType','it','Tipo di file non valido per il fax');
INSERT INTO "provisioning"."language_strings" VALUES(1219,'Client.Voip.InvalidFaxFileType','fr','Type de fichier non valide pour fax');
INSERT INTO "provisioning"."language_strings" VALUES(1220,'Web.Fees.InvalidDirection','en','Invalid fee direction');
INSERT INTO "provisioning"."language_strings" VALUES(1221,'Web.Fees.InvalidDirection','de','Ungültige Gebühren-Richtung');
INSERT INTO "provisioning"."language_strings" VALUES(1222,'Web.Fees.InvalidDirection','fr','Invalid fee direction');
INSERT INTO "provisioning"."language_strings" VALUES(1223,'Web.Fees.InvalidDirection','es','Invalid fee direction');
CREATE TABLE "provisioning"."voip_aig_sequence" (
  "id" integer  NOT NULL ,
  PRIMARY KEY ("id")
);
CREATE TABLE "provisioning"."voip_allowed_ip_groups" (
  "id" integer  NOT NULL ,
  "group_id" integer  NOT NULL,
  "ipnet" varchar(18) NOT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "provisioning"."voip_cc_mappings" (
  "id" integer  NOT NULL ,
  "uuid" char(36) NOT NULL,
  "auth_key" varchar(255) NOT NULL,
  "source_uuid" char(36) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "vs_uuid_ref" FOREIGN KEY ("uuid") REFERENCES "voip_subscribers" ("uuid") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_cf_destination_sets" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  DEFAULT NULL,
  "name" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_s_subid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_cf_destination_sets" VALUES(1,5,'trffghf');
CREATE TABLE "provisioning"."voip_cf_destinations" (
  "id" integer  NOT NULL ,
  "destination_set_id" integer  NOT NULL,
  "destination" varchar(255) NOT NULL,
  "priority" integer  DEFAULT NULL,
  "timeout" integer  NOT NULL DEFAULT '300',
  PRIMARY KEY ("id")
  CONSTRAINT "v_cf_dsetid_ref" FOREIGN KEY ("destination_set_id") REFERENCES "voip_cf_destination_sets" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_cf_destinations" VALUES(5,1,'sip:ghfhgf1.2.3.4',1,10);
INSERT INTO "provisioning"."voip_cf_destinations" VALUES(6,1,'sip:vmu44553333voicebox.local',2,300);
CREATE TABLE "provisioning"."voip_cf_mappings" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  NOT NULL,
  "type" text  NOT NULL DEFAULT 'cfu',
  "destination_set_id" integer  DEFAULT NULL,
  "time_set_id" integer  DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "cfmap_dest_ref" FOREIGN KEY ("destination_set_id") REFERENCES "voip_cf_destination_sets" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "cfmap_time_ref" FOREIGN KEY ("time_set_id") REFERENCES "voip_cf_time_sets" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "v_cfmap_subid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_cf_periods" (
  "id" integer  NOT NULL ,
  "time_set_id" integer  NOT NULL,
  "year" varchar(255) DEFAULT NULL,
  "month" varchar(255) DEFAULT NULL,
  "mday" varchar(255) DEFAULT NULL,
  "wday" varchar(255) DEFAULT NULL,
  "hour" varchar(255) DEFAULT NULL,
  "minute" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_cf_tsetid_ref" FOREIGN KEY ("time_set_id") REFERENCES "voip_cf_time_sets" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_cf_time_sets" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  DEFAULT NULL,
  "name" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_cf_ts_subid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_contacts" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  NOT NULL,
  "firstname" varchar(127) DEFAULT NULL,
  "lastname" varchar(127) DEFAULT NULL,
  "company" varchar(127) DEFAULT NULL,
  "phonenumber" varchar(31) DEFAULT NULL,
  "homephonenumber" varchar(31) DEFAULT NULL,
  "mobilenumber" varchar(31) DEFAULT NULL,
  "faxnumber" varchar(31) DEFAULT NULL,
  "email" varchar(255) DEFAULT NULL,
  "homepage" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_c_subscriberid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_dbaliases" (
  "id" integer  NOT NULL ,
  "username" varchar(127) NOT NULL,
  "domain_id" integer  NOT NULL,
  "subscriber_id" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_da_domainid_ref" FOREIGN KEY ("domain_id") REFERENCES "voip_domains" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "v_da_subscriberid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_dbaliases" VALUES(1,'111111111',8,9);
INSERT INTO "provisioning"."voip_dbaliases" VALUES(2,'111111112',8,10);
CREATE TABLE "provisioning"."voip_dom_preferences" (
  "id" integer  NOT NULL ,
  "domain_id" integer  NOT NULL,
  "attribute_id" integer  NOT NULL,
  "value" varchar(128) NOT NULL,
  "modify_timestamp" timestamp NOT NULL ,
  PRIMARY KEY ("id")
  CONSTRAINT "v_d_p_attributeid_ref" FOREIGN KEY ("attribute_id") REFERENCES "voip_preferences" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "v_d_p_domainid_ref" FOREIGN KEY ("domain_id") REFERENCES "voip_domains" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(1,2,62,'no','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(2,2,66,'UPDATE_FALLBACK_INVITE','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(3,2,90,'ice_strip_candidates','2013-06-28 12:19:55');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(4,2,95,'transparent','2013-06-28 12:20:01');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(5,2,96,'transparent','2013-06-28 12:20:01');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(7,3,66,'UPDATE_FALLBACK_INVITE','2013-07-05 11:14:44');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(8,3,73,'upn','2013-07-05 11:14:44');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(9,3,75,'npn','2013-07-05 11:14:44');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(10,3,90,'ice_strip_candidates','2013-07-05 11:14:44');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(11,3,95,'transparent','2013-07-05 11:14:44');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(12,3,96,'transparent','2013-07-05 11:14:44');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(13,3,62,'yes','2013-07-05 11:15:53');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(14,4,62,'no','2013-07-05 16:31:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(15,4,66,'UPDATE_FALLBACK_INVITE','2013-07-05 16:31:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(16,4,73,'upn','2013-07-05 16:31:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(17,4,75,'npn','2013-07-05 16:31:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(18,4,90,'ice_strip_candidates','2013-07-05 16:31:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(19,4,95,'transparent','2013-07-05 16:31:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(20,4,96,'transparent','2013-07-05 16:31:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(21,5,62,'no','2013-07-08 10:59:50');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(22,5,66,'UPDATE_FALLBACK_INVITE','2013-07-08 10:59:50');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(23,5,73,'upn','2013-07-08 10:59:50');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(24,5,75,'npn','2013-07-08 10:59:50');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(25,5,90,'ice_strip_candidates','2013-07-08 10:59:50');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(26,5,95,'transparent','2013-07-08 10:59:50');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(27,5,96,'transparent','2013-07-08 10:59:50');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(28,3,35,'1','2013-07-08 11:02:45');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(29,3,41,'789','2013-09-09 10:30:41');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(30,3,71,'pai_user','2013-07-08 11:03:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(31,3,51,'1','2013-07-09 13:53:32');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(32,3,52,'2','2013-07-09 13:53:32');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(33,3,53,'3','2013-07-09 13:53:32');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(34,3,54,'4','2013-07-09 13:53:32');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(37,5,24,'3','2013-07-10 09:06:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(38,5,23,'3','2013-07-10 09:06:09');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(39,5,67,'1','2013-07-10 12:24:38');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(40,6,62,'no','2013-08-07 17:58:46');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(41,6,66,'UPDATE_FALLBACK_INVITE','2013-08-07 17:58:46');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(42,6,73,'upn','2013-08-07 17:58:46');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(43,6,75,'npn','2013-08-07 17:58:46');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(44,6,90,'ice_strip_candidates','2013-08-07 17:58:46');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(45,6,95,'transparent','2013-08-07 17:58:46');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(46,6,96,'transparent','2013-08-07 17:58:46');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(47,6,24,'3','2013-08-08 07:33:40');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(48,7,62,'no','2013-08-09 09:58:23');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(49,7,66,'UPDATE_FALLBACK_INVITE','2013-08-09 09:58:23');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(50,7,73,'upn','2013-08-09 09:58:23');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(51,7,75,'npn','2013-08-09 09:58:23');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(52,7,90,'ice_strip_candidates','2013-08-09 09:58:23');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(53,7,95,'transparent','2013-08-09 09:58:23');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(54,7,96,'transparent','2013-08-09 09:58:23');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(55,5,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(56,7,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(57,3,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(58,6,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(59,4,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(60,2,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(61,8,62,'no','2013-09-06 12:49:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(62,8,66,'UPDATE_FALLBACK_INVITE','2013-09-06 12:49:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(63,8,73,'upn','2013-09-06 12:49:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(64,8,75,'npn','2013-09-06 12:49:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(65,8,90,'ice_strip_candidates','2013-09-06 12:49:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(66,8,95,'transparent','2013-09-06 12:49:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(67,8,96,'transparent','2013-09-06 12:49:13');
INSERT INTO "provisioning"."voip_dom_preferences" VALUES(68,8,97,'strip','2013-09-06 12:49:13');
CREATE TABLE "provisioning"."voip_domains" (
  "id" integer  NOT NULL ,
  "domain" varchar(127) NOT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."voip_domains" VALUES(2,'voip.sipwise.local');
INSERT INTO "provisioning"."voip_domains" VALUES(3,'gjungwirth.de');
INSERT INTO "provisioning"."voip_domains" VALUES(4,'sipwise.at');
INSERT INTO "provisioning"."voip_domains" VALUES(5,'1.2.3.4');
INSERT INTO "provisioning"."voip_domains" VALUES(6,'reseller.com');
INSERT INTO "provisioning"."voip_domains" VALUES(7,'192.168.51.45');
INSERT INTO "provisioning"."voip_domains" VALUES(8,'test.com');
CREATE TABLE "provisioning"."voip_fax_destinations" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  NOT NULL,
  "destination" varchar(255) NOT NULL,
  "filetype" text  NOT NULL DEFAULT 'TIFF',
  "cc" integer NOT NULL DEFAULT '0',
  "incoming" integer NOT NULL DEFAULT '1',
  "outgoing" integer NOT NULL DEFAULT '0',
  "status" integer NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
  CONSTRAINT "v_f_d_subscriberid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_fax_preferences" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  NOT NULL,
  "password" varchar(64) DEFAULT NULL,
  "name" varchar(64) DEFAULT NULL,
  "active" integer NOT NULL DEFAULT '0',
  "send_status" integer NOT NULL DEFAULT '1',
  "send_copy" integer NOT NULL DEFAULT '1',
  PRIMARY KEY ("id")
  CONSTRAINT "v_f_p_subscriberid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_pbx_groups" (
  "id" integer  NOT NULL ,
  "contract_id" integer  NOT NULL,
  "subscriber_id" integer  NOT NULL,
  "name" varchar(255) NOT NULL,
  "extension" varchar(255) DEFAULT NULL,
  "hunt_policy" text  NOT NULL DEFAULT 'serial',
  "hunt_policy_timeout" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "fk_v_sub_group" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_peer_groups" (
  "id" integer  NOT NULL ,
  "name" varchar(127) NOT NULL,
  "priority" integer NOT NULL DEFAULT '1',
  "description" varchar(255) DEFAULT NULL,
  "peering_contract_id" integer  DEFAULT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."voip_peer_groups" VALUES(1,'franky',1,'',3);
CREATE TABLE "provisioning"."voip_peer_hosts" (
  "id" integer  NOT NULL ,
  "group_id" integer  NOT NULL,
  "name" varchar(64) NOT NULL DEFAULT '',
  "ip" varchar(64) NOT NULL,
  "host" varchar(64) DEFAULT NULL,
  "port" integer NOT NULL DEFAULT '5060',
  "transport" integer  DEFAULT NULL,
  "weight" integer NOT NULL DEFAULT '0',
  "via_lb" integer NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
  CONSTRAINT "v_ps_groupid_ref" FOREIGN KEY ("group_id") REFERENCES "voip_peer_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_peer_hosts" VALUES(1,1,'frank','1.3.4.5','myhost.com',5060,1,0,0);
INSERT INTO "provisioning"."voip_peer_hosts" VALUES(2,1,'tiuzti','1.2.3.9','myhost.com',5060,1,1,0);
INSERT INTO "provisioning"."voip_peer_hosts" VALUES(3,1,'a','9.8.7.6','a.com',5060,1,1,0);
CREATE TABLE "provisioning"."voip_peer_preferences" (
  "id" integer  NOT NULL ,
  "peer_host_id" integer  NOT NULL,
  "attribute_id" integer  NOT NULL,
  "value" varchar(255) NOT NULL,
  "modify_timestamp" timestamp NOT NULL ,
  PRIMARY KEY ("id")
  CONSTRAINT "v_p_p_attributeid_ref" FOREIGN KEY ("attribute_id") REFERENCES "voip_preferences" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "v_p_p_peerhostid_ref" FOREIGN KEY ("peer_host_id") REFERENCES "voip_peer_hosts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(1,1,62,'no','2013-07-05 16:29:55');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(2,1,66,'UPDATE_FALLBACK_INVITE','2013-07-05 16:29:55');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(3,1,73,'upn','2013-07-05 16:29:55');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(4,1,75,'npn','2013-07-05 16:29:55');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(5,1,90,'ice_strip_candidates','2013-07-05 16:29:55');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(6,1,95,'transparent','2013-07-05 16:29:55');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(7,1,96,'transparent','2013-07-05 16:29:55');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(8,2,62,'no','2013-08-20 13:05:14');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(9,2,66,'UPDATE_FALLBACK_INVITE','2013-08-20 13:05:14');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(10,2,73,'upn','2013-08-20 13:05:14');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(11,2,75,'npn','2013-08-20 13:05:14');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(12,2,90,'ice_strip_candidates','2013-08-20 13:05:14');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(13,2,95,'transparent','2013-08-20 13:05:14');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(14,2,96,'transparent','2013-08-20 13:05:14');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(15,1,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(16,2,97,'strip','2013-08-27 08:50:08');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(17,3,62,'no','2013-08-28 14:32:39');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(18,3,66,'UPDATE_FALLBACK_INVITE','2013-08-28 14:32:39');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(19,3,73,'upn','2013-08-28 14:32:39');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(20,3,75,'npn','2013-08-28 14:32:39');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(21,3,90,'ice_strip_candidates','2013-08-28 14:32:39');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(22,3,95,'transparent','2013-08-28 14:32:39');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(23,3,96,'transparent','2013-08-28 14:32:39');
INSERT INTO "provisioning"."voip_peer_preferences" VALUES(24,3,97,'strip','2013-08-28 14:32:39');
CREATE TABLE "provisioning"."voip_peer_rules" (
  "id" integer  NOT NULL ,
  "group_id" integer  NOT NULL,
  "callee_prefix" varchar(64) NOT NULL DEFAULT '',
  "callee_pattern" varchar(64) DEFAULT '',
  "caller_pattern" varchar(64) DEFAULT NULL,
  "description" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_pg_groupid_ref" FOREIGN KEY ("group_id") REFERENCES "voip_peer_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_peer_rules" VALUES(1,1,'a','b','c','asdf');
CREATE TABLE "provisioning"."voip_preference_groups" (
  "id" integer  NOT NULL ,
  "name" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."voip_preference_groups" VALUES(1,'Call Forwards');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(2,'Call Blockings');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(3,'Access Restrictions');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(4,'Number Manipulations');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(5,'NAT and Media Flow Control');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(6,'Remote Authentication');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(7,'Session Timers');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(8,'Internals');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(9,'Cloud PBX');
INSERT INTO "provisioning"."voip_preference_groups" VALUES(10,'XMPP Settings');
CREATE TABLE "provisioning"."voip_preferences" (
  "id" integer  NOT NULL ,
  "voip_preference_groups_id" integer  NOT NULL,
  "attribute" varchar(31) NOT NULL,
  "type" integer NOT NULL DEFAULT '0',
  "max_occur" integer  NOT NULL,
  "usr_pref" integer NOT NULL DEFAULT '0',
  "dom_pref" integer NOT NULL DEFAULT '0',
  "peer_pref" integer NOT NULL DEFAULT '0',
  "modify_timestamp" timestamp NOT NULL ,
  "internal" integer NOT NULL DEFAULT '0',
  "expose_to_customer" integer NOT NULL DEFAULT '0',
  "data_type" text  DEFAULT NULL,
  "read_only" integer NOT NULL DEFAULT '0',
  "description" text,
  PRIMARY KEY ("id")
  CONSTRAINT "vpgid_ref" FOREIGN KEY ("voip_preference_groups_id") REFERENCES "voip_preference_groups" ("id") ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_preferences" VALUES(1,3,'lock',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',1,'See "lock_voip_account_subscriber" for a list of possible values. A lock value of "none" will not be returned to the caller. Read-only setting.');
INSERT INTO "provisioning"."voip_preferences" VALUES(2,2,'block_in_mode',1,1,1,0,0,'2013-08-07 14:28:49',0,1,'boolean',0,'Specifies the operational mode of the incoming block list. If unset or set to a false value, it is a blacklist (accept all calls except from numbers listed in the block list), with a true value it is a whitelist (reject all calls except from numbers listed in the block list).');
INSERT INTO "provisioning"."voip_preferences" VALUES(3,2,'block_in_list',0,0,1,0,0,'2013-08-07 14:28:49',0,1,'string',0,'Contains wildcarded SIP usernames (the localpart of the whole SIP URI, eg., "user" of SIP URI "userexample.com") that are (not) allowed to call the subscriber. "*", "?" and "[x-y]" with "x" and "y" representing numbers from 0 to 9 may be used as wildcards like in shell patterns.');
INSERT INTO "provisioning"."voip_preferences" VALUES(4,2,'block_in_clir',1,1,1,0,0,'2013-08-07 14:28:49',0,1,'boolean',0,'Incoming anonymous calls (with calling line identification restriction) are blocked if set to true.');
INSERT INTO "provisioning"."voip_preferences" VALUES(5,2,'block_out_mode',1,1,1,0,0,'2013-08-07 14:28:49',0,1,'boolean',0,'Specifies the operational mode of the outgoing block list. If unset or set to a false value, it is a blacklist (allow all calls except to numbers listed in the block list), with a true value it is a whitelist (deny all calls except to numbers listed in the block list).');
INSERT INTO "provisioning"."voip_preferences" VALUES(6,2,'block_out_list',0,0,1,0,0,'2013-08-07 14:28:49',0,1,'string',0,'Contains wildcarded SIP usernames (the localpart of the whole SIP URI, eg., "user" of SIP URI "userexample.com") that are (not) allowed to be called by the subscriber. "*", "?" and "[x-y]" with "x" and "y" representing numbers from 0 to 9 may be used as wildcards like in shell patterns.');
INSERT INTO "provisioning"."voip_preferences" VALUES(7,2,'adm_block_in_mode',1,1,1,0,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Same as "block_in_mode" but may only be set by administrators.');
INSERT INTO "provisioning"."voip_preferences" VALUES(8,2,'adm_block_in_list',0,0,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'Same as "block_in_list" but may only be set by administrators and is applied prior to the user setting.');
INSERT INTO "provisioning"."voip_preferences" VALUES(9,2,'adm_block_in_clir',1,1,1,0,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Same as "block_in_clir" but may only be set by administrators and is applied prior to the user setting.');
INSERT INTO "provisioning"."voip_preferences" VALUES(10,2,'adm_block_out_mode',1,1,1,0,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Same as "block_out_mode" but may only be set by administrators.');
INSERT INTO "provisioning"."voip_preferences" VALUES(11,2,'adm_block_out_list',0,0,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'Same as "block_out_list" but may only be set by administrators and is applied prior to the user setting.');
INSERT INTO "provisioning"."voip_preferences" VALUES(12,1,'cfu',1,0,1,0,0,'2013-06-28 12:19:58',1,0,'int',1,'The id pointing to the "Call Forward Unconditional" entry in the voip_cf_mappings table');
INSERT INTO "provisioning"."voip_preferences" VALUES(13,1,'cfb',1,0,1,0,0,'2013-06-28 12:19:58',1,0,'int',1,'The id pointing to the "Call Forward Busy" entry in the voip_cf_mappings table');
INSERT INTO "provisioning"."voip_preferences" VALUES(14,1,'cfna',1,0,1,0,0,'2013-06-28 12:19:58',1,0,'int',1,'The id pointing to the "Call Forward Unavailable" entry in the voip_cf_mappings table');
INSERT INTO "provisioning"."voip_preferences" VALUES(15,1,'cft',1,0,1,0,0,'2013-06-28 12:19:58',1,0,'int',1,'The id pointing to the "Call Forward Timeout" entry in the voip_cf_mappings table');
INSERT INTO "provisioning"."voip_preferences" VALUES(16,1,'ringtimeout',1,1,1,0,0,'2013-08-07 14:28:49',1,0,'int',0,'Specifies how many seconds the system should wait before redirecting the call if "cft" is set.');
INSERT INTO "provisioning"."voip_preferences" VALUES(17,4,'cli',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'SIP username (the localpart of the whole SIP URI, eg., "user" of SIP URI "userexample.com"). "network-provided calling line identification" - specifies the SIP username that is used for outgoing calls in the SIP "From" and "P-Asserted-Identity" headers (as user- and network-provided calling numbers). The content of the "From" header may be overridden by the "user_cli" preference and client (if allowed by the "allowed_clis" preference) SIP signalling. Automatically set to the primary E.164 number specified in the subscriber details.');
INSERT INTO "provisioning"."voip_preferences" VALUES(18,4,'clir',1,1,1,0,0,'2013-08-07 14:28:49',0,1,'boolean',0,'"Calling line identification restriction" - if set to true, the CLI is not displayed on outgoing calls.');
INSERT INTO "provisioning"."voip_preferences" VALUES(19,4,'cc',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'The country code that will be used for routing of dialed numbers without a country code. Defaults to the country code of the E.164 number if the subscriber has one.');
INSERT INTO "provisioning"."voip_preferences" VALUES(20,4,'ac',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'The area code that will be used for routing of dialed numbers without an area code. Defaults to the area code of the E.164 number if the subscriber has one.');
INSERT INTO "provisioning"."voip_preferences" VALUES(22,4,'emergency_prefix',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'A numeric string intended to be used in rewrite rules for emergency numbers.');
INSERT INTO "provisioning"."voip_preferences" VALUES(23,2,'ncos_id',1,1,1,1,0,'2013-06-28 12:19:58',1,0,'int',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(24,2,'adm_ncos_id',1,1,1,1,0,'2013-06-28 12:19:58',1,0,'int',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(29,2,'ncos',0,1,1,1,0,'2013-08-07 14:28:49',-1,1,'string',0,'Specifies the NCOS level that applies to the user.');
INSERT INTO "provisioning"."voip_preferences" VALUES(30,2,'adm_ncos',0,1,1,1,0,'2013-06-28 12:19:58',-1,0,'string',0,'Same as "ncos", but may only be set by administrators and is applied prior to the user setting.');
INSERT INTO "provisioning"."voip_preferences" VALUES(31,2,'block_out_override_pin',0,1,1,0,0,'2013-08-07 14:28:49',0,1,'string',0,'A PIN code which may be used in a VSC to disable the outgoing user block list and NCOS level for a call.');
INSERT INTO "provisioning"."voip_preferences" VALUES(32,2,'adm_block_out_override_pin',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'Same as "block_out_override_pin" but additionally disables the administrative block list and NCOS level.');
INSERT INTO "provisioning"."voip_preferences" VALUES(33,6,'peer_auth_user',0,1,1,0,1,'2013-06-28 12:19:58',0,0,'string',0,'A username used for authentication against the peer host.');
INSERT INTO "provisioning"."voip_preferences" VALUES(34,6,'peer_auth_pass',0,1,1,0,1,'2013-06-28 12:19:58',0,0,'string',0,'A password used for authentication against the peer host.');
INSERT INTO "provisioning"."voip_preferences" VALUES(35,3,'unauth_inbound_calls',1,1,0,1,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Allow unauthenticated inbound calls from FOREIGN domain to users within this domain. Use with care - it allows to flood your users with voice spam.');
INSERT INTO "provisioning"."voip_preferences" VALUES(36,6,'peer_auth_realm',0,1,1,0,1,'2013-06-28 12:19:58',0,0,'string',0,'A realm (hostname) used to identify and for authentication against a peer host.');
INSERT INTO "provisioning"."voip_preferences" VALUES(40,6,'peer_auth_register',1,1,1,1,1,'2013-06-28 12:19:58',0,0,'boolean',0,'Specifies whether registration at the peer host is desired.');
INSERT INTO "provisioning"."voip_preferences" VALUES(41,3,'concurrent_max',1,1,1,1,1,'2013-06-28 12:19:58',0,0,'int',0,'Maximum number of concurrent sessions (calls) for a subscriber or peer.');
INSERT INTO "provisioning"."voip_preferences" VALUES(42,3,'concurrent_max_out',1,1,1,1,1,'2013-06-28 12:19:58',0,0,'int',0,'Maximum number of concurrent outgoing sessions (calls) coming from a subscriber or going to a peer.');
INSERT INTO "provisioning"."voip_preferences" VALUES(43,3,'allowed_clis',0,0,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'A list of shell patterns specifying which CLIs are allowed to be set by the subscriber. "*", "?" and "[x-y]" with "x" and "y" representing numbers from 0 to 9 may be used as wildcards as usual in shell patterns.');
INSERT INTO "provisioning"."voip_preferences" VALUES(44,8,'force_outbound_calls_to_peer',1,1,1,1,1,'2013-06-28 12:19:58',0,0,'boolean',0,'Force calls from this user/domain/peer to be routed to PSTN even if the callee is local. Use with caution, as this setting may increase your costs! When enabling this option in a peer, make sure you trust it, as the NGCP will become an open relay for it!');
INSERT INTO "provisioning"."voip_preferences" VALUES(45,8,'account_id',1,1,1,0,0,'2013-06-28 12:19:58',1,0,'int',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(46,8,'ext_contract_id',0,1,1,0,0,'2013-06-28 12:19:58',1,0,'string',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(47,8,'ext_subscriber_id',0,1,1,0,0,'2013-06-28 12:19:58',1,0,'string',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(48,6,'find_subscriber_by_uuid',1,1,0,0,1,'2013-06-28 12:19:58',0,0,'boolean',0,'For incoming calls from this peer, find the destination subscriber also using its auth_username used for outbound registration.');
INSERT INTO "provisioning"."voip_preferences" VALUES(50,4,'rewrite_rule_set',1,1,1,1,1,'2013-06-28 12:19:58',-1,0,'int',0,'Specifies the list of caller and callee rewrite rules which should be applied for incoming and outgoing calls.');
INSERT INTO "provisioning"."voip_preferences" VALUES(51,4,'rewrite_caller_in_dpid',1,1,1,1,1,'2013-06-28 12:19:58',1,0,'int',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(52,4,'rewrite_callee_in_dpid',1,1,1,1,1,'2013-06-28 12:19:58',1,0,'int',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(53,4,'rewrite_caller_out_dpid',1,1,1,1,1,'2013-06-28 12:19:58',1,0,'int',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(54,4,'rewrite_callee_out_dpid',1,1,1,1,1,'2013-06-28 12:19:58',1,0,'int',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(55,4,'e164_to_ruri',1,1,1,0,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Send the E164 number instead of SIP AOR as request username when sending INVITE to the subscriber. If a 404 is received the SIP AOR is sent as request URI as fallback.');
INSERT INTO "provisioning"."voip_preferences" VALUES(56,4,'user_cli',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'SIP username (the localpart of the whole SIP URI, eg., "user" of SIP URI "userexample.com"). "user-provided calling line identification" - specifies the SIP username that is used for outgoing calls. If set, this is put in the SIP "From" header (as user-provided calling number) if a client sends a CLI which is not allowed by "allowed_clis" or if "allowed_clis" is not set.');
INSERT INTO "provisioning"."voip_preferences" VALUES(57,8,'prepaid',1,1,1,0,0,'2013-06-28 12:19:58',1,0,'boolean',0,NULL);
INSERT INTO "provisioning"."voip_preferences" VALUES(60,8,'force_inbound_calls_to_peer',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Force calls to this user to be treated as if the user was not local. This helps in migration scenarios.');
INSERT INTO "provisioning"."voip_preferences" VALUES(61,4,'emergency_suffix',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'A numeric string intended to be used in rewrite rules for emergency numbers.');
INSERT INTO "provisioning"."voip_preferences" VALUES(62,7,'sst_enable',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'Enable SIP Session Timers.');
INSERT INTO "provisioning"."voip_preferences" VALUES(63,7,'sst_expires',1,1,1,1,1,'2013-06-28 12:19:58',0,0,'int',0,'SIP Session Timers refresh interval (seconds). Should be always greater than min_timer preference. SBC will make refresh at the half of this interval.');
INSERT INTO "provisioning"."voip_preferences" VALUES(64,7,'sst_min_timer',1,1,1,1,1,'2013-06-28 12:19:58',0,0,'int',0,'Set Min-SE value in SBC. This is also used to build 422 reply if remote Min-SE is smaller than local Min-SE.');
INSERT INTO "provisioning"."voip_preferences" VALUES(65,7,'sst_max_timer',1,1,1,1,1,'2013-06-28 12:19:58',0,0,'int',0,'Sets upper limit on accepted Min-SE value in in SBC.');
INSERT INTO "provisioning"."voip_preferences" VALUES(66,7,'sst_refresh_method',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'SIP Session Timers refresh method.');
INSERT INTO "provisioning"."voip_preferences" VALUES(67,5,'sound_set',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'int',0,'Soundset');
INSERT INTO "provisioning"."voip_preferences" VALUES(68,3,'reject_emergency',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Reject emergency calls from this user or domain.');
INSERT INTO "provisioning"."voip_preferences" VALUES(69,4,'emergency_cli',0,1,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'SIP username (the localpart of the whole SIP URI, eg., "user" of SIP URI "userexample.com"). Emergency CLI which can be used in rewrite rules as substitution value.');
INSERT INTO "provisioning"."voip_preferences" VALUES(70,8,'outbound_socket',0,1,0,0,1,'2013-06-28 12:19:58',0,0,'enum',0,'Outbound socket to be used for SIP communication to this entity');
INSERT INTO "provisioning"."voip_preferences" VALUES(71,4,'inbound_upn',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'The SIP header field to fetch the user-provided-number from for inbound calls');
INSERT INTO "provisioning"."voip_preferences" VALUES(72,4,'inbound_npn',0,1,0,0,1,'2013-06-28 12:19:58',0,0,'enum',0,'The SIP header field to fetch the network-provided-number from for inbound calls');
INSERT INTO "provisioning"."voip_preferences" VALUES(73,4,'outbound_from_user',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'The content to put into the From username for outbound calls from the platform to the subscriber');
INSERT INTO "provisioning"."voip_preferences" VALUES(74,4,'outbound_from_display',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'The content to put into the From display-name for outbound calls from the platform to the subscriber');
INSERT INTO "provisioning"."voip_preferences" VALUES(75,4,'outbound_pai_user',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'The content to put into the P-Asserted-Identity username for outbound calls from the platform to the subscriber (use "None" to not set header at all)');
INSERT INTO "provisioning"."voip_preferences" VALUES(76,4,'outbound_ppi_user',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'The content to put into the P-Preferred-Identity username for outbound calls from the platform to the subscriber (use "None" to not set header at all)');
INSERT INTO "provisioning"."voip_preferences" VALUES(77,8,'mobile_push_enable',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Send inbound call to Mobile Push server when called subscriber is not registered. This can not be used together with CFNA as call will be then simply forwarded.');
INSERT INTO "provisioning"."voip_preferences" VALUES(78,4,'extension_in_npn',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Search for partial match of user-provided number (UPN) to subscriber''s  primary E164 number and aliases. If it mathes, take UPN as valid wihout allowed_clis check and copy UPN to network-provided number (NPN).');
INSERT INTO "provisioning"."voip_preferences" VALUES(79,3,'concurrent_max_per_account',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'int',0,'Maximum number of concurrent sessions (calls) for subscribers within the same account');
INSERT INTO "provisioning"."voip_preferences" VALUES(80,3,'concurrent_max_out_per_account',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'int',0,'Maximum number of concurrent outgoing sessions (calls) for subscribers within the same account');
INSERT INTO "provisioning"."voip_preferences" VALUES(81,4,'inbound_uprn',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'Specifies the way to obtain the User-Provided Redirecting CLI. Possible options are use NPN of forwarding subscriber or respect inbound Diversion header. Same validation rules as for UPN apply to UPRN. NGCP does not stack UPRNs up if the call is forwarded several times.');
INSERT INTO "provisioning"."voip_preferences" VALUES(82,4,'outbound_diversion',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'The content to put into the Diversion header for outbound calls (use "None" to not set header at all)');
INSERT INTO "provisioning"."voip_preferences" VALUES(83,3,'allowed_ips_grp',1,0,1,0,0,'2013-06-28 12:19:58',1,0,'string',0,'Group of addresses and/or IP nets allowed access.');
INSERT INTO "provisioning"."voip_preferences" VALUES(84,3,'man_allowed_ips_grp',1,0,1,0,0,'2013-06-28 12:19:58',1,0,'string',0,'Group of addresses and/or IP nets allowed access.');
INSERT INTO "provisioning"."voip_preferences" VALUES(85,3,'allowed_ips',1,0,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'Allow access from the given list of IP addresses and/or IP nets.');
INSERT INTO "provisioning"."voip_preferences" VALUES(86,3,'man_allowed_ips',1,0,1,0,0,'2013-06-28 12:19:58',0,0,'string',0,'Allow access from the given list of IP addresses and/or IP nets.');
INSERT INTO "provisioning"."voip_preferences" VALUES(87,3,'ignore_allowed_ips',1,1,1,0,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Ignore preferences "allowed_ips" and "man_allowed_ips".');
INSERT INTO "provisioning"."voip_preferences" VALUES(88,5,'no_nat_sipping',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Don''t do NAT ping for domain/user. Use with caution: this only makes sense on the access network which does not need pings (e.g. CDMA)');
INSERT INTO "provisioning"."voip_preferences" VALUES(89,8,'ip_header',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'string',0,'The SIP header to take the IP address for logging it into CDRs.');
INSERT INTO "provisioning"."voip_preferences" VALUES(90,5,'use_rtpproxy',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'Set RTP relay mode for this peer/domain/user');
INSERT INTO "provisioning"."voip_preferences" VALUES(91,5,'ipv46_for_rtpproxy',0,1,1,1,1,'2013-06-28 12:19:58',0,0,'enum',0,'Choose the logic of IPv4/IPv6 autodetection for the RTP relay');
INSERT INTO "provisioning"."voip_preferences" VALUES(92,3,'allow_out_foreign_domain',1,1,1,1,0,'2013-06-28 12:19:58',0,0,'boolean',0,'Allow outbound calls of local subscribers to foreign domains');
INSERT INTO "provisioning"."voip_preferences" VALUES(93,8,'mobile_push_expiry',1,1,1,1,0,'0000-00-00 00:00:00',0,0,'int',0,'The expiry interval of sent push request. Client is expected to register within this time, otherwise he should treat the request as outdated and ignore.');
INSERT INTO "provisioning"."voip_preferences" VALUES(94,9,'cloud_pbx',1,1,1,1,0,'2013-09-03 13:09:18',1,0,'boolean',0,'Send the calls from/to the subscribers through the cloud pbx module.');
INSERT INTO "provisioning"."voip_preferences" VALUES(95,5,'srtp_transcoding',0,1,1,1,1,'2013-06-28 12:20:01',0,0,'enum',0,'Choose the logic for RTP/SRTP transcoding (SAVP profile) for the RTP relay');
INSERT INTO "provisioning"."voip_preferences" VALUES(96,5,'rtcp_feedback',0,1,1,1,1,'2013-06-28 12:20:01',0,0,'enum',0,'Choose the logic for local RTCP feedback (AVPF profile) for the RTP relay');
INSERT INTO "provisioning"."voip_preferences" VALUES(97,8,'ua_header_mode',0,1,1,1,1,'0000-00-00 00:00:00',0,0,'enum',0,'User-Agent header passing mode.');
INSERT INTO "provisioning"."voip_preferences" VALUES(98,8,'ua_header_replace',0,1,1,1,1,'0000-00-00 00:00:00',0,0,'string',0,'The string to be used as a User-Agent header replacement if ua_header_mode is set to "replace".');
INSERT INTO "provisioning"."voip_preferences" VALUES(99,4,'outbound_history_info',0,1,1,1,1,'0000-00-00 00:00:00',0,0,'enum',0,'The content to put into the History-Info  header for outbound calls (use "None" to not set header at all)');
INSERT INTO "provisioning"."voip_preferences" VALUES(100,9,'cloud_pbx_hunt_policy',0,1,1,0,0,'0000-00-00 00:00:00',1,0,'enum',0,'The hunting policy for PBX hunt groups.');
INSERT INTO "provisioning"."voip_preferences" VALUES(101,9,'cloud_pbx_hunt_timeout',1,1,1,0,0,'0000-00-00 00:00:00',1,0,'int',0,'The serial timeout for hunting in PBX hunt groups.');
INSERT INTO "provisioning"."voip_preferences" VALUES(102,9,'cloud_pbx_hunt_group',0,0,1,0,0,'0000-00-00 00:00:00',1,0,'string',0,'The members (as SIP URIs) of the PBX hunt group.');
INSERT INTO "provisioning"."voip_preferences" VALUES(103,9,'cloud_pbx_base_cli',0,1,1,0,0,'0000-00-00 00:00:00',1,0,'string',0,'The base CLI for the PBX extension.');
INSERT INTO "provisioning"."voip_preferences" VALUES(104,10,'shared_buddylist_visibility',1,1,1,0,0,'0000-00-00 00:00:00',0,0,'boolean',0,'Export this subscriber into the shared XMPP buddy list for the customer.');
INSERT INTO "provisioning"."voip_preferences" VALUES(105,4,'display_name',0,1,1,0,0,'0000-00-00 00:00:00',0,0,'string',0,'The network-provided display name used for XMPP contacts and optionally SIP outbound header manipulation.');
CREATE TABLE "provisioning"."voip_preferences_enum" (
  "id" integer NOT NULL ,
  "preference_id" integer  DEFAULT NULL,
  "label" varchar(128) DEFAULT NULL,
  "value" varchar(128) DEFAULT NULL,
  "usr_pref" integer DEFAULT '0',
  "dom_pref" integer DEFAULT '0',
  "peer_pref" integer DEFAULT '0',
  "default_val" integer DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "voip_preferences_enum_ibfk_1" FOREIGN KEY ("preference_id") REFERENCES "voip_preferences" ("id")
);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(8,62,'use domain default',NULL,1,0,0,NULL);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(9,62,'no','no',1,0,0,NULL);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(10,62,'no','no',0,1,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(11,62,'no','no',0,0,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(12,62,'yes','yes',1,1,1,NULL);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(13,66,'use domain default',NULL,1,0,0,NULL);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(14,66,'UPDATE_FALLBACK_INVITE','UPDATE_FALLBACK_INVITE',1,0,0,NULL);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(15,66,'UPDATE_FALLBACK_INVITE','UPDATE_FALLBACK_INVITE',0,1,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(16,66,'UPDATE_FALLBACK_INVITE','UPDATE_FALLBACK_INVITE',0,0,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(17,66,'UPDATE','UPDATE',1,1,1,NULL);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(18,66,'INVITE','INVITE',1,1,1,NULL);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(19,70,'default',NULL,1,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(20,71,'From-Username',NULL,0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(21,71,'From-Displayname','from_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(22,71,'P-Asserted-Identity','pai_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(23,71,'P-Preferred-Identity','ppi_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(24,71,'Remote-Party-ID','rpid_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(25,72,'From-Username',NULL,0,0,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(26,72,'From-Displayname','from_display',0,0,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(27,72,'P-Asserted-Identity','pai_user',0,0,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(28,72,'P-Preferred-Identity','ppi_user',0,0,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(29,72,'Remote-Party-ID','rpid_user',0,0,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(30,73,'Network-Provided-Number','npn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(31,73,'User-Provided-Number','upn',0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(32,73,'Authentication-User','auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(33,73,'Received Display-name','rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(34,74,'None',NULL,0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(35,74,'Network-Provided-Number','npn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(36,74,'User-Provided-Number','upn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(37,74,'Authentication-User','auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(38,74,'Received Display-name','rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(39,75,'None',NULL,0,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(40,75,'Network-Provided-Number','npn',0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(41,75,'User-Provided-Number','upn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(42,75,'Authentication-User','auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(43,75,'Received Display-name','rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(44,76,'None',NULL,0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(45,76,'Network-Provided-Number','npn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(46,76,'User-Provided-Number','upn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(47,76,'Authentication-User','auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(48,76,'Received Display-name','rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(49,71,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(50,71,'From-Username','from_user',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(51,73,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(53,74,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(54,74,'None','none',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(55,75,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(56,75,'None','none',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(57,76,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(58,76,'None','none',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(59,75,'Network-Provided-Number ','npn',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(60,73,'User-Provided-Number','upn',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(61,81,'None','none',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(62,81,'Forwarder''s NPN',NULL,0,1,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(63,81,'Forwarder''s NPN','npn',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(64,81,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(65,81,'Forwarder''s NPN / Received Diversion','npn_diversion',1,1,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(66,81,'Received Diversion','diversion',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(67,82,'None',NULL,0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(68,82,'None','none',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(69,82,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(70,82,'UPRN','uprn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(71,73,'UPRN (if set) or Network-Provided-Number','uprn/npn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(72,73,'UPRN (if set) or User-Provided-Number','uprn/upn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(73,73,'UPRN (if set) or Authentication-User','uprn/auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(74,73,'UPRN (if set) or Received Display-name','uprn/rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(75,74,'UPRN (if set) or Network-Provided-Number','uprn/npn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(76,74,'UPRN (if set) or User-Provided-Number','uprn/upn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(77,74,'UPRN (if set) or Authentication-User','uprn/auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(78,74,'UPRN (if set) or Received Display-name','uprn/rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(79,75,'UPRN (if set) or Network-Provided-Number','uprn/npn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(80,75,'UPRN (if set) or User-Provided-Number','uprn/upn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(81,75,'UPRN (if set) or Authentication-User','uprn/auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(82,75,'UPRN (if set) or Received Display-name','uprn/rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(83,76,'UPRN (if set) or Network-Provided-Number','uprn/npn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(84,76,'UPRN (if set) or User-Provided-Number','uprn/upn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(85,76,'UPRN (if set) or Authentication-User','uprn/auth_user',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(86,76,'UPRN (if set) or Received Display-name','uprn/rcv_display',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(87,90,'Always with plain SDP',NULL,1,0,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(88,90,'Always with plain SDP','ice_strip_candidates',0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(89,90,'Always with rtpproxy as additional ICE candidate','ice_add_candidates',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(90,90,'Always with rtpproxy as only ICE candidate','ice_replace_candidates',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(91,90,'Never','never',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(92,91,'Auto-detect',NULL,1,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(93,91,'Force IPv4','force_ipv4',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(94,91,'Force IPv6','force_ipv6',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(95,95,'use domain default',NULL,1,0,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(96,95,'Transparent','transparent',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(97,95,'Transparent','transparent',0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(98,95,'Force RTP','force_rtp',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(99,95,'Prefer SRTP','force_srtp',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(100,96,'use domain default',NULL,1,0,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(101,96,'Transparent','transparent',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(102,96,'Transparent','transparent',0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(103,96,'Force AVP','force_avp',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(104,96,'Prefer AVPF','force_avpf',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(105,97,'Strip',NULL,1,0,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(106,97,'Strip','strip',0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(107,97,'Pass-through','passthrough',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(108,97,'Replace','replace',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(109,99,'None',NULL,0,1,1,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(110,99,'None','none',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(111,99,'use domain default',NULL,1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(112,99,'UPRN','uprn',1,1,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(113,73,'Peer authentication name','peer_auth_user',0,0,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(114,75,'Peer authentication name','peer_auth_user',0,0,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(115,76,'Peer authentication name','peer_auth_user',0,0,1,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(116,100,'serial','serial',1,0,0,1);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(117,100,'parallel','parallel',1,0,0,0);
INSERT INTO "provisioning"."voip_preferences_enum" VALUES(118,74,'Network-Provided Display-name','np_display',1,1,1,0);
CREATE TABLE "provisioning"."voip_reminder" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  NOT NULL,
  "time" time NOT NULL,
  "recur" text  NOT NULL DEFAULT 'never',
  PRIMARY KEY ("id")
  CONSTRAINT "v_rem_subscriberid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_rewrite_rule_sets" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  NOT NULL DEFAULT '1',
  "name" varchar(32) NOT NULL,
  "description" varchar(255) DEFAULT NULL,
  "caller_in_dpid" integer  DEFAULT NULL,
  "callee_in_dpid" integer  DEFAULT NULL,
  "caller_out_dpid" integer  DEFAULT NULL,
  "callee_out_dpid" integer  DEFAULT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."voip_rewrite_rule_sets" VALUES(1,1,'test','foo test',1,2,3,4);
INSERT INTO "provisioning"."voip_rewrite_rule_sets" VALUES(2,3,'€^^','d',5,6,7,8);
INSERT INTO "provisioning"."voip_rewrite_rule_sets" VALUES(3,3,'cloned','d',9,10,11,12);
INSERT INTO "provisioning"."voip_rewrite_rule_sets" VALUES(4,3,'cloned again','d',13,14,15,16);
CREATE TABLE "provisioning"."voip_rewrite_rules" (
  "id" integer  NOT NULL ,
  "set_id" integer  NOT NULL,
  "match_pattern" varchar(128) NOT NULL DEFAULT '',
  "replace_pattern" varchar(255) NOT NULL,
  "description" varchar(127) NOT NULL DEFAULT '',
  "direction" text  NOT NULL DEFAULT 'in',
  "field" text  NOT NULL DEFAULT 'caller',
  "priority" integer  NOT NULL DEFAULT '50',
  PRIMARY KEY ("id")
  CONSTRAINT "v_rwr_setid_ref" FOREIGN KEY ("set_id") REFERENCES "voip_rewrite_rule_sets" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_rewrite_rules" VALUES(1,1,'callerin','foo','','in','caller',1);
INSERT INTO "provisioning"."voip_rewrite_rules" VALUES(2,1,'calleein','foo','','in','callee',1);
INSERT INTO "provisioning"."voip_rewrite_rules" VALUES(3,1,'callerout','foo','','out','caller',1);
INSERT INTO "provisioning"."voip_rewrite_rules" VALUES(4,1,'calleeout','foo','','out','callee',1);
INSERT INTO "provisioning"."voip_rewrite_rules" VALUES(5,2,'1234','456','d','in','caller',50);
INSERT INTO "provisioning"."voip_rewrite_rules" VALUES(6,3,'1234','456','d','in','caller',50);
INSERT INTO "provisioning"."voip_rewrite_rules" VALUES(7,4,'1234','45','d','in','caller',50);
CREATE TABLE "provisioning"."voip_rwrs_sequence" (
  "id" integer  NOT NULL ,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."voip_rwrs_sequence" VALUES(16);
CREATE TABLE "provisioning"."voip_sound_files" (
  "id" integer NOT NULL ,
  "filename" varchar(256) DEFAULT NULL,
  "data" longblob,
  "handle_id" integer DEFAULT NULL,
  "set_id" integer DEFAULT NULL,
  "loopplay" integer DEFAULT '0',
  "codec" varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY ("id")
  CONSTRAINT "handle_id_ref" FOREIGN KEY ("handle_id") REFERENCES "voip_sound_handles" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "set_id_ref" FOREIGN KEY ("set_id") REFERENCES "voip_sound_sets" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_sound_groups" (
  "id" integer  NOT NULL ,
  "name" varchar(255) NOT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."voip_sound_groups" VALUES(1,'early_rejects');
INSERT INTO "provisioning"."voip_sound_groups" VALUES(2,'pbx');
INSERT INTO "provisioning"."voip_sound_groups" VALUES(3,'calling_card');
INSERT INTO "provisioning"."voip_sound_groups" VALUES(4,'music_on_hold');
INSERT INTO "provisioning"."voip_sound_groups" VALUES(5,'mobile_push');
CREATE TABLE "provisioning"."voip_sound_handles" (
  "id" integer NOT NULL ,
  "name" varchar(256) DEFAULT NULL,
  "group_id" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_s_h_group_ref" FOREIGN KEY ("group_id") REFERENCES "voip_sound_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(1,'block_in',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(2,'block_out',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(3,'block_ncos',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(4,'block_override_pin_wrong',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(5,'locked_in',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(6,'locked_out',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(7,'max_calls_in',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(8,'max_calls_out',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(9,'max_calls_peer',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(10,'unauth_caller_ip',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(11,'relaying_denied',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(12,'invalid_speeddial',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(13,'cf_loop',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(14,'callee_offline',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(15,'callee_busy',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(16,'callee_unknown',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(17,'callee_tmp_unavailable',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(18,'peering_unavailable',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(19,'voicebox_unavailable',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(20,'music_on_hold',4);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(21,'emergency_unsupported',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(22,'no_credit',1);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(23,'and',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(24,'busy_ringback_tone',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(25,'calling_card_not_found',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(26,'connecting',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(27,'could_not_connect',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(28,'credits_successfully_transfered',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(29,'declined_ringback_tone',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(30,'dollar',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(31,'enter_callingcard_number_to_transfer',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(32,'enter_callingcard_number',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(33,'enter_destination_number',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(34,'error_please_try_later',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(35,'euro_cents',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(36,'euro_unit',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(37,'you_have_in_your_account',3);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(38,'aa_welcome',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(39,'aa_1_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(40,'aa_1_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(41,'aa_2_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(42,'aa_2_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(43,'aa_3_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(44,'aa_3_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(45,'aa_4_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(46,'aa_4_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(47,'aa_5_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(48,'aa_5_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(49,'aa_6_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(50,'aa_6_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(51,'aa_7_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(52,'aa_7_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(53,'aa_8_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(54,'aa_8_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(55,'aa_9_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(56,'aa_9_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(57,'aa_0_for',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(58,'aa_0_option',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(59,'office_hours',2);
INSERT INTO "provisioning"."voip_sound_handles" VALUES(60,'push_connecting',5);
CREATE TABLE "provisioning"."voip_sound_sets" (
  "id" integer NOT NULL ,
  "reseller_id" integer  NOT NULL DEFAULT '1',
  "name" varchar(256) DEFAULT NULL,
  "description" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."voip_sound_sets" VALUES(1,1,'Default €','d');
INSERT INTO "provisioning"."voip_sound_sets" VALUES(2,3,'r€seller','blaaaa');
CREATE TABLE "provisioning"."voip_speed_dial" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  NOT NULL,
  "slot" varchar(64) NOT NULL,
  "destination" varchar(192) NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_sd_subscriberid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."voip_subscribers" (
  "id" integer  NOT NULL ,
  "username" varchar(127) NOT NULL,
  "domain_id" integer  NOT NULL,
  "uuid" char(36) NOT NULL,
  "password" varchar(40) DEFAULT NULL,
  "admin" integer NOT NULL DEFAULT '0',
  "account_id" integer  DEFAULT NULL,
  "webusername" varchar(127) DEFAULT NULL,
  "webpassword" varchar(40) DEFAULT NULL,
  "is_pbx_group" integer NOT NULL DEFAULT '0',
  "pbx_group_id" integer  DEFAULT NULL,
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("id")
  CONSTRAINT "v_s_domainid_ref" FOREIGN KEY ("domain_id") REFERENCES "voip_domains" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."voip_subscribers" VALUES(3,'no_such_number',2,'9bcb88b6-541a-43da-8fdc-816f5557ff93','e28507d4619ad61abdcab0b5edbce989',0,NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_subscribers" VALUES(4,'nagios',2,'ac1697cf-6933-45ef-9abf-b1278054ded0','nagios4Sipwise!',0,NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_subscribers" VALUES(5,'cdfdsfdsgf',5,'fc5d299b-6940-47f0-ba1e-1ae5e43c339a','fdsfdsffds',0,4,'cdfdsfdsgf',NULL,0,NULL,'2013-08-21 06:48:01','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_subscribers" VALUES(6,'jklkjljö',5,'17de3c68-3fd5-4d7d-aff8-b374c6fe36fe','ölkjölö',0,4,'administrator',NULL,0,NULL,'2013-08-21 07:01:14','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_subscribers" VALUES(7,'alice',7,'278ee25b-27c2-4a7b-82a7-b5769c2be718','123456',0,4,'alice','',0,NULL,'2013-08-09 09:59:33','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_subscribers" VALUES(8,'bob',7,'f1d40d7a-8f44-4cc9-86f6-18f06b89eab8','123456',0,4,'bob','',0,NULL,'2013-08-09 09:59:59','0000-00-00 00:00:00');
INSERT INTO "provisioning"."voip_subscribers" VALUES(9,'1111111',8,'6e41c627-d81f-4451-9c36-4674cb0acdd1','111111',1,9,NULL,NULL,0,NULL,'2013-09-06 12:50:07','2013-09-06 12:50:07');
INSERT INTO "provisioning"."voip_subscribers" VALUES(10,'new',8,'fe313b72-3028-4c6a-9a69-d3638d25d99f','111111',1,13,NULL,NULL,0,NULL,'2013-09-06 13:17:42','2013-09-06 13:17:42');
CREATE TABLE "provisioning"."voip_trusted_sources" (
  "id" integer  NOT NULL ,
  "subscriber_id" integer  NOT NULL,
  "src_ip" varchar(50) NOT NULL,
  "protocol" varchar(4) NOT NULL,
  "from_pattern" varchar(64) DEFAULT NULL,
  "uuid" varchar(64) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "subscriber_id_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "provisioning"."xmlgroups" (
  "id" integer  NOT NULL ,
  "name" varchar(32) NOT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."xmlgroups" VALUES(1,'proxy');
INSERT INTO "provisioning"."xmlgroups" VALUES(2,'registrar');
INSERT INTO "provisioning"."xmlgroups" VALUES(3,'presence');
INSERT INTO "provisioning"."xmlgroups" VALUES(4,'loadbalancer');
INSERT INTO "provisioning"."xmlgroups" VALUES(5,'appserver');
INSERT INTO "provisioning"."xmlgroups" VALUES(6,'proxy-ng');
INSERT INTO "provisioning"."xmlgroups" VALUES(7,'xmpp');
CREATE TABLE "provisioning"."xmlhostgroups" (
  "id" integer  NOT NULL ,
  "group_id" integer  NOT NULL,
  "host_id" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "xhg_groupid_ref" FOREIGN KEY ("group_id") REFERENCES "xmlgroups" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "xhg_hostid_ref" FOREIGN KEY ("host_id") REFERENCES "xmlhosts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "provisioning"."xmlhostgroups" VALUES(1,1,1);
INSERT INTO "provisioning"."xmlhostgroups" VALUES(2,5,2);
INSERT INTO "provisioning"."xmlhostgroups" VALUES(3,6,3);
INSERT INTO "provisioning"."xmlhostgroups" VALUES(4,4,4);
INSERT INTO "provisioning"."xmlhostgroups" VALUES(5,7,5);
CREATE TABLE "provisioning"."xmlhosts" (
  "id" integer  NOT NULL ,
  "ip" varchar(15) NOT NULL,
  "port" integer  NOT NULL,
  "path" varchar(64) NOT NULL DEFAULT '/',
  "sip_port" integer  DEFAULT NULL,
  "description" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "provisioning"."xmlhosts" VALUES(1,'127.0.0.1',8000,'/RPC2',5062,'Kamailio');
INSERT INTO "provisioning"."xmlhosts" VALUES(2,'127.0.0.1',8090,'/',NULL,'Sems');
INSERT INTO "provisioning"."xmlhosts" VALUES(3,'127.0.0.1',5062,'/',NULL,'Kamailio-SR');
INSERT INTO "provisioning"."xmlhosts" VALUES(4,'127.0.0.1',5060,'/',NULL,'Loadbalancer');
INSERT INTO "provisioning"."xmlhosts" VALUES(5,'127.0.0.1',5582,'/',NULL,'Prosody');
CREATE TABLE "provisioning"."xmlqueue" (
  "id" integer  NOT NULL ,
  "target" varchar(255) NOT NULL,
  "body" text NOT NULL,
  "ctime" integer  NOT NULL,
  "atime" integer  NOT NULL,
  "tries" integer  NOT NULL,
  "next_try" integer  NOT NULL,
  PRIMARY KEY ("id")
);
