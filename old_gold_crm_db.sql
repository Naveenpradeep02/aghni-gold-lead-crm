CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role ENUM('super_admin','staff') DEFAULT 'staff',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE gold_rates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    gold_type ENUM('24K','22K','18K'),
    new_rate DECIMAL(10,2),
    old_rate DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO gold_rates (gold_type,new_rate,old_rate)
VALUES
('24K',10000,9500),
('22K',9200,8700),
('18K',7500,7000);

INSERT INTO users (name,email,password,role)
VALUES (
    'Super Admin',
    'aghnigoldadmin@gmail.com',
    '$2b$10$vHy5XJapP/fjlBEefh0dAueZ0G8uwwipxc0oWAhrqBzM05E4MSbf2',
    'super_admin'
);

CREATE TABLE rate_history (
    id INT PRIMARY KEY AUTO_INCREMENT,
    gold_type ENUM('24K','22K','18K'),
    old_rate DECIMAL(10,2),
    new_rate DECIMAL(10,2),
    updated_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE leads (
    id INT PRIMARY KEY AUTO_INCREMENT,

    customer_name VARCHAR(100) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(100),

    gold_type ENUM('24K','22K','18K'),

    weight DECIMAL(10,2),

    market_value DECIMAL(12,2),
    purchase_value DECIMAL(12,2),

    status ENUM(
        'new',
        'contacted',
        'scheduled',
        'converted',
        'purchased',
        'rejected'
    ) DEFAULT 'new',

    gold_location ENUM(
        'in_hand',
        'bank_pledged',
        'finance_pledged',
        'pawn_shop',
        'locker',
        'other'
    ) DEFAULT 'in_hand',

    pledged_amount DECIMAL(12,2) DEFAULT 0,
    bank_finance_name VARCHAR(255),
    expected_sell_date DATE,
    ornament_type VARCHAR(100),

    purity_verified BOOLEAN DEFAULT FALSE,
    visit_required BOOLEAN DEFAULT FALSE,
    pickup_required BOOLEAN DEFAULT FALSE,

    source VARCHAR(100),

    source_id INT,
    report_status_id INT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lead_notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lead_id INT NOT NULL,
    note TEXT NOT NULL,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (lead_id) REFERENCES leads(id)
        ON DELETE CASCADE
);

CREATE TABLE lead_followups (
    id INT AUTO_INCREMENT PRIMARY KEY,

    lead_id INT NOT NULL,

    followup_date DATETIME NOT NULL,

    remarks TEXT,

    created_by INT,

    status ENUM(
        'pending',
        'completed',
        'missed'
    ) DEFAULT 'pending',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (lead_id) REFERENCES leads(id)
        ON DELETE CASCADE
);

CREATE TABLE lead_sources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    source_name VARCHAR(100) NOT NULL,
    status ENUM('active','inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO lead_sources (source_name)
VALUES
('ADS'),
('L1'),
('L2'),
('RPA'),
('ACC AD'),
('CAD NEW'),
('Q AD'),
('SALARY AD'),
('S/W AD'),
('LOAN AD'),
('NMG AD'),
('BUS AD'),
('GC'),
('NO ITEM'),
('DIRECT CALL');

CREATE TABLE report_status_master (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(100) NOT NULL,
    status_code VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO report_status_master (status_name,status_code)
VALUES
('Potential','potential'),
('Enquiry','enquiry'),
('Call Back','callback'),
('Repledge','repledge'),
('Pledge','pledge'),
('Out Of Station','out_station'),
('Not Interested','not_interested'),
('Genuine Reject','genuine_reject'),
('Fraud Reject','fraud_reject');