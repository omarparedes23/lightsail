use db_easy_table;
DROP TABLE IF EXISTS avis;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS tablerestaurant;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS restaurant;

create table restaurant (
id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(50),
rue varchar(200),
ville varchar(100),
code_postal char(5),
telephone VARCHAR(20),
email VARCHAR(40),
presentation text,
restaurant_type ENUM('FAST_FOOD', 'BRASSERIE', 'CUISINE_DU_MONDE'),
url VARCHAR(200)
);
create table client (
id INT AUTO_INCREMENT PRIMARY KEY,
nom VARCHAR(30),
prenom VARCHAR(30),
email VARCHAR(50),
mot_de_passe VARCHAR(200),
telephone VARCHAR(20),
rue varchar(200),
ville varchar(100),
code_postal char(5)
);
CREATE TABLE tablerestaurant (
id INT auto_increment,
restaurant_id INT NOT NULL,
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id),
PRIMARY KEY(id)
);
create table reservation (
id INT auto_increment,
date_reservation DATE,
heure_reservation TIME,
nombre_personnes INT,
client_id INT NOT NULL,
table_restaurant_id INT NOT NULL,
FOREIGN KEY (client_id) REFERENCES client(id),
FOREIGN KEY (table_restaurant_id) REFERENCES tablerestaurant(id),
PRIMARY KEY(id)
);
create table menu (
id INT AUTO_INCREMENT,
nom VARCHAR(30),
contenu VARCHAR(300),
menu_type ENUM('ENFANT', 'JUNIOR', 'DECOUVERTE', 'DEGUSTATION', 'DU_JOUR'),
prix DECIMAL(5,2),
url VARCHAR(200),
restaurant_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);
create table avis (
id INT AUTO_INCREMENT,
note int,
commentaire VARCHAR(200),
date_avis DATETIME,
client_id INT NOT NULL,
restaurant_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (client_id) REFERENCES client(id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(id)
);

desc restaurant;
select * from restaurant;
insert into restaurant values (1,
'Waly Fay','6 Rue Godefroy Cavaignac',"Paris","75011",'076456789',
'walyfay@gmail.com','Waly Fay, c’est LE restaurant sénégalais phare de Paris ! Si vous voulez une déco stylée et des mafés (plat en sauce à la cacahuète) à mourir, c’est la bonne adresse',
'CUISINE_DU_MONDE',
'https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2018/09/16120047/Capture-decran-2023-07-05-a-11.01.22.png');
insert into restaurant values (2,
'New Soul Food le Maquis','177, quai de Valmy',"Paris","75010",'063456789',
'newsoul@gmail.com','Adresse itinérante qui régale les Parisiens depuis maintenant 6 ans. Une cuisine africaine et européenne délicieuse. On parle bien sûr de New Soul Food, le food-truck que l’on trouve habituellement sur le parvis de la Bibliothèque Nationale de France – site François Mitterrand, ou encore à la Défense ! Et aujourd’hui, sa délicieuse cuisine se déguste également tout près du canal saint-Martin',
'CUISINE_DU_MONDE',
'https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2018/09/16120042/Copie-de-Design-sans-titre-68-1024x576-1.jpeg');
insert into restaurant values (3,
'Le petit Dakar','6, rue Elzevir',"Paris","75003",'054654789',
'lepetitdakar@gmail.com',
'Située en plein cœur de Paris, cette petite perle vous offre des yassas (poulet ou poisson mariné au citron, oignon et ail), des maffés et des thiéboudiennes (riz au poisson, persil et piment) abordables et délicieux !',
'BRASSERIE',
'https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2018/09/16120045/Capture-decran-2023-07-05-a-11.02.50.png');
insert into restaurant values (4,
'Le Khelkom','88 rue Jean-Pierre Timbaud',"Paris","75011",'043456574',
'lekhelkom@gmail.com',
'Des plats super colorés, joliment présentés et vraiment trop bons ! On craque pour le Yassa de poisson et le thieboudienne de la maison ! Ne manquez pas la banane flambée pour le dessert ! Attention, le restaurant n’ouvre que le soir.',
'BRASSERIE',
'https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2018/09/16120045/280229358_1726618081022592_2922650417605299425_n.jpg');
insert into restaurant values (5,
'Afrik’n’fusion','330 Rue des Pyrénées',"Paris","75020",'065656574',
'lekhelkom@gmail.com',
'Ici, on est plus dans le resto tradi : Afrik’n’Fusion penche plus vers la restauration rapide. Une collection de plats phares de la gastronomie africaine (pas que sénégalaise) est à choisir dans une déco américanisée. Maffé de poulet ou de bœuf, thiéboudienne, yassa poulet ou poisson, tous les grands classiques de la cuisine sénégalaise sont servis ici sur place ou à emporter.',
'FAST_FOOD',
'https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2018/09/16120044/Capture-decran-2023-07-05-a-11.11.07.png');
insert into tablerestaurant values ("1","1");
insert into tablerestaurant values ("2","1");
insert into tablerestaurant values ("4","1");
insert into tablerestaurant values ("8","1");