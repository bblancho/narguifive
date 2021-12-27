<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211013002143 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user (
            id INT AUTO_INCREMENT NOT NULL, 
            nom VARCHAR(255) NOT NULL, 
            prenom VARCHAR(255) NOT NULL, 
            email VARCHAR(180) NOT NULL, 
            roles JSON NOT NULL, 
            password VARCHAR(255) NOT NULL, 
            adresse VARCHAR(255) NOT NULL, 
            zipcode INT NOT NULL, 
            ville VARCHAR(255) NOT NULL, 
            phone INT NOT NULL, 
            sexe SMALLINT NOT NULL, 
            UNIQUE INDEX UNIQ_8D93D649E7927C74 (email), 
            PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB' );
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE user');
    }
}
