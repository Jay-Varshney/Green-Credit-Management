----------------------------------------------------
-- STEP 0: RESET TABLES & RESTART SERIAL COUNTERS
----------------------------------------------------
TRUNCATE TABLE 
    silver.credit_transaction, 
    silver.user, 
    silver.department, 
    silver.role 
RESTART IDENTITY CASCADE;

----------------------------------------------------
-- STEP 1: INSERT ALL ROLES (IDs: 1, 2, 3, 4)
----------------------------------------------------
INSERT INTO silver.role (role_name) VALUES 
    ('Employee'),                -- ID: 1
    ('Sustainability Auditor'),    -- ID: 2
    ('Department Head'),           -- ID: 3
    ('Executive Manager');         -- ID: 4

----------------------------------------------------
-- STEP 2: INSERT ALL DEPARTMENTS (IDs: 1 to 6)
----------------------------------------------------
INSERT INTO silver.department (dept_name) VALUES 
    ('Operations & Manufacturing'),              -- ID: 1
    ('Facilities & Energy'),                     -- ID: 2
    ('IT & Infrastructure'),                     -- ID: 3
    ('Logistics & Transport'),                   -- ID: 4
    ('HR & Corporate Social Responsibility'),    -- ID: 5
    ('Finance & Procurement');                   -- ID: 6

----------------------------------------------------
-- STEP 3: INSERT USERS (IDs: 1 to 15)
----------------------------------------------------
INSERT INTO silver.user (user_name, dept_id, role_id) VALUES 
    ('Alice Smith', 1, 1),      -- ID: 1 (Employee, Ops)
    ('Bob Jones', 2, 1),        -- ID: 2 (Employee, Facilities)
    ('Charlie Brown', 3, 1),    -- ID: 3 (Employee, IT)
    ('Diana Prince', 4, 1),     -- ID: 4 (Employee, Logistics)
    ('Evan Wright', 2, 2),      -- ID: 5 (Auditor, Facilities)
    ('Fiona Gallagher', 1, 3),  -- ID: 6 (Dept Head, Ops)
    ('George Clark', 5, 1),     -- ID: 7 (Employee, HR)
    ('Hannah Abbott', 6, 1),    -- ID: 8 (Employee, Finance)
    ('Ian Malcolm', 1, 1),      -- ID: 9 (Employee, Ops)
    ('Julia Roberts', 2, 1),    -- ID: 10 (Employee, Facilities)
    ('Kevin Spacey', 3, 2),     -- ID: 11 (Auditor, IT)
    ('Laura Croft', 4, 3),      -- ID: 12 (Dept Head, Logistics)
    ('Michael Scott', 5, 3),    -- ID: 13 (Dept Head, HR)
    ('Nancy Drew', 6, 2),       -- ID: 14 (Auditor, Finance)
    ('Oscar Martinez', 6, 1);   -- ID: 15 (Employee, Finance)

----------------------------------------------------
-- STEP 4: INSERT TRANSACTIONS
----------------------------------------------------
INSERT INTO silver.credit_transaction 
    (user_id, dept_id, credit, debit, green_type, description, evidence_url, date_of_creation, req_status, approved_rejected_by, status_update_date) 
VALUES 
    -- 2025 Q1
    (1, 1, 120.00, 0.00, 'Waste Reduction', 'Single-use plastic elimination drive', 'https://storage.company.com/ev/plastic_free_q1.pdf', '2025-01-15 09:00:00+00', 'Approved', 6, '2025-01-16 11:00:00+00'),
    (2, 2, 350.00, 0.00, 'Energy Conservation', 'Motion sensor lighting setup in Building A', 'https://storage.company.com/ev/bldg_a_sensors.pdf', '2025-02-10 14:20:00+00', 'Approved', 5, '2025-02-12 10:15:00+00'),
    (4, 4, 0.00, 200.00, 'Waste Reduction', 'Unplanned diesel generator backup usage', NULL, '2025-03-05 16:00:00+00', 'Approved', 5, '2025-03-06 09:30:00+00'),
    (7, 5, 250.00, 0.00, 'Tree Planting', 'Community garden & 250 sapling planting event', 'https://storage.company.com/ev/csr_garden.jpg', '2025-03-22 11:30:00+00', 'Approved', 13, '2025-03-24 14:00:00+00'),

    -- 2025 Q2
    (3, 3, 500.00, 0.00, 'Energy Conservation', 'Decommissioning legacy mainframe servers', 'https://storage.company.com/ev/server_decom.pdf', '2025-04-12 10:00:00+00', 'Approved', 11, '2025-04-14 15:45:00+00'),
    (8, 6, 180.00, 0.00, 'Waste Reduction', 'Paperless invoicing transition across suppliers', 'https://storage.company.com/ev/paperless_fin.pdf', '2025-05-02 08:30:00+00', 'Approved', 14, '2025-05-03 12:00:00+00'),
    (9, 1, 0.00, 95.00, 'Energy Conservation', 'HVAC system malfunction energy leak', NULL, '2025-05-28 17:10:00+00', 'Approved', 6, '2025-05-29 09:00:00+00'),
    (10, 2, 400.00, 0.00, 'Solar Installation', 'Rooftop Solar Array expansion - Wing B', 'https://storage.company.com/ev/solar_wing_b.pdf', '2025-06-14 13:45:00+00', 'Approved', 5, '2025-06-16 10:00:00+00'),

    -- 2025 Q3
    (2, 2, 450.00, 0.00, 'Solar Installation', 'Rooftop solar panel setup Phase 1', 'https://storage.company.com/ev/solar_p1.pdf', '2025-08-15 10:30:00+00', 'Approved', 5, '2025-08-16 14:00:00+00'),
    (4, 4, 0.00, 120.00, 'Waste Reduction', 'Fleet diesel consumption over target', NULL, '2025-09-02 09:15:00+00', 'Approved', 5, '2025-09-02 11:00:00+00'),
    (1, 1, 200.00, 0.00, 'Waste Reduction', 'Zero-waste packaging implementation', 'https://storage.company.com/ev/pkg_audit.pdf', '2025-09-20 16:45:00+00', 'Approved', 6, '2025-09-22 08:30:00+00'),
    (15, 6, 75.00, 0.00, 'Energy Conservation', 'Energy Star rated hardware upgrade for Finance team', 'https://storage.company.com/ev/finance_hardware.pdf', '2025-09-25 14:00:00+00', 'Approved', 14, '2025-09-26 16:30:00+00'),

    -- 2025 Q4
    (3, 3, 300.00, 0.00, 'Energy Conservation', 'Migrated legacy servers to energy-efficient cloud provider', 'https://storage.company.com/ev/cloud_mig.pdf', '2025-10-10 11:00:00+00', 'Approved', 5, '2025-10-12 15:20:00+00'),
    (7, 5, 90.00, 0.00, 'Waste Reduction', 'E-waste recycling program for old office electronics', 'https://storage.company.com/ev/ewaste_cert.pdf', '2025-10-28 15:00:00+00', 'Approved', 13, '2025-10-29 11:00:00+00'),
    (1, 1, 150.00, 0.00, 'Tree Planting', 'Annual corporate tree plantation drive (150 saplings)', 'https://storage.company.com/ev/trees_2025.jpg', '2025-11-05 14:00:00+00', 'Approved', 6, '2025-11-06 09:10:00+00'),
    (4, 4, 50.00, 0.00, 'Energy Conservation', 'EV van route optimization efficiency gains', 'https://storage.company.com/ev/route_opt.pdf', '2025-12-01 08:30:00+00', 'Rejected', 5, '2025-12-02 10:00:00+00'),
    (12, 4, 0.00, 310.00, 'Waste Reduction', 'Peak season air freight emissions surcharge', NULL, '2025-12-18 19:00:00+00', 'Approved', 12, '2025-12-19 09:00:00+00'),

    -- 2026 Q1
    (2, 2, 500.00, 0.00, 'Solar Installation', 'Solar canopy addition over employee parking', 'https://storage.company.com/ev/solar_canopy.pdf', '2026-01-18 13:15:00+00', 'Approved', 5, '2026-01-19 16:00:00+00'),
    (1, 1, 0.00, 80.00, 'Waste Reduction', 'Scrap material disposal overshoot', NULL, '2026-02-14 10:00:00+00', 'Approved', 6, '2026-02-15 11:45:00+00'),
    (8, 6, 210.00, 0.00, 'Energy Conservation', 'Server room cooling optimization', 'https://storage.company.com/ev/cooling_opt.pdf', '2026-02-27 11:00:00+00', 'Approved', 14, '2026-03-01 10:00:00+00'),
    (3, 3, 250.00, 0.00, 'Energy Conservation', 'Smart motion HVAC sensor installation in HQ', 'https://storage.company.com/ev/hvac_sensors.pdf', '2026-03-22 15:30:00+00', 'Approved', 5, '2026-03-24 09:00:00+00'),
    (7, 5, 130.00, 0.00, 'Tree Planting', 'Urban reforestation partnership drive', 'https://storage.company.com/ev/urban_trees.pdf', '2026-03-29 10:00:00+00', 'Expired', NULL, NULL),

    -- 2026 Q2
    (4, 4, 350.00, 0.00, 'Waste Reduction', 'Transitioned delivery fleet to 40% electric vehicles', 'https://storage.company.com/ev/ev_fleet.pdf', '2026-04-10 12:00:00+00', 'Approved', 5, '2026-04-12 14:10:00+00'),
    (10, 2, 0.00, 150.00, 'Energy Conservation', 'Emergency chiller plant operation', NULL, '2026-04-25 15:00:00+00', 'Approved', 5, '2026-04-26 09:00:00+00'),
    (2, 2, 600.00, 0.00, 'Energy Conservation', 'Facility-wide LED conversion project', 'https://storage.company.com/ev/led_retrofit.pdf', '2026-05-19 09:45:00+00', 'Approved', 5, '2026-05-20 10:30:00+00'),
    (1, 1, 100.00, 0.00, 'Waste Reduction', 'Composting program in cafeteria', 'https://storage.company.com/ev/compost.jpg', '2026-06-11 11:20:00+00', 'Approved', 6, '2026-06-12 13:00:00+00'),
    (9, 1, 280.00, 0.00, 'Energy Conservation', 'Variable frequency drives added to factory motors', 'https://storage.company.com/ev/vfd_install.pdf', '2026-06-25 14:30:00+00', 'Approved', 6, '2026-06-27 11:00:00+00'),

    -- 2026 Q3 (Pending Queue)
    (3, 3, 400.00, 0.00, 'Solar Installation', 'Data center solar panel array setup', 'https://storage.company.com/ev/dc_solar.pdf', '2026-07-05 14:00:00+00', 'Approved', 5, '2026-07-07 10:15:00+00'),
    (12, 4, 220.00, 0.00, 'Energy Conservation', 'Eco-driving training program for haulage drivers', 'https://storage.company.com/ev/ecodrive_cert.pdf', '2026-07-18 09:15:00+00', 'Approved', 12, '2026-07-20 16:00:00+00'),
    (2, 2, 300.00, 0.00, 'Energy Conservation', 'Battery energy storage system integration', 'https://storage.company.com/ev/bess_proof.pdf', '2026-08-01 10:00:00+00', 'Pending', NULL, NULL),
    (4, 4, 180.00, 0.00, 'Waste Reduction', 'Supplier packaging reduction initiative', 'https://storage.company.com/ev/supplier_pack.pdf', '2026-08-10 16:20:00+00', 'Pending', NULL, NULL),
    (7, 5, 160.00, 0.00, 'Tree Planting', 'Green roof installation on executive block', 'https://storage.company.com/ev/green_roof.pdf', '2026-08-12 11:00:00+00', 'Pending', NULL, NULL),
    (15, 6, 0.00, 60.00, 'Waste Reduction', 'Audit fine for improper hazardous waste sorting', NULL, '2026-08-14 13:30:00+00', 'Rejected', 14, '2026-08-15 09:00:00+00');