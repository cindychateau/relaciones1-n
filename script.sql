-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema esquema_usuarios2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema esquema_usuarios2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `esquema_usuarios2` DEFAULT CHARACTER SET utf8 ;
USE `esquema_usuarios2` ;

-- -----------------------------------------------------
-- Table `esquema_usuarios2`.`classrooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_usuarios2`.`classrooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esquema_usuarios2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `esquema_usuarios2`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `classroom_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_classrooms_idx` (`classroom_id` ASC),
  CONSTRAINT `fk_users_classrooms`
    FOREIGN KEY (`classroom_id`)
    REFERENCES `esquema_usuarios2`.`classrooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
