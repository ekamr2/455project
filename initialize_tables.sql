CREATE TABLE tenant (
    tenant_id NUMBER, 
    property_id NUMBER,     -- property where tenant lives
    PRIMARY KEY (tenant_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

CREATE TABLE employee (
    employee_id NUMBER,
    property_id NUMBER,     -- property where employee works
    user_type TEXT,         -- ie. maintenance, landlord, leasing consultants
    PRIMARY KEY (employee_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

CREATE TABLE property (
    property_id NUMBER,
    property_name TEXT,
    addy TEXT,              -- property address
    PRIMARY KEY (property_id)
);

CREATE TABLE billing (
    bill_id NUMBER,
    property_id NUMBER,
    bill_type TEXT,         -- ie. rent, electricity, water, gas
    amount NUMBER,          -- amount due ($)
    pay_to TEXT,            -- pay bill to XXX
    bill_month DATE,
    due_date DATE,
    date_paid DATE,
    PRIMARY KEY (bill_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

CREATE TABLE lease (
    lease_id NUMBER,
    tenant_id NUMBER,
    property_id NUMBER,
    begin_date DATE,        -- date the lease begins
    end_date DATE,          -- date the lease ends
    rent NUMBER,            -- ($)
    deposit NUMBER,         -- deposit amount ($)
    PRIMARY KEY (lease_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(tenant_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id)
);

CREATE TABLE maintenance (
    maintenance_id NUMBER,
    tenant_id NUMBER,
    property_id NUMBER,
    issue_category TEXT,    -- ie. plumbing, electrical, flooring
    request_status TEXT,    -- ie. pending, in-progress, completed
    request_date DATE,
    completed_date DATE,
    employee_id NUMBER,     -- assigned maintenance employee 
    PRIMARY KEY (maintenance_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(tenant_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
