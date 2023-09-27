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

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id)
)