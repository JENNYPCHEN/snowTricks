<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211224101924 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comment CHANGE trick_id trick_id INT DEFAULT NULL, CHANGE user_id user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE image DROP FOREIGN KEY fk_image_trick1');
        $this->addSql('ALTER TABLE image CHANGE trick_id trick_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE image ADD CONSTRAINT FK_C53D045FB281BE2E FOREIGN KEY (trick_id) REFERENCES trick (id)');
        $this->addSql('ALTER TABLE trick CHANGE user_id user_id INT DEFAULT NULL, CHANGE category_id category_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE trick RENAME INDEX name TO UNIQ_D8F0A91E5E237E06');
        $this->addSql('DROP INDEX email_UNIQUE ON user');
        $this->addSql('ALTER TABLE user ADD roles JSON NOT NULL, DROP email, DROP create_date, DROP token, DROP token_timestamp, CHANGE username username VARCHAR(180) NOT NULL');
        $this->addSql('ALTER TABLE user RENAME INDEX username_unique TO UNIQ_8D93D649F85E0677');
        $this->addSql('ALTER TABLE video DROP FOREIGN KEY fk_video_trick1');
        $this->addSql('ALTER TABLE video CHANGE trick_id trick_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE video ADD CONSTRAINT FK_7CC7DA2CB281BE2E FOREIGN KEY (trick_id) REFERENCES trick (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE comment CHANGE trick_id trick_id INT NOT NULL, CHANGE user_id user_id INT NOT NULL');
        $this->addSql('ALTER TABLE image DROP FOREIGN KEY FK_C53D045FB281BE2E');
        $this->addSql('ALTER TABLE image CHANGE trick_id trick_id INT NOT NULL');
        $this->addSql('ALTER TABLE image ADD CONSTRAINT fk_image_trick1 FOREIGN KEY (trick_id) REFERENCES trick (id) ON UPDATE CASCADE ON DELETE CASCADE');
        $this->addSql('ALTER TABLE trick CHANGE category_id category_id INT NOT NULL, CHANGE user_id user_id INT DEFAULT 1');
        $this->addSql('ALTER TABLE trick RENAME INDEX uniq_d8f0a91e5e237e06 TO name');
        $this->addSql('ALTER TABLE user ADD email VARCHAR(45) CHARACTER SET utf8 NOT NULL COLLATE `utf8_general_ci`, ADD create_date DATETIME NOT NULL, ADD token VARCHAR(255) CHARACTER SET utf8 DEFAULT NULL COLLATE `utf8_general_ci`, ADD token_timestamp DATETIME DEFAULT NULL, DROP roles, CHANGE username username VARCHAR(45) CHARACTER SET utf8 NOT NULL COLLATE `utf8_general_ci`');
        $this->addSql('CREATE UNIQUE INDEX email_UNIQUE ON user (email)');
        $this->addSql('ALTER TABLE user RENAME INDEX uniq_8d93d649f85e0677 TO username_UNIQUE');
        $this->addSql('ALTER TABLE video DROP FOREIGN KEY FK_7CC7DA2CB281BE2E');
        $this->addSql('ALTER TABLE video CHANGE trick_id trick_id INT NOT NULL');
        $this->addSql('ALTER TABLE video ADD CONSTRAINT fk_video_trick1 FOREIGN KEY (trick_id) REFERENCES trick (id) ON UPDATE CASCADE ON DELETE CASCADE');
    }
}
