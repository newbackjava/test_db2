-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema modelDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema modelDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `modelDB` DEFAULT CHARACTER SET utf8 ;
USE `modelDB` ;

-- -----------------------------------------------------
-- Table `modelDB`.`userTBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelDB`.`userTBL` (
                                                   `userName` CHAR(3) NOT NULL,
                                                   `addr` VARCHAR(45) NULL,
                                                   PRIMARY KEY (`userName`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `modelDB`.`buyTBL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelDB`.`buyTBL` (
                                                  `productName` CHAR(3) NOT NULL,
                                                  `userTBL_userName` CHAR(3) NOT NULL,
                                                  PRIMARY KEY (`productName`, `userTBL_userName`),

                                                  INDEX `fk_buyTBL_userTBL_idx` (`userTBL_userName` ASC) VISIBLE,
                                                  CONSTRAINT `fk_buyTBL_userTBL`
                                                      FOREIGN KEY (`userTBL_userName`)
                                                          REFERENCES `modelDB`.`userTBL` (`userName`)
                                                          ON DELETE NO ACTION
                                                          ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
