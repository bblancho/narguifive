<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211225000750 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        // $this->addSql('ALTER TABLE category ADD titre VARCHAR(255) DEFAULT NULL, ADD image VARCHAR(255) DEFAULT NULL');
        // $this->addSql('ALTER TABLE category ADD titre VARCHAR(255) DEFAULT NULL, ADD image VARCHAR(255) DEFAULT NULL');
        // $this->addSql('ALTER TABLE image_product ADD CONSTRAINT FK_465A53714584665A FOREIGN KEY (product_id) REFERENCES product (id)');
        // $this->addSql('ALTER TABLE marque CHANGE type type VARCHAR(255) DEFAULT NULL');
        // $this->addSql('ALTER TABLE order_details ADD CONSTRAINT FK_845CA2C1BFCDF877 FOREIGN KEY (my_order_id) REFERENCES `order` (id)');
        // $this->addSql('ALTER TABLE product ADD marque_id INT DEFAULT NULL, ADD gramme INT DEFAULT NULL, CHANGE taille taille DOUBLE PRECISION DEFAULT NULL, CHANGE vase vase VARCHAR(255) DEFAULT NULL, CHANGE tuyau tuyau VARCHAR(255) DEFAULT NULL, CHANGE fixation fixation VARCHAR(255) DEFAULT NULL');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD12469DE2 FOREIGN KEY (category_id) REFERENCES category (id)');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD527FEED1 FOREIGN KEY (sous_category_id) REFERENCES sous_category (id)');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD7ADA1FB5 FOREIGN KEY (color_id) REFERENCES color (id)');
        // $this->addSql('ALTER TABLE product ADD CONSTRAINT FK_D34A04AD4827B9B2 FOREIGN KEY (marque_id) REFERENCES marque (id)');
        // $this->addSql('CREATE INDEX IDX_D34A04AD4827B9B2 ON product (marque_id)');
        // $this->addSql('ALTER TABLE reset_password ADD CONSTRAINT FK_B9983CE5A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        // $this->addSql('ALTER TABLE sous_category ADD CONSTRAINT FK_E022D9412469DE2 FOREIGN KEY (category_id) REFERENCES category (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        // $this->addSql('ALTER TABLE category DROP titre, DROP image');
        // $this->addSql('ALTER TABLE image_product DROP FOREIGN KEY FK_465A53714584665A');
        // $this->addSql('ALTER TABLE marque CHANGE type type VARCHAR(255) CHARACTER SET utf8 NOT NULL COLLATE `utf8_unicode_ci`');
        // $this->addSql('ALTER TABLE order_details DROP FOREIGN KEY FK_845CA2C1BFCDF877');
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD12469DE2');
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD527FEED1');
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD7ADA1FB5');
        // $this->addSql('ALTER TABLE product DROP FOREIGN KEY FK_D34A04AD4827B9B2');
        // $this->addSql('DROP INDEX IDX_D34A04AD4827B9B2 ON product');
        // $this->addSql('ALTER TABLE product DROP marque_id, DROP gramme, CHANGE taille taille DOUBLE PRECISION NOT NULL, CHANGE vase vase VARCHAR(255) CHARACTER SET utf8 NOT NULL COLLATE `utf8_unicode_ci`, CHANGE tuyau tuyau VARCHAR(255) CHARACTER SET utf8 NOT NULL COLLATE `utf8_unicode_ci`, CHANGE fixation fixation VARCHAR(255) CHARACTER SET utf8 NOT NULL COLLATE `utf8_unicode_ci`');
        // $this->addSql('ALTER TABLE reset_password DROP FOREIGN KEY FK_B9983CE5A76ED395');
        // $this->addSql('ALTER TABLE sous_category DROP FOREIGN KEY FK_E022D9412469DE2');
    }
}
