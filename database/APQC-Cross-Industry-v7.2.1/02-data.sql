-- ============================================================================
-- APQC Process Classification Framework (PCF) - Cross Industry v7.2.1
-- Data Insert Statements
-- ============================================================================
--
-- This file contains INSERT statements for all APQC PCF processes
-- Total records: 413 processes across 3 hierarchy levels
--
-- Version: 7.2.1
-- Framework: Cross Industry
-- Generated: 2026-03-24
--
-- ============================================================================

-- Begin transaction for data integrity
BEGIN;

-- ============================================================================
-- Insert Framework Metadata
-- ============================================================================

INSERT INTO framework_metadata (
    id, framework_name, framework_version, industry_type, 
    release_date, description, source_system
) VALUES (
    1,
    'APQC Process Classification Framework',
    '7.2.1',
    'Cross Industry',
    '2019-12-18',
    'The APQC Process Classification Framework (PCF) is a reliable and robust framework used by thousands of organizations worldwide. It allows your organization to objectively benchmark its processes against others, regardless of industry, size, or geography.',
    'HOPEX V3.00.02'
);

-- ============================================================================
-- Insert Process Categories (Level 1)
-- ============================================================================


INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    1, '1.0', 'Develop Vision and Strategy',
    'Establishing a direction and vision for an organization. This involves defining the business concept and long-term vision, as well as developing the business strategy and managing strategic initiatives. Processes in this category focus on creating a vision, a mission, and strategic objectives, and culminate in creating measures to ensure that the organization is moving in the desired direction.',
    'Operating', 1
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    2, '2.0', 'Develop and Manage Products and Services',
    'Detailing practices and procedures related to the concept of developing and managing products and services. These are reflected in the process groups Govern and manage product/service development program [19696], Generate and define new product/service ideas [19698], and Develop products and services [10062].',
    'Operating', 2
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    3, '3.0', 'Market and Sell Products and Services',
    'Outlining process groups related to understanding markets, customers, and capabilities; developing marketing strategies; executing marketing plans; developing sales strategies; developing and managing marketing plans; and managing sales partners and alliances.',
    'Operating', 3
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    4, '4.0', 'Deliver Physical Products',
    'Performing supply chain activities include planning supply chain, procuring materials and services, and managing logistics.',
    'Operating', 4
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    5, '5.0', 'Deliver Services',
    'Offering services to customers. This is the act of providing service delivery as a core business practice and covers identifying strategies for performing service delivery, managing resources, and delivering services to the customer.',
    'Operating', 5
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    6, '6.0', 'Manage Customer Service',
    'Managing customers before and after the delivery of services. This includes developing and planning customer service practices with an eye on steering processes relating to inquiries after sales, feedback, warranties, and recalls.',
    'Operating', 6
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    7, '7.0', 'Develop and Manage Human Capital',
    'Delivering processes traditionally defined as "human resources". Process groups include those related to developing and maintaining workforce strategy, recruiting employees, developing and counseling employees, managing employee relations, rewarding and retaining employees, redeploying and retiring employees, managing employee information, and managing employee communications.',
    'Management and Support', 7
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    8, '8.0', 'Manage Information Technology (IT)',
    'Managing process groups relevant to the business of information technology within an organization. The process groups include "Develop and manage IT customer relationships", "Develop and manage IT business strategy", " Develop and manage IT resilience and risk", " Manage information", " Develop and manage services/solutions", "Deploy services/solutions", and " Create and manage support services/solutions".',
    'Management and Support', 8
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    9, '9.0', 'Manage Financial Resources',
    'Overseeing key back-office processes for organizations. This category includes process groups related to planning and management accounting, revenue accounting, general accounting and reporting, fixed-asset project accounting, payroll, accounts payable and expense reimbursements, treasury operations, internal controls, tax management, international funds/consolidation, and global trade services.',
    'Management and Support', 9
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    10, '10.0', 'Acquire, Construct, and Manage Assets',
    'Relating to the design, construction, acquisition, and management of both productive and non-productive assets.',
    'Management and Support', 10
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    11, '11.0', 'Manage Enterprise Risk, Compliance, Remediation, and Resiliency',
    'Ensuring that an organization effectively manages its risk. Process groups are aligned with traditional risk management activities.',
    'Management and Support', 11
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    12, '12.0', 'Manage External Relationships',
    'Fostering external relationships with stakeholders of the entity, including investors, government and industry, the board of directors, and the general public. This is not related to customer management.',
    'Management and Support', 12
);

INSERT INTO process_categories (
    category_id, category_code, category_name, category_description,
    category_type, sort_order
) VALUES (
    13, '13.0', 'Develop and Manage Business Capabilities',
    'Performing activities by an organization that are fundamental to the successful operation of the organization, even across functions in a business. Capabilities defined in the PCF include business process management; portfolio, program, and project management; quality management; change management; benchmarking; environmental health and safety management; and knowledge management.',
    'Management and Support', 13
);


-- ============================================================================
-- Insert All Processes (Levels 1, 2, and 3)
-- ============================================================================
-- Note: Inserting in hierarchical order to respect foreign key constraints


INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_0', '1.0', 'Develop Vision and Strategy',
    'Establishing a direction and vision for an organization. This involves defining the business concept and long-term vision, as well as developing the business strategy and managing strategic initiatives. Processes in this category focus on creating a vision, a mission, and strategic objectives, and culminate in creating measures to ensure that the organization is moving in the desired direction.',
    '10002', 'F2C3F3655DF91BE0',
    1, NULL, '1.0',
    'Category', FALSE, 1, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_0', '2.0', 'Develop and Manage Products and Services',
    'Detailing practices and procedures related to the concept of developing and managing products and services. These are reflected in the process groups Govern and manage product/service development program [19696], Generate and define new product/service ideas [19698], and Develop products and services [10062].',
    '10003', 'F2C3F3655DF91BE0',
    1, NULL, '2.0',
    'Category', FALSE, 2, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_0', '3.0', 'Market and Sell Products and Services',
    'Outlining process groups related to understanding markets, customers, and capabilities; developing marketing strategies; executing marketing plans; developing sales strategies; developing and managing marketing plans; and managing sales partners and alliances.',
    '10004', 'F2C3F3655DF91BE0',
    1, NULL, '3.0',
    'Category', FALSE, 3, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_0', '4.0', 'Deliver Physical Products',
    'Performing supply chain activities include planning supply chain, procuring materials and services, and managing logistics.',
    '20022', 'F2C3F3655DF91BE0',
    1, NULL, '4.0',
    'Category', FALSE, 4, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_0', '5.0', 'Deliver Services',
    'Offering services to customers. This is the act of providing service delivery as a core business practice and covers identifying strategies for performing service delivery, managing resources, and delivering services to the customer.',
    '20025', 'F2C3F3655DF91BE0',
    1, NULL, '5.0',
    'Category', FALSE, 5, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_0', '6.0', 'Manage Customer Service',
    'Managing customers before and after the delivery of services. This includes developing and planning customer service practices with an eye on steering processes relating to inquiries after sales, feedback, warranties, and recalls.',
    '20085', 'F2C3F3655DF91BE0',
    1, NULL, '6.0',
    'Category', FALSE, 6, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_0', '7.0', 'Develop and Manage Human Capital',
    'Delivering processes traditionally defined as "human resources". Process groups include those related to developing and maintaining workforce strategy, recruiting employees, developing and counseling employees, managing employee relations, rewarding and retaining employees, redeploying and retiring employees, managing employee information, and managing employee communications.',
    '10007', 'F2C3F3655DF91BE0',
    1, NULL, '7.0',
    'Category', FALSE, 7, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_0', '8.0', 'Manage Information Technology (IT)',
    'Managing process groups relevant to the business of information technology within an organization. The process groups include "Develop and manage IT customer relationships", "Develop and manage IT business strategy", " Develop and manage IT resilience and risk", " Manage information", " Develop and manage services/solutions", "Deploy services/solutions", and " Create and manage support services/solutions".',
    '20607', 'F2C3F3655DF91BE0',
    1, NULL, '8.0',
    'Category', FALSE, 8, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_0', '9.0', 'Manage Financial Resources',
    'Overseeing key back-office processes for organizations. This category includes process groups related to planning and management accounting, revenue accounting, general accounting and reporting, fixed-asset project accounting, payroll, accounts payable and expense reimbursements, treasury operations, internal controls, tax management, international funds/consolidation, and global trade services.',
    '17058', 'F2C3F3655DF91BE0',
    1, NULL, '9.0',
    'Category', FALSE, 9, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_0', '10.0', 'Acquire, Construct, and Manage Assets',
    'Relating to the design, construction, acquisition, and management of both productive and non-productive assets.',
    '19207', 'F2C3F3655DF91BE0',
    1, NULL, '10.0',
    'Category', FALSE, 10, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_0', '11.0', 'Manage Enterprise Risk, Compliance, Remediation, and Resiliency',
    'Ensuring that an organization effectively manages its risk. Process groups are aligned with traditional risk management activities.',
    '16437', 'F2C3F3655DF91BE0',
    1, NULL, '11.0',
    'Category', FALSE, 11, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_0', '12.0', 'Manage External Relationships',
    'Fostering external relationships with stakeholders of the entity, including investors, government and industry, the board of directors, and the general public. This is not related to customer management.',
    '10012', 'F2C3F3655DF91BE0',
    1, NULL, '12.0',
    'Category', FALSE, 12, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_0', '13.0', 'Develop and Manage Business Capabilities',
    'Performing activities by an organization that are fundamental to the successful operation of the organization, even across functions in a business. Capabilities defined in the PCF include business process management; portfolio, program, and project management; quality management; change management; benchmarking; environmental health and safety management; and knowledge management.',
    '10013', 'F2C3F3655DF91BE0',
    1, NULL, '13.0',
    'Category', FALSE, 13, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_1', '1.1', 'Define the business concept and long-term vision',
    'Creating a conceptual framework of the organization''s business activity and strategic vision with long-term applicability. Scout the organization''s internal capabilities, as well as the customer''s needs and desires, to identify a fit that can be used to advance a conceptual structure of the organization''s business activity. Conduct analysis in light of relevant externalities and large-scale shifts in the market landscape.',
    '17040', 'F2C3F3665DF91C50',
    2, '1.0', '1.0',
    'Process Group', FALSE, 14, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_1_1', '1.1.1', 'Assess the external environment',
    'Assessing all forces, entities, and systems that are external to an organization but can affect its operation. Analyze far-reaching currents in the macroeconomic situation, assess the competition, evaluate technological changes, and identify societal as well as ecological issues of concern. Create a big-picture understanding of externalities, with sufficient depth across individual aspects.',
    '10017', 'F2C3F3735DF933EB',
    3, '1.1', '1.0',
    'Process', TRUE, 15, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_1_2', '1.1.2', 'Survey market and determine customer needs and wants',
    'Examining the market to identify customer required solutions. Assess the relevant market(s) to determine the products/services that are needed or wanted by customers. Carry out quantitative and qualitative analyses to capture and investigate products/services. Employ creative techniques that allow for a closer appreciation of the customer, and design relevant solutions.',
    '10018', 'F2C3F3735DF933EB',
    3, '1.1', '1.0',
    'Process', TRUE, 16, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_1_3', '1.1.3', 'Assess the internal environment',
    'Undertaking a review of the organization''s in-house skills and resources in order to create a big-picture understanding of internal capacities. Assess the organization''s capabilities in order to advance the advantageous and weed out the detrimental aspects. Identify synergic associations within the backdrop of the forces and players active in the market, and take into account all externalities.',
    '10019', 'F2C3F3735DF933EB',
    3, '1.1', '1.0',
    'Process', TRUE, 17, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_1_4', '1.1.4', 'Establish strategic vision',
    'Establishing the organization''s long-term vision as a strategic positioning and engagement of stakeholders. Institute the vision by creating strategic orientations of all stakeholders. Understand the strategy development frameworks in this context.',
    '10020', 'F2C3F3735DF933EB',
    3, '1.1', '1.0',
    'Process', TRUE, 18, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_1_5', '1.1.5', 'Conduct organization restructuring opportunities',
    'Examining the scope and contingencies for restructuring based on market situation and internal realities. Map the market forces over which any and all probabilities can be probed for utility and viability. Once the restructuring options have been analyzed and the due-diligence performed, execute the deal. Consider seeking professional services for assistance in formalizing these opportunities.',
    '16792', 'F2C3F3735DF933EB',
    3, '1.1', '1.0',
    'Process', TRUE, 19, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2', '1.2', 'Develop business strategy',
    'Developing an organization''s mission statement, strategy, and business design. Create a concise statement that clearly articulates the mission of the organization, outlining practicable targets to Establish a strategic vision [10020]. Delineate strategic options by matching these alternatives with the organization''s internal capabilities. Create an organizational design, and identify goals by developing strategies at the functional and process levels.',
    '10015', 'F2C3F3665DF91C50',
    2, '1.0', '1.0',
    'Process Group', FALSE, 20, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_1', '1.2.1', 'Develop overall mission statement',
    'Establishing an overarching, compact statement that concisely underscores the mission of the organization. Define and communicate a clear and succinct mission statement, which encapsulates how the organization aims to proceed in order to Establish a strategic vision [10020]. Solicit critical inputs from senior management and strategy executives, and collaborate with marketing or personnel from allied functions.',
    '10037', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 21, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_2', '1.2.2', 'Define and evaluate strategic options to achieve the objectives',
    'Assessing sets of strategic decisions designed to drive the organization''s long-term objectives. Identify various strategies concerning core functional areas. Appraise strategic options in light of auxiliary decision frameworks that ensure smooth functioning, the advancement of functional efficiencies, and vitality. Involve senior management executives, especially strategy and/or business unit personnel, with need-based consultative assistance from professional services providers.',
    '10038', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 22, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_3', '1.2.3', 'Select long-term business strategy',
    'Embracing a strategy for the achievement of business goals over the distant future. Espouse one of the strategic options for realizing its mission over the long term. Enlist senior management executives, comprising strategy and/or business unit personnel.',
    '10039', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 23, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_4', '1.2.4', 'Coordinate and align functional and process strategies',
    'Aligning the approach and method of individual units, departments, systems, and operations within the organization, in accordance with the larger strategic course adopted. Employ the organization''s strategic path to guide the functions, divisions, and operations. Calibrate the plan and method of each functional area, as well as the processes therein, to Select the long-term business strategy [10039].',
    '10040', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 24, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_5', '1.2.5', 'Create organizational design',
    'Formulating a design for the organization''s resources that allow it to meet its objectives. Develop a new framework for molding the organization''s various processes into a coherent and seamless whole.',
    '10041', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 25, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_6', '1.2.6', 'Develop and set organizational goals',
    'Developing overall goals for the organization that help in accomplishing its mission. Formulate organization-wide targets in the near to middle term, which will accumulate and propel the organization to realize its long-term objectives, as outlined in Develop an overall mission statement [10037]. Enlist business unit heads or equivalent personnel, in close collaboration with senior management executives.',
    '10042', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 26, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_7', '1.2.7', 'Formulate business unit strategies',
    'Charting a strategic course for business units in order to leverage opportunities, sidestep hurdles, and create synergies among each other. Create strategic road maps for the organization''s units--in light of their individual resources and requirements, as well as their relationships with other business units--to achieve organizational goals.',
    '10043', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 27, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_8', '1.2.8', 'Develop customer experience strategy',
    'Defining a roadmap to meet customer expectations while considering how it will affect the business.',
    '19959', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 28, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_2_9', '1.2.9', 'Communicate strategies internally and externally',
    'Conveying planned procedures and methods to both internal departments and external stakeholders like customers, suppliers, etc., in an effective manner based on organizational objective.',
    '18916', 'F2C3F3745DF935B3',
    3, '1.2', '1.0',
    'Process', TRUE, 29, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_3', '1.3', 'Execute and measure strategic initiatives',
    'Managing strategic initiatives, from development through selection, execution, and evaluation. Conduct and oversee strategic projects supporting long-term objectives. Administer programs of strategic significance by developing such initiatives, select the most appropriate projects, and formulate measures to assess their impact.',
    '10016', 'F2C3F3665DF91C50',
    2, '1.0', '1.0',
    'Process Group', FALSE, 30, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_3_1', '1.3.1', 'Develop strategic initiatives',
    'Developing strategic projects that help fulfill long-term goals. Develop time-bound projects that are discretionary in nature and lie beyond the scope of the organization''s routine operations.',
    '10057', 'F2C3F3755DF938A4',
    3, '1.3', '1.0',
    'Process', TRUE, 31, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_3_2', '1.3.2', 'Evaluate strategic initiatives',
    'Examining projects of strategic significance that lie outside the purview of the organization''s routine operations. Closely analyze strategic initiatives for their applicability and feasibility, given the organization''s vision.',
    '10058', 'F2C3F3755DF938A4',
    3, '1.3', '1.0',
    'Process', TRUE, 32, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_3_3', '1.3.3', 'Select strategic initiatives',
    'Selecting relevant projects of strategic significance that create opportunities for the organization to realize its long-term objectives, on the basis of their suitability to the organization''s constraints and reality. Select from the process Evaluate strategic initiatives [10058], based on their applicability and feasibility for the organization. Enlist senior management, especially strategy personnel.',
    '10059', 'F2C3F3755DF938A4',
    3, '1.3', '1.0',
    'Process', TRUE, 33, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_3_4', '1.3.4', 'Establish high-level measures',
    'Devising measures to examine strategic projects. Formulate evaluation criteria to assess the strategic initiatives for the level of impact.',
    '10060', 'F2C3F3755DF938A4',
    3, '1.3', '1.0',
    'Process', TRUE, 34, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_3_5', '1.3.5', 'Execute strategic initiatives',
    'Successfully implement strategic initiatives. Execution of strategy is also defined as the process of implementing logical set of connected activities by an organization to make a strategy work.',
    '19507', 'F2C3F3755DF938A4',
    3, '1.3', '1.0',
    'Process', TRUE, 35, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_4', '1.4', 'Develop and maintain business models',
    'Establishing how an organization creates, delivers and captures value or makes profit. Identify the products or services that a business will sell, its target market, anticipated expenses, and other core aspects of its modus operandi. Revise the plan as required to reflect changing circumstances.',
    '20944', 'F2C3F3665DF91C50',
    2, '1.0', '1.0',
    'Process Group', FALSE, 36, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_4_1', '1.4.1', 'Develop business models',
    'Creating an economic model that describes the goals of an organization and the business processes needed to achieve those goals. This involves information gathering, securing necessary approvals and authorizations, integrating with preexisting models, including the general business concept [10002] and business strategy [10015], and formally accepting the model as the basis for organization''s day-to-day operations.',
    '20945', 'F2C3F3765DF93A62',
    3, '1.4', '1.0',
    'Process', TRUE, 37, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_4_2', '1.4.2', 'Maintain business models',
    'Revising and updating business models to reflect the changes in the marketed services, product inventory, market behavior, available resources or accrued expenses. Determine how and when to modify the accepted business model in response to incoming feedback.',
    '20950', 'F2C3F3765DF93A62',
    3, '1.4', '1.0',
    'Process', TRUE, 38, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_1_4_3', '1.4.3', 'Establish business model governance',
    'Creating and implementing a strategy, responsibilities and control mechanisms for managing business models that are timely, efficient and cost-effective.',
    '20955', 'F2C3F3765DF93A62',
    3, '1.4', '1.0',
    'Process', TRUE, 39, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_1', '2.1', 'Govern and manage product/service development program',
    'Supervising the complete product/service program from innovation until its commercial success. Meeting the customer demand and expectations. Conduct further development and innovation pertaining to business goals.',
    '19696', 'F2C3F3675DF91DB9',
    2, '2.0', '2.0',
    'Process Group', FALSE, 40, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_1_1', '2.1.1', 'Manage product and service portfolio',
    'Managing a portfolio of product/service offerings to take advantage of shifts in the market expectations, all the while coordinating with the overall business strategy. Revisit the product/service portfolio in light of market opportunities, and overhaul it to capture value created by these opportunities. Identify gaps between current offerings and the market expectations to direct the organization''s R&D activity. Create new solutions, and revise or retire existing ones so that the revamped portfolio aligns with Develop a business strategy [10015].',
    '10061', 'F2C3F3765DF93BD4',
    3, '2.1', '2.0',
    'Process', TRUE, 41, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_1_2', '2.1.2', 'Manage product and service life cycle',
    'Manage the introduction and withdrawal of products/services. Administer associated changes, namely measuring the performance of new solution offerings and the revision of master files in the archives.',
    '10067', 'F2C3F3765DF93BD4',
    3, '2.1', '2.0',
    'Process', TRUE, 42, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_1_3', '2.1.3', 'Manage patents, copyrights, and regulatory requirements',
    'Determining the attributes necessary to protect and safeguard intellectual assets, maximize the value of IP assets through streamlined process, and collaboration between departments. Focus on needs to safeguard, critical assets, and assets'' value.',
    '19985', 'F2C3F3765DF93BD4',
    3, '2.1', '2.0',
    'Process', TRUE, 43, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_1_4', '2.1.4', 'Manage product and service master data',
    'Controlling/authorizing to enable services'' and products'' data and other critical data of these functions through a well secured storage and accessibility processes backed by siloed applications/IT systems.',
    '11740', 'F2C3F3765DF93BD4',
    3, '2.1', '2.0',
    'Process', TRUE, 44, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_2', '2.2', 'Generate and define new product/service ideas',
    'Identifying and describing new product or service thoughts based on organizational objectives/targets.',
    '19698', 'F2C3F3675DF91DB9',
    2, '2.0', '2.0',
    'Process Group', FALSE, 45, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_2_1', '2.2.1', 'Perform discovery research',
    'Coordinating R&D activity to identify new technologies to integrate into the revamped portfolio of products/services. Conduct early-stage R&D activity to close gaps between existing solution offerings and changing market expectations. Triangulate appropriate technologies that can support the development of a revised product/service portfolio.',
    '10065', 'F2C3F3775DF93D20',
    3, '2.2', '2.0',
    'Process', TRUE, 46, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_2_2', '2.2.2', 'Generate new product/service concepts',
    'Producing and defining ideologies for new product/service offerings.',
    '19669', 'F2C3F3775DF93D20',
    3, '2.2', '2.0',
    'Process', TRUE, 47, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_2_3', '2.2.3', 'Define product/service development requirements',
    'Encompassing the identification and capture of new product/service requirements or potential improvements to current products/services. Collaborating with members of the supply chain to ensure the feasibility of what is being defined in the requirements. For example, a product with manufacturing requirements that supply chain cannot currently fulfill requires a corporate decision to either upgrade manufacturing capabilities or abandon the new product. Enterprise-level effects and needs must be considered. Depending on the nature of the final product or service, these requirements are often defined as a set of abilities, such as availability or reliability, that influence product development decisions.',
    '19990', 'F2C3F3775DF93D20',
    3, '2.2', '2.0',
    'Process', TRUE, 48, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_3', '2.3', 'Develop products and services',
    'Developing new products/services from scratch, including all activities associated with the design, prototyping, evaluation, and market testing of these planned offerings.',
    '10062', 'F2C3F3675DF91DB9',
    2, '2.0', '2.0',
    'Process Group', FALSE, 49, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_3_1', '2.3.1', 'Design and prototype products and services',
    'Sketching and standardizing product and service based on the market. Analyze the data market competitiveness and innovation attained for the product and service development.',
    '19993', 'F2C3F3785DF93E3C',
    3, '2.3', '2.0',
    'Process', TRUE, 50, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_3_2', '2.3.2', 'Test market for new or revised products and services',
    'Expanding on the marketplace analysis that took place earlier in the product development lifecycle by testing the market against offerings. The results from this in-depth analysis will help the organization finalize product/service characteristics and technical requirements and also identify any needed changes in the manufacturing and delivery processes that support market delivery. To prepare a detailed market study that accounts for any changes in the global environment, the organization may want to conduct a series of interviews, workshops, and focus groups with potential and existing customers.',
    '19996', 'F2C3F3785DF93E3C',
    3, '2.3', '2.0',
    'Process', TRUE, 51, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_2_3_3', '2.3.3', 'Prepare for production/service delivery',
    'Devising business plans and procedures for manufacturing/operations/production and delivery of services offered by the organization. Further in general terms the total amount of output that the manufacturing department is responsible to produce for each period.',
    '19997', 'F2C3F3785DF93E3C',
    3, '2.3', '2.0',
    'Process', TRUE, 52, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_1', '3.1', 'Understand markets, customers, and capabilities',
    'Making sense of the market and customers to identify the right opportunities to be capitalized, given the organization''s competencies. Discern trends and shift in the market and customers. Identify the right market opportunities that fit closely with the organization''s capabilities and strategy by gathering intelligence on various attributes of different market/customer segments.',
    '10101', 'F2C3F3685DF91ED2',
    2, '3.0', '3.0',
    'Process Group', FALSE, 53, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_1_1', '3.1.1', 'Perform customer and market intelligence analysis',
    'Gathering intelligence on the market and customers. Closely examine the inherent attributes and collective behavior of the various market and customer segments. Track trends in the market. Determine what drives the customers to make purchasing decisions in order to identify opportunities in the market.',
    '10106', 'F2C3F3795DF93FE1',
    3, '3.1', '3.0',
    'Process', TRUE, 54, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_1_2', '3.1.2', 'Evaluate and prioritize market opportunities',
    'Appraising market opportunities by quantifying and subjecting them to prioritization, as well as validation tests. Closely examine the market opportunities that have been identified by Perform customer and market intelligence analysis [10106]. Triangulate those opportunities to capitalize by finding a fit between identified opportunities and the composite of organizational capabilities and business strategy.',
    '10107', 'F2C3F3795DF93FE1',
    3, '3.1', '3.0',
    'Process', TRUE, 55, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_2', '3.2', 'Develop marketing strategy',
    'Charting a strategic course for marketing products/services. This will include defining the value proposition, creating a mechanism for pricing, and determining the right mix of marketing channels. Create a specific positioning and branding for the organization''s offerings. Enlist marketing head to lead, with inputs from the business development and sales functions.',
    '10102', 'F2C3F3685DF91ED2',
    2, '3.0', '3.0',
    'Process Group', FALSE, 56, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_2_1', '3.2.1', 'Define offering and customer value proposition',
    'Refining the attributes of organizational offerings to define their value proposition for the customer. Clearly define the suite of offerings in terms of the value delivered, from the perspective of what the customer desires. Validate the benefits delivered to the customers against target market segments, using techniques such as minimum viable product. Position brands for the respective products/services, in line with their unique value proposition and aligned with customers needs.',
    '11168', 'F2C3F3795DF940BB',
    3, '3.2', '3.0',
    'Process', TRUE, 57, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_2_2', '3.2.2', 'Define pricing strategy',
    'Creating a pricing strategy and mechanism that aligns with the benefits of the products/services, as perceived by customers. Chart a strategic course and a methodology that can guide the pricing of products/services. Draw heavily from the customer value proposition, and balance the expectations of different divisions inside the organization, while delivering the maximum ROI.',
    '10123', 'F2C3F3795DF940BB',
    3, '3.2', '3.0',
    'Process', TRUE, 58, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_2_3', '3.2.3', 'Define and manage channel strategy',
    'Establishing all the activities needed to identify the appropriate channels to market to different customer segments as defined in Determine target segments [10117]. This involves finding channel partners, ensuring that the channels align with organizational strategy for each segment, and the final channel selection process.',
    '20000', 'F2C3F3795DF940BB',
    3, '3.2', '3.0',
    'Process', TRUE, 59, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_2_4', '3.2.4', 'Analyze and manage channel performance',
    'Monitoring marketing and distribution efforts of all channels individually and as a network. Re-distribute or add resources to channels that perform better than expected. Purge or consolidate under-performing channels, and find more promising replacements.',
    '20006', 'F2C3F3795DF940BB',
    3, '3.2', '3.0',
    'Process', TRUE, 60, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_2_5', '3.2.5', 'Develop marketing communication strategy',
    'Establishing marketing communications that deliver promotional messages, in a coordinated way, through multiple marketing channels, such as print, radio, television, direct mail, online or mobile advertising, email, social media or personal selling.',
    '16848', 'F2C3F3795DF940BB',
    3, '3.2', '3.0',
    'Process', TRUE, 61, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_2_6', '3.2.6', 'Design and manage customer loyalty program',
    'Creating and managing a customer loyalty program. The loyalty program is a key part of marketing, with an elaborate strategy and process for acquiring, retaining, and engaging with members. Members are engaged and acquainted to the loyalty program, thus growing relationship and adding value through the program.',
    '18924', 'F2C3F3795DF940BB',
    3, '3.2', '3.0',
    'Process', TRUE, 62, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3', '3.3', 'Develop and manage marketing plans',
    'Creating specific plans to market offerings to customers. This process group includes processes for making budgets, identifying and developing media, pricing products and services, managing packaging, managing marketing content and promotional activities, tracking and responding to customer insight and monitoring measures established within "develop marketing strategy". Additionally, in this process group, organizations take action on plans made in earlier processes. Here, marketing and customers are managed and measured along with any supporting materials.',
    '20008', 'F2C3F3685DF91ED2',
    2, '3.0', '3.0',
    'Process Group', FALSE, 63, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_1', '3.3.1', 'Establish goals, objectives, and metrics for products/services by channel/segment',
    'Determining what to achieve by marketing. Create qualitative and quantitative targets. Establish metrics to track performance (for individual Market segments [10109] and Channels for target segments [10129]). Enlist the head of marketing to determine marketing priorities and the related measures. (The decision in establishing these goals, objectives, and metrics is founded in Develop marketing strategy [10102] and takes cues from current priorities and organizational strategy.)',
    '10148', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 64, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_2', '3.3.2', 'Establish marketing budgets',
    'Creating a budget for the organization''s marketing efforts, in line with the business-wide strategic outlook. Create a plan to distribute resources for achieving the marketing strategy in light of the overall business strategy. Make cost assumptions; calculate the estimated total revenue from the marketing activities against the costs/expenses of these activities. Forecast the return on investment. Attribute costs to the appropriate marketing activities such as promotional campaigns, advertising, marketing communications, PR campaigns, personnel, and office space. Enlist the financial and marketing functions.',
    '10149', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 65, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_3', '3.3.3', 'Develop and manage pricing',
    'Determining and maintaining a pricing mechanism based on forecasted sales and that enables a pricing equilibrium for the lifecycles of products/services. Create a pricing mechanism, factoring in attributes relating to the market, customers, sales, and the cost of production. Implement this pricing mechanism over all products/services. Analyze its performance, and adjust accordingly.',
    '20593', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 66, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_4', '3.3.4', 'Develop and manage promotional activities',
    'Conceptualizing, testing, and executing product/service/brand promotions. Once a promotion has launched, this process continues as the organization tweaks parts of the promotion or chooses to use ideas or lessons learned during the promotion in future activities. The promotion''s performance according to organizational measures is also evaluated in this process. Determine early on whether you need third party help with promotion. Purchase lists, consult with social media experts, hire seasonal staff, or pay for additional research.',
    '20010', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 67, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_5', '3.3.5', 'Track customer management measures',
    'Collating all customer-centered metrics. The objective is to create a big-picture view of the customers'' mindset and their behavior pertaining to the organization''s offerings.',
    '10153', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 68, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_6', '3.3.6', 'Analyze and respond to customer insight',
    'Reviewing and responding to customer feedback. Create tickets to initiate bug fixes or to propose feature updates. Monitor and track progress.',
    '16613', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 69, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_7', '3.3.7', 'Develop and manage packaging strategy',
    'Creating, executing, and administering a strategic road map for packaging products/services. Determine how to package products/services into finished offerings that can be directly marketed to prospective customers. Consider physicality, perishability, and shelf-life. Develop a strategy for packaging products/services. Test alternatives. Collect feedback. Refine the option chosen for execution. Have marketing, product development, and supply chain functions work together to develop sound packaging.',
    '10154', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 70, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_3_8', '3.3.8', 'Manage product marketing content',
    'Creating descriptions of products that are promotional and informative in content in order to initiate and increase sales. Marketing content consists of text, and optionally, images.',
    '16629', 'F2C3F37A5DF942CB',
    3, '3.3', '3.0',
    'Process', TRUE, 71, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_4', '3.4', 'Develop sales strategy',
    'Developing concrete plans for guiding and providing support to the sales function. Chart a road map for the sales function, including an analysis of historical sales data to create forecasts for anticipated sales, forming sales targets, forging partnerships with other economic agents to boost sales, devising a budget for this function, and determining metrics to measure customer management activities as well as progress in achieving sales targets.',
    '10103', 'F2C3F3685DF91ED2',
    2, '3.0', '3.0',
    'Process Group', FALSE, 72, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_4_1', '3.4.1', 'Develop sales forecast',
    'Developing a sales forecast for the organization''s portfolio of offerings, bearing in mind the effect of promotional events, and fine-tuning these in the context of the new forecast. Estimate the future demand for the organization''s products/services by analyzing historical information and any promotional activity.',
    '10129', 'F2C3F37C5DF94570',
    3, '3.4', '3.0',
    'Process', TRUE, 73, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_4_2', '3.4.2', 'Develop sales partner/alliance relationships',
    'Cultivating an alliance of partners by identifying, analyzing, negotiating, and managing partnerships with other economic agents.',
    '10130', 'F2C3F37C5DF94570',
    3, '3.4', '3.0',
    'Process', TRUE, 74, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_4_3', '3.4.3', 'Establish overall sales budgets',
    'Setting up a financial plan for the sales function. Calculate the estimated sales revenue and costs, which helps in calculating the overall net profit. Create a sound plan for resource outlay by comparing the forecast with historical data.',
    '10131', 'F2C3F37C5DF94570',
    3, '3.4', '3.0',
    'Process', TRUE, 75, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_4_4', '3.4.4', 'Establish sales goals and measures',
    'Establishing specific quantitative and qualitative measures of realizing sales targets. Create sales targets by analyzing historical sales data and comparing the forecasts to results, in light of customer and market intelligence. Examine the performance of sales personnel in light of market opportunities. Based on this review, establish sales targets along with metrics to quantify these goals, corresponding with the overall business strategy.',
    '10132', 'F2C3F37C5DF94570',
    3, '3.4', '3.0',
    'Process', TRUE, 76, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_4_5', '3.4.5', 'Establish customer management measures',
    'Identifying the appropriate measures that can represent key attributes of the customer management function. Select measures to track customer activity, feedback, satisfaction, organizational responsiveness to customer needs, and general data on how the organization is managing customer accounts, leads, and contacts. Build on customer and market intelligence to identify metrics gauging aspects related to customer management. Select measures based on the nature of the business, the type and size of customer base, strategic goals, and the model used to structure sales and customer relationships.',
    '10133', 'F2C3F37C5DF94570',
    3, '3.4', '3.0',
    'Process', TRUE, 77, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_5', '3.5', 'Develop and manage sales plans',
    'Selling products/services. Set appropriate customer expectations. Work with customers using the same schedule that product/service development, production, and customer service functions follow. Manage sales personnel and sales partnerships/alliances.',
    '10105', 'F2C3F3685DF91ED2',
    2, '3.0', '3.0',
    'Process Group', FALSE, 78, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_5_1', '3.5.1', 'Manage leads/opportunities',
    'Generating leads of prospective customers to grow the organization''s business. Identify viable customers based on customer and market research. Discover leads through IT applications, cold calling, reference/network development, or other sales and business development techniques. Employ a scoring model qualify the prospective customers into leads, and prioritize them.',
    '10182', 'F2C3F37D5DF94731',
    3, '3.5', '3.0',
    'Process', TRUE, 79, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_5_2', '3.5.2', 'Manage customers and accounts',
    'Managing the customer''s expectations, with the intent of responsibly increasing the sale of the organization''s products/services. Create a systematic method for governing sales, using sales forecasts and customer management measures. Develop a blueprint to manage relationships with customers and the data it holds on them, as well as the sale of its products/services to these customers. Devise a recipe for handling the organization''s key customers in order to manage their expectations with tact and responsibility while maximizing revenue.',
    '10183', 'F2C3F37D5DF94731',
    3, '3.5', '3.0',
    'Process', TRUE, 80, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_5_3', '3.5.3', 'Develop and manage sales proposals, bids, and quotes',
    'Understanding and refining the customer requirements as provided in a RFP (Request for Proposal) or RFI (Request for Information). (For military contracts and supplying fuels to railroads and major fuel users, there is a bidding process. These entities ask for bids from the refiners to supply fuel at a given location.). When compiling the response, they must take into consideration whether the requirements are a match with the strategic or tactical plans of the organization and whether they are able to submit a bid/proposal that is competitive based on an understanding of the offerings of other competing organizations. The next step will be to define the pricing and scheduling of the proposed solution and determine whether the proposal will be profitable for the company if accepted. The bid is then submitted and a notification of whether or not it was successful is received.',
    '11779', 'F2C3F37D5DF94731',
    3, '3.5', '3.0',
    'Process', TRUE, 81, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_5_4', '3.5.4', 'Manage sales orders',
    'Taking, receiving, processing, and acknowledging new customer orders or amendments to outstanding customer orders. Monitoring status from order receipt to customer delivery/customer invoicing.',
    '10185', 'F2C3F37D5DF94731',
    3, '3.5', '3.0',
    'Process', TRUE, 82, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_3_5_5', '3.5.5', 'Manage sales partners and alliances',
    'Managing the organization''s partners and alliances, with the objective of maximizing revenue. Train partners regarding the organization''s portfolio of products/services. Craft sales forecasts. Examine their performance. Manage all data held by the organization on these partners.',
    '10187', 'F2C3F37D5DF94731',
    3, '3.5', '3.0',
    'Process', TRUE, 83, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1', '4.1', 'Plan for and align supply chain resources',
    'Creating strategies for production and materials. Handle the demand for the products of the organization. Develop plans for handling materials. Develop and administer the schedule for master production. Plan for distribution requirements and its constraints by reviewing and assessing distribution policies and performance and by establishing quality standards and procedures.',
    '10215', 'F2C3F3695DF92070',
    2, '4.0', '4.0',
    'Process Group', FALSE, 84, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_1', '4.1.1', 'Develop production and materials strategies',
    'Creating strategies for production processes, as well as the process of managing materials. Define production and supply constraints. Design a blueprint of the workplace. Establish rules and regulations regarding the employees, outsourcing of services, and the expenditure to be incurred on the manufacturing capital.',
    '10221', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 85, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_2', '4.1.2', 'Manage demand for products',
    'Forecasting demand for products using secondary research and customer feedback. Refine these forecasts. Inspect the approach used in creating forecasts, and determine its accuracy.',
    '10222', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 86, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_3', '4.1.3', 'Create materials plan',
    'Developing a scheme that allows for advance planning for the availability of raw materials and spares. Start with an unconstrained plan, and refine based on supply chain realities by identifying critical materials required for production, checking material specifications, and collaborating with all vendors over the supply.',
    '10223', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 87, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_4', '4.1.4', 'Create and manage master production schedule',
    'Taking care of the master production plan. The master production includes creation and implementation of the site-level production plan, as well as management of the inventory that is currently in the production process.',
    '10224', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 88, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_5', '4.1.5', 'Plan distribution requirements',
    'Maintaining master data of finished products and inventory. Identify the requirements of finished products at the destination, as well as partner requirements. Calculate the consolidation at source. Manage replenishment planning. Create and administer a dispatch plan. Calculate load plans for destinations and partners. Manage the cost of supplying these products. Ensure effective utilization of capacity.',
    '17042', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 89, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_6', '4.1.6', 'Establish distribution planning constraints',
    'Instituting the constraints for planning of distribution process. Create a plan that specifies every element in the distribution process from the blueprint of the distribution centers to how and when the inventory would reach the distribution centers.',
    '10226', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 90, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_7', '4.1.7', 'Review distribution planning policies',
    'Revisiting and refurbishing the policies for planning the distribution process. Asses the distribution strategies, including how the products are to be made available and sent to different distributors. Set guidelines regarding relationships between the sources and the distribution centers.',
    '10227', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 91, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_1_8', '4.1.8', 'Develop quality standards and procedures',
    'Developing standards and procedures for maintaining the quality of products/services. Establish desired quality targets. Create standardized procedures for the quality. Ensure quality specifications are effectively communicated.',
    '10368', 'F2C3F37E5DF94938',
    3, '4.1', '4.0',
    'Process', TRUE, 92, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_2', '4.2', 'Procure materials and services',
    'Creating a plan for procuring materials and services. Develop strategies for sourcing materials and services. Choose the most appropriate suppliers, and develop contracts with them. Order the materials and services as per the requirements. Manage relationships with suppliers.',
    '10216', 'F2C3F3695DF92070',
    2, '4.0', '4.0',
    'Process Group', FALSE, 93, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_2_1', '4.2.1', 'Provide sourcing governance and perform category management',
    'Creating strategies for procuring materials and services from various sources, and for managing and evaluating categories. Establish a procurement process that describes the approach for obtaining products and purchasing activities. Evaluate the sources. Create sourcing relationships in order to continuously improve. Re-evaluate purchasing activities.',
    '10277', 'F2C3F37F5DF94BCA',
    3, '4.2', '4.0',
    'Process', TRUE, 94, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_2_2', '4.2.2', 'Develop sourcing and category management strategies',
    'Deploying a strategic sourcing methodology to segment the majority of organizational spend based on external supply markets (versus individual suppliers or internal stakeholders) to reduce the cost of buying goods and services, reduce risk in the supply chain, and maximize value delivered from the supply base. This approach typically includes cross-functional management of categories, examining the entire category spend, how the organization uses the products or services within the category, the marketplace, and major suppliers.',
    '20973', 'F2C3F37F5DF94BCA',
    3, '4.2', '4.0',
    'Process', TRUE, 95, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_2_3', '4.2.3', 'Select suppliers and develop/maintain contracts',
    'Evaluating supplier options to select the most effective and efficient suppliers. Validate selected suppliers. Establish and manage supplier contracts.',
    '10278', 'F2C3F37F5DF94BCA',
    3, '4.2', '4.0',
    'Process', TRUE, 96, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_2_4', '4.2.4', 'Order materials and services',
    'Creating and approving requisitions and distributing purchase orders accordingly. Hasten the procurement process to satisfy internal needs.',
    '10279', 'F2C3F37F5DF94BCA',
    3, '4.2', '4.0',
    'Process', TRUE, 97, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_2_5', '4.2.5', 'Manage suppliers',
    'Collecting and analyzing new information in order to track and rate suppliers through a supplier information management system.',
    '10280', 'F2C3F37F5DF94BCA',
    3, '4.2', '4.0',
    'Process', TRUE, 98, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_3', '4.3', 'Produce/Assemble/Test product',
    'Processing and delivering the finished goods manufactured by the organization. Schedule the production of products. Execute the product production activities. Perform tests to oversee and ensure quality of production. Maintain records of the production process. Track lots.',
    '10217', 'F2C3F3695DF92070',
    2, '4.0', '4.0',
    'Process Group', FALSE, 99, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_3_1', '4.3.1', 'Schedule production',
    'Scheduling the production of final products. Generate a detailed schedule plan. Create and release production orders and lots. Schedule the planned and unplanned maintenance orders.',
    '10303', 'F2C3F3805DF94D9E',
    3, '4.3', '4.0',
    'Process', TRUE, 100, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_3_2', '4.3.2', 'Produce/Assemble product',
    'Manufacturing the product. Convert the raw materials to develop consumer-ready products. Manage the raw materials to implement the detailed production schedule. Reproduce the defective items to ensure efficiency. Benchmark performance.',
    '10304', 'F2C3F3805DF94D9E',
    3, '4.3', '4.0',
    'Process', TRUE, 101, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_3_3', '4.3.3', 'Perform quality testing',
    'Executing tests to evaluate the quality of the products manufactured. Calibrate the test equipment. Conduct the actual tests. Record the results and outcomes of the quality test conducted.',
    '10369', 'F2C3F3805DF94D9E',
    3, '4.3', '4.0',
    'Process', TRUE, 102, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_3_4', '4.3.4', 'Maintain production records and manage lot traceability',
    'Perpetuating the production records by systematically documenting and using it to ensure the effective management of lots. Determine the lot numbering system and its use. (The lot number enables tracking of the constituent parts, as well as labor and equipment records involved in the manufacturing of a product. It enables manufacturers and to perform quality control checks, calculate expiration dates, and issue corrections of their production output.)',
    '10370', 'F2C3F3805DF94D9E',
    3, '4.3', '4.0',
    'Process', TRUE, 103, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_4', '4.4', 'Manage logistics and warehousing',
    'Administering and overseeing all activities related to logistics and warehousing. Outline and establish a strategy for the logistics function. Plan and administer the flow of inbound materials. Administer the operational activities of warehousing and outbound transportation. Manage reverse logistics including returns and exchanges.',
    '10219', 'F2C3F3695DF92070',
    2, '4.0', '4.0',
    'Process Group', FALSE, 104, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_4_1', '4.4.1', 'Provide logistics governance',
    'Outlining the strategy for managing logistics. Translate customer requirements logistic requirements. Create an efficient logistic network and outsourcing portions of logistics activities. Design a logistics strategy that optimizes transportation costs and schedule. Define key performance indicators.',
    '10338', 'F2C3F3815DF94F11',
    3, '4.4', '4.0',
    'Process', TRUE, 105, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_4_2', '4.4.2', 'Plan and manage inbound material flow',
    'Creating and executing a strategy for all the internal activities related to the flow/transfer of inbound materials. This process includes planning inbound material receipts, managing inbound material flow, monitoring inbound delivery performance, managing the flow of returned products, controlling the quality of returned parts, and salvaging or repairing returned products.',
    '20936', 'F2C3F3815DF94F11',
    3, '4.4', '4.0',
    'Process', TRUE, 106, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_4_3', '4.4.3', 'Operate warehousing',
    'Tracking the inventory deployment. Accept and store products. Ship the products. Measure the accuracy of the inventory. Assess the performance of the outsourced logistics activities.',
    '10340', 'F2C3F3815DF94F11',
    3, '4.4', '4.0',
    'Process', TRUE, 107, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_4_4_4', '4.4.4', 'Operate outbound transportation',
    'Creating a plan that specifies the schedule and system for transportation and delivery of the outbound products, as well as tracking the performance of the carrier delivery system. Conduct vehicle management and processing of all carrier-related documents.',
    '10341', 'F2C3F3815DF94F11',
    3, '4.4', '4.0',
    'Process', TRUE, 108, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_1', '5.1', 'Establish service delivery governance and strategies',
    'Creating rules and regulations for service delivery to the customer. Establish a system to manage performance, delivery, and direction of service delivery. Engage with the customer for satisfaction feedback. Define goals, policies, processes, and workplace layout and infrastructure as a part of the service delivery strategy.',
    '20026', 'F2C3F36A5DF921D6',
    2, '5.0', '5.0',
    'Process Group', FALSE, 109, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_1_1', '5.1.1', 'Establish service delivery governance',
    'Establishing service delivery governance through a system that manages performance, development, and direction. Allow for customer feedback on delivery satisfaction.',
    '20027', 'F2C3F3815DF950CE',
    3, '5.1', '5.0',
    'Process', TRUE, 110, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_1_2', '5.1.2', 'Develop service delivery strategies',
    'Constructing strategies that identify goals, policies, processes, and procedures in relation to service delivery. Review and validate strategies. Define the workplace layout and infrastructure.',
    '20032', 'F2C3F3815DF950CE',
    3, '5.1', '5.0',
    'Process', TRUE, 111, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_2', '5.2', 'Manage service delivery resources',
    'Understanding the demands on resources and creating a plan to enable the delivery of services via those resources.',
    '20040', 'F2C3F36A5DF921D6',
    2, '5.0', '5.0',
    'Process Group', FALSE, 112, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_2_1', '5.2.1', 'Manage service delivery resource demand',
    'Ensuring necessary resources are maintained through monitoring pipeline, developing forecasts, and collaborating with customers. Determine skills needed for service deliver and forecast customer orders. Monitor forecasted orders and modify if where needed. Measure forecast accuracy.',
    '20041', 'F2C3F3825DF951AA',
    3, '5.2', '5.0',
    'Process', TRUE, 113, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_2_2', '5.2.2', 'Create and manage resource plan',
    'Identifying the need for and creating a resource plan. Understand resource demand and align with capacity, skills, and capabilities. Enlist suppliers and partners to supplement needed skills and capabilities. Monitor and manage capabilities and skills with an eye on critical resources and supplier capacity.',
    '20050', 'F2C3F3825DF951AA',
    3, '5.2', '5.0',
    'Process', TRUE, 114, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_2_3', '5.2.3', 'Enable service delivery resources',
    'Instituting training to enable resources to provide service delivery to the customer. Develop a training plan. Create materials that provide for operation and technical training. Schedule, perform, and evaluate training.',
    '12127', 'F2C3F3825DF951AA',
    3, '5.2', '5.0',
    'Process', TRUE, 115, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_3', '5.3', 'Deliver service to customer',
    'Rendering service to the customer by initiating, executing, and completing tasks associated with service delivery.',
    '20058', 'F2C3F36A5DF921D6',
    2, '5.0', '5.0',
    'Process Group', FALSE, 116, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_3_1', '5.3.1', 'Initiate service delivery',
    'Collaborating with the customer to understand service needs. Review, understand, and modify the delivery scope with the organization needs of the customer in mind. Confirm readiness and identify, select, and assign resources. Plan for service delivery.',
    '20059', 'F2C3F3825DF952D0',
    3, '5.3', '5.0',
    'Process', TRUE, 117, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_3_2', '5.3.2', 'Execute service delivery',
    'Carrying out service delivery to the customer by creating and deploying the necessary solution. Analyze need and create a solution. Validate the solution and make changes if needed. Obtain approval to build/buy solution and then deploy solution to customer.',
    '20069', 'F2C3F3825DF952D0',
    3, '5.3', '5.0',
    'Process', TRUE, 118, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_5_3_3', '5.3.3', 'Complete service delivery',
    'Implementing final steps to complete service delivery to the customer. Evaluate success through project review, complete finance activities, and confirm delivery. Release resources and manage completion by harvesting knowledge and systems by archiving records.',
    '20077', 'F2C3F3825DF952D0',
    3, '5.3', '5.0',
    'Process', TRUE, 119, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1', '6.1', 'Develop customer care/customer service strategy',
    'Defining a plan that removes customer obstacles by gathering operational insight and competitive insight, as well as improving soft skills and forward resolution for employees. Develop customer segmentation. Define rules and regulations for customer service. Establish service levels for customers.',
    '10378', 'F2C3F36B5DF922EF',
    2, '6.0', '6.0',
    'Process Group', FALSE, 120, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1_1', '6.1.1', 'Define customer service requirements across the enterprise',
    'Defining a set of behaviors, skills, and policies needed to provide customer service effectively across the enterprise.',
    '20086', 'F2C3F3835DF95443',
    3, '6.1', '6.0',
    'Process', TRUE, 121, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1_2', '6.1.2', 'Define customer service experience',
    'Communicating to the customer service resources what is expected when engaging the customer. Relate service level expectations to the workforce. Ensure positive customer experience.',
    '20087', 'F2C3F3835DF95443',
    3, '6.1', '6.0',
    'Process', TRUE, 122, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1_3', '6.1.3', 'Define and manage customer service channel strategy',
    'Establishing and refining procedures for customer service and technical support.',
    '20088', 'F2C3F3835DF95443',
    3, '6.1', '6.0',
    'Process', TRUE, 123, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1_4', '6.1.4', 'Define customer service policies and procedures',
    'Outlining the framework of policies and methods for developing customer service strategy. Establish the rules and regulations that serve as a guideline for the customer service strategy. Take into account customer needs and behavior.',
    '10382', 'F2C3F3835DF95443',
    3, '6.1', '6.0',
    'Process', TRUE, 124, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1_5', '6.1.5', 'Establish target service level for each customer segment',
    'Determining and implementing levels for customer services. Benchmark certain customer service practices, and base customer level services on those benchmarks. Create a service level agreement, which is a negotiated agreement designed to create a common understanding about services, priorities, and responsibilities.',
    '10383', 'F2C3F3835DF95443',
    3, '6.1', '6.0',
    'Process', TRUE, 125, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1_6', '6.1.6', 'Define warranty offering',
    'Determining the exact terms and conditions under which specific warranties apply to certain goods or services.',
    '20089', 'F2C3F3835DF95443',
    3, '6.1', '6.0',
    'Process', TRUE, 126, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_1_7', '6.1.7', 'Develop recall strategy',
    'Establishing procedures to handle recalls of defective products.',
    '20092', 'F2C3F3835DF95443',
    3, '6.1', '6.0',
    'Process', TRUE, 127, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_2', '6.2', 'Plan and manage customer service contacts',
    'Planning and administering work force operations for customer service provision by taking care of customer services requests/inquiries, as well as the complaints.',
    '10379', 'F2C3F36B5DF922EF',
    2, '6.0', '6.0',
    'Process Group', FALSE, 128, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_2_1', '6.2.1', 'Plan and manage customer service work force',
    'Creating and administering the work force deployed for the customer service process. Forecast the customer work force needs to correctly schedule the work force. Track the utility of the work force deployed. Examine the interactions between the customer and customer service representatives to achieve high quality.',
    '10387', 'F2C3F3845DF9569A',
    3, '6.2', '6.0',
    'Process', TRUE, 129, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_2_2', '6.2.2', 'Manage customer service problems, requests, and inquiries',
    'Handling the requests and inquiries from customers that seek information regarding the organization''s products/services. Obtain the customer requests online and by phone. Direct these requests to higher-level representatives. Approve requests, and respond to customers.',
    '10388', 'F2C3F3845DF9569A',
    3, '6.2', '6.0',
    'Process', TRUE, 130, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_2_3', '6.2.3', 'Manage customer complaints',
    'Obtaining customer complaints online or by phone. Direct these complaints to higher-level representatives as appropriate. Resolve them. Respond to customers.',
    '10389', 'F2C3F3845DF9569A',
    3, '6.2', '6.0',
    'Process', TRUE, 131, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_2_4', '6.2.4', 'Process returns',
    'Acquiring returns and identify if the returns are scraped or salvaged.',
    '20094', 'F2C3F3845DF9569A',
    3, '6.2', '6.0',
    'Process', TRUE, 132, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_2_5', '6.2.5', 'Report incidents and risks to regulatory bodies',
    'Notifying all stakeholders, legal, and industry regulatory bodies of the incidents and risks related to a return or recall, if needed.',
    '12840', 'F2C3F3845DF9569A',
    3, '6.2', '6.0',
    'Process', TRUE, 133, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_3', '6.3', 'Service products after sales',
    'Assigning post-sales policies and paying claims on purchased products.  This is a process that is an administrative function focused on creating rules (claim codes). This group ensures that claims are valid and are processed quickly.  As well as to quickly determine responsibility for claim settlement.',
    '12658', 'F2C3F36B5DF922EF',
    2, '6.0', '6.0',
    'Process Group', FALSE, 134, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_3_1', '6.3.1', 'Register products',
    'Filing product registrations.',
    '20605', 'F2C3F3855DF9585D',
    3, '6.3', '6.0',
    'Process', TRUE, 135, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_3_2', '6.3.2', 'Process warranty claims',
    'Identifying, investigating, and processes warranty claims. This process includes: receipt and validation of a warranty claim; definition and diagnosis /root cause analysis of an issue and recommendation for corrective action; the determination of responsibility for settlement of the claim; the transaction being approved or denied; and the originator being notified and payment authorized. In the case of a recurring event, further investigation (definition and diagnosis or root cause analysis) is performed, and a recommendation for corrective action is made and implemented in production/design. It ends when the claim is closed.',
    '12669', 'F2C3F3855DF9585D',
    3, '6.3', '6.0',
    'Process', TRUE, 136, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_3_3', '6.3.3', 'Manage supplier recovery',
    'Managing the recovery of costs from suppliers for individual claims.',
    '20106', 'F2C3F3855DF9585D',
    3, '6.3', '6.0',
    'Process', TRUE, 137, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_3_4', '6.3.4', 'Service products',
    'Validating specific service requirements for individual customers. Determine and schedule resource to fulfill these requirements. Provide service to specific individual customers. Ensure the quality of service delivery.',
    '10218', 'F2C3F3855DF9585D',
    3, '6.3', '6.0',
    'Process', TRUE, 138, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_4', '6.4', 'Manage product recalls and regulatory audits',
    'Removing defective products from the distribution chain. Participate in audits from watchdog agencies.',
    '20110', 'F2C3F36B5DF922EF',
    2, '6.0', '6.0',
    'Process Group', FALSE, 139, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_4_1', '6.4.1', 'Initiate recall',
    'Commencing the removal process of defective products.',
    '20111', 'F2C3F3865DF959D2',
    3, '6.4', '6.0',
    'Process', TRUE, 140, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_4_2', '6.4.2', 'Assess the likelihood and consequences of occurrence of any hazards',
    'Performing risk analysis. Identify all dangers, evaluate how probable they are, and what kinds of negative results or or adverse side effect they carry.',
    '20112', 'F2C3F3865DF959D2',
    3, '6.4', '6.0',
    'Process', TRUE, 141, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_4_3', '6.4.3', 'Manage recall related communications',
    'Handling communications that are related to product recalls.',
    '20113', 'F2C3F3865DF959D2',
    3, '6.4', '6.0',
    'Process', TRUE, 142, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_4_4', '6.4.4', 'Submit regulatory reports',
    'Creating and delivering reports to regulatory agencies to provide details about handling product recalls.',
    '20114', 'F2C3F3865DF959D2',
    3, '6.4', '6.0',
    'Process', TRUE, 143, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_4_5', '6.4.5', 'Monitor and audit recall effectiveness',
    'Analyzing the effectiveness of product recalls.',
    '20115', 'F2C3F3865DF959D2',
    3, '6.4', '6.0',
    'Process', TRUE, 144, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_4_6', '6.4.6', 'Manage recall termination',
    'Ending product recalls, communicating to the public and filing reports.',
    '20116', 'F2C3F3865DF959D2',
    3, '6.4', '6.0',
    'Process', TRUE, 145, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_5', '6.5', 'Evaluate customer service operations and customer satisfaction',
    'Calculating and assessing the operational activities of the customer service function. Evaluation is achieved through the customer requests/inquiries handling process, the customer complaint handling process, and product and services quality. Examine activities to ensure high levels of customer service.',
    '20595', 'F2C3F36B5DF922EF',
    2, '6.0', '6.0',
    'Process Group', FALSE, 146, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_5_1', '6.5.1', 'Measure customer satisfaction with customer problems, requests, and inquiries handling',
    'Calculating satisfaction levels of customers by effectively evaluating the process of handling requests/inquiries of customers. Effectively calculate the performance of customer-requests/inquiries handling and resolution. Obtain information regarding requests/inquiries handling and resolution through customer feedback. Use it to explore new ideas and opportunities for enhanced customer requests/inquiries handling and resolution process.',
    '10401', 'F2C3F3875DF95BDF',
    3, '6.5', '6.0',
    'Process', TRUE, 147, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_5_2', '6.5.2', 'Measure customer satisfaction with customer- complaint handling and resolution',
    'Measuring the satisfaction level of customers as pertains to how their complaints are handled and resolved. This process element requires the organization to estimate the customers level of fulfillment with the process reconciling their complaints and towards the objective of ensuring customer retention. The feedback received can be used to develop concepts for new opportunities to boost the level of customer satisfaction.',
    '10402', 'F2C3F3875DF95BDF',
    3, '6.5', '6.0',
    'Process', TRUE, 148, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_5_3', '6.5.3', 'Measure customer satisfaction with products and services',
    'Calculating satisfaction levels of customers with products/services. Obtain customer feedback on products/services, as well as the effectiveness of the advertising campaigns. Examine this information to reach meaningful conclusions, which could then be used to enhance the customer service operations.',
    '10403', 'F2C3F3875DF95BDF',
    3, '6.5', '6.0',
    'Process', TRUE, 149, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_5_4', '6.5.4', 'Evaluate and manage warranty performance',
    'Assessing the cost and effectiveness of warranties.',
    '12672', 'F2C3F3875DF95BDF',
    3, '6.5', '6.0',
    'Process', TRUE, 150, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_6_5_5', '6.5.5', 'Evaluate recall performance',
    'Reviewing customer service feedback to identify areas in which improvements can be made. Engage with management to discuss issues.',
    '20121', 'F2C3F3875DF95BDF',
    3, '6.5', '6.0',
    'Process', TRUE, 151, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_1', '7.1', 'Develop and manage human resources planning, policies, and strategies',
    'Creating strategies for the HR function. Create and implement strategies for managing the work force. Supervise and enhance the strategies, plans, and policies supporting the HR function. Developing models for managing competency levels of the HR of the organization.',
    '17043', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 152, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_1_1', '7.1.1', 'Develop human resources strategy',
    'Creating a long-term plan to associate human resource requirements with the strategic goals of the company to ensure that there is enough qualified staffing to achieve those goals, to maintain competitive advantage and to reduce employee turnover.',
    '20958', 'F2C3F3875DF95DE6',
    3, '7.1', '7.0',
    'Process', TRUE, 153, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_1_2', '7.1.2', 'Develop and implement workforce strategy and policies',
    'Creating and executing strategies and policies for smooth administration of work force. Determine and gather skill requirements. Plan the requirements for employee resourcing per unit. Create compensation, succession, HR program, and employee diversity plans. Develop and administer policies for HR. Develop benefits for employees. Create models for work force strategies.',
    '17045', 'F2C3F3875DF95DE6',
    3, '7.1', '7.0',
    'Process', TRUE, 154, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_1_3', '7.1.3', 'Monitor and update strategy, plans, and policies',
    'Supervising the HR strategy, plans, and policies in order to refurbish them whenever needed. Determine the performance of HR plans and policies by measuring the objective achievement rate and its contribution to the overall business strategy. Ensure that information about these plans and strategies is effectively communicated to various stakeholders. Incorporate any suggestions by these stakeholders when revising HR plans and policies.',
    '10417', 'F2C3F3875DF95DE6',
    3, '7.1', '7.0',
    'Process', TRUE, 155, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_1_4', '7.1.4', 'Develop competency management models',
    'Creating and implementing the tools for managing the competency levels of HR. Design a model for integrating HR planning with business planning. Assess current HR capacity based on the competencies against the capacity needed to achieve the vision, mission, and business goals of the organization. Consider factors such as employee development, career path, compensation policies, and performance management.',
    '17046', 'F2C3F3875DF95DE6',
    3, '7.1', '7.0',
    'Process', TRUE, 156, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_2', '7.2', 'Recruit, source, and select employees',
    'Determining and handling employee requirements. Recruit or source the candidates as per the requirements. Screen and select the most appropriate candidates. Take care of the newly hired and re-hired employees. Maintain records of information for all applicants.',
    '10410', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 157, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_2_1', '7.2.1', 'Manage employee requisitions',
    'Handling the requirements for new employees. Create and open job requisitions by clearly defining the job descriptions. Post these requirements internally and externally, and modify them as appropriate. Manage the dates of the whole requisition process.',
    '10439', 'F2C3F3885DF95F57',
    3, '7.2', '7.0',
    'Process', TRUE, 158, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_2_2', '7.2.2', 'Recruit/Source candidates',
    'Recruiting new candidates for deployment across various functional areas inside the organization. Select methods for sourcing new employees. Manage relationships with third-party agencies. Stage recruitment fairs and drives. Manage employee referral programs.',
    '10440', 'F2C3F3885DF95F57',
    3, '7.2', '7.0',
    'Process', TRUE, 159, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_2_3', '7.2.3', 'Screen and select candidates',
    'Evaluating and selecting potential employees through interviews, tests, etc.',
    '20123', 'F2C3F3885DF95F57',
    3, '7.2', '7.0',
    'Process', TRUE, 160, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_2_4', '7.2.4', 'Manage new hire/re-hire',
    'Creating and making job offers to the selected candidates. Fairly negotiate the job offers. Agree on terms with the candidate to complete the hiring process.',
    '10443', 'F2C3F3885DF95F57',
    3, '7.2', '7.0',
    'Process', TRUE, 161, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_2_5', '7.2.5', 'Manage applicant information',
    'Creating and maintaining a system for managing the information of applicants. Create records for all candidates who apply. Maintain and track information through the use applicant-tracking systems.',
    '10444', 'F2C3F3885DF95F57',
    3, '7.2', '7.0',
    'Process', TRUE, 162, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_3', '7.3', 'Manage employee on boarding, development, and training',
    'Assisting employees in developing their capabilities, and providing them counseling services. Handle the orientation and deployment of the employees. Administer the performance of employees. Administer the development and enhancement of the employees. Provide training and development programs for employees.',
    '20599', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 163, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_3_1', '7.3.1', 'Manage employee orientation and deployment',
    'Creating and maintaining various employee on-boarding programs typically known as induction programs in order to ensure that the new employees are effectively introduced to the organization and its existing employees. Examine and evaluate the performance of these induction programs. Execute these programs on the ground level.',
    '10469', 'F2C3F3895DF96107',
    3, '7.3', '7.0',
    'Process', TRUE, 164, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_3_2', '7.3.2', 'Manage employee performance',
    'Defining individual performance objectives. Review performance in order to provide appraisals. Evaluate the efficiency and effectiveness of the current performance program. Update it regularly.',
    '10470', 'F2C3F3895DF96107',
    3, '7.3', '7.0',
    'Process', TRUE, 165, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_3_3', '7.3.3', 'Manage employee development',
    'Establishing employee development guidelines. Lay out career paths and plans for them. Manage the development of their skills to enhance their skills, ability, and knowledge.',
    '10472', 'F2C3F3895DF96107',
    3, '7.3', '7.0',
    'Process', TRUE, 166, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_3_4', '7.3.4', 'Develop and train employees',
    'Creating a link between employee and organizational development needs. Conduct and manage employee training programs by considering the need and availability of these programs.',
    '10473', 'F2C3F3895DF96107',
    3, '7.3', '7.0',
    'Process', TRUE, 167, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_4', '7.4', 'Manage employee relations',
    'Assisting general management in developing, maintaining, and improving employee relationships. This is accomplished through communication, performance management, processing grievances, and/or dispute. Interpret and convey organizational policies.',
    '17052', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 168, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_4_1', '7.4.1', 'Manage labor relations',
    'Managing labor relations, the collective bargaining process, and the relationships between the labor and management. Take care of employee grievances.',
    '10483', 'F2C3F3895DF9627C',
    3, '7.4', '7.0',
    'Process', TRUE, 169, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_4_2', '7.4.2', 'Manage collective bargaining process',
    'Managing any negotiations between an employer and a group of employees that determine the conditions of employment. Engage employees to reach agreements in regulating working conditions.',
    '10484', 'F2C3F3895DF9627C',
    3, '7.4', '7.0',
    'Process', TRUE, 170, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_4_3', '7.4.3', 'Manage labor management partnerships',
    'Handling partnerships between labor and management. Develop a lasting two-way relationship that is beneficial for the labor, management, and the organization.',
    '10485', 'F2C3F3895DF9627C',
    3, '7.4', '7.0',
    'Process', TRUE, 171, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_4_4', '7.4.4', 'Manage employee grievances',
    'Taking care or resolving any complaint raised by an employee by procedures provided for in a collective agreement, an employment contract, or by other mechanisms established by an employer.',
    '10531', 'F2C3F3895DF9627C',
    3, '7.4', '7.0',
    'Process', TRUE, 172, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_5', '7.5', 'Reward and retain employees',
    'Creating frameworks for rewarding and recognizing employees with the objective of retaining them. Create and manage programs for provision of rewards, recognition, and motivation. Manage and administer the benefits for employees. Help assist and retain employees. Administer payroll to employees.',
    '10412', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 173, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_5_1', '7.5.1', 'Develop and manage reward, recognition, and motivation programs',
    'Developing a salary/compensation structure and plan; developing a benefits and reward plan; develop commission plan; performing competitive analyses of benefits and rewards; identifying compensation requirements based on compensation, benefits, and HR policies; administering compensation, commission, and rewards to employees; and rewarding and motivating employees.',
    '10494', 'F2C3F38A5DF963FC',
    3, '7.5', '7.0',
    'Process', TRUE, 174, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_5_2', '7.5.2', 'Manage and administer benefits',
    'Managing and ensuring benefits enrollment by the employees. Process any benefit claims made by the employees. Balance the estimated amount and entitled amount of benefits.',
    '10495', 'F2C3F38A5DF963FC',
    3, '7.5', '7.0',
    'Process', TRUE, 175, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_5_3', '7.5.3', 'Manage employee assistance and retention',
    'Managing activities centered around delivering programs to support work/life balance for employees; developing family support systems; reviewing retention and motivation indicators; and reviewing compensation plans.',
    '10496', 'F2C3F38A5DF963FC',
    3, '7.5', '7.0',
    'Process', TRUE, 176, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_5_4', '7.5.4', 'Administer payroll',
    'Managing the sum of all financial records of salaries for an employee, including wages, bonuses, and deductions. Use a payroll management system to deal with the financial aspects of employees'' salaries, allowances, deductions, gross pay, net pay, etc. Generate pay slips for a specific period.',
    '10497', 'F2C3F38A5DF963FC',
    3, '7.5', '7.0',
    'Process', TRUE, 177, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6', '7.6', 'Redeploy and retire employees',
    'Managing the reassignment and retirement of employees. Manage the process of employee promotion and demotion. Administer separation, retirement, and leaves of absence. Outplace employees. Deploy personnel. Relocate employees in order to manage assignments.',
    '10413', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 178, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6_1', '7.6.1', 'Manage promotion and demotion process',
    'Administering the process of promoting and demoting employees. Design a system for advancing or demoting an employee''s rank or position. Leverage techniques such as horizontal promotion, vertical promotion, dry promotion, and involuntary/voluntary demotion.',
    '10512', 'F2C3F38B5DF96572',
    3, '7.6', '7.0',
    'Process', TRUE, 179, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6_2', '7.6.2', 'Manage separation',
    'Managing the process of employee separation, including resignations, discharges, and layoffs. Inform the employee of the termination. Complete paperwork for continuation of benefits.',
    '10513', 'F2C3F38B5DF96572',
    3, '7.6', '7.0',
    'Process', TRUE, 180, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6_3', '7.6.3', 'Manage retirement',
    'Managing and administering instances where a person stops employment completely.',
    '10514', 'F2C3F38B5DF96572',
    3, '7.6', '7.0',
    'Process', TRUE, 181, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6_4', '7.6.4', 'Manage leave of absence',
    'Managing the period of time that an employee must be away from their primary job, while maintaining the status of employee (i.e., paid and unpaid leave of absence but not vacations, holidays, hiatuses, sabbaticals, and work-from-home programs).',
    '10515', 'F2C3F38B5DF96572',
    3, '7.6', '7.0',
    'Process', TRUE, 182, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6_5', '7.6.5', 'Develop and implement employee outplacement',
    'Helping former employees transition to new jobs or to re-orient themselves in the job market. Deliver help through one-on-one sessions or in a group format. Provide guidance in career evaluation, resume writing, interview preparation, developing networks, and job searching.',
    '10516', 'F2C3F38B5DF96572',
    3, '7.6', '7.0',
    'Process', TRUE, 183, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6_6', '7.6.6', 'Manage workforce scheduling',
    'Organizing the workforce so that all positions are covered for all shifts with the necessary skilled resources in place. Have a system in place to backfill positions while an employee is on leave.',
    '20132', 'F2C3F38B5DF96572',
    3, '7.6', '7.0',
    'Process', TRUE, 184, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_6_7', '7.6.7', 'Relocate employees and manage assignments',
    'Managing the relocation of employees in order to carry out assignments. Manage internal business processes to transfer employees, their families, and/or entire departments of a business to a new location.',
    '17055', 'F2C3F38B5DF96572',
    3, '7.6', '7.0',
    'Process', TRUE, 185, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7', '7.7', 'Manage employee information and analytics',
    'Managing the employee reporting processes, employee inquiry process, employee information and data, and the HR information systems. Create and administer the employee metrics. Develop and handle the time and attendance systems. Refurbish the indicators for employee retention and motivation.',
    '17056', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 186, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7_1', '7.7.1', 'Manage reporting processes',
    'Providing information and reports regarding employees to management.',
    '10522', 'F2C3F38C5DF967CE',
    3, '7.7', '7.0',
    'Process', TRUE, 187, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7_2', '7.7.2', 'Manage employee inquiry process',
    'Handling instances where an employee believes that he/she has been inappropriately treated or he/she desires clarification. Encourage employees to inquire when needed. Record and clarify the issues for which the enquiry has been made.',
    '10523', 'F2C3F38C5DF967CE',
    3, '7.7', '7.0',
    'Process', TRUE, 188, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7_3', '7.7.3', 'Manage and maintain employee data',
    'Capturing and updating employee information and data and information on the employees.',
    '10524', 'F2C3F38C5DF967CE',
    3, '7.7', '7.0',
    'Process', TRUE, 189, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7_4', '7.7.4', 'Manage human resource information systems HRIS',
    'Administering and maintaining HR information systems that take care of activities related to HR, accounting, management, and payroll.',
    '10525', 'F2C3F38C5DF967CE',
    3, '7.7', '7.0',
    'Process', TRUE, 190, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7_5', '7.7.5', 'Develop and manage employee metrics',
    'Creating and maintaining performance metrics for employees. Create and manage a strategic system of data and statistics to accurately gauge each employee''s information. Consider productivity metrics, efficiency metrics, training metrics, etc.',
    '10526', 'F2C3F38C5DF967CE',
    3, '7.7', '7.0',
    'Process', TRUE, 191, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7_6', '7.7.6', 'Develop and manage time and attendance systems',
    'Developing and maintaining systems for managing the time and attendance of employees. Routinely upgrade the process and systems that track when employees start and stop work, the department where the work is performed, attendance in addition to tracking meals and breaks, the type of work performed, and the number of items produced.',
    '10527', 'F2C3F38C5DF967CE',
    3, '7.7', '7.0',
    'Process', TRUE, 192, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_7_7', '7.7.7', 'Manage/Collect employee suggestions and perform employee research',
    'Procuring and handling suggestions from employees, and performing research on employees. Manage and analyze the programs that help the organization to tap into employee ideas for improving the organization''s processes and/or products. Use surveys, focus groups, and other data-gathering methods to find out the attitudes, opinions, and feelings of members of an organization.',
    '10530', 'F2C3F38C5DF967CE',
    3, '7.7', '7.0',
    'Process', TRUE, 193, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_8', '7.8', 'Manage employee communication',
    'Creating an effective plan that initiates and promotes communication and engagement among the employees and between employees and management.',
    '17057', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', FALSE, 194, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_8_1', '7.8.1', 'Develop employee communication plan',
    'Creating a plan for managing communication among employees. Inform employees of direction. Counter resistance with change management approaches. Seek specific areas of input to the decision-making process. Seek varying degrees of involvement and co-creation.',
    '10529', 'F2C3F38D5DF96A17',
    3, '7.8', '7.0',
    'Process', TRUE, 195, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_8_2', '7.8.2', 'Conduct employee engagement surveys',
    'Questioning employees to ascertain overall workplace satisfaction.',
    '16944', 'F2C3F38D5DF96A17',
    3, '7.8', '7.0',
    'Process', TRUE, 196, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_7_9', '7.9', 'Deliver employee communications',
    'Implementing the communication plan for employees. Initiate dialogues and engagement by monitoring the exchange of ideas and opinions, the development of personal relationships, etc.',
    '10532', 'F2C3F36C5DF92492',
    2, '7.0', '7.0',
    'Process Group', TRUE, 197, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1', '8.1', 'Develop and manage IT customer relationships',
    'Creating and administering relationships with IT customers. Understanding customer needs including high-level business requirements for IT transformation. Plan for and communicate IT services along with establishing IT service levels, providing transformation guidance, and performance analysis that foster IT customer relationships.',
    '20608', 'F2C3F36D5DF9274E',
    2, '8.0', '8.0',
    'Process Group', FALSE, 198, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1_1', '8.1.1', 'Understand IT customer needs',
    'Assessing the customer communities along with current IT operational capabilities and usage.',
    '20609', 'F2C3F38D5DF96B95',
    3, '8.1', '8.0',
    'Process', TRUE, 199, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1_2', '8.1.2', 'Identify IT customer transformation needs',
    'Identifying changing needs of staff dependent on information technology based on continuous improvement to deliver results according to organizational goals.',
    '20612', 'F2C3F38D5DF96B95',
    3, '8.1', '8.0',
    'Process', TRUE, 200, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1_3', '8.1.3', 'Plan and communicate IT services',
    'Create and design an organized and curated collection of all IT-related services that can be performed by, for, or within the organization. Maintain and convey information about deliverables, prices, contact points, and processes for requesting an information technology service.',
    '20617', 'F2C3F38D5DF96B95',
    3, '8.1', '8.0',
    'Process', TRUE, 201, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1_4', '8.1.4', 'Provide IT transformation guidance',
    'Understanding the necessity of IT transformation for the business. Collect and analyze customer requirements. Identify opportunities and prioritize outcomes. Develop and support business case for transformation. Develop transformation plan and roadmap.',
    '20623', 'F2C3F38D5DF96B95',
    3, '8.1', '8.0',
    'Process', TRUE, 202, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1_5', '8.1.5', 'Develop and manage IT service levels',
    'Establishing and maintaining service levels for the provision of IT services and solutions. Design and maintain the IT services and solution catalogue, as well as service level agreements. Evaluate the performance of IT service level agreements. Communicate the results to the management.',
    '20632', 'F2C3F38D5DF96B95',
    3, '8.1', '8.0',
    'Process', TRUE, 203, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1_6', '8.1.6', 'Manage IT customer relationships',
    'Managing the IT relationship with its customers by systematically coordinating interactions over multiple touch points on a regular basis. Coordinate the IT''s efforts to reach out to its customers, which include emails, social-media interactions, newsletters, and direct conversations.',
    '20641', 'F2C3F38D5DF96B95',
    3, '8.1', '8.0',
    'Process', TRUE, 204, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_1_7', '8.1.7', 'Analyze service performance',
    'Proactively manage IT service levels against IT customer requirements.',
    '20648', 'F2C3F38D5DF96B95',
    3, '8.1', '8.0',
    'Process', TRUE, 205, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2', '8.2', 'Develop and manage IT business strategy',
    'Handling the business of IT. Create a organization-wide strategy for the IT function. Define the organization''s IT architecture. Manage the IT portfolio. Research and innovate in the field of IT. Assess and convey the performance and the value of the IT function.',
    '20652', 'F2C3F36D5DF9274E',
    2, '8.0', '8.0',
    'Process Group', FALSE, 206, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2_1', '8.2.1', 'Define business technology and governance strategy',
    'Defining the need of technology in business and systematic implementation of IT investments. It comprises of assessing competitive technology components to ensure structural analysis, development, usage and security of technology for efficient business operations.',
    '20653', 'F2C3F38E5DF96DE6',
    3, '8.2', '8.0',
    'Process', TRUE, 207, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2_2', '8.2.2', 'Manage IT portfolio strategy',
    'Strategy for systematic management of IT investments, projects, and activities. Analyze and examine the value of the IT portfolio and allocate resources based on business objectives.',
    '20660', 'F2C3F38E5DF96DE6',
    3, '8.2', '8.0',
    'Process', TRUE, 208, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2_3', '8.2.3', 'Define and maintain enterprise architecture',
    'Outlining and maintaining the organization''s IT architecture. Establish the IT architecture definition and framework. Ensure the relevance of IT. Create and confirm the approach for IT maintenance. Create rules and regulations to guide IT architecture. Authenticate and finalize all IT related research and innovation that takes place within the organization.',
    '20668', 'F2C3F38E5DF96DE6',
    3, '8.2', '8.0',
    'Process', TRUE, 209, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2_4', '8.2.4', 'Define IT service management strategy',
    'Defining perspective, position, plans, and patterns needed to execute designing, delivering, managing, and improving the way information technology is used within an organization.',
    '20674', 'F2C3F38E5DF96DE6',
    3, '8.2', '8.0',
    'Process', TRUE, 210, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2_5', '8.2.5', 'Control IT management system',
    'Regulating the IT management system through performance measures, governance, analysis, and monitoring through a variety of analytic tools. Evaluate IT finances, resource, services, projects, and value for report out.',
    '20682', 'F2C3F38E5DF96DE6',
    3, '8.2', '8.0',
    'Process', TRUE, 211, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2_6', '8.2.6', 'Manage IT value portfolio',
    'Creating and establishing the value portfolio. Defining, analyzing, and examining the value of projects, investments, and activities of the IT function.',
    '20693', 'F2C3F38E5DF96DE6',
    3, '8.2', '8.0',
    'Process', TRUE, 212, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_2_7', '8.2.7', 'Define and manage technology innovation',
    'Outline and manage the innovation of technology within the organization. Research and understand emerging future technological concepts and capabilities. Plan for IT innovation investments. Plan and execute viable innovation projects.',
    '20699', 'F2C3F38E5DF96DE6',
    3, '8.2', '8.0',
    'Process', TRUE, 213, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3', '8.3', 'Develop and manage IT resilience and risk',
    'Develop and include the processes required to rapidly adapt and respond to any internal or external opportunity, demand, disruption, or threat to IT. Develop a more dynamic, strategic, and integrated approach to managing risk and compliance obligations.',
    '20706', 'F2C3F36D5DF9274E',
    2, '8.0', '8.0',
    'Process Group', FALSE, 214, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_1', '8.3.1', 'Develop IT compliance, risk, and security strategy',
    'Ensuring that the organization effectively manages risk. Develop rules and standards for robust IT operations, manage risk, and adopt measures to protect integrity, confidentiality, and security of IT assets.',
    '20707', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 215, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_2', '8.3.2', 'Develop IT resilience strategy',
    'Developing resilience strategies of IT across the organization so that prospective risks can be avoided.',
    '20716', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 216, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_3', '8.3.3', 'Control IT risk, compliance, and security',
    'Ensure effective control in overall IT risk management, formulate and execute guidelines in-line with regulatory bodies, and manage organizational security throughout the business operations.',
    '20721', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 217, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_4', '8.3.4', 'Plan and manage IT continuity',
    'Planning and managing IT''s ability to recover from exposure to internal and external threats.',
    '20731', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 218, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_5', '8.3.5', 'Develop and manage IT security, privacy, and data protection',
    'Creating and deploying an architecture for securing and ensuring the privacy of data flows throughout the organization. Create and develop protocols that ensure proper and efficient use of IT services and solutions',
    '20735', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 219, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_6', '8.3.6', 'Conduct and analyze IT compliance assessments',
    'Evaluate and analyze the IT environment for the compliance of industry regulations and government legislation. Ensure that IT capability and resources meet the set standards.',
    '20743', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 220, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_7', '8.3.7', 'Develop and execute IT resilience and continuity operations',
    'Create and execute a process to rapidly adapt and respond to any internal or external opportunity, demand, disruption, or threat in IT. Maintain continuous IT operations to protect employees, assets, and overall brand equity.',
    '20749', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 221, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_3_8', '8.3.8', 'Manage IT user identity and authorization',
    'The process of identifying, authenticating, and authorizing IT users to have access to applications, systems, IT components, or networks by associating user rights and restrictions with established identities.',
    '20756', 'F2C3F3905DF96FB7',
    3, '8.3', '8.0',
    'Process', TRUE, 222, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_4', '8.4', 'Manage information',
    'Creating strategies to manage the organization''s information and content. Outline the architecture for information. Administer information resources. Administer the management of data and content.',
    '20765', 'F2C3F36D5DF9274E',
    2, '8.0', '8.0',
    'Process Group', FALSE, 223, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_4_1', '8.4.1', 'Define business information and analytics strategy',
    'Create an organization-wide strategy for the IT function by combining skills, technologies, applications, and processes in order to attain organizations objectives.',
    '20766', 'F2C3F3915DF97282',
    3, '8.4', '8.0',
    'Process', TRUE, 224, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_4_2', '8.4.2', 'Define and maintain business information architecture',
    'Creating strategies to manage the organization''s information and content. Outline the architecture for information collection and communication. Administer information resources, data management and content.',
    '20770', 'F2C3F3915DF97282',
    3, '8.4', '8.0',
    'Process', TRUE, 225, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_4_3', '8.4.3', 'Define and execute business information lifecycle planning and control',
    'Develop and implement strategies to plan and manage the flow of an information system''s data from creation and initial storage to the time when it becomes obsolete and deleted.',
    '20776', 'F2C3F3915DF97282',
    3, '8.4', '8.0',
    'Process', TRUE, 226, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_4_4', '8.4.4', 'Manage business information content',
    'Creating strategies to administer information and content. Understand the needs of the organization for information and content management. Realize the role of IT services for implementing the overall business strategy. Assess the implications of new technologies for managing information and content. Identify and prioritize the most effective and efficient actions for managing information and content.',
    '20779', 'F2C3F3915DF97282',
    3, '8.4', '8.0',
    'Process', TRUE, 227, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_5', '8.5', 'Develop and manage services/solutions',
    'Designing and maintaining the IT services/solutions catalogue. Evaluate the performance of IT services/solutions. Communicate the results to the management.',
    '20784', 'F2C3F36D5DF9274E',
    2, '8.0', '8.0',
    'Process Group', FALSE, 228, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_5_1', '8.5.1', 'Develop service/solution and integration strategy',
    'Developing service/solution along with creating a strategy that provides a base for delivering service/solution aligned with overall business needs. Conduct research within the services/solutions field for development and integration.',
    '20785', 'F2C3F3925DF973E4',
    3, '8.5', '8.0',
    'Process', TRUE, 229, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_5_2', '8.5.2', 'Manage service/solution lifecycle planning',
    'Executing life-cycle planning for IT services and solutions. Develop new requirements and feature-function enhancements. Create and design a life cycle plan that addresses the current and future state of IT services and solutions.',
    '20793', 'F2C3F3925DF973E4',
    3, '8.5', '8.0',
    'Process', TRUE, 230, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_5_3', '8.5.3', 'Develop and manage service/solution architecture',
    'Creating the architecture for the IT services and solutions. Assess architecture and business constraints in order to understand integration requirements. Promote existing architecture. Manage exceptions.',
    '20799', 'F2C3F3925DF973E4',
    3, '8.5', '8.0',
    'Process', TRUE, 231, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_5_4', '8.5.4', 'Execute IT service/solution creation and testing',
    'Understanding customer requirements. Design the IT services and solutions based on the requirements. Develop components for providing the requirements. Train resources to provide support. Test the IT services and solutions in advance. Confirm the customer experience post-sale.',
    '20808', 'F2C3F3925DF973E4',
    3, '8.5', '8.0',
    'Process', TRUE, 232, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_5_5', '8.5.5', 'Perform service/solution maintenance and testing',
    'Engaging in all aspects of service/solution maintenance and testing includes all preventative, routine, and corrective activates. Ensure that IT service/solution are functioning properly and regulations where applicable.',
    '20817', 'F2C3F3925DF973E4',
    3, '8.5', '8.0',
    'Process', TRUE, 233, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_6', '8.6', 'Deploy services/solutions',
    'Executing IT services/solutions by creating a strategy for deployment. Plan and execute the changes. Plan and administer the release of its IT services and solutions.',
    '20824', 'F2C3F36D5DF9274E',
    2, '8.0', '8.0',
    'Process Group', FALSE, 234, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_6_1', '8.6.1', 'Develop and manage service/solution deployment strategy',
    'Creating and implementing a strategy for the deployment of IT service/solution. Define all of the activities that make the IT function available for use. Establish the change policies for IT services and solutions. Define the deployment process, procedures, and tools. Select the most feasible and practical methodologies for the deployment process.',
    '20825', 'F2C3F3935DF975D0',
    3, '8.6', '8.0',
    'Process', TRUE, 235, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_6_2', '8.6.2', 'Plan service and solution implementation',
    'Strategizing and executing changes in IT solutions and services. Create a plan for deploying the changes. Communicate with stakeholders about the changes. Administer and implement the changes. Train the resources who will be affected by these changes. Install changes and verify their effect.',
    '20832', 'F2C3F3935DF975D0',
    3, '8.6', '8.0',
    'Process', TRUE, 236, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_6_3', '8.6.3', 'Manage change deployment control',
    'Creating and deploying an architecture for securing the changes deployed in the organization. Create and develop protocols that ensure proper and efficient use of deployed IT services and solutions. Test, evaluate, and implement the policies and protocols.',
    '20840', 'F2C3F3935DF975D0',
    3, '8.6', '8.0',
    'Process', TRUE, 237, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_6_4', '8.6.4', 'Implement technology solutions',
    'Deploy the identified solutions for information technology important for healthy business operations. Confirm status and operational availability of IT resources. Perform testing and distribution of change. Execute roll-back protocol if necessary.',
    '20848', 'F2C3F3935DF975D0',
    3, '8.6', '8.0',
    'Process', TRUE, 238, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_6_5', '8.6.5', 'Perform service and solution rollout',
    'Strategizing and executing changes in IT solutions and services. Create a plan for deploying the changes. Communicate with stakeholders about the changes. Administer and implement the changes. Train the resources who will be affected by these changes. Install changes and verify their effect.',
    '20858', 'F2C3F3935DF975D0',
    3, '8.6', '8.0',
    'Process', TRUE, 239, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7', '8.7', 'Create and manage support services/solutions',
    'Establishing and managing services for providing support to users of IT services and solutions. Define the plethora of services by which the organization assists users of computers, software products, or other information technology products.',
    '20866', 'F2C3F36D5DF9274E',
    2, '8.0', '8.0',
    'Process Group', FALSE, 240, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_1', '8.7.1', 'Define and establish service delivery strategy',
    'Defining and establishing strategy for delivering IT services and solutions to the users. Design an IT service delivery model that defines the processes and procedures needed to deliver the IT services and solutions.',
    '20867', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 241, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_2', '8.7.2', 'Define and develop service support strategy',
    'Defining and creating a strategy for provision of support to users of IT services and solutions.',
    '20873', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 242, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_3', '8.7.3', 'Plan and manage service delivery control',
    'Determine and manage service delivery flow across different business functions. Understand the level of services needed by different stakeholders. Identify major service delivery touch points and criticality associated. Ensure timely communication with users.',
    '20880', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 243, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_4', '8.7.4', 'Develop and manage infrastructure resource planning',
    'Developing and managing the resources required for administration of infrastructure. Manage the IT inventory and assets to meet organization''s IT resource capacity.',
    '20888', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 244, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_5', '8.7.5', 'Define service support planning',
    'Develop strategies and methodologies to provide service support. Examine service levels, support complexity, stakeholder requirements to offer service support.',
    '20895', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 245, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_6', '8.7.6', 'Develop and manage service delivery operations',
    'Developing and managing different delivery services using service delivery systems for operational activities within the IT function in order to achieve organizations goal.',
    '20905', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 246, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_7', '8.7.7', 'Manage infrastructure resource administration',
    'Managing the resources required for administration of IT infrastructure. Manage the IT inventory and assets. Take care of the organization''s IT resource capacity.',
    '20914', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 247, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_8_7_8', '8.7.8', 'Operate IT user support',
    'Managing systematic user support functionality and capability through defined procedures. Determine, record, and monitor user requests. Execute issue/request resolution. Utilize escalation path when needed. Resolve issue/request.',
    '20921', 'F2C3F3935DF9776C',
    3, '8.7', '8.0',
    'Process', TRUE, 248, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_1', '9.1', 'Perform planning and management accounting',
    'Determining different stages of the planning process and accounting. Classify, determine, analyze, interpret, and communicate information to make up-to-date business decisions for better management and control functions.',
    '10728', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 249, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_1_1', '9.1.1', 'Perform planning/budgeting/forecasting',
    'Allocating funds to meet future and current financial goals. Led by the chief financial officer, have the finance function plan, budget, and forecast in order to determine and describe long and short-term financial goals.',
    '10738', 'F2C3F3955DF97ACC',
    3, '9.1', '9.0',
    'Process', TRUE, 250, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_1_2', '9.1.2', 'Perform cost accounting and control',
    'Defining costs to be incurred and methods for optimum utilization. Determine the costs of products, processes, projects, etc. to compile in the financial statements, as well as to assist management in making decisions regarding planning and control. Control costs by managing and reducing business expenses.',
    '10739', 'F2C3F3955DF97ACC',
    3, '9.1', '9.0',
    'Process', TRUE, 251, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_1_3', '9.1.3', 'Perform cost management',
    'Deciding which expenses can be avoided to reduce some costs and increase revenues. Plan and control the organization''s budget to forecast future expenditures.',
    '10740', 'F2C3F3955DF97ACC',
    3, '9.1', '9.0',
    'Process', TRUE, 252, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_1_4', '9.1.4', 'Evaluate and manage financial performance',
    'Checking and achieving predetermined financial targets and timelines. Assess and manage the profitability, feasibility, and consistency of a business or project. Study the revenues generated.',
    '10741', 'F2C3F3955DF97ACC',
    3, '9.1', '9.0',
    'Process', TRUE, 253, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_2', '9.2', 'Perform revenue accounting',
    'Comparing revenue targets to reality. Review all transactions and entries passed in final accounts in a year in order to examine profits.',
    '10729', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 254, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_2_1', '9.2.1', 'Process customer credit',
    'Evaluating and processing requests for advances. Evaluate credit requests by customers requiring loans to buy products/services.',
    '10742', 'F2C3F3965DF97C40',
    3, '9.2', '9.0',
    'Process', TRUE, 255, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_2_2', '9.2.2', 'Invoice customer',
    'Preparing detailed reports of customer purchases. Prepare a commercial document between the seller and customer with details about transaction. Detail the quantity purchased, price of products/services, date, parties involved, unique invoice number, and tax information.',
    '10743', 'F2C3F3965DF97C40',
    3, '9.2', '9.0',
    'Process', TRUE, 256, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_2_3', '9.2.3', 'Process accounts receivable (AR)',
    'Processing payments due from customers. This includes all processing of funds received, whether by check or electronically. This does not include the generation of invoices.',
    '10744', 'F2C3F3965DF97C40',
    3, '9.2', '9.0',
    'Process', TRUE, 257, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_2_4', '9.2.4', 'Manage and process collections',
    'Posting entries to respective accounts, and preparing accounts for receivables. Manage the cash collected by the business from its debtors. Record it in the books of accounts to provide clear information about the availability of the cash.',
    '10745', 'F2C3F3965DF97C40',
    3, '9.2', '9.0',
    'Process', TRUE, 258, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_2_5', '9.2.5', 'Manage and process adjustments/deductions',
    'Creating and providing funds for necessary adjustments and deductions, including all expenses that were required for the business at certain point in time.',
    '10746', 'F2C3F3965DF97C40',
    3, '9.2', '9.0',
    'Process', TRUE, 259, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_3', '9.3', 'Perform general accounting and reporting',
    'Making statements about business activities and functions. Prepare financial statements (balance sheet, income statement, statement of cash flows, and statement of stockholders'' equity) according to accounting concepts and principles.',
    '10730', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 260, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_3_1', '9.3.1', 'Manage policies and procedures',
    'Creating procedures to perform general accounting and reporting. Follow the rules and regulations made for a particular process in the business. Publish accounting policies.',
    '10747', 'F2C3F3975DF97E04',
    3, '9.3', '9.0',
    'Process', TRUE, 261, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_3_2', '9.3.2', 'Perform general accounting',
    'Applying basic principles, concepts, and accounting practices in recording and preparing final accounts, and using accounting information in management.',
    '10748', 'F2C3F3975DF97E04',
    3, '9.3', '9.0',
    'Process', TRUE, 262, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_3_3', '9.3.3', 'Perform fixed-asset accounting',
    'Accounting for long-term and fixed assets. Record purchased, fixed assets that are not easily convertible into cash. Account for costs, useful life, resale value, depreciation, and amortization.',
    '10749', 'F2C3F3975DF97E04',
    3, '9.3', '9.0',
    'Process', TRUE, 263, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_3_4', '9.3.4', 'Perform financial reporting',
    'Reporting on the organization''s financial status to stakeholders. Include balance sheets, income statements, cash flow statements, and statements of shareholders'' equity.',
    '10750', 'F2C3F3975DF97E04',
    3, '9.3', '9.0',
    'Process', TRUE, 264, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_4', '9.4', 'Manage fixed-asset project accounting',
    'Managing accounts for large funds-invested projects. Manage and account for fixed assets projects (capital projects), which required significant capital investments over many years.',
    '10731', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 265, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_4_1', '9.4.1', 'Perform capital planning and project approval',
    'Preparing a project finance report to solicit approvals in capital projects. Prepare budgets for projects that require heavy investments. Report on project finances to solicit approvals from management.',
    '10751', 'F2C3F3985DF97F6A',
    3, '9.4', '9.0',
    'Process', TRUE, 266, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_4_2', '9.4.2', 'Perform capital project accounting',
    'Accounting for large-scale and large-cost investments. Manage and account for ongoing activities related to capital projects, including setting up new projects, recording project transactions, monitoring and tracking spending, closing and capitalizing projects, and measuring the financial returns on completed projects.',
    '10752', 'F2C3F3985DF97F6A',
    3, '9.4', '9.0',
    'Process', TRUE, 267, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_5', '9.5', 'Process payroll',
    'Handling reporting time, managing pay, and processing taxes from salaries. Pay employees. Withhold taxes. Confirm the correct funds are paid to the correct government agency.',
    '10732', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 268, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_5_1', '9.5.1', 'Report time',
    'Recording the reporting time of employees on-site. Track working days, salary calculations, holidays taken, number of hours spend in the office, billing hours, etc.',
    '10753', 'F2C3F3985DF98056',
    3, '9.5', '9.0',
    'Process', TRUE, 269, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_5_2', '9.5.2', 'Manage pay',
    'Managing the total payments made in employees payroll, including bonuses and compensation.',
    '10754', 'F2C3F3985DF98056',
    3, '9.5', '9.0',
    'Process', TRUE, 270, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_5_3', '9.5.3', 'Manage and process payroll taxes',
    'Deducting and paying taxes from employees'' salaries.',
    '10755', 'F2C3F3985DF98056',
    3, '9.5', '9.0',
    'Process', TRUE, 271, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_6', '9.6', 'Process accounts payable and expense reimbursements',
    'Handling bills and reimbursements to be made. Make payments for goods or services taken or used on behalf of the organization.',
    '10733', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 272, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_6_1', '9.6.1', 'Process accounts payable (AP)',
    'Processing payments of operating expenses and other supplier charges. This includes the development of policies and procedures around processing of accounts payable and all operations. This process is often supported by key technology enablers.',
    '10756', 'F2C3F3995DF98169',
    3, '9.6', '9.0',
    'Process', TRUE, 273, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_6_2', '9.6.2', 'Process expense reimbursements',
    'Processing reimbursements to employees for the expenses incurred during the course of business. Approve and process advancements and reimbursements for employee expenses on the organization''s behalf. Capture and report relevant tax data and manage personal accounts.',
    '10757', 'F2C3F3995DF98169',
    3, '9.6', '9.0',
    'Process', TRUE, 274, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_6_3', '9.6.3', 'Manage corporate credit cards',
    'Handling and authoring credit cards to business entities or for corporate purchases.',
    '20929', 'F2C3F3995DF98169',
    3, '9.6', '9.0',
    'Process', TRUE, 275, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_7', '9.7', 'Manage treasury operations',
    'Managing business''s investments in trading in bonds, currencies, financial derivatives, etc. Manage the financial assets and holdings of the organization. Optimize the organization''s liquidity. Invest excess cash. Reduce financial risks.',
    '10734', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 276, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_7_1', '9.7.1', 'Manage treasury policies and procedures',
    'Managing rules and regulations for investments in trading in bonds, currencies, financial derivatives, etc. Establish policies and procedures for investments made. Optimize liquidity in treasury operations.',
    '10758', 'F2C3F39A5DF982A4',
    3, '9.7', '9.0',
    'Process', TRUE, 277, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_7_2', '9.7.2', 'Manage cash',
    'Taking care of all cash-related activities in the business. Manage and reconcile cash positions. Manage cash equivalents. Process and oversee electronic fund transfers. Develop cash flow forecasts. Manage cash flows. Produce cash management accounting transactions and reports. Manage and oversee banking relationships. Analyze, negotiate, resolve, and confirm bank fees.',
    '10759', 'F2C3F39A5DF982A4',
    3, '9.7', '9.0',
    'Process', TRUE, 278, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_7_3', '9.7.3', 'Manage in-house bank accounts',
    'Managing financial services provided by an in-house bank structure in the corporation that is operating like a commercial bank.',
    '10760', 'F2C3F39A5DF982A4',
    3, '9.7', '9.0',
    'Process', TRUE, 279, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_7_4', '9.7.4', 'Manage debt and investment',
    'Taking care of the organization''s financial position. Manage its loans or debts from different sources and investments. Leverage the most profitable options to balance the financial position in the market.',
    '10761', 'F2C3F39A5DF982A4',
    3, '9.7', '9.0',
    'Process', TRUE, 280, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_7_5', '9.7.5', 'Monitor and execute risk and hedging transactions',
    'Performing transactions that limit investment risk with the help of derivatives, such as options and futures contracts. Manage interest rates, foreign exchange, and exposure risks. Develop and execute hedging transactions. Evaluate and refine hedging positions. Produce hedge accounting transactions and reports. Monitor credit.',
    '11208', 'F2C3F39A5DF982A4',
    3, '9.7', '9.0',
    'Process', TRUE, 281, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_7_6', '9.7.6', 'Manage financial fraud/dispute cases',
    'Handling cases that involve financial fraud. Resolve disputes.',
    '16958', 'F2C3F39A5DF982A4',
    3, '9.7', '9.0',
    'Process', TRUE, 282, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_8', '9.8', 'Manage internal controls',
    'Administering internal controls. This process requires the organization to manage entity''s board of trustees, management, and other personnel in order to offer judicious assurance about the achievement of effectiveness, proficiency of operations, and reliability of financial reporting.',
    '10735', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 283, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_8_1', '9.8.1', 'Establish internal controls, policies, and procedures',
    'Forming rules and regulations to ensure the achievement of effectiveness, proficiency of operations, and reliability of financial reporting.',
    '10762', 'F2C3F39B5DF984A1',
    3, '9.8', '9.0',
    'Process', TRUE, 284, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_8_2', '9.8.2', 'Operate controls and monitor compliance with internal controls policies and procedures',
    'Incorporating planning, management, operations, and monitoring of internal control mechanism policies and procedures in order to manage internal controls. Design and implement control activities. Monitor control effectiveness. Remediate control deficiencies. Create compliance functions. Operate compliance functions. Implement and maintain technologies and tools to enable the internal controls-related activities.',
    '10763', 'F2C3F39B5DF984A1',
    3, '9.8', '9.0',
    'Process', TRUE, 285, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_8_3', '9.8.3', 'Report on internal controls compliance',
    'Reporting on internal controls compliance to the appropriate authority, including IT regulations and pertinent data.',
    '10764', 'F2C3F39B5DF984A1',
    3, '9.8', '9.0',
    'Process', TRUE, 286, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_9', '9.9', 'Manage taxes',
    'Estimating the organization''s periodic tax liabilities. Ensure that appropriate taxing authorities receive tax return filings and payments when due.',
    '10736', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 287, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_9_1', '9.9.1', 'Develop tax strategy and plan',
    'Setting targets for periodic tax liabilities. Assess the tax impact of various activities such as the acquisition or disposal of fixed assets or a deliberate change in number of employee.',
    '10765', 'F2C3F39B5DF985DC',
    3, '9.9', '9.0',
    'Process', TRUE, 288, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_9_2', '9.9.2', 'Process taxes',
    'Processing the taxes of the organization in line with the regional taxation structure, including corporate, property, excise, and service taxes.',
    '10766', 'F2C3F39B5DF985DC',
    3, '9.9', '9.0',
    'Process', TRUE, 289, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_10', '9.10', 'Manage international funds/consolidation',
    'Managing cash collections and disbursements made by operating units across the enterprise. When appropriate, transfer cash from the operating units to parent-level bank accounts managed by the organization''s treasury team.',
    '10737', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 290, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_10_1', '9.10.1', 'Monitor international rates',
    'Forecasting and monitoring changes in foreign currency value or interest rates around the world that play an important role in the organization.',
    '10767', 'F2C3F39C5DF986B8',
    3, '9.10', '9.0',
    'Process', TRUE, 291, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_10_2', '9.10.2', 'Manage transactions',
    'Managing any transfer of funds in the course of conducting cross-border trades or investments, including conversion across currencies. Find the most suitable alternative for making payments, while saving taxes and avoiding any unwarranted regulation, with the objective of protecting capital.',
    '10768', 'F2C3F39C5DF986B8',
    3, '9.10', '9.0',
    'Process', TRUE, 292, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_10_3', '9.10.3', 'Monitor currency exposure/hedge currency',
    'Assessing exposure to potential financial losses as a result of changes in the value of currencies. Forecast the impact of movements in foreign currency values. Enter into financial transactions designed to offset or limit potential exposure to loss.',
    '10769', 'F2C3F39C5DF986B8',
    3, '9.10', '9.0',
    'Process', TRUE, 293, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_10_4', '9.10.4', 'Report results',
    'Documenting and reporting accounting entries to formally report financial gains or losses experienced as a result of foreign exchange activity.',
    '10770', 'F2C3F39C5DF986B8',
    3, '9.10', '9.0',
    'Process', TRUE, 294, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11', '9.11', 'Perform global trade services',
    'Making and collecting payments for transactions in products/services, and transporting them to interested markets.',
    '17059', 'F2C3F36E5DF9296A',
    2, '9.0', '9.0',
    'Process Group', FALSE, 295, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_1', '9.11.1', 'Screen sanctioned party list',
    'Evaluating the approved list of parties for engaging in international trade in order to ensure the safety of the organization''s business transactions. Examine agents that have been granted legal rights to engage in global trade and their credentials.',
    '14090', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 296, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_2', '9.11.2', 'Control exports and imports',
    'Overseeing and directing the flow of trade to/from the organization in order to ensure financial gains.',
    '14091', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 297, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_3', '9.11.3', 'Classify products',
    'Systematically categorizing products/services for their suitability to international trade. Create classes and categories for demarcating the types of products suitable for international trade. Study requisite national and international standards and the adherence of the organization''s portfolio of offerings to these.',
    '14092', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 298, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_4', '9.11.4', 'Perform currency conversion',
    'Identifying current exchange rates between two currencies and converting the foreign currency to that of the local monetary unit. I.E., yen to US dollar.',
    '19593', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 299, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_5', '9.11.5', 'Calculate duty',
    'Computing the excise duty to be paid during international trade.',
    '14093', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 300, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_6', '9.11.6', 'Communicate with customs',
    'Communicating with the customs department to ensure fluid compliance. Share pertinent information mandated by law with the government agency that controls and collects the duties levied for the international exchange of products/services.',
    '14094', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 301, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_7', '9.11.7', 'Document trade',
    'Documenting and recording the trade processes while making transactions, noting the description, quality, number, transportation medium, indemnity, and inspection.',
    '14095', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 302, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_8', '9.11.8', 'Process trade preferences',
    'Preparing global trade under preference, which allows the organization to import/export products at a lower or nil rate of customs duty and/or levy charge.',
    '14096', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 303, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_9', '9.11.9', 'Handle restitution',
    'Administering and overseeing all restitution activities the organization may be subjected to. Manage compliance with apposite legal frameworks. Make any restitution that may be required by law; comply with authorities over any fines or non-financial measures imposed.',
    '14097', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 304, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_9_11_10', '9.11.10', 'Prepare letter of credit',
    'Creating a document assuring that a seller will receive payment when certain delivery conditions are met. (If the buyer is unable to make payment on the purchase, a bank covers the outstanding amount.)',
    '14098', 'F2C3F39D5DF9882C',
    3, '9.11', '9.0',
    'Process', TRUE, 305, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_1', '10.1', 'Plan and acquire assets',
    'Building and purchasing non-productive assets for the organization. Acquire and construct non-productive assets that are not yielding any income/profits to the business.',
    '10937', 'F2C3F36F5DF92CBD',
    2, '10.0', '10.0',
    'Process Group', FALSE, 306, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_1_1', '10.1.1', 'Develop property strategy and long term vision',
    'Strategizing a long-term vision for managing properties. Prepare strategies and a long-term vision for managing purchased/retained properties.',
    '10941', 'F2C3F39F5DF98BB1',
    3, '10.1', '10.0',
    'Process', TRUE, 307, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_1_2', '10.1.2', 'Plan facility',
    'Recognizing the needs of facility users in order to construct a project proposal that meets those needs.',
    '10943', 'F2C3F39F5DF98BB1',
    3, '10.1', '10.0',
    'Process', TRUE, 308, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_1_3', '10.1.3', 'Provide workspace and facilities',
    'Managing the provision of the workspace and its assets. Arrange an office space with all assets (tables, chairs, computers, admin staff, etc.) according to requirements.',
    '10944', 'F2C3F39F5DF98BB1',
    3, '10.1', '10.0',
    'Process', TRUE, 309, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_1_4', '10.1.4', 'Manage facilities operations',
    'Managing all operational activities of the facility. Manage how each function/business unit works. Support the manufacturing facility to attain organizational goals.',
    '10949', 'F2C3F39F5DF98BB1',
    3, '10.1', '10.0',
    'Process', TRUE, 310, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_2', '10.2', 'Design and construct productive assets',
    'Conceptualizing and realizing dividend and income generating assets such as machines, tools, factories, etc. Manage steps to acquire assets including managing capital, as well as planning, scheduling, and overseeing construction.',
    '19208', 'F2C3F36F5DF92CBD',
    2, '10.0', '10.0',
    'Process Group', FALSE, 311, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_2_1', '10.2.1', 'Manage capital program for productive assets',
    'Producing and maintaining a planning schedule and a financial plan to purchase or manufacture productive assets. Determine the investment plan, monitor capital, and secure the necessary financing in order to realize completion of the program.',
    '19209', 'F2C3F39F5DF98D26',
    3, '10.2', '10.0',
    'Process', TRUE, 312, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_2_2', '10.2.2', 'Design and plan asset construction',
    'Outlining the steps and strategies needed to construct assets. Verify that all regulations are adhered to and that all permissions have been granted. Organize and plan for resources to complete construction.',
    '20139', 'F2C3F39F5DF98D26',
    3, '10.2', '10.0',
    'Process', TRUE, 313, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_2_3', '10.2.3', 'Schedule and perform construction work',
    'Arranging a timetable for which to perform construction work. Schedule resources to contract assets for new or replacement assets. Reschedule or redesign assets if needed.',
    '19229', 'F2C3F39F5DF98D26',
    3, '10.2', '10.0',
    'Process', TRUE, 314, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_2_4', '10.2.4', 'Manage asset construction',
    'Overseeing the performance and quality of work. Assure that records are maintained throughout the construction process. Adhere to all safety, security, and access regulations set forth by the organization and all government standards.',
    '19224', 'F2C3F39F5DF98D26',
    3, '10.2', '10.0',
    'Process', TRUE, 315, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_3', '10.3', 'Maintain productive assets',
    'Preserving productive assets through the planning, managing, and performance of preventative, routine, and critical maintenance work.',
    '19238', 'F2C3F36F5DF92CBD',
    2, '10.0', '10.0',
    'Process Group', FALSE, 316, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_3_1', '10.3.1', 'Plan asset maintenance',
    'Ensuring that necessary resources are available and tasks are prioritized accordingly through planning. Provide strategies and policies that identify tasks that need to be completed, and the resources necessary to fulfill those tasks.',
    '19239', 'F2C3F3A05DF98E9C',
    3, '10.3', '10.0',
    'Process', TRUE, 317, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_3_2', '10.3.2', 'Manage asset maintenance',
    'Ensuring that asset maintenance is conducted in a timely manner and successfully. Schedule work with the required resources with an eye on quality control and safety. Verify that contracted maintenance meets performance targets.',
    '19245', 'F2C3F3A05DF98E9C',
    3, '10.3', '10.0',
    'Process', TRUE, 318, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_3_3', '10.3.3', 'Perform asset maintenance',
    'Engaging in all aspects of asset maintenance. Ensure that all assets are functioning properly and to all specified codes and regulations where applicable. Maintenance includes all preventative, routine, and corrective activates.',
    '19253', 'F2C3F3A05DF98E9C',
    3, '10.3', '10.0',
    'Process', TRUE, 319, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_4', '10.4', 'Dispose of assets',
    'Retiring productive and non-productive assets.',
    '10940', 'F2C3F36F5DF92CBD',
    2, '10.0', '10.0',
    'Process Group', FALSE, 320, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_4_1', '10.4.1', 'Develop exit strategy',
    'Creating a strategy for managing asset exits.',
    '10952', 'F2C3F3A15DF98FC6',
    3, '10.4', '10.0',
    'Process', TRUE, 321, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_4_2', '10.4.2', 'Decommission productive assets',
    'Retiring assets that are no longer viable to the business. Decommission assets that are no longer in working order, are out of date, or whose maintenance exceeds the cost of replacement.',
    '19258', 'F2C3F3A15DF98FC6',
    3, '10.4', '10.0',
    'Process', TRUE, 322, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_4_3', '10.4.3', 'Perform sale or trade',
    'Performing the sale of assets. Achieve and complete the sale process. Deliver the end product to the customers.',
    '10953', 'F2C3F3A15DF98FC6',
    3, '10.4', '10.0',
    'Process', TRUE, 323, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_4_4', '10.4.4', 'Perform abandonment',
    'Abandoning assets. Manage the act of deliberately and permanently giving up, granting, leaving, or surrendering property or buildings and allowing others to use the intellectual property without protest.',
    '10954', 'F2C3F3A15DF98FC6',
    3, '10.4', '10.0',
    'Process', TRUE, 324, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_10_4_5', '10.4.5', 'Perform waste and hazardous goods management',
    'Disposing of waste and hazardous materials as outlined by state, local, and federal regulations.',
    '16970', 'F2C3F3A15DF98FC6',
    3, '10.4', '10.0',
    'Process', TRUE, 325, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_1', '11.1', 'Manage enterprise risk',
    'Creating requisite frameworks and coordinating all risk management activities for the entire organization and each function. Manage the enterprise risk by outlining the risk policies and procedures. Monitor and communicate all risk management activities. Encourage correspondence among the business units. Manage the risk of all business units and functions.',
    '17060', 'F2C3F3705DF92E2A',
    2, '11.0', '11.0',
    'Process Group', FALSE, 326, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_1_1', '11.1.1', 'Establish the enterprise risk framework and policies',
    'Creating an agenda for the rules and regulations of enterprise risk that deal with hazardous, financial, operational, and strategic risks.',
    '16439', 'F2C3F3A25DF991CD',
    3, '11.1', '11.0',
    'Process', TRUE, 327, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_1_2', '11.1.2', 'Oversee and coordinate enterprise risk management activities',
    'Coordinating to plan, organize, lead, and control the activities of an organization in order to minimize the special effects of risk on capital and earnings.',
    '16445', 'F2C3F3A25DF991CD',
    3, '11.1', '11.0',
    'Process', TRUE, 328, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_1_3', '11.1.3', 'Manage business unit and function risk',
    'Analyzing the threats a business unit/function faces to prioritize the controls it implements..',
    '17462', 'F2C3F3A25DF991CD',
    3, '11.1', '11.0',
    'Process', TRUE, 329, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_2', '11.2', 'Manage compliance',
    'Managing steps to confirm enduring compliance to industry regulations and government legislation.',
    '17467', 'F2C3F3705DF92E2A',
    2, '11.0', '11.0',
    'Process Group', FALSE, 330, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_2_1', '11.2.1', 'Establish compliance framework and policies',
    'Developing a set of procedures detailing an organization''s progress in complying with established guidelines, provisions, and legislation.',
    '17468', 'F2C3F3A35DF992F4',
    3, '11.2', '11.0',
    'Process', TRUE, 331, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_2_2', '11.2.2', 'Manage regulatory compliance',
    'Obeying laws, guidelines, strategies, and stipulations related to the business.',
    '16463', 'F2C3F3A35DF992F4',
    3, '11.2', '11.0',
    'Process', TRUE, 332, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_3', '11.3', 'Manage remediation efforts',
    'Administering the efforts and activities for remediation. This process element requires the organization to create plans for corrective action in collaboration with government agencies and pertinent professional services agencies which specialize in remediation efforts relevant to the organization''s operations. Additionally, the organization needs to consult experts to validate the plan, determine resources allocation, resolve any legal concerns, and formulate a company-wide policy for remediation.',
    '11185', 'F2C3F3705DF92E2A',
    2, '11.0', '11.0',
    'Process Group', FALSE, 333, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_3_1', '11.3.1', 'Create remediation plans',
    'Creating plans for remediation efforts. Make a plan to address a case of environmental adulteration. Identify and treat the adulteration so that the area will become operational again.',
    '11201', 'F2C3F3A35DF993D1',
    3, '11.3', '11.0',
    'Process', TRUE, 334, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_3_2', '11.3.2', 'Contact and confer with experts',
    'Discussing and soliciting advice from experts for in order to incorporate their suggestion (regarding Create remediation plans [11201]).',
    '11202', 'F2C3F3A35DF993D1',
    3, '11.3', '11.0',
    'Process', TRUE, 335, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_3_3', '11.3.3', 'Identify/dedicate resources',
    'Identifying and dedicating the resources for managing remediation efforts. Discern the resources needed for remediation efforts. Dispense with resources in a sound and well-reasoned manner.',
    '11203', 'F2C3F3A35DF993D1',
    3, '11.3', '11.0',
    'Process', TRUE, 336, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_3_4', '11.3.4', 'Investigate legal aspects',
    'Examining regulatory and legislative frameworks. Obligate the organization to remediate any damages through compensations, fines, and any other remedial efforts necessitated to correct the situations. Analyze local environmental laws, binding international covenants, etc. in order to examine legal accuracy about the rules and procedures.',
    '11204', 'F2C3F3A35DF993D1',
    3, '11.3', '11.0',
    'Process', TRUE, 337, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_3_5', '11.3.5', 'Investigate damage cause',
    'Studying the causes of damage, which could be environmental, physical, social, etc. at country level in order to institute better policies and regulations.',
    '11205', 'F2C3F3A35DF993D1',
    3, '11.3', '11.0',
    'Process', TRUE, 338, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_3_6', '11.3.6', 'Amend or create policy',
    'Crafting a new framework of policies and procedures for deploying remediation efforts, or change existing policies and procedures. Adapt the policy structure to the context of the apposite national and international regulatory frameworks.',
    '11206', 'F2C3F3A35DF993D1',
    3, '11.3', '11.0',
    'Process', TRUE, 339, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_4', '11.4', 'Manage business resiliency',
    'Including the processes required to rapidly adapt and respond to any internal or external opportunity, demand, disruption, or threat. Develop a more dynamic, strategic, and integrated approach to managing compliance obligations.',
    '11216', 'F2C3F3705DF92E2A',
    2, '11.0', '11.0',
    'Process Group', FALSE, 340, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_4_1', '11.4.1', 'Develop the business resilience strategy',
    'Creating a strategy for rapidly adapting to disturbances. Maintain continuous business processes and protecting employees, assets, and overall brand equity.',
    '11221', 'F2C3F3A45DF995DE',
    3, '11.4', '11.0',
    'Process', TRUE, 341, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_4_2', '11.4.2', 'Perform continuous business operations planning',
    'Developing plans to ensure continuous business operations.',
    '11222', 'F2C3F3A45DF995DE',
    3, '11.4', '11.0',
    'Process', TRUE, 342, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_4_3', '11.4.3', 'Test continuous business operations',
    'Assessing ongoing activities within the organization that are not intended to stop except for in an emergency.',
    '11223', 'F2C3F3A45DF995DE',
    3, '11.4', '11.0',
    'Process', TRUE, 343, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_4_4', '11.4.4', 'Maintain continuous business operations',
    'Evaluating business operations. Determine which activities generate revenues, perform best, and provide good returns.',
    '11224', 'F2C3F3A45DF995DE',
    3, '11.4', '11.0',
    'Process', TRUE, 344, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_11_4_5', '11.4.5', 'Share knowledge of specific risks across other parts of the organization',
    'Sharing information about risks and resilience strategies of business operations across the organization so that prospective risks can be avoided.',
    '16471', 'F2C3F3A45DF995DE',
    3, '11.4', '11.0',
    'Process', TRUE, 345, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_1', '12.1', 'Build investor relationships',
    'Creating a strategic management responsibility for integrating finance, communication, marketing, and securities law compliance. Allow the most effective two-way communication among the organization, the financial community, and other constituencies. Enlist the investor relations function to provide market intelligence to corporate management.',
    '11010', 'F2C3F3715DF92F74',
    2, '12.0', '12.0',
    'Process Group', FALSE, 346, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_1_1', '12.1.1', 'Plan, build, and manage lender relations',
    'Building and managing relations with bankers or lenders through strong products/services strategies that bankers would want to invest in. Foster a receptive environment for low rates of interest, easy access to loans, etc.',
    '11035', 'F2C3F3A65DF997E7',
    3, '12.1', '12.0',
    'Process', TRUE, 347, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_1_2', '12.1.2', 'Plan, build, and manage analyst relations',
    'Creating and maintaining long-term relations with analysts. Involve analysts in strategy and product decisions in order to elicit valuable information.',
    '11036', 'F2C3F3A65DF997E7',
    3, '12.1', '12.0',
    'Process', TRUE, 348, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_1_3', '12.1.3', 'Communicate with shareholders',
    'Practicing regular, transparent communication with shareholders through annual shareholders'' meetings, quarterly earnings calls, shareholders letters, one-on-one emails or calls, etc.',
    '11037', 'F2C3F3A65DF997E7',
    3, '12.1', '12.0',
    'Process', TRUE, 349, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_2', '12.2', 'Manage government and industry relationships',
    'Creating and maintaining relationships with government and industry representatives.',
    '11011', 'F2C3F3715DF92F74',
    2, '12.0', '12.0',
    'Process Group', FALSE, 350, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_2_1', '12.2.1', 'Manage government relations',
    'Persuading public and government policy at the local, regional, national, and global level (subject to government regulations).',
    '11038', 'F2C3F3A65DF99910',
    3, '12.2', '12.0',
    'Process', TRUE, 351, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_2_2', '12.2.2', 'Manage relations with quasi-government bodies',
    'Managing relations with quasi-governmental organizations, corporations, businesses, or any other agency that is treated by national laws and principles to be under the supervision of the government but also distinct and self-directed from the government.',
    '11039', 'F2C3F3A65DF99910',
    3, '12.2', '12.0',
    'Process', TRUE, 352, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_2_3', '12.2.3', 'Manage relations with trade or industry groups',
    'Managing relations with organizations established and financed by businesses that operate in a specific industry. Participate in public relations actions such as lobbying and publishing, advertising, education, and political donations.',
    '11040', 'F2C3F3A65DF99910',
    3, '12.2', '12.0',
    'Process', TRUE, 353, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_2_4', '12.2.4', 'Manage lobby activities',
    'Managing lobbying activities to affect government policies.',
    '11041', 'F2C3F3A65DF99910',
    3, '12.2', '12.0',
    'Process', TRUE, 354, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_3', '12.3', 'Manage relations with board of directors',
    'Maintaining relations with representatives of the stockholders. Establish corporate management-related policies and to make decisions on major company issues. Implement practices designed to engender communication, trust, and cooperation.',
    '11012', 'F2C3F3715DF92F74',
    2, '12.0', '12.0',
    'Process Group', FALSE, 355, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_3_1', '12.3.1', 'Report financial results',
    'Reporting financial results to management, and releasing results to the public. Report financial statements, including the income statement, balance sheet, and statement of cash flows.',
    '11042', 'F2C3F3A75DF99A84',
    3, '12.3', '12.0',
    'Process', TRUE, 356, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_3_2', '12.3.2', 'Report audit findings',
    'Reporting audit findings to management. Practice an internal audit with criteria for confirming a problem, a description of the situation, and the root cause of the problem. Make recommendations that resolve the issue.',
    '11043', 'F2C3F3A75DF99A84',
    3, '12.3', '12.0',
    'Process', TRUE, 357, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4', '12.4', 'Manage legal and ethical issues',
    'Managing legal practices to abide by the law, as well as ethical practices.',
    '11013', 'F2C3F3715DF92F74',
    2, '12.0', '12.0',
    'Process Group', FALSE, 358, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_1', '12.4.1', 'Create ethics policies',
    'Creating a code of ethics that communicate the organization''s philosophy to employees, vendors, customers, clients, and the public.',
    '11044', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 359, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_2', '12.4.2', 'Manage corporate governance policies',
    'Administering the system of rules, practices, and processes through which a company is directed and controlled. Balance stakeholder interests including shareholders, management, customers, suppliers, financiers, government, and the community. Outline a strategy for achieving organizational goals, from action plans and internal controls to performance measurement and corporate disclosure.',
    '11045', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 360, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_3', '12.4.3', 'Develop and perform preventive law programs',
    'Creating and applying programs and activities. Encourage the adherence preventive laws, such as environmental law, sex discrimination, computer law, estate planning, corporate compliance, business planning, and property transactions.',
    '11046', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 361, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_4', '12.4.4', 'Ensure compliance',
    'Ensuring the organization''s compliance position. Validate compliance with different statutes, regulatory directions, and legal principles (using Establish compliance framework and policies [17468]). Coordinate with compliance and risk management personnel.',
    '11047', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 362, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_5', '12.4.5', 'Manage outside counsel',
    'Managing professionals, sought externally for assistance over legal and ethical concerns. Administer and oversee assistance from subject matter experts and professionals for sourcing expert opinion and counseling over legal and ethical matters.',
    '11048', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 363, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_6', '12.4.6', 'Protect intellectual property',
    'Safeguarding the intellectual property of the organization. This process requires the organization to protect a wide variety of intellectual property created by it. It involves creating and managing non-disclosure agreements (NDAs), following up on current developments in the areas where the organization holds patents, tracking the use of the organization''s copyrighted material, creating and upholding licensing terms, and administering policies for safeguarding intellectual property.',
    '11049', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 364, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_7', '12.4.7', 'Resolve disputes and litigations',
    'Resolving disputes or civil lawsuits internally or externally.',
    '11050', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 365, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_8', '12.4.8', 'Provide legal advice/counseling',
    'Providing legal advice concerning the substance or procedure of a law in relation to a particular situation.',
    '11051', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 366, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_4_9', '12.4.9', 'Negotiate and document agreements/contracts',
    'Negotiating terms to reach a final draft of a contract that is acceptable to all parties.',
    '11052', 'F2C3F3A85DF99B52',
    3, '12.4', '12.0',
    'Process', TRUE, 367, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_5', '12.5', 'Manage public relations program',
    'Managing a public relations programs through business and communications skills.',
    '11014', 'F2C3F3715DF92F74',
    2, '12.0', '12.0',
    'Process Group', FALSE, 368, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_5_1', '12.5.1', 'Manage community relations',
    'Developing and administering community relations. Establish business connections with the people constituting the environment the organization operates in and draws resources from in order to foster mutual understanding, trust, and support. Create programs that promote the organization''s image in a positive and community-oriented way.',
    '11066', 'F2C3F3A95DF99E51',
    3, '12.5', '12.0',
    'Process', TRUE, 369, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_5_2', '12.5.2', 'Manage media relations',
    'Developing and managing relations with media. Develop connections with journalists to solicit critical, third-party endorsements for a product, issue, service, or organization.',
    '11067', 'F2C3F3A95DF99E51',
    3, '12.5', '12.0',
    'Process', TRUE, 370, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_5_3', '12.5.3', 'Promote political stability',
    'Promoting political security and stability in the regions where the organization conducts business. Encourage political stability in the regions where the organization operates. Support civic programs, citizen engagement, connection platforms, etc.',
    '11068', 'F2C3F3A95DF99E51',
    3, '12.5', '12.0',
    'Process', TRUE, 371, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_5_4', '12.5.4', 'Create press releases',
    'Developing press releases to communicate developments and generate interest in the organization.',
    '11069', 'F2C3F3A95DF99E51',
    3, '12.5', '12.0',
    'Process', TRUE, 372, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_12_5_5', '12.5.5', 'Issue press releases',
    'Issuing press releases to carefully selected media in distribution channels such as the web, newspapers, and social media.',
    '11070', 'F2C3F3A95DF99E51',
    3, '12.5', '12.0',
    'Process', TRUE, 373, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_1', '13.1', 'Manage business processes',
    'Establishing and administering governance for management of the processes. Outline and manage the frameworks for management of the processes. Define the business processes. Administer the performance of the processes. Enhance the business processes.',
    '16378', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 374, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_1_1', '13.1.1', 'Establish and maintain process management governance',
    'Defining and managing the organization''s approach to governing business process management. Establish and manage tools to support the governance process. Assign ownership for all business processes. Perform activities to administer the governing process.',
    '16379', 'F2C3F3AA5DF9A059',
    3, '13.1', '13.0',
    'Process', TRUE, 375, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_1_2', '13.1.2', 'Define and manage process frameworks',
    'Determining and organizing the structural composition of business processes. Design, establish, and administer the framework. Identify any cross-functional processes that are mandatory for achieving business excellence.',
    '16384', 'F2C3F3AA5DF9A059',
    3, '13.1', '13.0',
    'Process', TRUE, 376, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_1_3', '13.1.3', 'Define processes',
    'Outlining and establishing the business processes of the organization. Scope, analyze, map, and publish processes for the employees who may require it.',
    '16387', 'F2C3F3AA5DF9A059',
    3, '13.1', '13.0',
    'Process', TRUE, 377, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_1_4', '13.1.4', 'Manage process performance',
    'Evaluating and handling the performance of business processes. Provide training to process owners. Support the execution of business processes. Measure and report the performance of the business processes.',
    '16392', 'F2C3F3AA5DF9A059',
    3, '13.1', '13.0',
    'Process', TRUE, 378, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_1_5', '13.1.5', 'Improve processes',
    'Identifying and choosing improvement opportunities. Create and manage improvement projects. Perform the improvement activities continuously and routinely.',
    '16396', 'F2C3F3AA5DF9A059',
    3, '13.1', '13.0',
    'Process', TRUE, 379, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_2', '13.2', 'Manage portfolio, program, and project',
    'Managing investments, holdings, products, businesses, and brands, along with the related projects that together constitute a program.',
    '16400', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 380, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_2_1', '13.2.1', 'Manage portfolio',
    'Managing the business portfolio of the organization, including investments, holdings, products, businesses, and brands. Establish a portfolio strategy. Define portfolio governance. Monitor and control the portfolio.',
    '16401', 'F2C3F3AB5DF9A217',
    3, '13.2', '13.0',
    'Process', TRUE, 381, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_2_2', '13.2.2', 'Manage programs',
    'Establishing, implementing, and managing business programs. Successfully handle related projects that together constitute a program. Establish the program structure and approach. Coordinate with stakeholders and partners. Execute the program. Assess and report the performance of the program. Coordinate and prioritize resources across projects. Manage links between the projects and the overall costs and risks of the program.',
    '16405', 'F2C3F3AB5DF9A217',
    3, '13.2', '13.0',
    'Process', TRUE, 382, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_2_3', '13.2.3', 'Manage projects',
    'Establishing the scope of the projects. Create plans for implementing the projects. Initiate projects. Review and report project performance to management. Close projects.',
    '16410', 'F2C3F3AB5DF9A217',
    3, '13.2', '13.0',
    'Process', TRUE, 383, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_3', '13.3', 'Manage enterprise quality',
    'Managing organizational attributes that are closely associated with the quality of output. Determine the quality requirements. Evaluate the correspondence between the quality performance and requirements. Manage non-conformance activities. Ensure implementation and maintenance of the enterprise quality management system.',
    '17471', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 384, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_3_1', '13.3.1', 'Establish quality requirements',
    'Determining essential activities, processes, and attributes for securing enterprise quality. Outline critical characteristics for quality. Outline activities encouraging the preservation of quality. Create quality controls. Confirm capabilities in accordance with quality requirements. Finalize the plan for quality maintenance.',
    '17472', 'F2C3F3AC5DF9A33E',
    3, '13.3', '13.0',
    'Process', TRUE, 385, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_3_2', '13.3.2', 'Evaluate performance to requirements',
    'Analyzing if the performance of the quality plan has achieved the estimated and desired requirements. Conduct tests against the quality plan. Assess the results of these tests.',
    '17482', 'F2C3F3AC5DF9A33E',
    3, '13.3', '13.0',
    'Process', TRUE, 386, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_3_3', '13.3.3', 'Manage non-conformance',
    'Handling any nonconformance activities or events. Assess the potential impact of the nonconformity. Decide the immediate actions to take. Identify the root causes. Take corrective or preventive action. Ensure future conformance.',
    '17492', 'F2C3F3AC5DF9A33E',
    3, '13.3', '13.0',
    'Process', TRUE, 387, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_3_4', '13.3.4', 'Implement and maintain the enterprise quality management system (EQMS)',
    'Establishing and administering the software that manages content and business processes for quality and compliance across the value chain. Define the quality strategy. Plan and deploy the EQMS scope, targets, and goals. Identify core process controls and metric. Develop EQMS governance. Assess the performance of EQMS. Encourage improvements in EQMS.',
    '17498', 'F2C3F3AC5DF9A33E',
    3, '13.3', '13.0',
    'Process', TRUE, 388, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_4', '13.4', 'Manage change',
    'Planning, designing, and implementing the change. Ensure improvement in the change process.',
    '11074', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 389, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_4_1', '13.4.1', 'Plan for change',
    'Crafting a plan for implementing change to the organization''s multiple frameworks, systems, and functional areas. Chart a schematic plan that gives the organization a foundation to shape its change efforts.',
    '11134', 'F2C3F3AD5DF9A4B9',
    3, '13.4', '13.0',
    'Process', TRUE, 390, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_4_2', '13.4.2', 'Design the change',
    'Developing plans for change management, training, communication, and rewards/incentives. Establish metrics for measuring the change adoption. Clarify new roles for employees. Identify budgets.',
    '11135', 'F2C3F3AD5DF9A4B9',
    3, '13.4', '13.0',
    'Process', TRUE, 391, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_4_3', '13.4.3', 'Implement change',
    'Effectuating the change within the desired impact areas of the organization. Ensure adequate commitment from all corners of the organization for the desired change. Create support structures. Refashion all processes deemed necessary. Observe the progress.',
    '11136', 'F2C3F3AD5DF9A4B9',
    3, '13.4', '13.0',
    'Process', TRUE, 392, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_4_4', '13.4.4', 'Sustain improvement',
    'Sustaining the impact of the change process in order to enact continual process improvement. Monitor the performance of re-engineered business processes. Identify best practices and potential issues. Effectuate remedial steps.',
    '11137', 'F2C3F3AD5DF9A4B9',
    3, '13.4', '13.0',
    'Process', TRUE, 393, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_5', '13.5', 'Develop and manage enterprise-wide knowledge management (KM) capability',
    'Creating and administering the capability of the organization''s knowledge management function. Develop a strategy for knowledge management. Assess capabilities of the knowledge management function.',
    '11073', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 394, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_5_1', '13.5.1', 'Develop KM strategy',
    'Creating a plan for managing the organization''s knowledge base. Determine what kind of specialized knowledge the organization possesses, which elements of this collective knowledge can prove beneficial, how to capture and maintain this knowledge, how to grant access to this library of information, and how the organization should proceed.',
    '11095', 'F2C3F3AD5DF9A62C',
    3, '13.5', '13.0',
    'Process', TRUE, 395, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_5_2', '13.5.2', 'Assess KM capabilities',
    'Assessing the maturity of the existing initiatives in knowledge management, and evaluating existing KM approaches. Identify the gaps and needs in order to enhance the existing KM approaches. Develop and implement new KM approaches.',
    '11096', 'F2C3F3AD5DF9A62C',
    3, '13.5', '13.0',
    'Process', TRUE, 396, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_5_3', '13.5.3', 'Design and implement KM capabilities',
    'Creating knowledge bases and other repositories to preserve and develop company expertise, and to train new employees.',
    '20965', 'F2C3F3AD5DF9A62C',
    3, '13.5', '13.0',
    'Process', TRUE, 397, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_5_4', '13.5.4', 'Evolve and sustain KM capabilities',
    'Developing resources for improved knowledge management and knowledge engineering.',
    '20969', 'F2C3F3AD5DF9A62C',
    3, '13.5', '13.0',
    'Process', TRUE, 398, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_6', '13.6', 'Measure and benchmark',
    'Creating and administering a strategy to manage organizational performance. Benchmark the performance of the internal processes, as well as the organization as a whole.',
    '16436', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 399, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_6_1', '13.6.1', 'Create and manage organizational performance strategy',
    'Creating and implementing a strategy for administering organizational performance. This process element calls upon the organization to create and administer a strategy for measuring, tracking, streamlining, and improving internal performance. It encompasses creating a blueprint for the tactical measurement of internal processes and work force improvement, in alignment with Employee Metrics Developed and Managed [10526].',
    '11071', 'F2C3F3AE5DF9A79B',
    3, '13.6', '13.0',
    'Process', TRUE, 400, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_6_2', '13.6.2', 'Benchmark performance',
    'Comparing organizational performance internally or externally with other organizations.',
    '11072', 'F2C3F3AE5DF9A79B',
    3, '13.6', '13.0',
    'Process', TRUE, 401, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_6_3', '13.6.3', 'Evaluate process performance',
    'Assessing process data, measures, and trends in an effort to evaluate process performance and identify possible improvements.',
    '20147', 'F2C3F3AE5DF9A79B',
    3, '13.6', '13.0',
    'Process', TRUE, 402, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_7', '13.7', 'Manage environmental health and safety (EHS)',
    'Determining the impacts of environmental health and safety. Create and implement the EHS program. Train and educate employees of the EHS function. Oversee and manage the EHS program.',
    '11179', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 403, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_7_1', '13.7.1', 'Determine environmental health and safety impacts',
    'Determining the impact of EHS offering--and the procedures it employs to process them--on the environment at large, as well as the health and safety of employees. Evaluate the environmental impact of the organization''s products, services, and operations. Conduct health, safety, and environmental audits.',
    '11180', 'F2C3F3AF5DF9A8AE',
    3, '13.7', '13.0',
    'Process', TRUE, 404, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_7_2', '13.7.2', 'Develop and execute functional EHS program',
    'Identify the requirements for regulation and shareholders. Assess future risks and opportunities. Develop a policy for the EHS program. Record and manage EHS program events.',
    '11181', 'F2C3F3AF5DF9A8AE',
    3, '13.7', '13.0',
    'Process', TRUE, 405, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_7_3', '13.7.3', 'Train and educate functional employees',
    'Conducting programs such as on-the-job training sessions, group training workshops, and online training.',
    '11182', 'F2C3F3AF5DF9A8AE',
    3, '13.7', '13.0',
    'Process', TRUE, 406, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_7_4', '13.7.4', 'Monitor and manage functional EHS management program',
    'Managing the costs and benefits of EHS. Measure and report the performance of EHS. Implement plans for emergency response and pollution prevention. Provide EHS support.',
    '11183', 'F2C3F3AF5DF9A8AE',
    3, '13.7', '13.0',
    'Process', TRUE, 407, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_8', '13.8', 'Develop, Manage, and Deliver Analytics',
    'Creating new and improving existing analytical capabilities to enhance data management pipeline.',
    '20959', 'F2C3F3715DF9312C',
    2, '13.0', '13.0',
    'Process Group', FALSE, 408, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_8_1', '13.8.1', 'Develop and manage hypotheses',
    'Creating theories that explain empirical data. Use the hypotheses to guide feature selection in the process of data collection.',
    '20960', 'F2C3F3AF5DF9AA26',
    3, '13.8', '13.0',
    'Process', TRUE, 409, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_8_2', '13.8.2', 'Collect data',
    'Gathering and harvesting structured and unstructured data from disparate sources. Clean and pre-process data. Remove duplicates. Convert to a uniform format to make records comparable.',
    '20961', 'F2C3F3AF5DF9AA26',
    3, '13.8', '13.0',
    'Process', TRUE, 410, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_8_3', '13.8.3', 'Analyze data',
    'Conducting data analysis. Choose statistical algorithms that best reveal patterns and trends in the data. Compare with hypotheses and time series forecasts. Determine error rates and significant outliers.',
    '20962', 'F2C3F3AF5DF9AA26',
    3, '13.8', '13.0',
    'Process', TRUE, 411, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_8_4', '13.8.4', 'Report on data',
    'Summarizing and documenting the results of data analysis. Create graphs and visualizations to illustrate numerical findings to make them more accessible to readers.',
    '20963', 'F2C3F3AF5DF9AA26',
    3, '13.8', '13.0',
    'Process', TRUE, 412, TRUE
);

INSERT INTO processes (
    process_id, process_code, process_name, process_description,
    process_number, internal_id, hierarchy_level, parent_process_code,
    category_code, process_type, is_leaf_node, sort_order, is_active
) VALUES (
    'APQC_CI_13_8_5', '13.8.5', 'Identify remedial actions',
    'Determining the steps that need to be taken to correct the shortcomings.',
    '20964', 'F2C3F3AF5DF9AA26',
    3, '13.8', '13.0',
    'Process', TRUE, 413, TRUE
);


-- ============================================================================
-- Commit Transaction
-- ============================================================================

COMMIT;

-- ============================================================================
-- Verify Data Load
-- ============================================================================

-- Check record counts
SELECT 'Framework Metadata' as table_name, COUNT(*) as record_count FROM framework_metadata
UNION ALL
SELECT 'Process Categories', COUNT(*) FROM process_categories
UNION ALL
SELECT 'Processes', COUNT(*) FROM processes;

-- Check hierarchy distribution
SELECT 
    hierarchy_level,
    process_type,
    COUNT(*) as count
FROM processes
GROUP BY hierarchy_level, process_type
ORDER BY hierarchy_level;

-- ============================================================================
