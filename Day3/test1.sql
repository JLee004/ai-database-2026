--Create ERD Table
CREATE TABLE companies (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from companies c;

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    department_name VARCHAR(100) NOT NULL,

    CONSTRAINT fk_department_company
        FOREIGN KEY (company_id)
        REFERENCES companies(company_id),

    CONSTRAINT unique_department_per_company
        UNIQUE (company_id, department_name)
);


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL,

    CONSTRAINT fk_employee_company
        FOREIGN KEY (company_id)
        REFERENCES companies(company_id),

    CONSTRAINT unique_employee_email
        UNIQUE (company_id, email)
);


CREATE TABLE recipients (
    recipient_id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    department_id INT,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL,
    job_title VARCHAR(150),
    active BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_recipient_company
        FOREIGN KEY (company_id)
        REFERENCES companies(company_id),

    CONSTRAINT fk_recipient_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    CONSTRAINT unique_recipient_email
        UNIQUE (company_id, email)
);


CREATE TABLE topics (
    topic_id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    topic_name VARCHAR(150) NOT NULL,
    description TEXT,

    CONSTRAINT fk_topic_company
        FOREIGN KEY (company_id)
        REFERENCES companies(company_id),

    CONSTRAINT unique_topic_per_company
        UNIQUE (company_id, topic_name)
);


CREATE TABLE routing_rules (
    rule_id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    topic_id INT NOT NULL,
    recipient_id INT NOT NULL,
    priority INT DEFAULT 1,
    active BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_rule_company
        FOREIGN KEY (company_id)
        REFERENCES companies(company_id),

    CONSTRAINT fk_rule_topic
        FOREIGN KEY (topic_id)
        REFERENCES topics(topic_id),

    CONSTRAINT fk_rule_recipient
        FOREIGN KEY (recipient_id)
        REFERENCES recipients(recipient_id)
);