CREATE TABLE
    medical_histories (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        admitted_at TIMESTAMP,
        patient_id INT,
        status VARCHAR(255),
        CONSTRAINT fk_patient FOREIGN KEY patient_id REFERENCES patients(id)
    )