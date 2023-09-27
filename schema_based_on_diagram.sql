CREATE TABLE
    medical_histories (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        admitted_at TIMESTAMP,
        patient_id INT,
        status VARCHAR(255),
        CONSTRAINT fk_patient FOREIGN KEY patient_id REFERENCES patients(id)
    )

CREATE TABLE
    Patients (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255),
        date_of_birth DATE
    )