

CREATE TABLE IF NOT EXISTS appointments (
    id INT NOT NULL AUTO_INCREMENT, --auto incremented 
    patientID BIGINT NOT NULL, -- the generated ID of the user
    diagnosis JSON NOT NULL, 
    start_time data DEFAULT GETDATE(), -- the start of appointment
    ongoing TINYINT DEFAULT 0, -- determines if the appointment is still ongoing or not
    remarks TExT NOT NULL, -- remarks of the doctor
    doctorID BIGINT NOT NULL -- the doctors ID that can be viewed in another table
)

CREATE TABLE IF NOT EXISTS doctors (
    id INT NOT NULL AUTO_INCREMENT, -- id of the doctor thatn can be referenced from another table
    name VARCHAR(70) NOT NULL,  --name of the doctor
    username VARCHAR(50) NOT NULL, -- username for the doctors to log in their dashboard
    password VARCHAR(30) NOT NULL DEFAULT "youshallnotpass", --password fot the doctor to log in their dashboard
    birth_certificate_image BLOB NOT NULL, -- image byte pof their certificate
    identifications JSON NOT NULL, -- json data of their identifications
    patients JSON NOT NULL, -- the list of patients he diagnosed 
    AVAILABLE TINYINT DEFAULT 1 -- determines the availability of the doctor
)

CREATE TABLE IF NOT EXISTS partial_patients (
    name VARCHAR(70) NOT NULL, -- name of the patient/client 
    patientID INT NOT NULL, -- ID of the patient that can be referenced from another table
    biodata JSON NOT NULL,  -- json biodata of the client/patient
    diagnosis TEXT NOT NULL, -- diagnosis of the patient
    sex TINYINT NOT NULL,
    past_medication TEXT NOT NULL, -- past medications, input by the doctor
    illnesses_history TEXT NOT NULL, -- input by the doctor
    vaccinated TINYINT NOT NULL, -- determines the covid19 vaccination status of the patient/client
    subjective_data TEXT DEFAULT "None", -- subjective data to be input by the doctor
    objective_data TEXT DEFAULT "None", -- objective data to be input by the doctor
    respiratory_data TEXT DEFAULT "None" -- respiratory data to be input by the doctor
)

CREATE TABLE IF NOT EXISTS apppointmentRequests (
    id INT NOT NULL AUTO_INCREMENT, -- apointment ID that can be referenced by another tables
    accepted TINYINT NOT NULL, -- determines if the appointment is accepted or not
    dtime DATE DEFAULT GETDATE(), -- time of the appointment
    doctor INT NOT NULL, -- doctor ID that can be referenced from another table
    patient INT NOT NULL -- patientID that can be referenced from another table
)