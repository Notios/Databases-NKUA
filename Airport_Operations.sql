-- National and Kapodistrian of Athens
-- Department of Digital Industry Technologies
-- Course: Databases
-- Georgios Loudaros & Georgios Karofylakis

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Airports operation
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`AirTrafficControllers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AirTrafficControllers` (
  `idAirTrafficControllers` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `MedicalCheckup` DATETIME NULL,
  `Association_Name` INT NOT NULL,
  PRIMARY KEY (`idAirTrafficControllers`, `Association_Name`),
  INDEX `fk_AirTrafficControllers_Association1_idx` (`Association_Name` ASC) VISIBLE,
  CONSTRAINT `fk_AirTrafficControllers_Association1`
    FOREIGN KEY (`Association_Name`)
    REFERENCES `mydb`.`Association` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aircraft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aircraft` (
  `idAircraft` INT NOT NULL,
  `Model` VARCHAR(45) NULL,
  `Checks_idChecks` INT NOT NULL,
  PRIMARY KEY (`idAircraft`, `Checks_idChecks`),
  INDEX `fk_Aircraft_Checks1_idx` (`Checks_idChecks` ASC) VISIBLE,
  CONSTRAINT `fk_Aircraft_Checks1`
    FOREIGN KEY (`Checks_idChecks`)
    REFERENCES `mydb`.`Checks` (`idChecks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Airlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Airlines` (
  `idAirlines` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `ICCode` VARCHAR(45) NULL,
  `Active` VARCHAR(1) NULL,
  PRIMARY KEY (`idAirlines`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Airlines_has_Itineraries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Airlines_has_Itineraries` (
  `Airlines_idAirlines` INT NOT NULL,
  `Itineraries_idItineraries` INT NOT NULL,
  PRIMARY KEY (`Airlines_idAirlines`, `Itineraries_idItineraries`),
  INDEX `fk_Airlines_has_Itineraries_Itineraries1_idx` (`Itineraries_idItineraries` ASC) VISIBLE,
  INDEX `fk_Airlines_has_Itineraries_Airlines1_idx` (`Airlines_idAirlines` ASC) VISIBLE,
  CONSTRAINT `fk_Airlines_has_Itineraries_Airlines1`
    FOREIGN KEY (`Airlines_idAirlines`)
    REFERENCES `mydb`.`Airlines` (`idAirlines`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airlines_has_Itineraries_Itineraries1`
    FOREIGN KEY (`Itineraries_idItineraries`)
    REFERENCES `mydb`.`Itineraries` (`idItineraries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Airports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Airports` (
  `idAirports` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `IATA` VARCHAR(45) NULL,
  PRIMARY KEY (`idAirports`),
  UNIQUE INDEX `IATA_UNIQUE` (`IATA` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Airports_has_Itineraries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Airports_has_Itineraries` (
  `Airports_idAirports` INT NOT NULL,
  `Itineraries_idItineraries` INT NOT NULL,
  PRIMARY KEY (`Airports_idAirports`, `Itineraries_idItineraries`),
  INDEX `fk_Airports_has_Itineraries_Itineraries1_idx` (`Itineraries_idItineraries` ASC) VISIBLE,
  INDEX `fk_Airports_has_Itineraries_Airports1_idx` (`Airports_idAirports` ASC) VISIBLE,
  CONSTRAINT `fk_Airports_has_Itineraries_Airports1`
    FOREIGN KEY (`Airports_idAirports`)
    REFERENCES `mydb`.`Airports` (`idAirports`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airports_has_Itineraries_Itineraries1`
    FOREIGN KEY (`Itineraries_idItineraries`)
    REFERENCES `mydb`.`Itineraries` (`idItineraries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Airports_has_Itineraries1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Airports_has_Itineraries1` (
  `Airports_idAirports` INT NOT NULL,
  `Itineraries_idItineraries` INT NOT NULL,
  PRIMARY KEY (`Airports_idAirports`, `Itineraries_idItineraries`),
  INDEX `fk_Airports_has_Itineraries1_Itineraries1_idx` (`Itineraries_idItineraries` ASC) VISIBLE,
  INDEX `fk_Airports_has_Itineraries1_Airports1_idx` (`Airports_idAirports` ASC) VISIBLE,
  CONSTRAINT `fk_Airports_has_Itineraries1_Airports1`
    FOREIGN KEY (`Airports_idAirports`)
    REFERENCES `mydb`.`Airports` (`idAirports`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airports_has_Itineraries1_Itineraries1`
    FOREIGN KEY (`Itineraries_idItineraries`)
    REFERENCES `mydb`.`Itineraries` (`idItineraries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Association`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Association` (
  `Name` INT NOT NULL,
  `YearEstablishment` INT NULL,
  `MemberID` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Checks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Checks` (
  `idChecks` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Rating` INT NULL,
  `Date` DATETIME NULL,
  `Hours` INT NULL,
  `Technical` VARCHAR(45) NULL,
  `Aircraft` VARCHAR(45) NULL,
  PRIMARY KEY (`idChecks`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Itineraries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Itineraries` (
  `idItineraries` INT NOT NULL,
  `Airline` VARCHAR(45) NULL,
  `DepartureAirport` VARCHAR(45) NULL,
  `ArrivalAirport` VARCHAR(45) NULL,
  PRIMARY KEY (`idItineraries`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Technicians`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Technicians` (
  `idTechnicians` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Salary` DECIMAL(2) NULL,
  `Specialty` VARCHAR(45) NULL,
  `Association_Name` INT NOT NULL,
  `Checks_idChecks` INT NOT NULL,
  PRIMARY KEY (`idTechnicians`, `Association_Name`, `Checks_idChecks`),
  INDEX `fk_Technicians_Association_idx` (`Association_Name` ASC) VISIBLE,
  INDEX `fk_Technicians_Checks1_idx` (`Checks_idChecks` ASC) VISIBLE,
  CONSTRAINT `fk_Technicians_Association`
    FOREIGN KEY (`Association_Name`)
    REFERENCES `mydb`.`Association` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Technicians_Checks1`
    FOREIGN KEY (`Checks_idChecks`)
    REFERENCES `mydb`.`Checks` (`idChecks`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
