create database taskmanagement;
use taskmanagement;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);
CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE
);
CREATE TABLE TaskCategories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    created_by INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES Users(user_id)
);
CREATE TABLE Tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    assigned_to INT,
    category_id INT,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (assigned_to) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES TaskCategories(category_id)
);
CREATE TABLE Milestones (
    milestone_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    title VARCHAR(100) NOT NULL,
    due_date DATE,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);
CREATE TABLE TaskUpdates (
    update_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT,
    updated_by INT,
    update_text TEXT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id),
    FOREIGN KEY (updated_by) REFERENCES Users(user_id)
);
CREATE TABLE ProjectMembers (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    user_id INT,
    role VARCHAR(50),
    joined_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE TaskAttachments (
    attachment_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT,
    file_name VARCHAR(255),
    file_url TEXT,
    uploaded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (task_id) REFERENCES Tasks(task_id)
);
INSERT INTO Users (username, email, password_hash, role) VALUES
('alice', 'alice@example.com', 'hashed_pw1', 'admin'),
('bob', 'bob@example.com', 'hashed_pw2', 'member'),
('carol', 'carol@example.com', 'hashed_pw3', 'member'),
('dave', 'dave@example.com', 'hashed_pw4', 'member'),
('eve', 'eve@example.com', 'hashed_pw5', 'admin'),
('frank', 'frank@example.com', 'hashed_pw6', 'member'),
('grace', 'grace@example.com', 'hashed_pw7', 'member'),
('heidi', 'heidi@example.com', 'hashed_pw8', 'member'),
('ivan', 'ivan@example.com', 'hashed_pw9', 'member'),
('judy', 'judy@example.com', 'hashed_pw10', 'member'),
('karen', 'karen@example.com', 'hashed_pw11', 'member'),
('leo', 'leo@example.com', 'hashed_pw12', 'admin'),
('mallory', 'mallory@example.com', 'hashed_pw13', 'member'),
('nancy', 'nancy@example.com', 'hashed_pw14', 'member'),
('oliver', 'oliver@example.com', 'hashed_pw15', 'member'),
('peggy', 'peggy@example.com', 'hashed_pw16', 'member'),
('quinn', 'quinn@example.com', 'hashed_pw17', 'member'),
('ruth', 'ruth@example.com', 'hashed_pw18', 'member'),
('sam', 'sam@example.com', 'hashed_pw19', 'admin'),
('trudy', 'trudy@example.com', 'hashed_pw20', 'member'),
('ursula', 'ursula@example.com', 'hashed_pw21', 'member'),
('victor', 'victor@example.com', 'hashed_pw22', 'member'),
('wendy', 'wendy@example.com', 'hashed_pw23', 'member'),
('xavier', 'xavier@example.com', 'hashed_pw24', 'member'),
('yvonne', 'yvonne@example.com', 'hashed_pw25', 'member'),
('zach', 'zach@example.com', 'hashed_pw26', 'member'),
('aaron', 'aaron@example.com', 'hashed_pw27', 'member'),
('bella', 'bella@example.com', 'hashed_pw28', 'member'),
('carlos', 'carlos@example.com', 'hashed_pw29', 'admin'),
('diana', 'diana@example.com', 'hashed_pw30', 'member'),
('edward', 'edward@example.com', 'hashed_pw31', 'member'),
('fiona', 'fiona@example.com', 'hashed_pw32', 'member');
select * from users;
INSERT INTO Projects (project_name, description, start_date, end_date) VALUES
('Website Redesign', 'Redesign the corporate website with a new UI/UX.', '2025-01-10', '2025-03-15'),
('Mobile App Launch', 'Develop and launch the first version of our mobile app.', '2025-02-01', '2025-04-30'),
('CRM Integration', 'Integrate CRM with our internal systems.', '2025-03-01', '2025-05-15'),
('Marketing Campaign', 'Q2 digital marketing and email outreach.', '2025-04-01', '2025-06-30'),
('Customer Survey', 'Conduct feedback survey with key customers.', '2025-01-20', '2025-02-28'),
('Data Migration', 'Move data to the new cloud platform.', '2025-03-10', '2025-05-10'),
('SEO Optimization', 'Improve organic search visibility.', '2025-02-15', '2025-04-01'),
('Security Audit', 'Third-party audit of security systems.', '2025-03-05', '2025-04-05'),
('New Hire Onboarding', 'Automate and streamline onboarding flow.', '2025-01-15', '2025-02-15'),
('Internal Portal Update', 'Add new tools to the employee portal.', '2025-04-01', '2025-05-15'),
('AI Chatbot', 'Build AI chatbot for customer support.', '2025-02-10', '2025-04-20'),
('E-commerce Platform', 'Launch new e-commerce functionality.', '2025-03-01', '2025-06-01'),
('Product Launch', 'Go-to-market campaign for new product.', '2025-05-01', '2025-07-01'),
('Cloud Cost Review', 'Analyze and optimize cloud spend.', '2025-01-20', '2025-02-20'),
('Annual Report', 'Prepare and design 2024 annual report.', '2025-02-01', '2025-03-10'),
('Help Desk Upgrade', 'Upgrade ticketing and help desk system.', '2025-03-15', '2025-04-15'),
('Training Program', 'Develop leadership training content.', '2025-01-05', '2025-02-28'),
('UI Framework Update', 'Update to latest frontend framework.', '2025-04-01', '2025-05-20'),
('Vendor Evaluation', 'Review and rate all software vendors.', '2025-02-25', '2025-03-25'),
('Social Media Strategy', 'Plan and execute Q2 social strategy.', '2025-03-01', '2025-04-30'),
('App Performance Tuning', 'Optimize backend and DB performance.', '2025-01-10', '2025-03-10'),
('Compliance Checklist', 'Update compliance tracking systems.', '2025-02-05', '2025-03-25'),
('Localization Project', 'Translate UI and content to Spanish.', '2025-04-10', '2025-06-10'),
('Quarterly Review', 'Prepare slides for Q1 review.', '2025-03-15', '2025-03-30'),
('DevOps Pipeline', 'Implement CI/CD using GitHub Actions.', '2025-01-20', '2025-03-20'),
('Backup & Recovery', 'Improve DB backup and restore.', '2025-02-15', '2025-04-01'),
('Feature Flag System', 'Integrate feature flagging framework.', '2025-03-01', '2025-05-01'),
('Bug Bash Event', 'Organize team-wide bug hunt.', '2025-04-05', '2025-04-10'),
('Documentation Revamp', 'Clean up and restructure internal docs.', '2025-01-30', '2025-03-01'),
('API Versioning', 'Implement version control in APIs.', '2025-02-20', '2025-04-20'),
('Partner Portal', 'Launch new partner access portal.', '2025-03-01', '2025-05-30'),
('Accessibility Update', 'Improve accessibility compliance.', '2025-04-01', '2025-06-01');
select * from projects;
INSERT INTO TaskCategories (name, description, created_by, created_at) VALUES
('Bug Fix', 'Tasks related to fixing bugs or issues.', 1, '2025-01-01 09:00:00'),
('Feature Development', 'Developing new features for the product.', 2, '2025-01-02 10:00:00'),
('UI Design', 'User interface design tasks.', 3, '2025-01-03 11:00:00'),
('UX Research', 'User experience studies and feedback.', 4, '2025-01-04 12:00:00'),
('Testing', 'QA and testing tasks.', 5, '2025-01-05 13:00:00'),
('Documentation', 'Writing or updating documentation.', 6, '2025-01-06 14:00:00'),
('Code Review', 'Reviewing code for quality and standards.', 7, '2025-01-07 15:00:00'),
('Deployment', 'Deployment-related tasks and scripts.', 8, '2025-01-08 16:00:00'),
('Performance Optimization', 'Improving system or code performance.', 9, '2025-01-09 17:00:00'),
('Security', 'Security audits and vulnerability fixes.', 10, '2025-01-10 18:00:00'),
('Database', 'Database management and optimization.', 1, '2025-01-11 09:00:00'),
('Analytics', 'Data collection and reporting tasks.', 2, '2025-01-12 10:00:00'),
('Marketing', 'Marketing content and campaigns.', 3, '2025-01-13 11:00:00'),
('SEO', 'Search engine optimization tasks.', 4, '2025-01-14 12:00:00'),
('Client Support', 'Handling customer support requests.', 5, '2025-01-15 13:00:00'),
('Integration', 'Integrating third-party tools or APIs.', 6, '2025-01-16 14:00:00'),
('Infrastructure', 'Server and cloud infrastructure tasks.', 7, '2025-01-17 15:00:00'),
('Planning', 'Project or sprint planning tasks.', 8, '2025-01-18 16:00:00'),
('Research', 'Technical or market research.', 9, '2025-01-19 17:00:00'),
('Refactoring', 'Improving existing codebase.', 10, '2025-01-20 18:00:00'),
('Design Review', 'Reviewing design mockups and assets.', 1, '2025-01-21 09:00:00'),
('Legal Compliance', 'Tasks related to legal or policy requirements.', 2, '2025-01-22 10:00:00'),
('Content Creation', 'Creating blog posts, articles, or videos.', 3, '2025-01-23 11:00:00'),
('Training', 'Internal training and learning sessions.', 4, '2025-01-24 12:00:00'),
('Event Coordination', 'Managing online or physical events.', 5, '2025-01-25 13:00:00'),
('Accessibility', 'Improving usability for all users.', 6, '2025-01-26 14:00:00'),
('Internal Tools', 'Building or maintaining internal tools.', 7, '2025-01-27 15:00:00'),
('Onboarding', 'Tasks related to onboarding new team members.', 8, '2025-01-28 16:00:00'),
('Backup and Recovery', 'Managing backup systems and recovery plans.', 9, '2025-01-29 17:00:00'),
('Prototype', 'Creating and testing prototypes.', 10, '2025-01-30 18:00:00'),
('Survey', 'Creating and analyzing user or employee surveys.', 1, '2025-01-31 09:00:00'),
('Social Media', 'Tasks for social media engagement and content.', 2, '2025-02-01 10:00:00');
select * from TaskCategories;
INSERT INTO Tasks (project_id, assigned_to, category_id, status) VALUES
(1, 2, 1, 'pending'),
(1, 3, 2, 'in progress'),
(2, 4, 3, 'completed'),
(2, 5, 4, 'on hold'),
(3, 6, 5, 'pending'),
(3, 7, 6, 'in progress'),
(4, 8, 7, 'completed'),
(4, 9, 8, 'pending'),
(5, 10, 9, 'in progress'),
(5, 11, 10, 'pending'),
(6, 12, 11, 'completed'),
(6, 13, 12, 'pending'),
(7, 14, 13, 'on hold'),
(7, 15, 14, 'in progress'),
(8, 16, 15, 'completed'),
(8, 17, 16, 'pending'),
(9, 18, 17, 'in progress'),
(9, 19, 18, 'pending'),
(10, 20, 19, 'on hold'),
(10, 21, 20, 'pending'),
(1, 22, 1, 'in progress'),
(2, 23, 2, 'completed'),
(3, 24, 3, 'on hold'),
(4, 25, 4, 'pending'),
(5, 26, 5, 'in progress'),
(6, 27, 6, 'pending'),
(7, 28, 7, 'completed'),
(8, 29, 8, 'pending'),
(9, 30, 9, 'in progress'),
(10, 31, 10, 'pending'),
(1, 32, 11, 'pending'),
(2, 1, 12, 'in progress');
select * from Tasks;
INSERT INTO Milestones (project_id, title, due_date, status) VALUES
(1, 'Initial Design Approval', '2025-01-25', 'completed'),
(1, 'UI Wireframe Finalization', '2025-02-05', 'completed'),
(1, 'Website Launch', '2025-03-10', 'pending'),
(2, 'App MVP Completion', '2025-03-15', 'in progress'),
(2, 'Beta Testing Start', '2025-04-01', 'pending'),
(2, 'Public Launch', '2025-04-30', 'pending'),
(3, 'CRM Requirements Review', '2025-03-05', 'completed'),
(3, 'Integration Testing', '2025-04-10', 'in progress'),
(3, 'Full Deployment', '2025-05-10', 'pending'),
(4, 'Campaign Planning', '2025-04-10', 'completed'),
(4, 'Launch Email Series', '2025-05-01', 'in progress'),
(4, 'Evaluate ROI', '2025-06-25', 'pending'),
(5, 'Survey Design', '2025-01-25', 'completed'),
(5, 'Customer Outreach', '2025-02-10', 'completed'),
(5, 'Results Analysis', '2025-02-28', 'pending'),
(6, 'Data Backup Complete', '2025-03-20', 'completed'),
(6, 'Cloud Transfer Start', '2025-04-01', 'in progress'),
(6, 'System Validation', '2025-05-05', 'pending'),
(7, 'Keyword Research', '2025-02-20', 'completed'),
(7, 'On-Page Optimization', '2025-03-15', 'in progress'),
(7, 'Performance Audit', '2025-04-01', 'pending'),
(8, 'Initial Security Scan', '2025-03-10', 'completed'),
(8, 'Penetration Testing', '2025-03-25', 'in progress'),
(8, 'Audit Report Finalization', '2025-04-05', 'pending'),
(9, 'Welcome Email Setup', '2025-01-25', 'completed'),
(9, 'HR Workflow Automation', '2025-02-10', 'in progress'),
(9, 'Final Review', '2025-02-15', 'pending'),
(10, 'Tool Evaluation', '2025-04-10', 'completed'),
(10, 'Portal Redesign Start', '2025-04-25', 'in progress'),
(10, 'Feature Release', '2025-05-10', 'pending'),
(2, 'Performance Review', '2025-04-20', 'pending'),
(3, 'Stakeholder Sign-Off', '2025-05-01', 'pending');
select * from Milestones;
INSERT INTO TaskUpdates (task_id, updated_by, update_text, updated_at) VALUES
(1, 2, 'Initial task created and assigned.', '2025-01-10 09:00:00'),
(2, 3, 'Started development work.', '2025-01-11 10:15:00'),
(3, 4, 'Code review completed.', '2025-01-12 14:30:00'),
(4, 5, 'Blocked by API delay.', '2025-01-13 11:00:00'),
(5, 6, 'Waiting on design specs.', '2025-01-14 15:45:00'),
(6, 7, 'Test cases written.', '2025-01-15 16:30:00'),
(7, 8, 'Pushed changes to GitHub.', '2025-01-16 13:10:00'),
(8, 9, 'Updated task with new deadline.', '2025-01-17 09:40:00'),
(9, 10, 'Performance issue found.', '2025-01-18 10:20:00'),
(10, 11, 'Meeting with client scheduled.', '2025-01-19 14:00:00'),
(11, 12, 'Implemented requested feature.', '2025-01-20 12:30:00'),
(12, 13, 'Bug fixed and tested.', '2025-01-21 13:45:00'),
(13, 14, 'Reviewed acceptance criteria.', '2025-01-22 11:00:00'),
(14, 15, 'Started integration.', '2025-01-23 16:15:00'),
(15, 16, 'Submitted for QA.', '2025-01-24 17:00:00'),
(16, 17, 'Fixed mobile layout issues.', '2025-01-25 09:00:00'),
(17, 18, 'Documentation updated.', '2025-01-26 14:30:00'),
(18, 19, 'Code optimized for performance.', '2025-01-27 15:10:00'),
(19, 20, 'Bug could not be reproduced.', '2025-01-28 10:45:00'),
(20, 21, 'Sprint demo ready.', '2025-01-29 11:30:00'),
(21, 22, 'Staging deployment done.', '2025-01-30 13:00:00'),
(22, 23, 'Design feedback received.', '2025-01-31 14:15:00'),
(23, 24, 'Task reassigned to another team.', '2025-02-01 10:00:00'),
(24, 25, 'Testing complete.', '2025-02-02 11:20:00'),
(25, 26, 'Ready for client review.', '2025-02-03 12:30:00'),
(26, 27, 'Sprint review passed.', '2025-02-04 13:40:00'),
(27, 28, 'Found blocker in deployment.', '2025-02-05 14:50:00'),
(28, 29, 'Deployment postponed.', '2025-02-06 16:00:00'),
(29, 30, 'Refactored authentication module.', '2025-02-07 17:10:00'),
(30, 31, 'Client feedback incorporated.', '2025-02-08 10:30:00'),
(31, 32, 'Final testing phase started.', '2025-02-09 11:45:00'),
(32, 1, 'Task marked completed.', '2025-02-10 13:00:00');
select * from TaskUpdates;
INSERT INTO ProjectMembers (project_id, user_id, role, joined_at) VALUES
(1, 1, 'manager', '2025-01-10 09:00:00'),
(1, 2, 'developer', '2025-01-11 10:00:00'),
(1, 3, 'designer', '2025-01-12 11:00:00'),
(2, 4, 'QA', '2025-01-13 12:00:00'),
(2, 5, 'developer', '2025-01-14 13:00:00'),
(2, 6, 'lead', '2025-01-15 14:00:00'),
(3, 7, 'developer', '2025-01-16 15:00:00'),
(3, 8, 'QA', '2025-01-17 16:00:00'),
(3, 9, 'manager', '2025-01-18 17:00:00'),
(4, 10, 'developer', '2025-01-19 18:00:00'),
(4, 11, 'designer', '2025-01-20 09:00:00'),
(4, 12, 'manager', '2025-01-21 10:00:00'),
(5, 13, 'lead', '2025-01-22 11:00:00'),
(5, 14, 'QA', '2025-01-23 12:00:00'),
(5, 15, 'developer', '2025-01-24 13:00:00'),
(6, 16, 'developer', '2025-01-25 14:00:00'),
(6, 17, 'QA', '2025-01-26 15:00:00'),
(6, 18, 'designer', '2025-01-27 16:00:00'),
(7, 19, 'developer', '2025-01-28 17:00:00'),
(7, 20, 'manager', '2025-01-29 18:00:00'),
(8, 21, 'lead', '2025-01-30 09:00:00'),
(8, 22, 'QA', '2025-01-31 10:00:00'),
(8, 23, 'developer', '2025-02-01 11:00:00'),
(9, 24, 'designer', '2025-02-02 12:00:00'),
(9, 25, 'developer', '2025-02-03 13:00:00'),
(9, 26, 'QA', '2025-02-04 14:00:00'),
(10, 27, 'manager', '2025-02-05 15:00:00'),
(10, 28, 'developer', '2025-02-06 16:00:00'),
(10, 29, 'designer', '2025-02-07 17:00:00'),
(2, 30, 'developer', '2025-02-08 18:00:00'),
(3, 31, 'QA', '2025-02-09 09:00:00'),
(4, 32, 'developer', '2025-02-10 10:00:00');
select * from ProjectMembers;
INSERT INTO TaskAttachments (task_id, file_name, file_url, uploaded_at) VALUES
(1, 'bug_report_001.pdf', 'https://files.example.com/attachments/bug_report_001.pdf', '2025-01-10 09:00:00'),
(2, 'ui_mockup_v2.png', 'https://files.example.com/attachments/ui_mockup_v2.png', '2025-01-11 10:00:00'),
(3, 'feature_doc.docx', 'https://files.example.com/attachments/feature_doc.docx', '2025-01-12 11:30:00'),
(4, 'api_reference.json', 'https://files.example.com/attachments/api_reference.json', '2025-01-13 14:20:00'),
(5, 'test_plan.xlsx', 'https://files.example.com/attachments/test_plan.xlsx', '2025-01-14 15:10:00'),
(6, 'client_feedback.mp4', 'https://files.example.com/attachments/client_feedback.mp4', '2025-01-15 09:00:00'),
(7, 'error_log.txt', 'https://files.example.com/attachments/error_log.txt', '2025-01-16 10:00:00'),
(8, 'wireframe_v1.jpg', 'https://files.example.com/attachments/wireframe_v1.jpg', '2025-01-17 12:15:00'),
(9, 'meeting_notes.pdf', 'https://files.example.com/attachments/meeting_notes.pdf', '2025-01-18 14:00:00'),
(10, 'sprint_backlog.xlsx', 'https://files.example.com/attachments/sprint_backlog.xlsx', '2025-01-19 16:10:00'),
(11, 'security_audit.csv', 'https://files.example.com/attachments/security_audit.csv', '2025-01-20 08:50:00'),
(12, 'design_guidelines.pdf', 'https://files.example.com/attachments/design_guidelines.pdf', '2025-01-21 09:30:00'),
(13, 'feature_proposal.pptx', 'https://files.example.com/attachments/feature_proposal.pptx', '2025-01-22 11:00:00'),
(14, 'release_notes.txt', 'https://files.example.com/attachments/release_notes.txt', '2025-01-23 13:10:00'),
(15, 'deployment_script.sh', 'https://files.example.com/attachments/deployment_script.sh', '2025-01-24 14:40:00'),
(16, 'style_guide.pdf', 'https://files.example.com/attachments/style_guide.pdf', '2025-01-25 10:20:00'),
(17, 'performance_report.pdf', 'https://files.example.com/attachments/performance_report.pdf', '2025-01-26 12:00:00'),
(18, 'integration_diagram.png', 'https://files.example.com/attachments/integration_diagram.png', '2025-01-27 15:15:00'),
(19, 'deployment_logs.zip', 'https://files.example.com/attachments/deployment_logs.zip', '2025-01-28 16:45:00'),
(20, 'mockup_dark_theme.png', 'https://files.example.com/attachments/mockup_dark_theme.png', '2025-01-29 10:00:00'),
(21, 'timeline_chart.xlsx', 'https://files.example.com/attachments/timeline_chart.xlsx', '2025-01-30 13:30:00'),
(22, 'bug_repro_video.mp4', 'https://files.example.com/attachments/bug_repro_video.mp4', '2025-01-31 14:20:00'),
(23, 'user_flow.svg', 'https://files.example.com/attachments/user_flow.svg', '2025-02-01 09:15:00'),
(24, 'roadmap_q2.pdf', 'https://files.example.com/attachments/roadmap_q2.pdf', '2025-02-02 11:10:00'),
(25, 'invoice_template.docx', 'https://files.example.com/attachments/invoice_template.docx', '2025-02-03 13:00:00'),
(26, 'changelog.txt', 'https://files.example.com/attachments/changelog.txt', '2025-02-04 14:45:00'),
(27, 'user_survey_results.pdf', 'https://files.example.com/attachments/user_survey_results.pdf', '2025-02-05 15:30:00'),
(28, 'branding_assets.zip', 'https://files.example.com/attachments/branding_assets.zip', '2025-02-06 16:20:00'),
(29, 'code_snippets.js', 'https://files.example.com/attachments/code_snippets.js', '2025-02-07 17:00:00'),
(30, 'task_checklist.xlsx', 'https://files.example.com/attachments/task_checklist.xlsx', '2025-02-08 10:30:00'),
(31, 'demo_script.txt', 'https://files.example.com/attachments/demo_script.txt', '2025-02-09 12:10:00'),
(32, 'prototype_link.txt', 'https://files.example.com/attachments/prototype_link.txt', '2025-02-10 13:00:00');
select * from TaskAttachments;
--------------------------------------------
Show All milestones for a specific project:
--------------------------------------------
SELECT 
    Milestones.title,
    Milestones.due_date,
    Milestones.status
FROM Milestones
WHERE Milestones.project_id = 2;
---------------------------------
List all attachments for a task:
---------------------------------
SELECT 
    TaskAttachments.file_name,
    TaskAttachments.file_url,
    TaskAttachments.uploaded_at
FROM TaskAttachments
WHERE TaskAttachments.task_id = 10;
----------------------------
Show latest update per task:
----------------------------
SELECT 
    TU.task_id,
    TU.update_text,
    TU.updated_at
FROM TaskUpdates TU
INNER JOIN (
    SELECT task_id, MAX(updated_at) AS max_updated
    FROM TaskUpdates
    GROUP BY task_id
) latest ON TU.task_id = latest.task_id AND TU.updated_at = latest.max_updated;
---------------------------------------
Listing of Projects and the Categories:
---------------------------------------
SELECT 
    p.project_id,
    p.project_name,
    c.category_id,
    c.name AS category_name,
    c.created_at
FROM 
    Projects p,
    TaskCategories c
ORDER BY 
    p.project_id, c.category_id;
------------------------------------------------------------------------
List all tasks in a specific project with their assigned user and status:
------------------------------------------------------------------------
SELECT 
    t.task_id,
    t.status,
    u.username AS assigned_user,
    p.project_name
FROM Tasks t
JOIN Users u ON t.assigned_to = u.user_id
JOIN Projects p ON t.project_id = p.project_id
WHERE p.project_name = 'Website Redesign';
----------------------------------------
Show all categories created by each user:
----------------------------------------
SELECT 
    tc.name AS category_name,
    u.username AS created_by
FROM TaskCategories tc
JOIN Users u ON tc.created_by = u.user_id;
-----------------------------------------------------------------
 List members of each project along with their role and join date
 ----------------------------------------------------------------
 SELECT 
    p.project_name,
    u.username,
    pm.role,
    pm.joined_at
FROM ProjectMembers pm
JOIN Users u ON pm.user_id = u.user_id
JOIN Projects p ON pm.project_id = p.project_id;
---------------------------------------------------------------------
 Get recent updates for a specific task including who made the update
---------------------------------------------------------------------
SELECT 
    tu.update_text,
    tu.updated_at,
    u.username AS updated_by
FROM TaskUpdates tu
JOIN Users u ON tu.updated_by = u.user_id
WHERE tu.task_id = 101
ORDER BY tu.updated_at DESC;
----------------------------------------------------------------------------------
 List milestones for each project along with how many tasks exist in that project:
-----------------------------------------------------------------------------------
SELECT 
    p.project_name,
    m.title AS milestone_title,
    m.due_date,
    COUNT(t.task_id) AS total_tasks
FROM Milestones m
JOIN Projects p ON m.project_id = p.project_id
LEFT JOIN Tasks t ON t.project_id = p.project_id
GROUP BY p.project_name, m.title, m.due_date;
-------------------------------------------------------------------------
Find all tasks that have attachments, including the number of attachments:
-------------------------------------------------------------------------
SELECT 
    t.task_id,
    p.project_name,
    COUNT(ta.attachment_id) AS attachment_count
FROM Tasks t
JOIN Projects p ON t.project_id = p.project_id
JOIN TaskAttachments ta ON ta.task_id = t.task_id
GROUP BY t.task_id, p.project_name
HAVING COUNT(ta.attachment_id) > 0;
---------------------------------------------------------------
Find users who are assigned tasks but are not project members:
---------------------------------------------------------------
SELECT DISTINCT 
    u.username,
    t.task_id,
    p.project_name
FROM Tasks t
JOIN Users u ON t.assigned_to = u.user_id
JOIN Projects p ON t.project_id = p.project_id
LEFT JOIN ProjectMembers pm 
    ON pm.user_id = u.user_id AND pm.project_id = p.project_id
WHERE pm.member_id IS NULL;
----------------------------------------------------
Find overdue milestones and their associated project:
----------------------------------------------------
SELECT 
    m.title AS milestone_title,
    p.project_name,
    m.due_date,
    m.status
FROM Milestones m
JOIN Projects p ON m.project_id = p.project_id
WHERE m.due_date < CURDATE() AND m.status != 'completed';
-----------------------------------------------------------------------
List users who created task categories but are not assigned to any task:
-----------------------------------------------------------------------
SELECT DISTINCT 
    u.user_id,
    u.username
FROM Users u
JOIN TaskCategories tc ON u.user_id = tc.created_by
LEFT JOIN Tasks t ON t.assigned_to = u.user_id
WHERE t.task_id IS NULL;












