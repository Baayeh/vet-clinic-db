--- create patients table
CREATE TABLE patients (
  id SERIAL NOT NULL,
  name VARCHAR(250) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);

--- create medical_histories table
CREATE TABLE medical_histories (
  id SERIAL NOT NULL,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT,
  status VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

--- create invoices table
CREATE TABLE invoices (
  id SERIAL NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  generate_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);


--- create treatments table
CREATE TABLE treatments (
  id SERIAL NOT NULL,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

--- create invoice_items table
CREATE TABLE invoice_items (
  id SERIAL NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  invoice_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

--- Create treatment_histories join table
--- create invoice_items table
CREATE TABLE treatment_histories (
  id SERIAL NOT NULL,
  medical_history_id INT,
  treatment_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
);

--- CREATE FK INDEXES
CREATE INDEX ON medical_histories(patient_id);

CREATE INDEX ON invoices(medical_history_id);

CREATE INDEX ON invoice_items(invoice_id);

CREATE INDEX ON invoice_items(treatment_id);

CREATE INDEX ON treatment_histories(medical_history_id);

CREATE INDEX ON treatment_histories(treatment_id);