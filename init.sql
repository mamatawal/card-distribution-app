USE jobs_db;

-- Creating tables
CREATE TABLE jobs (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    media_id INT,
    job_category_id INT,
    job_type_id INT,
    description TEXT,
    detail TEXT,
    business_skill TEXT,
    knowledge TEXT,
    location VARCHAR(255),
    activity TEXT,
    academic_degree_doctor INT,
    academic_degree_master INT,
    academic_degree_professional INT,
    academic_degree_bachelor INT,
    salary_statistic_group VARCHAR(255),
    salary_range_first_year DECIMAL(10, 2),
    salary_range_average DECIMAL(10, 2),
    salary_range_remarks TEXT,
    restriction TEXT,
    estimated_total_workers INT,
    remarks TEXT,
    url VARCHAR(255),
    seo_description TEXT,
    seo_keywords TEXT,
    sort_order INT,
    publish_status INT,
    version INT,
    created_by INT,
    created TIMESTAMP,
    modified TIMESTAMP,
    deleted TIMESTAMP
);

CREATE TABLE job_categories (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    sort_order INT,
    created_by INT,
    created TIMESTAMP,
    modified TIMESTAMP,
    deleted TIMESTAMP
);

CREATE TABLE job_types (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    job_category_id INT,
    sort_order INT,
    created_by INT,
    created TIMESTAMP,
    modified TIMESTAMP,
    deleted TIMESTAMP
);

CREATE TABLE personalities (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    deleted TIMESTAMP
);

CREATE TABLE jobs_personalities (
    job_id INT,
    personality_id INT,
    PRIMARY KEY (job_id, personality_id)
);

CREATE TABLE practical_skills (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    deleted TIMESTAMP
);

CREATE TABLE jobs_practical_skills (
    job_id INT,
    practical_skill_id INT,
    PRIMARY KEY (job_id, practical_skill_id)
);

CREATE TABLE basic_abilities (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    deleted TIMESTAMP
);

CREATE TABLE jobs_basic_abilities (
    job_id INT,
    basic_ability_id INT,
    PRIMARY KEY (job_id, basic_ability_id)
);

CREATE TABLE affiliates (
    id INT PRIMARY KEY,
    type INT,
    name VARCHAR(255),
    deleted TIMESTAMP
);

CREATE TABLE jobs_tools (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id)
);

CREATE TABLE jobs_career_paths (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id)
);

CREATE TABLE jobs_rec_qualifications (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id)
);

CREATE TABLE jobs_req_qualifications (
    job_id INT,
    affiliate_id INT,
    PRIMARY KEY (job_id, affiliate_id)
);

-- Dummy data for jobs
INSERT INTO jobs VALUES
(1, 'Job 1', 1, 1, 1, 'Job description 1', 'Job detail 1', 'Skill 1', 'Knowledge 1', 'Location 1', 'Activity 1', 1, 1, 1, 1, 'Group 1', 50000, 60000, 'Remarks 1', 'Restriction 1', 100, 'Remarks 1', 'http://job1.com', 'SEO Desc 1', 'SEO Keywords 1', 1, 1, 1, 1, '2023-08-21 10:00:00', '2023-08-21 11:00:00', NULL),
(2, 'Job 2', 2, 1, 2, 'Job description 2', 'Job detail 2', 'Skill 2', 'Knowledge 2', 'Location 2', 'Activity 2', 2, 2, 2, 2, 'Group 2', 60000, 70000, 'Remarks 2', 'Restriction 2', 150, 'Remarks 2', 'http://job2.com', 'SEO Desc 2', 'SEO Keywords 2', 2, 1, 1, 1, '2023-08-21 09:00:00', '2023-08-21 12:00:00', NULL),
(3, 'Cabin Attendant Job', 3, 1, 1, 'Exciting job in the skies', 'More details about the job', 'Excellent customer service skills', 'In-depth knowledge of safety procedures', 'Various locations', 'Assisting passengers during flight', 0, 1, 1, 0, 'Airlines', 40000, 55000, 'Salary remarks', 'No restrictions', 200, 'Some remarks', 'http://cabinjob.com', 'SEO description for cabin job', 'flight, service', 3, 1, 1, 1, '2023-08-21 08:00:00', '2023-08-21 13:00:00', NULL),
(4, 'Flight Attendant Position', 4, 1, 2, 'In-flight experience required', 'Further details about the role', 'Strong communication skills', 'Understanding of aircraft systems', 'Various destinations', 'Assisting passengers during flights', 1, 0, 1, 0, 'Air travel', 45000, 60000, 'Compensation remarks', 'Flexible schedule', 180, 'Additional remarks', 'http://flightattendant.com', 'SEO description for flight attendant', 'customer service, travel', 4, 1, 1, 1, '2023-08-21 09:30:00', '2023-08-21 14:00:00', NULL);

-- Dummy data for job_categories
INSERT INTO job_categories VALUES
(1, 'Category 1', 1, 1, '2023-08-21 10:00:00', '2023-08-21 11:00:00', NULL),
(2, 'Category 2', 2, 1, '2023-08-21 09:00:00', '2023-08-21 12:00:00', NULL),
(3, 'Category 3', 3, 1, '2023-08-21 10:30:00', '2023-08-21 11:30:00', NULL),
(4, 'Category 4', 4, 1, '2023-08-21 09:30:00', '2023-08-21 12:30:00', NULL);

-- Dummy data for job_types
INSERT INTO job_types VALUES
(1, 'Type 1', 1, 1, 1, '2023-08-21 10:00:00', '2023-08-21 11:00:00', NULL),
(2, 'Type 2', 2, 1, 1, '2023-08-21 09:00:00', '2023-08-21 12:00:00', NULL),
(3, 'Type 3', 3, 1, 1, '2023-08-21 10:30:00', '2023-08-21 11:30:00', NULL),
(4, 'Type 4', 4, 1, 1, '2023-08-21 09:30:00', '2023-08-21 12:30:00', NULL);

-- Dummy data for personalities
INSERT INTO personalities VALUES
(1, 'Personality 1', NULL),
(2, 'Personality 2', NULL),
(3, 'Personality 3', NULL),
(4, 'Personality 4', NULL);

-- Dummy data for practical_skills
INSERT INTO practical_skills VALUES
(1, 'Skill 1', NULL),
(2, 'Skill 2', NULL),
(3, 'Skill 3', NULL),
(4, 'Skill 4', NULL);

-- Dummy data for basic_abilities
INSERT INTO basic_abilities VALUES
(1, 'Ability 1', NULL),
(2, 'Ability 2', NULL),
(3, 'Ability 3', NULL),
(4, 'Ability 4', NULL);

-- Dummy data for affiliates
INSERT INTO affiliates VALUES
(1, 'Affiliate 1', 1, NULL),
(2, 'Affiliate 2', 2, NULL),
(3, 'Affiliate 3', 3, NULL),
(4, 'Affiliate 4', 4, NULL),
(5, 'Affiliate 5', 5, NULL),
(6, 'Affiliate 6', 6, NULL);

-- Dummy data for jobs_personalities
INSERT INTO jobs_personalities VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(3, 4),
(4, 3);

-- Dummy data for jobs_practical_skills
INSERT INTO jobs_practical_skills VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(3, 4),
(4, 4);

-- Dummy data for jobs_basic_abilities
INSERT INTO jobs_basic_abilities VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(3, 4),
(4, 4);

-- Dummy data for jobs_tools
INSERT INTO jobs_tools VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6);

-- Dummy data for jobs_career_paths
INSERT INTO jobs_career_paths VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6);

-- Dummy data for jobs_rec_qualifications
INSERT INTO jobs_rec_qualifications VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6);

-- Dummy data for jobs_req_qualifications
INSERT INTO jobs_req_qualifications VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6);
