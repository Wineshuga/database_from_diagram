CREATE TABLE
    medical_histories (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        admitted_at TIMESTAMP,
        patient_id INT,
        status VARCHAR(255),
        CONSTRAINT fk_patient FOREIGN KEY patient_id REFERENCES patients(id)
    )

CREATE TABLE
    patients (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255),
        date_of_birth DATE
    )

CREATE TABLE
    treatments (
        id INT GENERATED ALWAYS AS IDENTITY,
        type VARCHAR(255),
        name VARCHAR(255),
        PRIMARY KEY (id)
    )

CREATE TABLE
    invoice_items (
        id INT GENERATED ALWAYS AS IDENTITY,
        unit_price decimal(8, 2),
        quantity INT,
        total_price decimal(8, 2),
        invoice_id INT,
        treatment_id INT,
        name VARCHAR(255),
        PRIMARY KEY (id) CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES invoices(id) CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id)
    )

CREATE TABLE
    invoices (
        id INT GENERATED ALWAYS AS IDENTITY,
        total_amount decimal(8, 2),
        generated_at TIMESTAMP,
        payed_at TIMESTAMP,
        medical_history_id INT PRIMARY KEY (id) CONSTRAINT fk_medical_history REFERENCES medical_histories(id)
    )

-- join table

CREATE TABLE
    admission (
        medical_history_id INT,
        treatment_id INT
    )

-- create indexes

CREATE INDEX patient_id_idx ON medical_histories(patient_id ASC);

CREATE INDEX invoice_id_idx ON invoice_items(invoice_id ASC);

CREATE INDEX treatment_id_idx ON invoice_items(treatment_id ASC);

CREATE INDEX
    medical_history_id_idx ON invoices(medical_history_id ASC);

CREATE INDEX
    medical_history_idx ON admission(medical_history_id ASC);

CREATE INDEX treatment_idx ON admission(treatment_id ASC);