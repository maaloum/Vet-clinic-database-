-- -----------------------------------------------------
-- Schema clinic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clinic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clinic` DEFAULT CHARACTER SET utf8 ;
USE `clinic` ;

-- -----------------------------------------------------
-- Table `clinic`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinic`.`Patients` (
  `id` INT GENERATED ALWAYS AS () VIRTUAL,
  `name` VARCHAR(45) NOT NULL,
  `date_of_birth` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinic`.`Medical_histories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinic`.`Medical_histories` (
  `id` INT GENERATED ALWAYS AS () VIRTUAL,
  `admitted_at` TIMESTAMP(15) GENERATED ALWAYS AS () VIRTUAL,
  `patient_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `patient_id_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `patient_id`
    FOREIGN KEY (`patient_id`)
    REFERENCES `clinic`.`Patients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinic`.`Treatments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinic`.`Treatments` (
  `id` INT GENERATED ALWAYS AS () VIRTUAL,
  `type` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `clinic`.`Medical_histories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clinic`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clinic`.`invoices` (
  `id` INT GENERATED ALWAYS AS () VIRTUAL,
  `total_amount` DECIMAL NULL,
  `generated_at` TIMESTAMP GENERATED ALWAYS AS () STORED,
  `payed_at` TIMESTAMP NULL,
  `medical_history_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `medical_histories_id_idx` (`medical_history_id` ASC) VISIBLE,
  CONSTRAINT `medical_histories_id`
    FOREIGN KEY (`medical_history_id`)
    REFERENCES `clinic`.`Medical_histories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `clinic`.`Invoice_items`
-- -----------------------------------------------------

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quatity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX ON invoice_items (invoice_id);

CREATE INDEX ON invoice_items (treatment_id);

