<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211229180116 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        // $this->addSql('CREATE TABLE adresse (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, nom VARCHAR(255) NOT NULL, prenom VARCHAR(255) NOT NULL, lastname VARCHAR(255) NOT NULL, societe VARCHAR(255) DEFAULT NULL, adresse VARCHAR(255) NOT NULL, postal VARCHAR(255) NOT NULL, ville VARCHAR(255) NOT NULL, pays VARCHAR(255) NOT NULL, phone VARCHAR(255) NOT NULL, INDEX IDX_C35F0816A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE category (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, content LONGTEXT DEFAULT NULL, slug VARCHAR(255) DEFAULT NULL, titre VARCHAR(255) DEFAULT NULL, image VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE color (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, ref VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE gout (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, slug VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE header (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, content LONGTEXT NOT NULL, btn_title VARCHAR(255) NOT NULL, btn_url VARCHAR(255) NOT NULL, image VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE image_product (id INT AUTO_INCREMENT NOT NULL, product_id INT DEFAULT NULL, image_name VARCHAR(255) NOT NULL, image_size VARCHAR(255) NOT NULL, INDEX IDX_465A53714584665A (product_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE marque (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, type VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE `order` (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, created_at DATETIME NOT NULL, transpoteur_nom VARCHAR(255) NOT NULL, transporteur_prix DOUBLE PRECISION NOT NULL, delivry LONGTEXT NOT NULL, is_paid TINYINT(1) NOT NULL, reference VARCHAR(255) NOT NULL, stripe_session_id VARCHAR(255) DEFAULT NULL, statut INT NOT NULL, INDEX IDX_F5299398A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE order_details (id INT AUTO_INCREMENT NOT NULL, my_order_id INT NOT NULL, product VARCHAR(255) NOT NULL, qantity INT NOT NULL, price DOUBLE PRECISION NOT NULL, total DOUBLE PRECISION NOT NULL, INDEX IDX_845CA2C1BFCDF877 (my_order_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE picture (id INT AUTO_INCREMENT NOT NULL, produit_id INT DEFAULT NULL, image_size VARCHAR(255) DEFAULT NULL, image_name VARCHAR(255) NOT NULL, updated_at DATETIME NOT NULL, INDEX IDX_16DB4F89F347EFB (produit_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE product (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, sous_category_id INT DEFAULT NULL, color_id INT DEFAULT NULL, marque_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, content LONGTEXT NOT NULL, slug VARCHAR(255) NOT NULL, image VARCHAR(255) DEFAULT NULL, price DOUBLE PRECISION NOT NULL, price_ht DOUBLE PRECISION NOT NULL, promotion TINYINT(1) DEFAULT NULL, nouveaute TINYINT(1) DEFAULT NULL, taille DOUBLE PRECISION DEFAULT NULL, vase VARCHAR(255) DEFAULT NULL, tuyau VARCHAR(255) DEFAULT NULL, fixation VARCHAR(255) DEFAULT NULL, autre VARCHAR(255) DEFAULT NULL, publie TINYINT(1) NOT NULL, is_best TINYINT(1) NOT NULL, gramme INT DEFAULT NULL, en_stock TINYINT(1) NOT NULL, quantite INT DEFAULT NULL, INDEX IDX_D34A04AD12469DE2 (category_id), INDEX IDX_D34A04AD527FEED1 (sous_category_id), INDEX IDX_D34A04AD7ADA1FB5 (color_id), INDEX IDX_D34A04AD4827B9B2 (marque_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE reset_password (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, token VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, INDEX IDX_B9983CE5A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE sous_category (id INT AUTO_INCREMENT NOT NULL, category_id INT DEFAULT NULL, nom VARCHAR(255) NOT NULL, content LONGTEXT DEFAULT NULL, slug VARCHAR(255) DEFAULT NULL, INDEX IDX_E022D9412469DE2 (category_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE transporteur (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, price DOUBLE PRECISION NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, prenom VARCHAR(255) NOT NULL, email VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, adresse VARCHAR(255) NOT NULL, zipcode INT NOT NULL, ville VARCHAR(255) NOT NULL, phone INT NOT NULL, sexe SMALLINT NOT NULL, UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB');
        // $this->addSql('ALTER TABLE adresse ADD CONSTRAINT FK_C35F0816A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        // $this->addSql('ALTER TABLE image_product ADD CONSTRAINT FK_465A53714584665A FOREIGN KEY (product_id) REFERENCES product (id)');
        // $this->addSql('ALTER TABLE `order` ADD CONSTRAINT FK_F5299398A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        // $this->addSql('ALTER TABLE order_details ADD CONSTRAINT FK_845CA2C1BFCDF877 FOREIGN KEY (my_order_id) REFERENCES `order` (id)');
        // $this->addSql('ALTER TABLE picture ADD CONSTRAINT FK_16DB4F89F347EFB FOREIGN KEY (produit_id) REFERENCES product (id)');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD12469DE2 FOREIGN KEY (category_id) REFERENCES category (id)');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD527FEED1 FOREIGN KEY (sous_category_id) REFERENCES sous_category (id)');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD7ADA1FB5 FOREIGN KEY (color_id) REFERENCES color (id)');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD4827B9B2 FOREIGN KEY (marque_id) REFERENCES marque (id)');
        // $this->addSql('ALTER TABLE reset_password ADD CONSTRAINT FK_B9983CE5A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        // $this->addSql('ALTER TABLE sous_category ADD CONSTRAINT FK_E022D9412469DE2 FOREIGN KEY (category_id) REFERENCES category (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD12469DE2');
        // $this->addSql('ALTER TABLE sous_category DROP FOREIGN KEY FK_E022D9412469DE2');
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD7ADA1FB5');
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD4827B9B2');
        // $this->addSql('ALTER TABLE order_details DROP FOREIGN KEY FK_845CA2C1BFCDF877');
        // $this->addSql('ALTER TABLE image_product DROP FOREIGN KEY FK_465A53714584665A');
        // $this->addSql('ALTER TABLE picture DROP FOREIGN KEY FK_16DB4F89F347EFB');
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD527FEED1');
        // $this->addSql('ALTER TABLE adresse DROP FOREIGN KEY FK_C35F0816A76ED395');
        // $this->addSql('ALTER TABLE `order` DROP FOREIGN KEY FK_F5299398A76ED395');
        // $this->addSql('ALTER TABLE reset_password DROP FOREIGN KEY FK_B9983CE5A76ED395');
        // $this->addSql('DROP TABLE adresse');
        // $this->addSql('DROP TABLE category');
        // $this->addSql('DROP TABLE color');
        // $this->addSql('DROP TABLE gout');
        // $this->addSql('DROP TABLE header');
        // $this->addSql('DROP TABLE image_product');
        // $this->addSql('DROP TABLE marque');
        // $this->addSql('DROP TABLE `order`');
        // $this->addSql('DROP TABLE order_details');
        // $this->addSql('DROP TABLE picture');
        // $this->addSql('DROP TABLE product');
        // $this->addSql('DROP TABLE reset_password');
        // $this->addSql('DROP TABLE sous_category');
        // $this->addSql('DROP TABLE transporteur');
        // $this->addSql('DROP TABLE user');
    }
}
