-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: db759307491.hosting-data.io
-- Generation Time: Nov 28, 2018 at 09:53 PM
-- Server version: 5.5.60-0+deb7u1-log
-- PHP Version: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db759307491`
--

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_adminnotification_inbox`
--

CREATE TABLE `jeu6_adminnotification_inbox` (
  `notification_id` int(10) UNSIGNED NOT NULL COMMENT 'Notification id',
  `severity` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';

--
-- Dumping data for table `jeu6_adminnotification_inbox`
--

INSERT INTO `jeu6_adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES
(1, 1, '2018-09-06 13:22:45', 'Magento Open Source 1 software security patches thru June 2020', 'Magento Open Source 1 software security patches thru June 2020\n\nFor Magento Open Source 1.5 to 1.9, we are providing software security patches through June 2020 to ensure those sites remain secure and compliant. Visit our information page for more details about our software maintenance policy and other considerations for your business.\n\nhttps://info2.magento.com/M1OpenSource.html\n', 'https://info2.magento.com/M1OpenSource.html', 0, 0),
(2, 1, '2018-09-18 21:21:37', 'Magento Open Source 2.2.6 delivers important security updates along with performance and functionality enhancements – 9/18/2018', 'The latest release of Magento Open Source includes important security enhancements along with performance and functionality improvements. With these important updates we strongly recommend that you upgrade to ensure your sites maintain the highest level of security. You can review the release notes for more information about all of the enhancements. For more information about security updates included in these versions of Magento please see our Security Center: https://magento.com/security/patches/magento-2.2.6-and-2.1.15-security-update', 'https://devdocs.magento.com/guides/v2.2/release-notes/bk-release-notes.html', 0, 0),
(3, 2, '2018-09-27 13:49:45', 'PHP 7.2 support patches are now available for Magento 1', 'PHP 7.2 support patches for Magento 1 are now available. It is critical you are on a supported version of PHP to ensure your site is secure and in compliance. For compatibility and download details, please visit our developer forum post.\n\nhttps://community.magento.com/t5/News-Announcements/PHP-7-2-Support-Patches-for-Magento-1-are-now-available/m-p/106999#M211', 'https://community.magento.com/t5/News-Announcements/PHP-7-2-Support-Patches-for-Magento-1-are-now-available/m-p/106999#M211', 0, 0),
(4, 4, '2018-10-30 17:23:29', 'Help Magento improve our product - take a brief survey ', 'We want your perspectives on Personalization and Experience Optimization. \n\nYour feedback is 100% confidential.\n\nExperience Optimization refers to A/B/n Testing, Recommendations, and Experience Targeting (dynamic content, emails, promotions, etc.)\n\nThank you!\n\nClick here\nhttps://www.surveymonkey.com/r/M1-Exp-Opt-Oct2018', 'https://www.surveymonkey.com/r/M1-Exp-Opt-Oct2018', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_admin_assert`
--

CREATE TABLE `jeu6_admin_assert` (
  `assert_id` int(10) UNSIGNED NOT NULL COMMENT 'Assert ID',
  `assert_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'Assert Type',
  `assert_data` text COMMENT 'Assert Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Assert Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_admin_role`
--

CREATE TABLE `jeu6_admin_role` (
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User ID',
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Role Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';

--
-- Dumping data for table `jeu6_admin_role`
--

INSERT INTO `jeu6_admin_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, 'Administrators'),
(2, 1, 2, 0, 'U', 1, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_admin_rule`
--

CREATE TABLE `jeu6_admin_rule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule ID',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Assert ID',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role Type',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';

--
-- Dumping data for table `jeu6_admin_rule`
--

INSERT INTO `jeu6_admin_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `assert_id`, `role_type`, `permission`) VALUES
(1, 1, 'all', NULL, 0, 'G', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_admin_user`
--

CREATE TABLE `jeu6_admin_user` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(100) DEFAULT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin User Table';

--
-- Dumping data for table `jeu6_admin_user`
--

INSERT INTO `jeu6_admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`, `rp_token`, `rp_token_created_at`) VALUES
(1, 'Site', 'Owner', 'sswarsi@hotmail.com', 'admin', '48dad946455ca66d3a6fe4535493453a:PFqMr0bNwZvAK5y2LaDCKdGuSRa7xVkT', '2018-11-16 14:43:15', '2018-11-09 23:11:14', '2018-11-16 13:26:51', 35, 0, 1, 'a:1:{s:11:\"configState\";a:148:{s:12:\"dev_restrict\";s:1:\"0\";s:9:\"dev_debug\";s:1:\"0\";s:20:\"dev_translate_inline\";s:1:\"0\";s:7:\"dev_log\";s:1:\"1\";s:6:\"dev_js\";s:1:\"0\";s:7:\"dev_css\";s:1:\"0\";s:31:\"advanced_modules_disable_output\";s:1:\"1\";s:22:\"configswatches_general\";s:1:\"1\";s:40:\"configswatches_product_detail_dimensions\";s:1:\"0\";s:41:\"configswatches_product_listing_dimensions\";s:1:\"0\";s:37:\"configswatches_layered_nav_dimensions\";s:1:\"0\";s:14:\"design_package\";s:1:\"1\";s:12:\"design_theme\";s:1:\"1\";s:11:\"design_head\";s:1:\"0\";s:13:\"design_header\";s:1:\"0\";s:13:\"design_footer\";s:1:\"0\";s:16:\"design_watermark\";s:1:\"0\";s:17:\"design_pagination\";s:1:\"0\";s:12:\"design_email\";s:1:\"0\";s:23:\"marcus_settings_general\";s:1:\"0\";s:22:\"marcus_settings_header\";s:1:\"1\";s:22:\"marcus_settings_footer\";s:1:\"0\";s:24:\"marcus_settings_category\";s:1:\"0\";s:33:\"marcus_settings_category_products\";s:1:\"0\";s:28:\"marcus_settings_product_info\";s:1:\"0\";s:31:\"marcus_settings_products_slider\";s:1:\"0\";s:31:\"marcus_settings_product_related\";s:1:\"0\";s:30:\"marcus_settings_product_upsell\";s:1:\"0\";s:30:\"marcus_settings_product_labels\";s:1:\"0\";s:32:\"marcus_settings_newsletter_popup\";s:1:\"0\";s:24:\"marcus_settings_contacts\";s:1:\"0\";s:29:\"marcus_settings_theme_install\";s:1:\"1\";s:15:\"payment_account\";s:1:\"1\";s:31:\"payment_paypal_group_all_in_one\";s:1:\"0\";s:24:\"payment_payflow_advanced\";s:1:\"0\";s:25:\"payment_required_settings\";s:1:\"1\";s:25:\"payment_payments_advanced\";s:1:\"1\";s:15:\"payment_express\";s:1:\"1\";s:30:\"payment_advanced_advertise_bml\";s:1:\"0\";s:38:\"payment_advanced_settings_bml_homepage\";s:1:\"0\";s:42:\"payment_advanced_settings_bml_categorypage\";s:1:\"0\";s:41:\"payment_advanced_settings_bml_productpage\";s:1:\"0\";s:38:\"payment_advanced_settings_bml_checkout\";s:1:\"0\";s:34:\"payment_settings_payments_advanced\";s:1:\"1\";s:43:\"payment_settings_payments_advanced_advanced\";s:1:\"0\";s:25:\"payment_billing_agreement\";s:1:\"0\";s:25:\"payment_settlement_report\";s:1:\"0\";s:16:\"payment_frontend\";s:1:\"0\";s:33:\"payment_settings_express_checkout\";s:1:\"1\";s:42:\"payment_settings_express_checkout_advanced\";s:1:\"0\";s:11:\"payment_wpp\";s:1:\"0\";s:29:\"payment_wpp_required_settings\";s:1:\"1\";s:32:\"payment_wpp_and_express_checkout\";s:1:\"1\";s:25:\"payment_wpp_advertise_bml\";s:1:\"0\";s:33:\"payment_wpp_settings_bml_homepage\";s:1:\"0\";s:37:\"payment_wpp_settings_bml_categorypage\";s:1:\"0\";s:36:\"payment_wpp_settings_bml_productpage\";s:1:\"0\";s:33:\"payment_wpp_settings_bml_checkout\";s:1:\"0\";s:20:\"payment_wpp_settings\";s:1:\"1\";s:29:\"payment_wpp_settings_advanced\";s:1:\"0\";s:29:\"payment_wpp_billing_agreement\";s:1:\"0\";s:29:\"payment_wpp_settlement_report\";s:1:\"0\";s:20:\"payment_wpp_frontend\";s:1:\"0\";s:37:\"payment_wpp_settings_express_checkout\";s:1:\"1\";s:46:\"payment_wpp_settings_express_checkout_advanced\";s:1:\"0\";s:19:\"payment_wps_express\";s:1:\"0\";s:37:\"payment_wps_express_checkout_required\";s:1:\"1\";s:54:\"payment_wps_express_checkout_required_express_checkout\";s:1:\"1\";s:33:\"payment_wps_express_advertise_bml\";s:1:\"0\";s:41:\"payment_wps_express_settings_bml_homepage\";s:1:\"0\";s:45:\"payment_wps_express_settings_bml_categorypage\";s:1:\"0\";s:44:\"payment_wps_express_settings_bml_productpage\";s:1:\"0\";s:41:\"payment_wps_express_settings_bml_checkout\";s:1:\"0\";s:28:\"payment_settings_wps_express\";s:1:\"1\";s:37:\"payment_settings_wps_express_advanced\";s:1:\"0\";s:37:\"payment_wps_express_billing_agreement\";s:1:\"0\";s:37:\"payment_wps_express_settlement_report\";s:1:\"0\";s:28:\"payment_wps_express_frontend\";s:1:\"0\";s:31:\"payment_paypal_payment_gateways\";s:1:\"0\";s:45:\"payment_paypal_verisign_with_express_checkout\";s:1:\"0\";s:31:\"payment_paypal_payflow_required\";s:1:\"1\";s:35:\"payment_paypal_payflow_api_settings\";s:1:\"1\";s:36:\"payment_paypal_payflow_advertise_bml\";s:1:\"0\";s:44:\"payment_paypal_payflow_settings_bml_homepage\";s:1:\"0\";s:48:\"payment_paypal_payflow_settings_bml_categorypage\";s:1:\"0\";s:47:\"payment_paypal_payflow_settings_bml_productpage\";s:1:\"0\";s:44:\"payment_paypal_payflow_settings_bml_checkout\";s:1:\"0\";s:31:\"payment_settings_paypal_payflow\";s:1:\"1\";s:40:\"payment_settings_paypal_payflow_advanced\";s:1:\"0\";s:40:\"payment_paypal_payflow_settlement_report\";s:1:\"0\";s:31:\"payment_paypal_payflow_frontend\";s:1:\"0\";s:39:\"payment_paypal_payflow_express_checkout\";s:1:\"1\";s:48:\"payment_paypal_payflow_express_checkout_advanced\";s:1:\"0\";s:20:\"payment_payflow_link\";s:1:\"0\";s:29:\"payment_payflow_link_required\";s:1:\"1\";s:33:\"payment_payflow_link_payflow_link\";s:1:\"1\";s:37:\"payment_payflow_link_express_checkout\";s:1:\"1\";s:34:\"payment_payflow_link_advertise_bml\";s:1:\"0\";s:42:\"payment_payflow_link_settings_bml_homepage\";s:1:\"0\";s:46:\"payment_payflow_link_settings_bml_categorypage\";s:1:\"0\";s:45:\"payment_payflow_link_settings_bml_productpage\";s:1:\"0\";s:42:\"payment_payflow_link_settings_bml_checkout\";s:1:\"0\";s:29:\"payment_settings_payflow_link\";s:1:\"1\";s:38:\"payment_settings_payflow_link_advanced\";s:1:\"0\";s:38:\"payment_payflow_link_settlement_report\";s:1:\"0\";s:29:\"payment_payflow_link_frontend\";s:1:\"0\";s:46:\"payment_settings_payflow_link_express_checkout\";s:1:\"1\";s:55:\"payment_settings_payflow_link_express_checkout_advanced\";s:1:\"0\";s:38:\"payment_payflow_link_billing_agreement\";s:1:\"0\";s:42:\"payment_paypal_alternative_payment_methods\";s:1:\"0\";s:24:\"payment_express_checkout\";s:1:\"0\";s:33:\"payment_express_checkout_required\";s:1:\"1\";s:50:\"payment_express_checkout_required_express_checkout\";s:1:\"1\";s:21:\"payment_advertise_bml\";s:1:\"0\";s:29:\"payment_settings_bml_homepage\";s:1:\"0\";s:33:\"payment_settings_bml_categorypage\";s:1:\"0\";s:32:\"payment_settings_bml_productpage\";s:1:\"0\";s:29:\"payment_settings_bml_checkout\";s:1:\"0\";s:19:\"payment_settings_ec\";s:1:\"1\";s:28:\"payment_settings_ec_advanced\";s:1:\"0\";s:42:\"payment_express_checkout_billing_agreement\";s:1:\"0\";s:42:\"payment_express_checkout_settlement_report\";s:1:\"0\";s:33:\"payment_express_checkout_frontend\";s:1:\"0\";s:14:\"payment_ccsave\";s:1:\"0\";s:15:\"payment_checkmo\";s:1:\"0\";s:12:\"payment_free\";s:1:\"0\";s:20:\"payment_banktransfer\";s:1:\"1\";s:22:\"payment_cashondelivery\";s:1:\"1\";s:21:\"payment_purchaseorder\";s:1:\"0\";s:31:\"payment_authorizenet_directpost\";s:1:\"0\";s:20:\"payment_authorizenet\";s:1:\"0\";s:16:\"currency_options\";s:1:\"1\";s:20:\"currency_webservicex\";s:1:\"0\";s:15:\"currency_import\";s:1:\"0\";s:15:\"shipping_origin\";s:1:\"1\";s:15:\"shipping_option\";s:1:\"1\";s:17:\"carriers_flatrate\";s:1:\"0\";s:18:\"carriers_tablerate\";s:1:\"0\";s:21:\"carriers_freeshipping\";s:1:\"0\";s:12:\"carriers_ups\";s:1:\"0\";s:13:\"carriers_usps\";s:1:\"0\";s:14:\"carriers_fedex\";s:1:\"0\";s:12:\"carriers_dhl\";s:1:\"0\";s:15:\"carriers_dhlint\";s:1:\"0\";s:15:\"general_country\";s:1:\"1\";s:14:\"general_region\";s:1:\"1\";s:14:\"general_locale\";s:1:\"0\";s:25:\"general_store_information\";s:1:\"0\";}}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api2_acl_attribute`
--

CREATE TABLE `jeu6_api2_acl_attribute` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `user_type` varchar(20) NOT NULL COMMENT 'Type of user',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `operation` varchar(20) NOT NULL COMMENT 'Operation',
  `allowed_attributes` text COMMENT 'Allowed attributes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Filter ACL Attributes';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api2_acl_role`
--

CREATE TABLE `jeu6_api2_acl_role` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `role_name` varchar(255) NOT NULL COMMENT 'Name of role'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Roles';

--
-- Dumping data for table `jeu6_api2_acl_role`
--

INSERT INTO `jeu6_api2_acl_role` (`entity_id`, `created_at`, `updated_at`, `role_name`) VALUES
(1, '2018-10-27 14:04:15', NULL, 'Guest'),
(2, '2018-10-27 14:04:15', NULL, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api2_acl_rule`
--

CREATE TABLE `jeu6_api2_acl_rule` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role ID',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `privilege` varchar(20) DEFAULT NULL COMMENT 'ACL Privilege'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Rules';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api2_acl_user`
--

CREATE TABLE `jeu6_api2_acl_user` (
  `admin_id` int(10) UNSIGNED NOT NULL COMMENT 'Admin ID',
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Users';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api_assert`
--

CREATE TABLE `jeu6_api_assert` (
  `assert_id` int(10) UNSIGNED NOT NULL COMMENT 'Assert id',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert type',
  `assert_data` text COMMENT 'Assert additional data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api_role`
--

CREATE TABLE `jeu6_api_role` (
  `role_id` int(10) UNSIGNED NOT NULL COMMENT 'Role id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent role id',
  `tree_level` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Role level in tree',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort order to display on admin area',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role type',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User id',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api_rule`
--

CREATE TABLE `jeu6_api_rule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Api rule Id',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Api role Id',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Module code',
  `api_privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Assert id',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role type',
  `api_permission` varchar(10) DEFAULT NULL COMMENT 'Permission'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api_session`
--

CREATE TABLE `jeu6_api_session` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User id',
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Login date',
  `sessid` varchar(40) DEFAULT NULL COMMENT 'Sessioin id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_api_user`
--

CREATE TABLE `jeu6_api_user` (
  `user_id` int(10) UNSIGNED NOT NULL COMMENT 'User id',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'First name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'Last name',
  `email` varchar(128) DEFAULT NULL COMMENT 'Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'Nickname',
  `api_key` varchar(100) DEFAULT NULL COMMENT 'Api key',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User record create date',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User record modify date',
  `lognum` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quantity of log ins',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Refresh ACL flag',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Account status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_aw_blog`
--

CREATE TABLE `jeu6_aw_blog` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `post_content` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `update_user` varchar(255) NOT NULL DEFAULT '',
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `comments` tinyint(11) NOT NULL,
  `tags` text NOT NULL,
  `short_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_aw_blog_cat`
--

CREATE TABLE `jeu6_aw_blog_cat` (
  `cat_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(6) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jeu6_aw_blog_cat`
--

INSERT INTO `jeu6_aw_blog_cat` (`cat_id`, `title`, `identifier`, `sort_order`, `meta_keywords`, `meta_description`) VALUES
(1, 'News', 'news', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_aw_blog_cat_store`
--

CREATE TABLE `jeu6_aw_blog_cat_store` (
  `cat_id` smallint(6) UNSIGNED DEFAULT NULL,
  `store_id` smallint(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_aw_blog_comment`
--

CREATE TABLE `jeu6_aw_blog_comment` (
  `comment_id` int(11) UNSIGNED NOT NULL,
  `post_id` smallint(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `user` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_aw_blog_post_cat`
--

CREATE TABLE `jeu6_aw_blog_post_cat` (
  `cat_id` smallint(6) UNSIGNED DEFAULT NULL,
  `post_id` smallint(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_aw_blog_store`
--

CREATE TABLE `jeu6_aw_blog_store` (
  `post_id` smallint(6) UNSIGNED DEFAULT NULL,
  `store_id` smallint(6) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_aw_blog_tags`
--

CREATE TABLE `jeu6_aw_blog_tags` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `tag_count` int(11) NOT NULL DEFAULT '0',
  `store_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_captcha_log`
--

CREATE TABLE `jeu6_captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cataloginventory_stock`
--

CREATE TABLE `jeu6_cataloginventory_stock` (
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';

--
-- Dumping data for table `jeu6_cataloginventory_stock`
--

INSERT INTO `jeu6_cataloginventory_stock` (`stock_id`, `stock_name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cataloginventory_stock_item`
--

CREATE TABLE `jeu6_cataloginventory_stock_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';

--
-- Dumping data for table `jeu6_cataloginventory_stock_item`
--

INSERT INTO `jeu6_cataloginventory_stock_item` (`item_id`, `product_id`, `stock_id`, `qty`, `min_qty`, `use_config_min_qty`, `is_qty_decimal`, `backorders`, `use_config_backorders`, `min_sale_qty`, `use_config_min_sale_qty`, `max_sale_qty`, `use_config_max_sale_qty`, `is_in_stock`, `low_stock_date`, `notify_stock_qty`, `use_config_notify_stock_qty`, `manage_stock`, `use_config_manage_stock`, `stock_status_changed_auto`, `use_config_qty_increments`, `qty_increments`, `use_config_enable_qty_inc`, `enable_qty_increments`, `is_decimal_divided`) VALUES
(8, 8, 1, '0.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 0, '2018-10-27 22:47:10', NULL, 1, 0, 1, 1, 1, '0.0000', 1, 0, 0),
(9, 9, 1, '0.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 0, '2018-10-27 22:50:50', NULL, 1, 0, 1, 1, 1, '0.0000', 1, 0, 0),
(10, 10, 1, '10.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(11, 11, 1, '10.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0),
(12, 12, 1, '0.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 0, 1, 0, 1, '0.0000', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cataloginventory_stock_status`
--

CREATE TABLE `jeu6_cataloginventory_stock_status` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Dumping data for table `jeu6_cataloginventory_stock_status`
--

INSERT INTO `jeu6_cataloginventory_stock_status` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(8, 1, 1, '0.0000', 0),
(9, 1, 1, '0.0000', 0),
(10, 1, 1, '10.0000', 1),
(11, 1, 1, '10.0000', 1),
(12, 1, 1, '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cataloginventory_stock_status_idx`
--

CREATE TABLE `jeu6_cataloginventory_stock_status_idx` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';

--
-- Dumping data for table `jeu6_cataloginventory_stock_status_idx`
--

INSERT INTO `jeu6_cataloginventory_stock_status_idx` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(8, 1, 1, '0.0000', 0),
(9, 1, 1, '0.0000', 0),
(10, 1, 1, '10.0000', 1),
(11, 1, 1, '10.0000', 1),
(12, 1, 1, '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cataloginventory_stock_status_tmp`
--

CREATE TABLE `jeu6_cataloginventory_stock_status_tmp` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Status'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogrule`
--

CREATE TABLE `jeu6_catalogrule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From Date',
  `to_date` date DEFAULT NULL COMMENT 'To Date',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `sub_is_enable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Rule Enable For Subitems',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogrule_affected_product`
--

CREATE TABLE `jeu6_catalogrule_affected_product` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Affected Product';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogrule_customer_group`
--

CREATE TABLE `jeu6_catalogrule_customer_group` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogrule_group_website`
--

CREATE TABLE `jeu6_catalogrule_group_website` (
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogrule_product`
--

CREATE TABLE `jeu6_catalogrule_product` (
  `rule_product_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Product Id',
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogrule_product_price`
--

CREATE TABLE `jeu6_catalogrule_product_price` (
  `rule_product_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogrule_website`
--

CREATE TABLE `jeu6_catalogrule_website` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogsearch_fulltext`
--

CREATE TABLE `jeu6_catalogsearch_fulltext` (
  `fulltext_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `data_index` longtext COMMENT 'Data index'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';

--
-- Dumping data for table `jeu6_catalogsearch_fulltext`
--

INSERT INTO `jeu6_catalogsearch_fulltext` (`fulltext_id`, `product_id`, `store_id`, `data_index`) VALUES
(8, 12, 1, 'PRE0000013|None|None|None|color switcher|color switcher-red|color switcher-green|f ef wf f efef|cass ff f f ff ffmmwef;|cass ff f f ff ffmmwef;|wef w g gw gew g|fef r lwer r l3r32lr|fef r lwer r l3r32lr|1000|100|100|Red|Green|1');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogsearch_query`
--

CREATE TABLE `jeu6_catalogsearch_query` (
  `query_id` int(10) UNSIGNED NOT NULL COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `synonym_for` varchar(255) DEFAULT NULL COMMENT 'Synonym for',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog search query table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalogsearch_result`
--

CREATE TABLE `jeu6_catalogsearch_result` (
  `query_id` int(10) UNSIGNED NOT NULL COMMENT 'Query ID',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product ID',
  `relevance` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Relevance'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_anc_categs_index_idx`
--

CREATE TABLE `jeu6_catalog_category_anc_categs_index_idx` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Path'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_anc_categs_index_tmp`
--

CREATE TABLE `jeu6_catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Path'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_anc_products_index_idx`
--

CREATE TABLE `jeu6_catalog_category_anc_products_index_idx` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_anc_products_index_tmp`
--

CREATE TABLE `jeu6_catalog_category_anc_products_index_tmp` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_entity`
--

CREATE TABLE `jeu6_catalog_category_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';

--
-- Dumping data for table `jeu6_catalog_category_entity`
--

INSERT INTO `jeu6_catalog_category_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, 0, '2011-08-18 22:28:30', '2011-08-18 22:28:30', '1', 0, 0, 2),
(2, 3, 3, 1, '2011-08-18 22:28:30', '2011-08-18 22:28:30', '1/2', 1, 1, 1),
(3, 3, 3, 2, '2018-10-27 22:35:57', '2018-10-27 22:35:57', '1/2/3', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_entity_datetime`
--

CREATE TABLE `jeu6_catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_category_entity_datetime`
--

INSERT INTO `jeu6_catalog_category_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 51, 0, 3, NULL),
(2, 3, 52, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_entity_decimal`
--

CREATE TABLE `jeu6_catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_category_entity_decimal`
--

INSERT INTO `jeu6_catalog_category_entity_decimal` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 62, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_entity_int`
--

CREATE TABLE `jeu6_catalog_category_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_category_entity_int`
--

INSERT INTO `jeu6_catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 59, 0, 1, 1),
(2, 3, 59, 1, 1, 1),
(3, 3, 34, 0, 2, 1),
(4, 3, 59, 0, 2, 1),
(5, 3, 34, 1, 2, 1),
(6, 3, 59, 1, 2, 1),
(7, 3, 34, 0, 3, 1),
(8, 3, 59, 0, 3, 1),
(9, 3, 42, 0, 3, NULL),
(10, 3, 43, 0, 3, 0),
(11, 3, 60, 0, 3, 0),
(12, 3, 61, 0, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_entity_text`
--

CREATE TABLE `jeu6_catalog_category_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_category_entity_text`
--

INSERT INTO `jeu6_catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 57, 0, 1, NULL),
(2, 3, 57, 1, 1, NULL),
(3, 3, 57, 0, 2, NULL),
(4, 3, 57, 1, 2, NULL),
(5, 3, 36, 0, 3, NULL),
(6, 3, 39, 0, 3, NULL),
(7, 3, 40, 0, 3, NULL),
(8, 3, 54, 0, 3, NULL),
(9, 3, 57, 0, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_entity_varchar`
--

CREATE TABLE `jeu6_catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_category_entity_varchar`
--

INSERT INTO `jeu6_catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 33, 0, 1, 'Root Catalog'),
(2, 3, 33, 1, 1, 'Root Catalog'),
(3, 3, 35, 1, 1, 'root-catalog'),
(4, 3, 33, 0, 2, 'Default Category'),
(5, 3, 33, 1, 2, 'Default Category'),
(6, 3, 41, 1, 2, 'PRODUCTS'),
(7, 3, 35, 1, 2, 'default-category'),
(8, 3, 33, 0, 3, 'Home'),
(9, 3, 35, 0, 3, 'home'),
(10, 3, 38, 0, 3, NULL),
(11, 3, 41, 0, 3, 'PRODUCTS'),
(12, 3, 50, 0, 3, NULL),
(13, 3, 53, 0, 3, NULL),
(14, 3, 49, 1, 3, 'home.html'),
(15, 3, 49, 0, 3, 'home.html');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_flat_store_1`
--

CREATE TABLE `jeu6_catalog_category_flat_store_1` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'entity_id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'parent_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'path',
  `position` int(11) NOT NULL COMMENT 'position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'level',
  `children_count` int(11) NOT NULL COMMENT 'children_count',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `all_children` text COMMENT 'All Children',
  `available_sort_by` text COMMENT 'Available Product Listing Sort By',
  `children` text COMMENT 'Children',
  `custom_apply_to_products` int(11) DEFAULT NULL COMMENT 'Apply To Products',
  `custom_design` varchar(255) DEFAULT NULL COMMENT 'Custom Design',
  `custom_design_from` datetime DEFAULT NULL COMMENT 'Active From',
  `custom_design_to` datetime DEFAULT NULL COMMENT 'Active To',
  `custom_layout_update` text COMMENT 'Custom Layout Update',
  `custom_use_parent_settings` int(11) DEFAULT NULL COMMENT 'Use Parent Category Settings',
  `default_sort_by` varchar(255) DEFAULT NULL COMMENT 'Default Product Listing Sort By',
  `description` text COMMENT 'Description',
  `display_mode` varchar(255) DEFAULT NULL COMMENT 'Display Mode',
  `filter_price_range` decimal(12,4) DEFAULT NULL COMMENT 'Layered Navigation Price Step',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `include_in_menu` int(11) DEFAULT NULL COMMENT 'Include in Navigation Menu',
  `is_active` int(11) DEFAULT NULL COMMENT 'Is Active',
  `is_anchor` int(11) DEFAULT NULL COMMENT 'Is Anchor',
  `landing_page` int(11) DEFAULT NULL COMMENT 'CMS Block',
  `meta_description` text COMMENT 'Meta Description',
  `meta_keywords` text COMMENT 'Meta Keywords',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `path_in_store` text COMMENT 'Path In Store',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT 'Thumbnail Image',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'URL Key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'Url Path'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Flat (Store 1)';

--
-- Dumping data for table `jeu6_catalog_category_flat_store_1`
--

INSERT INTO `jeu6_catalog_category_flat_store_1` (`entity_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`, `store_id`, `all_children`, `available_sort_by`, `children`, `custom_apply_to_products`, `custom_design`, `custom_design_from`, `custom_design_to`, `custom_layout_update`, `custom_use_parent_settings`, `default_sort_by`, `description`, `display_mode`, `filter_price_range`, `image`, `include_in_menu`, `is_active`, `is_anchor`, `landing_page`, `meta_description`, `meta_keywords`, `meta_title`, `name`, `page_layout`, `path_in_store`, `thumbnail`, `url_key`, `url_path`) VALUES
(1, 0, '2011-08-18 22:28:30', '2011-08-18 22:28:30', '1', 0, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Root Catalog', NULL, NULL, NULL, 'root-catalog', NULL),
(2, 1, '2011-08-18 22:28:30', '2011-08-18 22:28:30', '1/2', 1, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRODUCTS', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 'Default Category', NULL, NULL, NULL, 'default-category', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_product`
--

CREATE TABLE `jeu6_catalog_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';

--
-- Dumping data for table `jeu6_catalog_category_product`
--

INSERT INTO `jeu6_catalog_category_product` (`category_id`, `product_id`, `position`) VALUES
(3, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_product_index`
--

CREATE TABLE `jeu6_catalog_category_product_index` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

--
-- Dumping data for table `jeu6_catalog_category_product_index`
--

INSERT INTO `jeu6_catalog_category_product_index` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2, 10, 0, 1, 1, 1),
(2, 11, 0, 1, 1, 1),
(2, 12, 20005, 0, 1, 4),
(2, 8, 0, 1, 1, 4),
(2, 9, 0, 1, 1, 4),
(3, 12, 1, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_product_index_enbl_idx`
--

CREATE TABLE `jeu6_catalog_category_product_index_enbl_idx` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_product_index_enbl_tmp`
--

CREATE TABLE `jeu6_catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visibility'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_product_index_idx`
--

CREATE TABLE `jeu6_catalog_category_product_index_idx` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_category_product_index_tmp`
--

CREATE TABLE `jeu6_catalog_category_product_index_tmp` (
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL COMMENT 'Visibility'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_compare_item`
--

CREATE TABLE `jeu6_catalog_compare_item` (
  `catalog_compare_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Compare Item ID',
  `visitor_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_eav_attribute`
--

CREATE TABLE `jeu6_catalog_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `is_configurable` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Configurable',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `jeu6_catalog_eav_attribute`
--

INSERT INTO `jeu6_catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `is_configurable`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`) VALUES
(33, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(34, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(35, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(36, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0),
(37, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(38, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(39, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(40, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(41, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(42, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(43, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(44, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(45, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(46, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(47, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(48, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(49, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(50, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(51, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(52, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(53, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(54, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(56, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(57, 'adminhtml/catalog_category_helper_sortby_available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(58, 'adminhtml/catalog_category_helper_sortby_default', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(59, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(61, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(62, 'adminhtml/catalog_category_helper_pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(63, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, NULL, 1, 0, 0, 0),
(64, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, NULL, 1, 0, 1, 0),
(65, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, NULL, 1, 0, 1, 0),
(66, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, 1, 0, 0, 0),
(67, NULL, 2, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 'simple,configurable,virtual,bundle,downloadable', 1, 0, 0, 0),
(68, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(69, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(70, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(71, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'virtual,downloadable', 0, 0, 0, 0),
(72, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,bundle', 0, 0, 0, 0),
(73, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'simple', 1, 0, 0, 0),
(74, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(75, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(76, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(77, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(78, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(79, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(80, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(81, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(82, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(83, NULL, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable', 1, 0, 0, 0),
(84, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(85, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(86, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(87, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(88, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(89, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(90, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(91, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual', 0, 0, 0, 0),
(92, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual', 0, 0, 0, 0),
(93, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(94, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(95, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(96, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(97, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(98, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(99, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(100, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(101, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0),
(102, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(103, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(104, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(105, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(106, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(107, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(108, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,configurable,bundle,grouped', 0, 0, 0, 0),
(109, 'adminhtml/catalog_product_helper_form_msrp_enabled', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0),
(110, 'adminhtml/catalog_product_helper_form_msrp_price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0),
(111, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,bundle,configurable,virtual,downloadable', 0, 0, 0, 0),
(112, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0),
(113, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 'simple,configurable,virtual,downloadable,bundle', 1, 0, 0, 0),
(114, 'giftmessage/adminhtml_product_helper_form_config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0),
(115, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(116, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0),
(117, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(118, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(119, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'bundle', 0, 0, 0, 0),
(120, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'downloadable', 0, 0, 0, 0),
(121, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0),
(122, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0),
(123, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'downloadable', 0, 0, 0, 0),
(124, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(125, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, 0, 0, 0),
(136, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'simple,configurable,virtual,bundle,downloadable', 0, 0, 0, 0),
(137, NULL, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 'simple,configurable', 0, 0, 0, 0),
(138, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(139, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(140, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(141, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(142, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(143, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(144, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(145, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(146, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(147, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0),
(148, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0),
(149, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0),
(150, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0),
(151, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_bundle_option`
--

CREATE TABLE `jeu6_catalog_product_bundle_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_bundle_option_value`
--

CREATE TABLE `jeu6_catalog_product_bundle_option_value` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value Id',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_bundle_price_index`
--

CREATE TABLE `jeu6_catalog_product_bundle_price_index` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_bundle_selection`
--

CREATE TABLE `jeu6_catalog_product_bundle_selection` (
  `selection_id` int(10) UNSIGNED NOT NULL COMMENT 'Selection Id',
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `position` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_bundle_selection_price`
--

CREATE TABLE `jeu6_catalog_product_bundle_selection_price` (
  `selection_id` int(10) UNSIGNED NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_bundle_stock_index`
--

CREATE TABLE `jeu6_catalog_product_bundle_stock_index` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_enabled_index`
--

CREATE TABLE `jeu6_catalog_product_enabled_index` (
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visibility'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Visibility Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity`
--

CREATE TABLE `jeu6_catalog_product_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';

--
-- Dumping data for table `jeu6_catalog_product_entity`
--

INSERT INTO `jeu6_catalog_product_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `type_id`, `sku`, `has_options`, `required_options`, `created_at`, `updated_at`) VALUES
(8, 4, 4, 'simple', '11111', 0, 0, '2018-10-27 22:47:10', '2018-10-27 22:47:10'),
(9, 4, 4, 'simple', '433', 0, 0, '2018-10-27 22:50:50', '2018-10-27 22:50:50'),
(10, 4, 9, 'simple', 'PRE0000010', 0, 0, '2018-11-12 00:05:27', '2018-11-12 00:13:18'),
(11, 4, 9, 'simple', 'PRE0000012', 0, 0, '2018-11-12 00:05:42', '2018-11-12 00:07:36'),
(12, 4, 9, 'configurable', 'PRE0000013', 1, 1, '2018-11-12 00:09:23', '2018-11-15 04:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_datetime`
--

CREATE TABLE `jeu6_catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_product_entity_datetime`
--

INSERT INTO `jeu6_catalog_product_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(85, 4, 84, 0, 8, NULL),
(86, 4, 85, 0, 8, NULL),
(87, 4, 69, 0, 8, NULL),
(88, 4, 70, 0, 8, NULL),
(89, 4, 95, 0, 8, NULL),
(90, 4, 96, 0, 8, NULL),
(91, 4, 84, 0, 9, NULL),
(92, 4, 85, 0, 9, NULL),
(93, 4, 69, 0, 9, NULL),
(94, 4, 70, 0, 9, NULL),
(95, 4, 95, 0, 9, NULL),
(96, 4, 96, 0, 9, NULL),
(97, 4, 84, 0, 10, NULL),
(98, 4, 85, 0, 10, NULL),
(99, 4, 69, 0, 10, NULL),
(100, 4, 70, 0, 10, NULL),
(101, 4, 95, 0, 10, NULL),
(102, 4, 96, 0, 10, NULL),
(103, 4, 69, 0, 11, NULL),
(104, 4, 70, 0, 11, NULL),
(105, 4, 84, 0, 11, NULL),
(106, 4, 85, 0, 11, NULL),
(107, 4, 95, 0, 11, NULL),
(108, 4, 96, 0, 11, NULL),
(115, 4, 84, 0, 12, NULL),
(116, 4, 85, 0, 12, NULL),
(117, 4, 69, 0, 12, NULL),
(118, 4, 70, 0, 12, NULL),
(119, 4, 95, 0, 12, NULL),
(120, 4, 96, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_decimal`
--

CREATE TABLE `jeu6_catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_product_entity_decimal`
--

INSERT INTO `jeu6_catalog_product_entity_decimal` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(50, 4, 72, 0, 8, '10.0000'),
(51, 4, 67, 0, 8, '1000.0000'),
(52, 4, 68, 0, 8, NULL),
(53, 4, 111, 0, 8, NULL),
(54, 4, 72, 0, 9, '10.0000'),
(55, 4, 67, 0, 9, '1000.0000'),
(56, 4, 68, 0, 9, NULL),
(57, 4, 111, 0, 9, NULL),
(58, 4, 72, 0, 10, '0.0000'),
(59, 4, 67, 0, 10, '100.0000'),
(60, 4, 68, 0, 10, NULL),
(61, 4, 111, 0, 10, NULL),
(62, 4, 67, 0, 11, '100.0000'),
(63, 4, 68, 0, 11, NULL),
(64, 4, 72, 0, 11, '0.0000'),
(65, 4, 111, 0, 11, NULL),
(69, 4, 67, 0, 12, '1000.0000'),
(70, 4, 68, 0, 12, NULL),
(71, 4, 111, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_gallery`
--

CREATE TABLE `jeu6_catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_group_price`
--

CREATE TABLE `jeu6_catalog_product_entity_group_price` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `is_percent` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Percent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_int`
--

CREATE TABLE `jeu6_catalog_product_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_product_entity_int`
--

INSERT INTO `jeu6_catalog_product_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(38, 4, 87, 0, 8, 1),
(39, 4, 93, 0, 8, 4),
(40, 4, 125, 0, 8, 0),
(41, 4, 113, 0, 8, 0),
(42, 4, 91, 0, 8, 0),
(43, 4, 87, 0, 9, 1),
(44, 4, 93, 0, 9, 4),
(45, 4, 125, 0, 9, 0),
(46, 4, 113, 0, 9, 0),
(47, 4, 91, 0, 9, 0),
(48, 4, 87, 0, 10, 1),
(49, 4, 93, 0, 10, 1),
(50, 4, 125, 0, 10, 0),
(51, 4, 83, 0, 10, 4),
(52, 4, 137, 0, 10, 11),
(53, 4, 113, 0, 10, 0),
(54, 4, 91, 0, 10, 0),
(55, 4, 83, 0, 11, 5),
(56, 4, 87, 0, 11, 1),
(57, 4, 91, 0, 11, 0),
(58, 4, 93, 0, 11, 1),
(59, 4, 113, 0, 11, 0),
(60, 4, 125, 0, 11, 0),
(61, 4, 137, 0, 11, 11),
(63, 4, 87, 0, 12, 1),
(64, 4, 93, 0, 12, 4),
(65, 4, 125, 0, 12, 0),
(66, 4, 113, 0, 12, 0),
(67, 4, 83, 0, 12, NULL),
(68, 4, 137, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_media_gallery`
--

CREATE TABLE `jeu6_catalog_product_entity_media_gallery` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_product_entity_media_gallery`
--

INSERT INTO `jeu6_catalog_product_entity_media_gallery` (`value_id`, `attribute_id`, `entity_id`, `value`) VALUES
(1, 80, 12, '/p/r/product-01_1jpg.image.273x338.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_media_gallery_value`
--

CREATE TABLE `jeu6_catalog_product_entity_media_gallery_value` (
  `value_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) UNSIGNED DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Disabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';

--
-- Dumping data for table `jeu6_catalog_product_entity_media_gallery_value`
--

INSERT INTO `jeu6_catalog_product_entity_media_gallery_value` (`value_id`, `store_id`, `label`, `position`, `disabled`) VALUES
(1, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_text`
--

CREATE TABLE `jeu6_catalog_product_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_product_entity_text`
--

INSERT INTO `jeu6_catalog_product_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(44, 4, 64, 0, 8, 'scsavsvssvs'),
(45, 4, 65, 0, 8, 'asvavssav'),
(46, 4, 75, 0, 8, NULL),
(47, 4, 97, 0, 8, NULL),
(48, 4, 64, 0, 9, 'ffafffwfwfwqf'),
(49, 4, 65, 0, 9, 'ffwqffwfwfw'),
(50, 4, 75, 0, 9, NULL),
(51, 4, 97, 0, 9, NULL),
(52, 4, 64, 0, 10, 'cass ff f  f ff ffmmwef;'),
(53, 4, 65, 0, 10, 'fef r lwer r l3r32lr'),
(54, 4, 75, 0, 10, NULL),
(55, 4, 97, 0, 10, NULL),
(56, 4, 64, 0, 11, 'cass ff f  f ff ffmmwef;'),
(57, 4, 65, 0, 11, 'fef r lwer r l3r32lr'),
(58, 4, 75, 0, 11, NULL),
(59, 4, 97, 0, 11, NULL),
(62, 4, 64, 0, 12, 'f ef wf f efef'),
(63, 4, 65, 0, 12, 'wef w g gw gew g'),
(64, 4, 75, 0, 12, NULL),
(65, 4, 97, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_tier_price`
--

CREATE TABLE `jeu6_catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_entity_varchar`
--

CREATE TABLE `jeu6_catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value ID',
  `entity_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';

--
-- Dumping data for table `jeu6_catalog_product_entity_varchar`
--

INSERT INTO `jeu6_catalog_product_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(155, 4, 63, 0, 8, 'test'),
(156, 4, 88, 0, 8, 'test'),
(157, 4, 108, 0, 8, NULL),
(158, 4, 109, 0, 8, '2'),
(159, 4, 110, 0, 8, '4'),
(160, 4, 74, 0, 8, NULL),
(161, 4, 76, 0, 8, NULL),
(162, 4, 77, 0, 8, 'no_selection'),
(163, 4, 78, 0, 8, 'no_selection'),
(164, 4, 79, 0, 8, 'no_selection'),
(165, 4, 94, 0, 8, NULL),
(166, 4, 98, 0, 8, NULL),
(167, 4, 100, 0, 8, 'container2'),
(168, 4, 114, 0, 8, NULL),
(169, 4, 89, 1, 8, 'test.html'),
(170, 4, 89, 0, 8, 'test.html'),
(171, 4, 63, 0, 9, 'aqfwf fev eve'),
(172, 4, 88, 0, 9, 'aqfwf-fev-eve'),
(173, 4, 108, 0, 9, NULL),
(174, 4, 109, 0, 9, '2'),
(175, 4, 110, 0, 9, '4'),
(176, 4, 74, 0, 9, NULL),
(177, 4, 76, 0, 9, NULL),
(178, 4, 77, 0, 9, 'no_selection'),
(179, 4, 78, 0, 9, 'no_selection'),
(180, 4, 79, 0, 9, 'no_selection'),
(181, 4, 94, 0, 9, NULL),
(182, 4, 98, 0, 9, NULL),
(183, 4, 100, 0, 9, 'container2'),
(184, 4, 114, 0, 9, NULL),
(185, 4, 89, 1, 9, 'aqfwf-fev-eve.html'),
(186, 4, 89, 0, 9, 'aqfwf-fev-eve.html'),
(187, 4, 63, 0, 10, 'color switcher-red'),
(188, 4, 88, 0, 10, 'color-switcher-red'),
(189, 4, 108, 0, 10, NULL),
(190, 4, 109, 0, 10, '2'),
(191, 4, 110, 0, 10, '4'),
(192, 4, 74, 0, 10, NULL),
(193, 4, 76, 0, 10, NULL),
(194, 4, 77, 0, 10, 'no_selection'),
(195, 4, 78, 0, 10, 'no_selection'),
(196, 4, 79, 0, 10, 'no_selection'),
(197, 4, 94, 0, 10, NULL),
(198, 4, 98, 0, 10, NULL),
(199, 4, 100, 0, 10, 'container2'),
(200, 4, 114, 0, 10, NULL),
(201, 4, 89, 1, 10, 'color-switcher-red.html'),
(202, 4, 89, 0, 10, 'color-switcher-red.html'),
(203, 4, 63, 0, 11, 'color switcher-green'),
(204, 4, 74, 0, 11, NULL),
(205, 4, 76, 0, 11, NULL),
(206, 4, 77, 0, 11, 'no_selection'),
(207, 4, 78, 0, 11, 'no_selection'),
(208, 4, 79, 0, 11, 'no_selection'),
(209, 4, 88, 0, 11, 'color-switcher-red'),
(210, 4, 89, 0, 11, 'color-switcher-red-11.html'),
(211, 4, 94, 0, 11, NULL),
(212, 4, 98, 0, 11, NULL),
(213, 4, 100, 0, 11, 'container2'),
(214, 4, 108, 0, 11, NULL),
(215, 4, 109, 0, 11, '2'),
(216, 4, 110, 0, 11, '4'),
(217, 4, 114, 0, 11, NULL),
(218, 4, 89, 1, 11, 'color-switcher-red-11.html'),
(227, 4, 63, 0, 12, 'color switcher'),
(228, 4, 88, 0, 12, 'color-switcher'),
(229, 4, 108, 0, 12, NULL),
(230, 4, 109, 0, 12, '2'),
(231, 4, 110, 0, 12, '4'),
(232, 4, 74, 0, 12, NULL),
(233, 4, 76, 0, 12, NULL),
(234, 4, 77, 0, 12, '/p/r/product-01_1jpg.image.273x338.jpg'),
(235, 4, 78, 0, 12, '/p/r/product-01_1jpg.image.273x338.jpg'),
(236, 4, 79, 0, 12, '/p/r/product-01_1jpg.image.273x338.jpg'),
(237, 4, 94, 0, 12, NULL),
(238, 4, 98, 0, 12, NULL),
(239, 4, 100, 0, 12, 'container2'),
(240, 4, 114, 0, 12, NULL),
(241, 4, 89, 1, 12, 'color-switcher.html'),
(242, 4, 89, 0, 12, 'color-switcher.html'),
(255, 4, 103, 0, 12, NULL),
(256, 4, 104, 0, 12, NULL),
(257, 4, 105, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_flat_1`
--

CREATE TABLE `jeu6_catalog_product_flat_1` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'entity_id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'attribute_set_id',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'type_id',
  `cost` decimal(12,4) DEFAULT NULL COMMENT 'cost',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `gift_message_available` smallint(6) DEFAULT NULL COMMENT 'gift_message_available',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'has_options',
  `image_label` varchar(255) DEFAULT NULL COMMENT 'image_label',
  `is_imported` smallint(6) DEFAULT NULL COMMENT 'is_imported',
  `is_recurring` smallint(6) DEFAULT NULL COMMENT 'is_recurring',
  `links_exist` int(11) DEFAULT NULL COMMENT 'links_exist',
  `links_purchased_separately` int(11) DEFAULT NULL COMMENT 'links_purchased_separately',
  `links_title` varchar(255) DEFAULT NULL COMMENT 'links_title',
  `msrp` decimal(12,4) DEFAULT NULL COMMENT 'msrp',
  `msrp_display_actual_price_type` varchar(255) DEFAULT NULL COMMENT 'msrp_display_actual_price_type',
  `msrp_enabled` smallint(6) DEFAULT NULL COMMENT 'msrp_enabled',
  `name` varchar(255) DEFAULT NULL COMMENT 'name',
  `news_from_date` datetime DEFAULT NULL COMMENT 'news_from_date',
  `news_to_date` datetime DEFAULT NULL COMMENT 'news_to_date',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'price',
  `price_type` int(11) DEFAULT NULL COMMENT 'price_type',
  `price_view` int(11) DEFAULT NULL COMMENT 'price_view',
  `recurring_profile` text COMMENT 'recurring_profile',
  `required_options` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'required_options',
  `shipment_type` int(11) DEFAULT NULL COMMENT 'shipment_type',
  `short_description` text COMMENT 'short_description',
  `sku` varchar(64) DEFAULT NULL COMMENT 'sku',
  `sku_type` int(11) DEFAULT NULL COMMENT 'sku_type',
  `small_image` varchar(255) DEFAULT NULL COMMENT 'small_image',
  `small_image_label` varchar(255) DEFAULT NULL COMMENT 'small_image_label',
  `special_from_date` datetime DEFAULT NULL COMMENT 'special_from_date',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'special_price',
  `special_to_date` datetime DEFAULT NULL COMMENT 'special_to_date',
  `status` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'status',
  `tax_class_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'tax_class_id',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT 'thumbnail',
  `thumbnail_label` varchar(255) DEFAULT NULL COMMENT 'thumbnail_label',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'url_key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'url_path',
  `visibility` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'visibility',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'weight',
  `weight_type` int(11) DEFAULT NULL COMMENT 'weight_type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Flat (Store 1)';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_eav`
--

CREATE TABLE `jeu6_catalog_product_index_eav` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Dumping data for table `jeu6_catalog_product_index_eav`
--

INSERT INTO `jeu6_catalog_product_index_eav` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(12, 83, 1, 4),
(12, 83, 1, 5),
(12, 113, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_eav_decimal`
--

CREATE TABLE `jeu6_catalog_product_index_eav_decimal` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_eav_decimal_idx`
--

CREATE TABLE `jeu6_catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_eav_decimal_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_eav_idx`
--

CREATE TABLE `jeu6_catalog_product_index_eav_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';

--
-- Dumping data for table `jeu6_catalog_product_index_eav_idx`
--

INSERT INTO `jeu6_catalog_product_index_eav_idx` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(12, 83, 1, 4),
(12, 83, 1, 5),
(12, 113, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_eav_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_eav_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'Value'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';

--
-- Dumping data for table `jeu6_catalog_product_index_eav_tmp`
--

INSERT INTO `jeu6_catalog_product_index_eav_tmp` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(12, 113, 1, 0),
(12, 83, 1, 4),
(12, 83, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_group_price`
--

CREATE TABLE `jeu6_catalog_product_index_group_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price`
--

CREATE TABLE `jeu6_catalog_product_index_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Dumping data for table `jeu6_catalog_product_index_price`
--

INSERT INTO `jeu6_catalog_product_index_price` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(10, 0, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(10, 1, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(10, 2, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(10, 3, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 0, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 1, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 2, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 3, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(12, 0, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 1, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 2, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 3, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_bundle_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_bundle_opt_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_bundle_opt_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_bundle_sel_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_bundle_sel_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_bundle_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) UNSIGNED NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_cfg_opt_agr_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index ';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_cfg_opt_agr_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp T';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_cfg_opt_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_cfg_opt_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_downlod_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_downlod_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_final_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_final_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_final_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_final_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';

--
-- Dumping data for table `jeu6_catalog_product_index_price_idx`
--

INSERT INTO `jeu6_catalog_product_index_price_idx` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(10, 0, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(10, 1, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(10, 2, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(10, 3, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 0, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 1, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 2, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(11, 3, 1, 0, '100.0000', '100.0000', '100.0000', '100.0000', NULL, NULL),
(12, 0, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 1, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 2, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 3, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_opt_agr_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_opt_agr_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_opt_idx`
--

CREATE TABLE `jeu6_catalog_product_index_price_opt_idx` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_opt_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_price_tmp`
--

CREATE TABLE `jeu6_catalog_product_index_price_tmp` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price'
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';

--
-- Dumping data for table `jeu6_catalog_product_index_price_tmp`
--

INSERT INTO `jeu6_catalog_product_index_price_tmp` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(12, 0, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 1, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 2, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL),
(12, 3, 1, 0, '1000.0000', '1000.0000', '1000.0000', '1000.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_tier_price`
--

CREATE TABLE `jeu6_catalog_product_index_tier_price` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_index_website`
--

CREATE TABLE `jeu6_catalog_product_index_website` (
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';

--
-- Dumping data for table `jeu6_catalog_product_index_website`
--

INSERT INTO `jeu6_catalog_product_index_website` (`website_id`, `website_date`, `rate`) VALUES
(1, '2018-11-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_link`
--

CREATE TABLE `jeu6_catalog_product_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link Type ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_link_attribute`
--

CREATE TABLE `jeu6_catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) NOT NULL DEFAULT '' COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) NOT NULL DEFAULT '' COMMENT 'Data Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';

--
-- Dumping data for table `jeu6_catalog_product_link_attribute`
--

INSERT INTO `jeu6_catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 1, 'position', 'int'),
(2, 3, 'position', 'int'),
(3, 3, 'qty', 'decimal'),
(4, 4, 'position', 'int'),
(5, 5, 'position', 'int');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_link_attribute_decimal`
--

CREATE TABLE `jeu6_catalog_product_link_attribute_decimal` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_link_attribute_int`
--

CREATE TABLE `jeu6_catalog_product_link_attribute_int` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_link_attribute_varchar`
--

CREATE TABLE `jeu6_catalog_product_link_attribute_varchar` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_link_type`
--

CREATE TABLE `jeu6_catalog_product_link_type` (
  `link_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Link Type ID',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT 'Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';

--
-- Dumping data for table `jeu6_catalog_product_link_type`
--

INSERT INTO `jeu6_catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_option`
--

CREATE TABLE `jeu6_catalog_product_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) UNSIGNED DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_option_price`
--

CREATE TABLE `jeu6_catalog_product_option_price` (
  `option_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Price ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_option_title`
--

CREATE TABLE `jeu6_catalog_product_option_title` (
  `option_title_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Title ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_option_type_price`
--

CREATE TABLE `jeu6_catalog_product_option_type_price` (
  `option_type_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Type Price ID',
  `option_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_option_type_title`
--

CREATE TABLE `jeu6_catalog_product_option_type_title` (
  `option_type_title_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Type Title ID',
  `option_type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_option_type_value`
--

CREATE TABLE `jeu6_catalog_product_option_type_value` (
  `option_type_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Type ID',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_relation`
--

CREATE TABLE `jeu6_catalog_product_relation` (
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) UNSIGNED NOT NULL COMMENT 'Child ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';

--
-- Dumping data for table `jeu6_catalog_product_relation`
--

INSERT INTO `jeu6_catalog_product_relation` (`parent_id`, `child_id`) VALUES
(12, 10),
(12, 11);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_super_attribute`
--

CREATE TABLE `jeu6_catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Super Attribute ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Position'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';

--
-- Dumping data for table `jeu6_catalog_product_super_attribute`
--

INSERT INTO `jeu6_catalog_product_super_attribute` (`product_super_attribute_id`, `product_id`, `attribute_id`, `position`) VALUES
(1, 12, 83, 0),
(2, 12, 137, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_super_attribute_label`
--

CREATE TABLE `jeu6_catalog_product_super_attribute_label` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';

--
-- Dumping data for table `jeu6_catalog_product_super_attribute_label`
--

INSERT INTO `jeu6_catalog_product_super_attribute_label` (`value_id`, `product_super_attribute_id`, `store_id`, `use_default`, `value`) VALUES
(1, 1, 0, 0, 'Color'),
(2, 2, 0, 0, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_super_attribute_pricing`
--

CREATE TABLE `jeu6_catalog_product_super_attribute_pricing` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value ID',
  `product_super_attribute_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `value_index` varchar(255) NOT NULL DEFAULT '' COMMENT 'Value Index',
  `is_percent` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Percent',
  `pricing_value` decimal(12,4) DEFAULT NULL COMMENT 'Pricing Value',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Pricing Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_super_link`
--

CREATE TABLE `jeu6_catalog_product_super_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';

--
-- Dumping data for table `jeu6_catalog_product_super_link`
--

INSERT INTO `jeu6_catalog_product_super_link` (`link_id`, `product_id`, `parent_id`) VALUES
(1, 10, 12),
(2, 11, 12);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_catalog_product_website`
--

CREATE TABLE `jeu6_catalog_product_website` (
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';

--
-- Dumping data for table `jeu6_catalog_product_website`
--

INSERT INTO `jeu6_catalog_product_website` (`product_id`, `website_id`) VALUES
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_checkout_agreement`
--

CREATE TABLE `jeu6_checkout_agreement` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_checkout_agreement_store`
--

CREATE TABLE `jeu6_checkout_agreement_store` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cms_block`
--

CREATE TABLE `jeu6_cms_block` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Block Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';

--
-- Dumping data for table `jeu6_cms_block`
--

INSERT INTO `jeu6_cms_block` (`block_id`, `title`, `identifier`, `content`, `creation_time`, `update_time`, `is_active`) VALUES
(1, 'Footer Links', 'footer_links', '<ul>\r\n<li><a href=\"{{store direct_url=\"about-magento-demo-store\"}}\">About Us</a></li>\r\n<li><a href=\"{{store direct_url=\"customer-service\"}}\">Customer Service</a></li>\r\n<li class=\"last privacy\"><a href=\"{{store direct_url=\"privacy-policy-cookie-restriction-mode\"}}\">Privacy Policy</a></li>\r\n</ul>', '2011-08-18 22:28:06', '2018-10-27 12:04:16', 1),
(2, 'Cookie restriction notice', 'cookie_restriction_notice_block', '<p>This website requires cookies to provide all of its features. For more information on what data is contained in the cookies, please see our <a href=\"{{store direct_url=\"privacy-policy-cookie-restriction-mode\"}}\">Privacy Policy page</a>. To accept cookies from this site, please click the Allow button below.</p>', '2018-10-27 12:04:16', '2018-10-27 12:04:16', 1),
(3, 'Our Brands', 'our_brands', '<div class=\"logo-slider-inner owl-center-cont\">	\n	<div id=\"brand-slider\" class=\"owl-carousel home-owl-carousel custom-carousel\" data-item=\"5\" data-lg=\"5\" data-md=\"3\" data-sm=\"2\" data-xs=\"1\">\n		<div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				<img class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand1.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>\n		</div>\n		<div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				  <img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand2.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>	\n		</div>\n		<div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand3.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>	\n		</div>\n		<div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand4.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>	\n		</div>\n		<div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand5.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>	\n		</div>\n		<div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand6.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>	\n		</div>\n		 <div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand1.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>\n		</div>\n		<div class=\"item \">\n			<a href=\"#\" class=\"image\">\n				<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand2.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>	\n		</div>\n		<div class=\"item\">\n			<a href=\"#\" class=\"image\">\n				<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand3.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n			</a>	\n		</div>\n	</div>\n</div>\n	', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(4, 'Footer Aboutus Column', 'footer_aboutus_column', '<div class=\"aboutus-col\">	\n		<div class=\"f-weghit\">\n			<img alt=\"logo\" src=\"{{block type=\"core/template\" template=\"perfectus/template/footer_logo.phtml\"}}\">\n			<p><strong>Marcus</strong> is a premium Templates theme with advanced admin module. It’s extremely customizable, easy to use and fully responsive and retina ready.</p>\n			<ul class=\"about-ul\">\n				<li><i class=\"material-icons\">place</i> <strong>Add:</strong> 1234 Heaven Stress, Beverly Hill, Melbourne, USA.</li>\n				<li><i class=\"material-icons\">email</i> <strong>Email:</strong> Contact@erentheme.com</li>\n				<li><i class=\"material-icons\">phone</i> <strong>Phone Number:</strong> (800) 123 456 789</li>\n			</ul>\n		</div>\n	</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(5, 'Footer Payments', 'footer_payments', '<ul>\n	<li><img src=\"{{media url=\"wysiwyg/marcus/payments/1.jpg\"}}\" alt=\"Paypal\" title=\"Paypal\" width=\"45\" height=\"28\" /></li>\n	<li><img src=\"{{media url=\"wysiwyg/marcus/payments/2.jpg\"}}\" alt=\"Discover\" title=\"Discover\" width=\"45\" height=\"28\" /></li>\n	<li><img src=\"{{media url=\"wysiwyg/marcus/payments/3.jpg\"}}\" alt=\"Visa\" title=\"Visa\" width=\"45\" height=\"28\" /></li>\n	<li><img src=\"{{media url=\"wysiwyg/marcus/payments/4.jpg\"}}\" alt=\"Maestro\" title=\"Maestro\" width=\"45\" height=\"28\" /></li>\n	<li><img src=\"{{media url=\"wysiwyg/marcus/payments/5.jpg\"}}\" alt=\"Discover\" title=\"Discover\" width=\"45\" height=\"28\" /></li>\n</ul>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(6, 'Navigation Before Links', 'pu_before_navmenu_links', '&nbsp;', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(7, 'Navigation After Links', 'pu_after_navmenu_links', '<li>\n    <a class=\"level0\" href=\"{{store direct_url=\"blog\"}}\"><span>Blog</span></a>\n</li>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(8, 'Sidebar Banners', 'sidebar_banners', '<div class=\"sidebar-widget  mt-10\">\n				<div id=\"advertisement-slider\" class=\"advertisement-slider owl-carousel\">\n					<div class=\"item\"><img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/sidebar/b1.jpg\"}}\" title=\"banner\" width=\"263\" height=\"352\" /></div>\n                                         <div class=\"item\"><img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/sidebar/b2.jpg\"}}\" title=\"banner\" width=\"263\" height=\"352\" /></div>\n				</div>\n			</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(9, 'Marcus Category Custom Left Sidebar', 'marcus_category_custom_left_sidebar', '{{block type=\"fltproducts/bestsellers_home_list\" block-title=\"Best Seller\" column_count=\"2\" limit=\"4\" name=\"bestseller-sidebar\" template=\"perfectus/fltproducts/sidebar_block.phtml\"}}\n{{block type=\"fltproducts/newproduct_home_list\" block-title=\"New Products\" column_count=\"3\" limit=\"4\"  name=\"newsprod-sidebar\" template=\"perfectus/fltproducts/sidebar_block.phtml\"}}\n{{block type=\"cms/block\" block_id=\"sidebar_banners\"}}', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(10, 'Marcus Category Custom Right Sidebar', 'marcus_category_custom_right_sidebar', '{{block type=\"fltproducts/featured_home_list\" block-title=\"Featured Products\" column_count=\"3\" limit=\"6\"  name=\"featured-sidebar\" template=\"perfectus/fltproducts/sidebar_block.phtml\"}}', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(11, 'Google Map', 'contacts_google_map', '<iframe src=\"https://maps.google.co.in/maps?f=q&source=s_q&hl=en&geocode=&q=Auburn+Grove,+Hawthorn,+Victoria,+Australia&aq=0&oq=Auburn+Groove,+Hawthorn&sll=23.223279,72.657137&sspn=0.07651,0.169086&ie=UTF8&hq=&hnear=Auburn+Grove,+Hawthorn+East+Victoria+3123,+Australia&t=m&z=14&ll=-37.825499,145.04689&output=embed\" width=\"100%\" height=\"450\"  style=\"border:0\"><br /><small><a href=\"https://maps.google.co.in/maps?f=q&source=embed&hl=en&geocode=&q=Auburn+Grove,+Hawthorn,+Victoria,+Australia&aq=0&oq=Auburn+Groove,+Hawthorn&sll=23.223279,72.657137&sspn=0.07651,0.169086&ie=UTF8&hq=&hnear=Auburn+Grove,+Hawthorn+East+Victoria+3123,+Australia&t=m&z=14&ll=-37.825499,145.04689\" style=\"color:#0000FF;text-align:left\">View Larger Map</a></small></iframe>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(12, 'Contacts Store Information', 'contacts_store_information', '<div class=\"col-md-12 contact-info\">\n    <div class=\"col-sm-4\">\n        <div class=\"contact-bg text-center\">\n            <i class=\"material-icons\">settings_phone</i>\n            <h3>24 x 7 Customer service</h3>\n            <p>+(251) 546-9442<br>+(125) 546-4478</p>\n        </div>\n    </div>\n    <div class=\"col-sm-4\">\n        <div class=\"contact-bg text-center cb-border\">\n            <i class=\"material-icons\">place</i>\n            <h3>Reach us</h3>\n            <p>584 Sugar St.<br>South Richmond Hill, NY 11419</p>\n        </div>\n    </div>\n    <div class=\"col-sm-4\">\n        <div class=\"contact-bg text-center\">\n            <i class=\"material-icons\">mail_outline</i>\n            <h3>You have any question</h3>\n            <p>info@marcus.com<br>inquiry@marcus.com </p>\n        </div>\n    </div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(13, 'Marcus Product Info Custom Left Sidebar', 'marcus_prodinfo_custom_left_sidebar', '{{block type=\"fltproducts/bestsellers_home_list\" block-title=\"Best Seller\" column_count=\"1\" column_lg=\"1\" column_md=\"1\" column_sm=\"2\" column_xs=\"1\" row_count=\"2\"  limit=\"4\" name=\"bestseller-sidebar\" template=\"perfectus/fltproducts/sidebar_block.phtml\"}}\n{{block type=\"cms/block\" block_id=\"sidebar_banners\"}}', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(14, 'Marcus Product Info Custom Right Sidebar', 'marcus_prodinfo_custom_right_sidebar', '{{block type=\"cms/block\" block_id=\"sidebar_banners\"}}\n<div class=\"block-services\">\n	<div class=\"services\">\n			<div class=\"pp-ser pp-s2\">\n				<ul>\n					<li>\n						<i class=\"material-icons\">flight</i>\n						<div class=\"pp-cont\">\n							<strong>free shipping</strong>\n							<p>On order over $200</p>\n						</div>\n					</li>\n					<li>\n						<i class=\"material-icons\">call_to_action</i>\n						<div class=\"pp-cont\">\n							<strong>Easy payment</strong>\n							<p>Optimal for payment</p>\n						</div>\n					</li>\n					<li>\n						<i class=\"material-icons\">access_time</i>\n						<div class=\"pp-cont\">\n							<strong>30 days return</strong>\n							<p>Money back guarantee</p>\n						</div>\n					</li>\n					<li>\n						<i class=\"material-icons\">card_giftcard</i>\n						<div class=\"pp-cont\">\n							<strong>special gift card</strong>\n							<p>On order over $800</p>\n						</div>\n					</li>\n				</ul>\n			</div>\n	</div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(15, 'Social Links', 'social_links', '<ul>\n	<li> <a href=\"#\" class=\"fac\"><i class=\"fa fa-facebook\"></i></a> </li>\n	<li><a href=\"#\" class=\"twi\"><i class=\"fa fa-twitter\"></i></a></li>\n	<li><a href=\"#\" class=\"goo\"><i class=\"fa fa-google-plus\"></i></a></li>\n	<li><a href=\"#\" class=\"behance\"><i class=\"fa fa-github\" aria-hidden=\"true\"></i></a> </li>\n</ul>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(16, 'Footer Information Column', 'footer_information_column', '<div class=\"mobile-collapse\">\n<div class=\"module-heading outer-bottom-xs mobile-collapse__title\">\n<h4 class=\"module-title\">Information</h4>\n</div>\n<div class=\"module-body mobile-collapse__content\">\n<div class=\"f-weghit2\">\n<ul class=\"list-unstyled\">\n<li ><a  href=\"{{store direct_url=\"about-us\"}}\"><span>About Us</span></a></li>\n<li ><a  href=\"{{store direct_url=\"contacts\"}}\"><span>Contact Us</span></a></li>\n<li ><a  href=\"{{store direct_url=\"faqs\"}}\"><span>FAQs</span></a></li>\n<li ><a  href=\"{{store direct_url=\"terms-conditions\"}}\"><span>Terms & Conditions</span></a></li>\n<li ><a  href=\"{{store direct_url=\"reward-points\"}}\"><span>Reward Points</span></a></li>\n</ul>\n</div>\n</div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(17, 'Footer Quick Links Column', 'footer_quicklinks_column', '<div class=\"mobile-collapse\">\n<div class=\"module-heading outer-bottom-xs mobile-collapse__title\">\n<h4 class=\"module-title\">Quick Links</h4>\n</div>\n<div class=\"module-body mobile-collapse__content\">\n<div class=\"f-weghit2\">\n<ul class=\"list-unstyled\">\n<li ><a  href=\"{{store direct_url=\"customer/account/login/\"}}\"><span>My Account</span></a></li>\n<li ><a  href=\"{{store direct_url=\"sales/order/history/\"}}\"><span>Order History</span></a></li>\n<li ><a  href=\"{{store direct_url=\"wishlist/\"}}\"><span>Wish List</span></a></li>\n<li ><a  href=\"{{store direct_url=\"#\"}}\"><span>Privacy Policy</span></a></li>\n<li ><a  href=\"{{store direct_url=\"#\"}}\"><span>Returns</span></a></li>\n</ul>\n</div>\n</div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(18, 'Footer Newsletter Column', 'footer_newsletter_column', '<div class=\"mobile-collapse\">\n	<div class=\"module-heading outer-bottom-xs mobile-collapse__title\">\n		<h4 class=\"module-title\">Newsletter</h4>\n	</div>\n	<div class=\"module-body mobile-collapse__content\">\n		<div class=\"f-weghit\">\n			<p class=\"sub-text\">Subscribe to our newsletter and get 10% off your first purchase</p>\n				{{block type=\"newsletter/subscribe\" name=\"newsletter\" template=\"newsletter/footer_subscribe.phtml\"}}\n		</div>\n	</div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(19, 'Footer Instagram Feeds Column', 'footer_instagram_feeds_column', '<div class=\"mobile-collapse\">\n	<div class=\"module-heading outer-bottom-xs mobile-collapse__title\"><h4 class=\"module-title\">Instagram feed</h4></div>\n	<div class=\"module-body mobile-collapse__content\">\n		<div class=\"f-weghit\">\n			{{block type=\"core/template\" template=\"perfectus/instagram/feeds.phtml\"}}\n		</div>\n	</div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(20, 'Footer Latest News Column', 'footer_latest_news_column', '<div class=\"mobile-collapse\">\n	<div class=\"module-heading outer-bottom-xs mobile-collapse__title\"><h4 class=\"module-title\">latest news</h4></div>\n	<div class=\"module-body mobile-collapse__content\">\n		<div class=\"f-weghit\">\n			{{widget type=\"blog/footer\"}}\n		</div>\n	</div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(21, 'Footer Help & Support Column', 'footer_help_support_column', '<div class=\"mobile-collapse\">\n<div class=\"module-heading outer-bottom-xs mobile-collapse__title\">\n<h4 class=\"module-title\">Help & Support</h4>\n</div>\n<div class=\"module-body mobile-collapse__content\">\n<div class=\"f-weghit2\">\n<ul class=\"list-unstyled\">\n<li ><a  href=\"{{store direct_url=\"contacts\"}}\"><span>About Us</span></a></li>\n<li ><a  href=\"{{store direct_url=\"faqs\"}}\"><span>FAQs</span></a></li>\n<li ><a  href=\"{{store direct_url=\"terms-conditions\"}}\"><span>Terms & Conditions</span></a></li>\n<li ><a  href=\"{{store direct_url=\"reward-points\"}}\"><span>Reward Points</span></a></li>\n<li ><a  href=\"{{store direct_url=\"404\"}}\"><span>404</span></a></li>\n</ul>\n</div>\n</div>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(22, 'Footer Social Links', 'footer_social_links', '<div class=\"scoial-footer\">\n	<ul>\n		<li> <a class=\"fac\" href=\"#\"><i class=\"fa fa-facebook\"></i></a> </li>\n		<li><a class=\"twi\" href=\"#\"><i class=\"fa fa-twitter\"></i></a></li>\n		<li><a class=\"goo\" href=\"#\"><i class=\"fa fa-google-plus\"></i></a></li>\n		<li><a class=\"behance\" href=\"#\"><i aria-hidden=\"true\" class=\"fa fa-github\"></i></a> </li>\n	</ul>\n</div>', '2018-11-14 14:39:28', '2018-11-14 14:39:28', 1),
(23, 'Footer Custom Links', 'footer_custom_links', '<ul class=\"f-link fc-links\">\n	<li><a href=\"#\">blog</a></li>\n	<li><a href=\"#\">about us</a></li>\n	<li><a href=\"#\">accessories</a></li>\n	<li><a href=\"#\">order tracking</a></li>\n	<li><a href=\"#\">contact</a></li>\n</ul>', '2018-11-14 14:39:29', '2018-11-14 14:39:29', 1),
(24, 'Footer Instagram Feeds Full Width', 'footer_instagram_feeds_full_width', '<div class=\"mobile-collapse\">\n	<div class=\"module-heading outer-bottom-xs mobile-collapse__title\"><h4 class=\"module-title\">Instagram feed</h4></div>\n	<div class=\"module-body mobile-collapse__content\">\n		<div class=\"f-weghit\">\n			{{block type=\"core/template\" template=\"perfectus/instagram/feeds_wide.phtml\"}}\n		</div>\n	</div>\n</div>', '2018-11-14 14:39:29', '2018-11-14 14:39:29', 1),
(25, 'Custom Tab', 'productinfo_custom_tab', '<p>This is custom tab. You can add CMS content such as sizing guide or videos to enhance product detail.</p>', '2018-11-14 14:39:29', '2018-11-14 14:39:29', 1),
(26, 'Header Topbar Banner Slider', 'header_topbar_banner_slider', '<div class=\"topbar-banner owl-carousel\">\n	<div class=\"item\">New Collection <strong>EXHALE STYLE</strong> Brand & Accessories</div>\n	<div class=\"item\">Advertise a special promotion Save <span>20%</span> this weekend!</div>\n	<div class=\"item\">Sale Up To <span color=\"theme-color\">40%</span> Hurry Limited Offer! </div>\n</div>\n<script type=\"text/javascript\">\n	jQuery(document).ready(function(){\n		jQuery(\'.topbar-banner\').owlCarousel({\n			autoPlay : 4000,\n			singleItem : true,\n			transitionStyle : \'fade\'\n		});\n	});\n</script>', '2018-11-14 14:39:29', '2018-11-14 14:39:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cms_block_store`
--

CREATE TABLE `jeu6_cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';

--
-- Dumping data for table `jeu6_cms_block_store`
--

INSERT INTO `jeu6_cms_block_store` (`block_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cms_page`
--

CREATE TABLE `jeu6_cms_page` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `root_template` varchar(255) DEFAULT NULL COMMENT 'Page Template',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) NOT NULL DEFAULT '' COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Page Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';

--
-- Dumping data for table `jeu6_cms_page`
--

INSERT INTO `jeu6_cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES
(1, '404 Not Found 1', 'two_columns_right', 'Page keywords', 'Page description', 'no-route', NULL, '<div class=\"page-title\"><h1>Whoops, our bad...</h1></div>\r\n<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n', '2011-08-18 22:28:06', '2011-08-18 22:28:06', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Home page', 'one_column', NULL, NULL, 'home', NULL, '<div class=\"page-title\">\r\n<h2>Home Page</h2>\r\n</div>', '2011-08-18 22:28:07', '2018-10-27 13:07:19', 1, 0, '<!--<reference name=\"content\">\r\n        <block type=\"catalog/product_new\" name=\"home.catalog.product.new\" alias=\"product_new\" template=\"catalog/product/new.phtml\" after=\"cms_page\">\r\n            <action method=\"addPriceBlockType\">\r\n                <type>bundle</type>\r\n                <block>bundle/catalog_product_price</block>\r\n                <template>bundle/catalog/product/price.phtml</template>\r\n            </action>\r\n        </block>\r\n        <block type=\"reports/product_viewed\" name=\"home.reports.product.viewed\" alias=\"product_viewed\" template=\"reports/home_product_viewed.phtml\" after=\"product_new\">\r\n            <action method=\"addPriceBlockType\">\r\n                <type>bundle</type>\r\n                <block>bundle/catalog_product_price</block>\r\n                <template>bundle/catalog/product/price.phtml</template>\r\n            </action>\r\n        </block>\r\n        <block type=\"reports/product_compared\" name=\"home.reports.product.compared\" template=\"reports/home_product_compared.phtml\" after=\"product_viewed\">\r\n            <action method=\"addPriceBlockType\">\r\n                <type>bundle</type>\r\n                <block>bundle/catalog_product_price</block>\r\n                <template>bundle/catalog/product/price.phtml</template>\r\n            </action>\r\n        </block>\r\n    </reference>\r\n    <reference name=\"right\">\r\n        <action method=\"unsetChild\"><alias>right.reports.product.viewed</alias></action>\r\n        <action method=\"unsetChild\"><alias>right.reports.product.compared</alias></action>\r\n    </reference>-->', NULL, NULL, NULL, NULL, NULL),
(3, 'About Us', 'two_columns_right', NULL, NULL, 'about-magento-demo-store', NULL, '<div class=\"page-title\">\r\n<h1>About Magento Store</h1>\r\n</div>\r\n<div class=\"col3-set\">\r\n<div class=\"col-1\"><p><a href=\"http://www.varien.com/\"><img src=\"{{skin url=\'images/media/about_us_img.jpg\'}}\" title=\"Varien\" alt=\"Varien\" /></a></p><p style=\"line-height:1.2em;\"><small>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</small></p>\r\n<p style=\"color:#888; font:1.2em/1.4em georgia, serif;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta.</p></div>\r\n<div class=\"col-2\">\r\n<p><strong style=\"color:#de036f;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.</strong></p>\r\n<p>Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo. </p>\r\n<p>Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus. Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi. Vestibulum sapien dolor, aliquet nec, porta ac, malesuada a, libero. Praesent feugiat purus eget est. Nulla facilisi. Vestibulum tincidunt sapien eu velit. Mauris purus. Maecenas eget mauris eu orci accumsan feugiat. Pellentesque eget velit. Nunc tincidunt.</p></div>\r\n<div class=\"col-3\">\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper </p>\r\n<p><strong style=\"color:#de036f;\">Maecenas ullamcorper, odio vel tempus egestas, dui orci faucibus orci, sit amet aliquet lectus dolor et quam. Pellentesque consequat luctus purus.</strong></p>\r\n<p>Nunc et risus. Etiam a nibh. Phasellus dignissim metus eget nisi.</p>\r\n<div class=\"divider\"></div>\r\n<p>To all of you, from all of us at Magento Store - Thank you and Happy eCommerce!</p>\r\n<p style=\"line-height:1.2em;\"><strong style=\"font:italic 2em Georgia, serif;\">John Doe</strong><br /><small>Some important guy</small></p></div>\r\n</div>', '2011-08-18 22:28:07', '2011-08-18 22:28:07', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Customer Service', 'three_columns', NULL, NULL, 'customer-service', NULL, '<div class=\"page-title\">\r\n<h1>Customer Service</h1>\r\n</div>\r\n<ul class=\"disc\">\r\n<li><a href=\"#answer1\">Shipping &amp; Delivery</a></li>\r\n<li><a href=\"#answer2\">Privacy &amp; Security</a></li>\r\n<li><a href=\"#answer3\">Returns &amp; Replacements</a></li>\r\n<li><a href=\"#answer4\">Ordering</a></li>\r\n<li><a href=\"#answer5\">Payment, Pricing &amp; Promotions</a></li>\r\n<li><a href=\"#answer6\">Viewing Orders</a></li>\r\n<li><a href=\"#answer7\">Updating Account Information</a></li>\r\n</ul>\r\n<dl>\r\n<dt id=\"answer1\">Shipping &amp; Delivery</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer2\">Privacy &amp; Security</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer3\">Returns &amp; Replacements</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer4\">Ordering</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer5\">Payment, Pricing &amp; Promotions</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer6\">Viewing Orders</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n<dt id=\"answer7\">Updating Account Information</dt>\r\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede. Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in, faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa. Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec, justo.</dd>\r\n</dl>', '2011-08-18 22:28:08', '2011-08-18 22:28:08', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Enable Cookies', 'one_column', NULL, NULL, 'enable-cookies', NULL, '<div class=\"std\">\r\n    <ul class=\"messages\">\r\n        <li class=\"notice-msg\">\r\n            <ul>\r\n                <li>Please enable cookies in your web browser to continue.</li>\r\n            </ul>\r\n        </li>\r\n    </ul>\r\n    <div class=\"page-title\">\r\n        <h1><a name=\"top\"></a>What are Cookies?</h1>\r\n    </div>\r\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class=\"subtitle\">Enabling Cookies</h2>\r\n    <ul class=\"disc\">\r\n        <li><a href=\"#ie7\">Internet Explorer 7.x</a></li>\r\n        <li><a href=\"#ie6\">Internet Explorer 6.x</a></li>\r\n        <li><a href=\"#firefox\">Mozilla/Firefox</a></li>\r\n        <li><a href=\"#opera\">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name=\"ie7\"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-3.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-4.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-5.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie7-6.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"ie6\"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-1.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src=\"{{skin url=\"images/cookies/ie6-2.gif\"}}\" alt=\"\" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"firefox\"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/firefox.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n    <h3><a name=\"opera\"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src=\"{{skin url=\"images/cookies/opera.png\"}}\" alt=\"\" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\r\n</div>\r\n', '2011-08-18 22:28:08', '2011-08-18 22:28:08', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Privacy Policy', 'one_column', NULL, NULL, 'privacy-policy-cookie-restriction-mode', 'Privacy Policy', '<p style=\"color: #ff0000; font-weight: bold; font-size: 13px\">\n    Please replace this text with you Privacy Policy.\n    Please add any additional cookies your website uses below (e.g., Google Analytics)\n</p>\n<p>\n    This privacy policy sets out how {{config path=\"general/store_information/name\"}} uses and protects any information\n    that you give {{config path=\"general/store_information/name\"}} when you use this website.\n    {{config path=\"general/store_information/name\"}} is committed to ensuring that your privacy is protected.\n    Should we ask you to provide certain information by which you can be identified when using this website,\n    then you can be assured that it will only be used in accordance with this privacy statement.\n    {{config path=\"general/store_information/name\"}} may change this policy from time to time by updating this page.\n    You should check this page from time to time to ensure that you are happy with any changes.\n</p>\n<h2>What we collect</h2>\n<p>We may collect the following information:</p>\n<ul>\n    <li>name</li>\n    <li>contact information including email address</li>\n    <li>demographic information such as postcode, preferences and interests</li>\n    <li>other information relevant to customer surveys and/or offers</li>\n</ul>\n<p>\n    For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n</p>\n<h2>What we do with the information we gather</h2>\n<p>\n    We require this information to understand your needs and provide you with a better service,\n    and in particular for the following reasons:\n</p>\n<ul>\n    <li>Internal record keeping.</li>\n    <li>We may use the information to improve our products and services.</li>\n    <li>\n        We may periodically send promotional emails about new products, special offers or other information which we\n        think you may find interesting using the email address which you have provided.\n    </li>\n    <li>\n        From time to time, we may also use your information to contact you for market research purposes.\n        We may contact you by email, phone, fax or mail. We may use the information to customise the website\n        according to your interests.\n    </li>\n</ul>\n<h2>Security</h2>\n<p>\n    We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure,\n    we have put in place suitable physical, electronic and managerial procedures to safeguard and secure\n    the information we collect online.\n</p>\n<h2>How we use cookies</h2>\n<p>\n    A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n    Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n    a particular site. Cookies allow web applications to respond to you as an individual. The web application\n    can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n    your preferences.\n</p>\n<p>\n    We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page traffic\n    and improve our website in order to tailor it to customer needs. We only use this information for statistical\n    analysis purposes and then the data is removed from the system.\n</p>\n<p>\n    Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful\n    and which you do not. A cookie in no way gives us access to your computer or any information about you,\n    other than the data you choose to share with us. You can choose to accept or decline cookies.\n    Most web browsers automatically accept cookies, but you can usually modify your browser setting\n    to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n</p>\n<h2>Links to other websites</h2>\n<p>\n    Our website may contain links to other websites of interest. However, once you have used these links\n    to leave our site, you should note that we do not have any control over that other website.\n    Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n    visiting such sites and such sites are not governed by this privacy statement.\n    You should exercise caution and look at the privacy statement applicable to the website in question.\n</p>\n<h2>Controlling your personal information</h2>\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n<ul>\n    <li>\n        whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n        that you do not want the information to be used by anybody for direct marketing purposes\n    </li>\n    <li>\n        if you have previously agreed to us using your personal information for direct marketing purposes,\n        you may change your mind at any time by writing to or emailing us at\n        {{config path=\"trans_email/ident_general/email\"}}\n    </li>\n</ul>\n<p>\n    We will not sell, distribute or lease your personal information to third parties unless we have your permission\n    or are required by law to do so. We may use your personal information to send you promotional information\n    about third parties which we think you may find interesting if you tell us that you wish this to happen.\n</p>\n<p>\n    You may request details of personal information which we hold about you under the Data Protection Act 1998.\n    A small fee will be payable. If you would like a copy of the information held on you please write to\n    {{config path=\"general/store_information/address\"}}.\n</p>\n<p>\n    If you believe that any information we are holding on you is incorrect or incomplete,\n    please write to or email us as soon as possible, at the above address.\n    We will promptly correct any information found to be incorrect.\n</p>\n<h2><a name=\"list\"></a>List of cookies we collect</h2>\n<p>The table below lists the cookies we collect and what information they store.</p>\n<table class=\"data-table\">\n    <thead>\n        <tr>\n            <th>COOKIE name</th>\n            <th>COOKIE Description</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <th>CART</th>\n            <td>The association with your shopping cart.</td>\n        </tr>\n        <tr>\n            <th>CATEGORY_INFO</th>\n            <td>Stores the category info on the page, that allows to display pages more quickly.</td>\n        </tr>\n        <tr>\n            <th>COMPARE</th>\n            <td>The items that you have in the Compare Products list.</td>\n        </tr>\n        <tr>\n            <th>CURRENCY</th>\n            <td>Your preferred currency</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER</th>\n            <td>An encrypted version of your customer id with the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_AUTH</th>\n            <td>An indicator if you are currently logged into the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_INFO</th>\n            <td>An encrypted version of the customer group you belong to.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_SEGMENT_IDS</th>\n            <td>Stores the Customer Segment ID</td>\n        </tr>\n        <tr>\n            <th>EXTERNAL_NO_CACHE</th>\n            <td>A flag, which indicates whether caching is disabled or not.</td>\n        </tr>\n        <tr>\n            <th>FRONTEND</th>\n            <td>You sesssion ID on the server.</td>\n        </tr>\n        <tr>\n            <th>GUEST-VIEW</th>\n            <td>Allows guests to edit their orders.</td>\n        </tr>\n        <tr>\n            <th>LAST_CATEGORY</th>\n            <td>The last category you visited.</td>\n        </tr>\n        <tr>\n            <th>LAST_PRODUCT</th>\n            <td>The most recent product you have viewed.</td>\n        </tr>\n        <tr>\n            <th>NEWMESSAGE</th>\n            <td>Indicates whether a new message has been received.</td>\n        </tr>\n        <tr>\n            <th>NO_CACHE</th>\n            <td>Indicates whether it is allowed to use cache.</td>\n        </tr>\n        <tr>\n            <th>PERSISTENT_SHOPPING_CART</th>\n            <td>A link to information about your cart and viewing history if you have asked the site.</td>\n        </tr>\n        <tr>\n            <th>POLL</th>\n            <td>The ID of any polls you have recently voted in.</td>\n        </tr>\n        <tr>\n            <th>POLLN</th>\n            <td>Information on what polls you have voted on.</td>\n        </tr>\n        <tr>\n            <th>RECENTLYCOMPARED</th>\n            <td>The items that you have recently compared.            </td>\n        </tr>\n        <tr>\n            <th>STF</th>\n            <td>Information on products you have emailed to friends.</td>\n        </tr>\n        <tr>\n            <th>STORE</th>\n            <td>The store view or language you have selected.</td>\n        </tr>\n        <tr>\n            <th>USER_ALLOWED_SAVE_COOKIE</th>\n            <td>Indicates whether a customer allowed to use cookies.</td>\n        </tr>\n        <tr>\n            <th>VIEWED_PRODUCT_IDS</th>\n            <td>The products that you have recently viewed.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST</th>\n            <td>An encrypted list of products added to your Wishlist.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST_CNT</th>\n            <td>The number of items in your Wishlist.</td>\n        </tr>\n    </tbody>\n</table>', '2018-10-27 12:04:16', '2018-10-27 12:04:16', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Marcus - Homepage 1', 'one_column', NULL, NULL, 'marcus-style-1', NULL, '{{block type=\"mainslider/mainslider\" name=\"mainslider\" template=\"perfectus/mainslider/slider.phtml\"}}\n<section class=\"banner ptb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"banner-slider banners-carousel owl-carousel\" data-item=\"1\" data-lg=\"1\" data-md=\"1\" data-sm=\"1\" data-xs=\"1\">\n				<div class=\"item\">\n					<div class=\"col-md-6 col-xs-6 col-xxs-12\">\n						<div class=\"single-banner banner-img \">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb1.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1 f-ban\">\n								<div class=\"as-text\">\n									<h3>Men’s</h3>\n									<h4>Fashion year</h4>\n									<a href=\"#\">Shop now</a>\n								</div>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3 col-xs-3 col-xxs-6\">\n						<div class=\"single-banner banner-img \">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb2.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1\">\n								<div class=\"as-text\">\n									<a href=\"#\">T-Shirt</a>\n								</div>\n							</div>\n						</div>\n						<div class=\"single-banner banner-img bmgr\">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb3.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1\">\n								<div class=\"as-text\">\n									<a href=\"#\">jeans</a>\n								</div>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3 col-xs-3 col-xxs-6\">\n						<div class=\"single-banner banner-img \">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb4.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1\">\n								<div class=\"as-text\">\n									<a href=\"#\">shoes</a>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area pb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div id=\"product-tabs-slider\" class=\"scroll-tabs\">\n					<div class=\"row\">\n						<div class=\"col-sm-12\">\n							<div class=\"more-info-tab clearfix \">\n								<div class=\"page-title\">\n								<h2 class=\"new-product-title pull-left\">new<span>arrivals</span></h2>\n								<ul class=\"nav nav-tabs nav-tab-line pull-right\" id=\"new-products-tabs\">\n									<li class=\"active\"><a data-transition-type=\"backSlide\" href=\"#tbnp-1\" data-toggle=\"tab\">Men</a></li>\n									<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-2\" data-toggle=\"tab\">Woman</a></li>\n									<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-3\" data-toggle=\"tab\">Gifts</a></li>\n								</ul>\n							</div>\n							<div class=\"tab-content outer-top-xs\">\n								<div class=\"tab-pane active\" id=\"tbnp-1\">\n									{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"29\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-2\">\n									{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"3\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-3\">\n									{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"59\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/hm1-mb1.jpg\"}})\">\n	<div class=\"container text-center\">\n		<h3>2018 new style</h3>\n		<h2>SALE OFF UP TO 70%</h2>\n		<a href=\"#\">Shop now</a>\n	</div>\n</section>\n<section class=\"products-area pb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">special<span>deals</span></h2>\n				</div>\n				{{block type=\"fltproducts/specials_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" limit=\"8\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner7 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/h1_newsletter_bg.jpg\"}})\">\n	<div alt=\"banner\" height=\"auto\" width=\"auto\">\n		<div class=\"container\">\n			<div class=\"row\">\n				<div class=\"col-lg-12 text-center\">\n					<h6>Sale up to <span class=\"theme-color\">60%</span> off for 1000+ products</h6>\n					<div class=\"date-px\">09 June to 16 July</div>		\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area micro-product-area pb-30\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xl-3 col-lg-4 col-md-4 col-sm-6 col-xs-12 pb-20\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">best<span>seller</span></h2>\n				</div>\n				{{block type=\"fltproducts/bestsellers_home_list\" column_count=\'1\' row_count=\'2\' template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n			<div class=\"col-xl-3 col-lg-4 col-md-4 col-sm-6 col-xs-12 pb-20\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">on<span>sale</span></h2>						\n				</div>\n				{{block type=\"fltproducts/specials_home_list\" column_count=\'1\' row_count=\'2\' template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n			<div class=\"col-xl-3 col-lg-4 col-md-4 hidden-sm col-xs-12 pb-20\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">top<span>product</span></h2>	\n				</div>\n				{{block type=\"fltproducts/allproducts_home_list\" product_ids=\"10,2\" column_count=\'1\' row_count=\'2\' limit=\"2\" template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"last-news blg-s1 mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n			<div class=\"page-title\">\n				<h2 class=\"section-title\">latest <span>news</span></h2>\n			</div>\n			{{widget type=\"blog/slider\" blocks_count=\"3\" column_count=\"3\" column_lg=\"3\" column_md=\"3\" column_sm=\"2\" column_xs=\"1\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"brands-sec\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n				<div class=\"product-slider row outer-top-xs logo-slider\">\n					<div id=\"brands-carousel\" class=\"logo-slider col-sm-12\">\n						<div class=\"page-title\"><h2>our <span>brands</span></h2></div>\n						{{block type=\"cms/block\" block_id=\"our_brands\"}}\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '503 Service Unavailable', 'one_column', NULL, NULL, 'service-unavailable', NULL, '<div class=\"page-title\"><h1>We\'re Offline...</h1></div>\n<p>...but only for just a bit. We\'re working to make the Magento Demo a better place for you!</p>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Reward Points', 'one_column', NULL, NULL, 'reward-points', NULL, '<div class=\"page-content\">\n	<div class=\"page-title\"><h2>Reward Points</h2></div>\n	<span class=\"title-tag\">Rewards can currently be earned for the following actions:</span>\n	<div class=\"page-inner-content\">\n	<p>The Reward Points Program allows you to earn points for certain actions you take on the site. Points are awarded based on making purchases and customer actions such as submitting reviews.</p>\n	<p>&nbsp;</p>\n	<h3 class=\"fntuc-head\">Benefits of Reward Points for Registered Customers</h3>\n	<p>Once you register you will be able to earn and accrue reward points, which are then redeemable at time of purchase towards the cost of your order. Rewards are an added bonus to your shopping experience on the site and just one of the ways we thank you for being a loyal customer.</p>\n	<ul>\n	<li>Making purchases — every time you make a purchase you earn points based on the price of products purchased and these points are added to your Reward Points balance.</li>\n	<li>Registering on the site.</li>\n	<li>Subscribing to a newsletter for the first time.</li>\n	<li>Sending Invitations — Earn points by inviting your friends to join the site.</li>\n	<li>Converting Invitations to Customer — Earn points for every invitation you send out which leads to your friends registering on the site.</li>\n	<li>Converting Invitations to Order — Earn points for every invitation you send out which leads to a sale.</li>\n	<li>Review Submission — Earn points for submitting product reviews.</li>\n	<li>New Tag Submission — Earn points for adding tags to products.</li>\n	</ul>\n	<p>&nbsp;</p>\n	<h3 class=\"fntuc-head\">Reward Points Exchange Rates</h3>\n	<p>The value of reward points is determined by an exchange rate of both currency spent on products to points, and an exchange rate of points earned to currency for spending on future purchases.</p>\n	<p>&nbsp;</p>\n	<h3 class=\"fntuc-head\">Redeeming Reward Points</h3>\n	<p>You can redeem your reward points at checkout. If you have accumulated enough points to redeem them you will have the option of using points as one of the payment methods.  The option to use reward points, as well as your balance and the monetary equivalent this balance, will be shown to you in the Payment Method area of the checkout.  Redeemable reward points can be used in conjunction with other payment methods such as credit cards, gift cards and more.</p>\n	<p>&nbsp;</p>\n	<h3 class=\"fntuc-head\">Reward Points Minimums and Maximums</h3>\n	<p>Reward points may be capped at a minimum value required for redemption.  If this option is selected you will not be able to use your reward points until you accrue a minimum number of points, at which point they will become available for redemption.</p>\n	<p>Reward points may also be capped at the maximum value of points which can be accrued. If this option is selected you will need to redeem your accrued points before you are able to earn more points.</p>\n	<p>&nbsp;</p>\n	<h3 class=\"fntuc-head\">Managing My Reward Points</h3>\n	<p>You have the ability to view and manage your points through your <a href=\"{{store url=\"customer/account\"}}\">Customer Account</a>. From your account you will be able to view your total points (and currency equivalent), minimum needed to redeem, whether you have reached the maximum points limit and a cumulative history of points acquired, redeemed and lost. The history record will retain and display historical rates and currency for informational purposes. The history will also show you comprehensive informational messages regarding points, including expiration notifications.</p>\n	<p>&nbsp;</p>\n	<h3 class=\"fntuc-head\">Reward Points Expiration</h3>\n	<p>Reward points can be set to expire. Points will expire in the order form which they were first earned.</p>\n	<p><strong>Note</strong>: You can sign up to receive email notifications each time your balance changes when you either earn, redeem or lose points, as well as point expiration notifications. This option is found in the <a href=\"{{store url=\"reward/customer/info\"}}\">Reward Points section</a> of the My Account area.</p>\n	</div>\n</div>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Marcus - Homepage 2', 'one_column', NULL, NULL, 'marcus-style-2', NULL, '{{block type=\"mainslider/mainslider\" name=\"mainslider\" template=\"perfectus/mainslider/slider.phtml\"}}\n<section class=\"services ptb-50\">\n	<div class=\"container\">\n		<div class=\"pp-ser\">\n			<ul>\n				<li>\n					<i class=\"material-icons\">flight</i>\n					<div class=\"pp-cont\">\n						<strong>free shipping</strong>\n						<p>On order over $200</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">call_to_action</i>\n					<div class=\"pp-cont\">\n						<strong>Easy payment</strong>\n						<p>Optimal for payment</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">access_time</i>\n					<div class=\"pp-cont\">\n						<strong>30 days return</strong>\n						<p>Money back guarantee</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">card_giftcard</i>\n					<div class=\"pp-cont\">\n						<strong>special gift card</strong>\n						<p>On order over $800</p>\n					</div>\n				</li>\n			</ul>\n		</div>\n	</div>\n</section>\n<section class=\"our-cat mb-50\">\n	<div class=\"container\">\n		<div class=\"page-title pgt-s2 text-center\">\n			<h2 class=\"section-title\">our categories</h2>\n			<p>pleasure rationally encounter consequences</p>\n		</div>\n		<div class=\"our-categories\">\n			<div class=\"tbs-2 banner-slider banners-carousel owl-carousel\" data-item=\"5\" data-lg=\"5\" data-md=\"4\" data-sm=\"3\" data-xs=\"2\">\n				<div class=\"item\">\n					<div class=\"single-banner\">\n						<a href=\"#\">\n							<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm2-tb1.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n						</a>\n						<div class=\"banner-content\">\n							<div class=\"ourcat-bg\">\n								<strong>Men</strong>\n								<p>70 products</p>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class=\"item\">\n					<div class=\"single-banner\">\n						<a href=\"#\">\n							<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm2-tb2.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n						</a>\n						<div class=\"banner-content\">\n							<div class=\"ourcat-bg\">\n								<strong>Women</strong>\n								<p>70 products</p>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class=\"item\">\n					<div class=\"single-banner\">\n						<a href=\"#\">\n							<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm2-tb3.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n						</a>\n						<div class=\"banner-content\">\n							<div class=\"ourcat-bg\">\n								<strong>Shoes</strong>\n								<p>70 products</p>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class=\"item\">\n					<div class=\"single-banner\">\n						<a href=\"#\">\n							 <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm2-tb4.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n						</a>\n						<div class=\"banner-content\">\n							<div class=\"ourcat-bg\">\n								<strong>Belts</strong>\n								<p>70 products</p>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class=\"item\">\n					<div class=\"single-banner\">\n						<a href=\"#\">\n							<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm2-tb5.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n						</a>\n						<div class=\"banner-content\">\n							<div class=\"ourcat-bg\">\n								<strong>Bags</strong>\n								<p>70 products</p>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s2 text-center\">\n					<h2 class=\"section-title\">new arrivals</h2>\n					<p>pleasure rationally encounter consequences</p>\n				</div>\n				{{block type=\"fltproducts/newproduct_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" row_count=\"2\" limit=\"10\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner2 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/hm2-mb1.jpg\"}})\">\n	<div class=\"container text-center\">\n		<h2>SALE OFF! UP TO <span>70%</span><br>FLASH SALE</h2>\n		<a class=\"active\" href=\"#\">Shop collection</a>\n		<a href=\"#\">take a look</a>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s2 text-center\">\n					<h2 class=\"section-title\">special deals</h2>\n					<p>pleasure rationally encounter consequences</p>\n				</div>\n				{{block type=\"fltproducts/specials_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" limit=\"6\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"brands-sec\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n				<div class=\"product-slider row outer-top-xs logo-slider\">\n					<div id=\"brands-carousel\" class=\"logo-slider no-nav col-sm-12\">\n						{{block type=\"cms/block\" block_id=\"our_brands\"}}\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jeu6_cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES
(11, 'FAQs', 'one_column', NULL, NULL, 'faqs', NULL, '<div class=\"page-content\">\n	<div class=\"page-title\"><h2>FAQ</h2></div>\n	<span class=\"title-tag mb-20\">Last Updated on January 01, 2018</span>\n	<div class=\"panel-group accordian-wrap\" id=\"accordion\">\n		<!-- accordian-step-01  -->\n		<div class=\"panel panel-default accordian-step accordian-step-01\">\n			<!-- panel-heading -->\n			<div class=\"panel-heading\">\n				<h4 class=\"accordian-title\">\n					<a data-toggle=\"collapse\" class=\"\" data-parent=\"#accordion\" href=\"#collapseOne\">\n					  <span>1</span>Do you Ship Internationally ?\n					</a>\n				 </h4>\n			</div>\n			<!-- panel-heading -->\n			<div id=\"collapseOne\" class=\"panel-collapse collapse in\">\n				<!-- panel-body  -->\n				<div class=\"panel-body\">\n					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem.			\n				</div>\n				<!-- panel-body  -->\n			</div><!-- row -->\n		</div>\n		<!-- accordian-step-01  -->\n		<!-- accordian-step-02  -->\n		<div class=\"panel panel-default accordian-step accordian-step-02\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseTwo\">\n				  <span>2</span>Who should I to contact if I have any queries?	\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseTwo\" class=\"panel-collapse collapse\">\n			  <div class=\"panel-body\">\n				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n			  </div>\n			</div>\n		</div>\n		<!-- accordian-step-02  -->\n\n		<!-- accordian-step-03  -->\n		<div class=\"panel panel-default accordian-step accordian-step-03\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseThree\">\n					<span>3</span>How do I track my order ?\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseThree\" class=\"panel-collapse collapse\">\n			  <div class=\"panel-body\">\n				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n			  </div>\n			</div>\n		</div>\n		<!-- accordian-step-03  -->\n\n		<!-- accordian-step-04  -->\n		<div class=\"panel panel-default accordian-step accordian-step-04\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseFour\">\n					<span>4</span>How can I cancel or change my order ?\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseFour\" class=\"panel-collapse collapse\">\n				<div class=\"panel-body\">\n					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n				</div>\n			</div>\n		</div>\n		<!-- accordian-step-04  -->\n\n		<!-- accordian-step-05  -->\n		<div class=\"panel panel-default accordian-step accordian-step-05\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseFive\">\n					<span>5</span>How can I return a product\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseFive\" class=\"panel-collapse collapse\">\n			  <div class=\"panel-body\">\n				Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n			  </div>\n			</div>\n		</div>\n		<!-- accordian-step-05  -->\n\n		<!-- accordian-step-06  -->\n		<div class=\"panel panel-default accordian-step accordian-step-06\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseSix\">\n					<span>6</span>How long will it take to get my package ?\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseSix\" class=\"panel-collapse collapse\">\n				<div class=\"panel-body\">\n					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n				</div>\n			</div>\n		</div>\n		<!-- accordian-step-06  -->\n\n		<!-- accordian-step-07  -->\n		<div class=\"panel panel-default accordian-step accordian-step-07\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseSeven\">\n					<span>7</span>What Shipping methods are available ?\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseSeven\" class=\"panel-collapse collapse\">\n				<div class=\"panel-body\">\n					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n				</div>\n			</div>\n		</div>\n		<!-- accordian-step-07  -->\n\n		<!-- accordian-step-08  -->\n		<div class=\"panel panel-default accordian-step accordian-step-08\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseEight\">\n					<span>8</span>Do you provide any warranty ?\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseEight\" class=\"panel-collapse collapse\">\n				<div class=\"panel-body\">\n					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n				</div>\n			</div>\n		</div>\n		<!-- accordian-step-08  -->\n\n		<!-- accordian-step-09  -->\n		<div class=\"panel panel-default accordian-step accordian-step-09\">\n			<div class=\"panel-heading\">\n			  <h4 class=\"accordian-title\">\n				<a data-toggle=\"collapse\" class=\"collapsed\" data-parent=\"#accordion\" href=\"#collapseNine\">\n					<span>9</span>Do you have replacement guarantee ?\n				</a>\n			  </h4>\n			</div>\n			<div id=\"collapseNine\" class=\"panel-collapse collapse\">\n				<div class=\"panel-body\">\n					Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.\n				</div>\n			</div>\n		</div>\n		<!-- accordian-step-09  -->\n		\n	</div><!-- /.accordian-steps -->\n</div>\n<div class=\"col-md-12 no-nav\">\n	{{block type=\"cms/block\" block_id=\"our_brands\"}}\n</div>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Terms Conditions', 'one_column', NULL, NULL, 'terms-conditions', NULL, '<div class=\"page-content\">\n	<div class=\"page-title\"><h2>Terms And Conditions</h2></div>\n	<span class=\"title-tag\">This Agreement was last modified on July 20, 2017.</span>\n	<div class=\"page-inner-content\">\n		<h3 class=\"fntuc-head\">Intellectual Propertly</h3>\n		<ol>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. </li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n		</ol>\n		<h3 class=\"fntuc-head\">Termination</h3>\n		<ol>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. </li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n			<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis diam erat. Duis velit lectus, posuere a blandit sit amet, tempor at lorem. Donec ultricies, lorem sed ultrices interdum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n		</ol>\n		<h3 class=\"fntuc-head\">Changes to this agreement</h3>\n		<p>We reserve the right, at our sole discretion, to modify or replace these Terms and Conditions by posting the updated terms on the Site. Your continued use of the Site after any such changes constitutes your acceptance of the new Terms and Conditions. </p>\n		<br><br>\n		<h3 class=\"fntuc-head\">Contact Us</h3>\n		<p>If you have any questions about this Agreement, please contact us filling this <a href=\"{{config path=\"web/secure/base_url\"}}contact\" class=\'contact-form\'>contact form</a></p>\n	</div>\n</div>\n<div class=\"no-nav\">\n{{block type=\"cms/block\" block_id=\"our_brands\"}}\n</div>\n', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Marcus - Homepage 4', 'one_column', NULL, NULL, 'marcus-style-4', NULL, '{{block type=\"mainslider/mainslider\" name=\"mainslider\" template=\"perfectus/mainslider/slider.phtml\"}}\n<section class=\"banner home-banner3 ptb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"tbs-4 banner-slider banners-carousel owl-carousel\" data-item=\"3\" data-lg=\"3\" data-md=\"2\" data-sm=\"2\" data-xs=\"1\">\n				<div class=\"item\">\n					<div class=\"col-lg-12\">\n						<div class=\"single-banner product-banner-text hm4-bs1\">\n							<div class=\"single-img\">\n								<a href=\"#\">\n									<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm4-tb1.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n								</a>\n								<div class=\"banner-content\">\n									<div class=\"text\">\n										<h2>T-Shirt</h2>\n										<span>50% off this summer</span>\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class=\"item\">\n					<div class=\"col-lg-12\">\n						<div class=\"single-banner product-banner-text hm4-bs1\">\n							<div class=\"single-img\">\n								<a href=\"#\">\n									<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm4-tb2.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n								</a>\n								<div class=\"banner-content\">\n									<div class=\"text\">\n										<h2>Bags</h2>\n										<span>Spring sale up to 30% off</span>\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n				<div class=\"item\">\n					<div class=\"col-lg-12\">\n						<div class=\"single-banner product-banner-text hm4-bs1\">\n							<div class=\"single-img\">\n								<a href=\"#\">\n									<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm4-tb3.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n								</a>\n								<div class=\"banner-content\">\n									<div class=\"text\">\n										<h2>Shoes</h2>\n										<span>awsome new collection</span>\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s2 text-center\">\n					<h2 class=\"section-title\">Shop the new collection</h2>\n					<p>Sed ultricies metus accumsan erat dictum, at pellentesque dolor vestibulum</p>\n				</div>\n				{{block type=\"fltproducts/newproduct_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" limit=\"6\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner4 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/hm4-mb1.jpg\"}})\">\n	<div class=\"container text-center\">\n		<h3>#trending 2017</h3>\n		<h2>Spring fresh</h2>\n		<a class=\"button btn-flat button3\" href=\"#\">Shop collection</a>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s2 text-center\">\n					<h2 class=\"section-title\">Featured products</h2>\n					<p>Sed ultricies metus accumsan erat dictum, at pellentesque dolor vestibulum</p>\n				</div>\n				{{block type=\"fltproducts/featured_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" row_count=\"2\" limit=\"8\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"services mb-50\">\n	<div class=\"container\">\n		<div class=\"page-title pgt-s2 text-center\">\n			<h2 class=\"section-title\">Why Should Choose us?</h2>\n			<p>Fusce suscipit elit et eros pretium, eget feugiat dolor tristique</p>\n		</div>\n		<div class=\"pp-ser pp-ser3\">\n			<ul>\n				<li>\n					<i class=\"material-icons\">flight</i>\n					<div class=\"pp-cont\">\n						<strong>free shipping</strong>\n						<p>I must explain to you how all this mistaken idea.</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">card_giftcard</i>\n					<div class=\"pp-cont\">\n						<strong>special gift card</strong>\n						<p>At vero eos et accusamus et iusto odio dignissimos.</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">credit_card</i>\n					<div class=\"pp-cont\">\n						<strong>Easy payment</strong>\n						<p>Cupiditate non provident, similique sunt in culpa qui.</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">access_time</i>\n					<div class=\"pp-cont\">\n						<strong>30 days return</strong>\n						<p>Rerum necessitatibus saepe eveniet ut et voluptates.</p>\n					</div>\n				</li>\n			</ul>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner3 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/h1_newsletter_bg.jpg\"}})\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-lg-12 text-center\">\n				<h6>EASY RETURN <span class=\"theme-color\">FREE SHIPPING</span> ON ALL ORDERS OVER <span class=\"theme-color\">$49</span></h6>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"last-news blg-s2\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n			<div class=\"page-title pgt-s3 text-center\">\n				<h2 class=\"section-title\">Latest news</h2>\n				<p>Nam egestas magna aliquet tellus placerat auctor</p>\n			</div>\n			{{widget type=\"blog/slider\" blocks_count=\"3\" column_count=\"3\" column_lg=\"3\" column_md=\"3\" column_sm=\"2\" column_xs=\"1\"}}\n			</div>\n		</div>\n	</div>\n</section>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Marcus - Homepage 3', 'one_column', NULL, NULL, 'marcus-style-3', NULL, '{{block type=\"mainslider/mainslider\" name=\"mainslider\" template=\"perfectus/mainslider/slider.phtml\"}}\n<section class=\"banner home-banner3 ptb-50\">\n    <div class=\"container\">\n        <div class=\"page-title pgt-s3\">\n			<h2 class=\"section-title\">shop by category</h2>\n		</div>\n        <div class=\"row\">\n            <div class=\"tbs-3 banner-slider banners-carousel owl-carousel\" data-item=\"1\" data-lg=\"1\" data-md=\"1\" data-sm=\"1\" data-xs=\"1\">\n                <div class=\"item\">\n                    <div class=\"col-md-3 col-sm-3 col-xs-3 col-xxs-12\">\n                        <div class=\"single-banner banner-img hm3-bs1\">\n                            <a href=\"#\">\n                                <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-tb1.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                            </a>\n                            <div class=\"banner-content\">\n                                <div class=\"as-text\">\n                                    <a href=\"#\">jeans</a>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n\n                    <div class=\"col-md-9 col-sm-9 col-xs-9 col-xxs-12\">\n                        <div class=\"row\">\n                            <div class=\"col-xs-4 col-xxs-12\">\n                                <div class=\"single-banner banner-img hm3-bs1\">\n                                    <a href=\"#\">\n                                        <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-tb2.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                    </a>\n                                    <div class=\"banner-content\">\n                                        <div class=\"as-text\">\n                                            <a href=\"#\">shoes</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n\n                            <div class=\"col-xs-4 col-xxs-12 hm3-bs1\">\n                                <div class=\"single-banner banner-img\">\n                                    <a href=\"#\">\n                                        <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-tb3.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                    </a>\n                                    <div class=\"banner-content\">\n                                        <div class=\"as-text\">\n                                            <a href=\"#\">shirts</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n\n                            <div class=\"col-xs-4 col-xxs-12 hm3-bs1\">\n                                <div class=\"single-banner banner-img\">\n                                    <a href=\"#\">\n                                        <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-tb4.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                    </a>\n                                    <div class=\"banner-content\">\n                                        <div class=\"as-text\">\n                                            <a href=\"#\">bags</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n\n                            <div class=\"col-xs-6 col-xxs-12 hm3-bs1\">\n                                <div class=\"single-banner banner-img\">\n                                    <a href=\"#\">\n                                        <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-tb5.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                    </a>\n                                    <div class=\"banner-content\">\n                                        <div class=\"as-text\">\n                                            <a href=\"#\">shorts</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                            <div class=\"col-xs-6 col-xxs-12\">\n                                <div class=\"single-banner banner-img hm3-bs1\">\n                                    <a href=\"#\">\n                                        <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-tb6.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                    </a>\n                                    <div class=\"banner-content\">\n                                        <div class=\"as-text\">\n                                            <a href=\"#\">watches</a>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n\n                </div>\n            </div>\n        </div>\n    </div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s3\">\n					<h2 class=\"section-title\">just arrived</h2>\n				</div>\n				{{block type=\"fltproducts/newproduct_home_list\" column_count=\"5\" column_lg=\"5\" column_md=\"4\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" row_count=\"2\" limit=\"10\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"banners\">\n    <div class=\"container\">\n        <div class=\"our-banner\">\n			<div class=\"row\">\n				<div class=\"banner-slider banners-carousel owl-carousel\" data-item=\"1\">\n					<div class=\"item\">\n						<div class=\"col-xs-6 col-xxs-12\">\n							<div class=\"single-banner hm3-bs2\">\n								<a href=\"#\">\n									<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-bb1.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n								</a>\n								<div class=\"banner-content\">\n									<div class=\"banner-text\">\n										<h4 class=\"theme-color\">Exclusive</h4>\n										<h2>Discount & Offers</h2>\n									</div>\n								</div>\n							</div>\n						</div>\n						<div class=\"col-xs-6 col-xxs-12\">\n							<div class=\"banner-img6\">\n								<div class=\"single-banner hm3-bs2\">\n									<a href=\"#\">\n										<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-bb2.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n									</a>\n									<div class=\"banner-content\">\n										<div class=\"banner-text\">\n											<h4 class=\"theme-color\">SUPER  DEAL ONLY TODAY!</h4>\n											<h2>MEGA SALE OFF UP TO 70%</h2>\n											<a href=\"#\">Shop Now</a>\n										</div>\n									</div>\n								</div>\n							</div>\n							<div class=\"banner-img6\">\n								<div class=\"single-banner hm3-bs2\">\n									<a href=\"#\">\n										<img src=\"{{media url=\"wysiwyg/marcus/fashion/hm3-bb3.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n									</a>\n									<div class=\"banner-content\">\n										<div class=\"banner-text\">\n											<h4 class=\"theme-color\">new arrivals</h4>\n											<h2>Fashion <br>sale</h2>\n										</div>\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n    </div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s3\">\n					<h2 class=\"section-title\">best sellers</h2>\n				</div>\n				{{block type=\"fltproducts/bestsellers_home_list\" column_count=\"5\" column_lg=\"5\" column_md=\"4\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" limit=\"6\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"newsletter parallax_banner3 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/hm3-mb1.jpg\"}})\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-lg-12 text-center\">\n				<h6>Join our newsletter</h6>\n				<p>Sign up for our newsletter and gent <span class=\"theme-color\">40%</span> off your next order.</p>\n			</div>\n			<div class=\"col-lg-12\">\n				<div class=\"mb-newsletter\">\n				{{block type=\"newsletter/subscribe\" name=\"newsletter\" template=\"newsletter/footer_subscribe.phtml\"}}\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"last-news blg-s2 mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n			<div class=\"page-title pgt-s3\">\n				<h2 class=\"section-title\">Latest news</h2>\n			</div>\n			{{widget type=\"blog/slider\" blocks_count=\"3\" column_count=\"3\" column_lg=\"3\" column_md=\"3\" column_sm=\"2\" column_xs=\"1\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"services\">\n	<div class=\"container\">\n		<div class=\"pp-ser pp-s2\">\n			<ul>\n				<li>\n					<i class=\"material-icons\">flight</i>\n					<div class=\"pp-cont\">\n						<strong>free shipping</strong>\n						<p>On order over $200</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">call_to_action</i>\n					<div class=\"pp-cont\">\n						<strong>Easy payment</strong>\n						<p>Optimal for payment</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">access_time</i>\n					<div class=\"pp-cont\">\n						<strong>30 days return</strong>\n						<p>Money back guarantee</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">card_giftcard</i>\n					<div class=\"pp-cont\">\n						<strong>special gift card</strong>\n						<p>On order over $800</p>\n					</div>\n				</li>\n			</ul>\n		</div>\n	</div>\n</section>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Marcus - Homepage 5', 'one_column', NULL, NULL, 'marcus-style-5', NULL, '{{block type=\"mainslider/mainslider\" name=\"mainslider\" template=\"perfectus/mainslider/slider.phtml\"}}\n<section class=\"services ptb-50\">\n	<div class=\"container\">\n		<div class=\"pp-ser\">\n			<ul>\n				<li>\n					<i class=\"material-icons\">flight</i>\n					<div class=\"pp-cont\">\n						<strong>free shipping</strong>\n						<p>On order over $200</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">call_to_action</i>\n					<div class=\"pp-cont\">\n						<strong>Easy payment</strong>\n						<p>Optimal for payment</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">access_time</i>\n					<div class=\"pp-cont\">\n						<strong>30 days return</strong>\n						<p>Money back guarantee</p>\n					</div>\n				</li>\n				<li>\n					<i class=\"material-icons\">card_giftcard</i>\n					<div class=\"pp-cont\">\n						<strong>special gift card</strong>\n						<p>On order over $800</p>\n					</div>\n				</li>\n			</ul>\n		</div>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div id=\"product-tabs-slider\" class=\"scroll-tabs\">\n					<div class=\"row\">\n						<div class=\"col-sm-12\">\n							<div class=\"more-info-tab clearfix \">\n								<div class=\"page-title pgt-s5 text-center\">\n									<h2 class=\"section-title\">Browse our collection</h2>\n									<ul class=\"nav nav-tabs nav-tab-line pull-right\" id=\"new-products-tabs\">\n										<li class=\"active\"><a data-transition-type=\"backSlide\" href=\"#tbnp-1\" data-toggle=\"tab\">New</a></li>\n										<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-2\" data-toggle=\"tab\">Featured</a></li>\n										<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-3\" data-toggle=\"tab\">Special</a></li>\n									</ul>\n								</div>\n							</div>\n							<div class=\"tab-content outer-top-xs\">\n								<div class=\"tab-pane active\" id=\"tbnp-1\">\n									{{block type=\"fltproducts/newproduct_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" row_count=\"2\" limit=\"10\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-2\">\n									{{block type=\"fltproducts/featured_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" row_count=\"2\" limit=\"8\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-3\">\n									{{block type=\"fltproducts/specials_home_list\" column_count=\"4\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" row_count=\"2\" limit=\"8\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner3 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/h1_newsletter_bg.jpg\"}})\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-lg-12 text-center\">\n				<h6>EASY RETURN <span class=\"theme-color\">FREE SHIPPING</span> ON ALL ORDERS OVER <span class=\"theme-color\">$49</span></h6>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s1 text-center\">\n					<h2 class=\"section-title\">Featured collection</h2>\n				</div>\n				{{block type=\"fltproducts/featured_home_list\" column_count=\"3\" column_lg=\"3\" column_md=\"2\" column_sm=\"2\" column_xs=\"1\" column_xxs=\"1\" row_count=\"1\" row_count=\"2\" limit=\"8\" template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"last-news blg-s2\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n			<div class=\"page-title pgt-s1 text-center\">\n				<h2 class=\"section-title\">Latest news</h2>\n			</div>\n			{{widget type=\"blog/slider\" blocks_count=\"3\" column_count=\"3\" column_lg=\"3\" column_md=\"3\" column_sm=\"2\" column_xs=\"1\"}}\n			</div>\n		</div>\n	</div>\n</section>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Marcus - Homepage 6', 'one_column', NULL, NULL, 'marcus-style-6', NULL, '{{block type=\"mainslider/mainslider\" name=\"mainslider\" template=\"perfectus/mainslider/slider.phtml\"}}\n<section class=\"banner home-banner6 ptb-50\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"tbs-5 banner-slider banners-carousel owl-carousel\" data-item=\"3\" data-lg=\"3\" data-md=\"2\" data-sm=\"2\" data-xs=\"1\">\n                <div class=\"item\">\n                    <div class=\"col-md-12\">\n                        <div class=\"single-banner\">\n                            <div class=\"banner-img\">\n                                <a href=\"#\">\n                                    <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm6-tb1.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                </a>\n                                <div class=\"banner-content hm3-bs1\">\n                                    <div class=\"as-text\">\n                                        <a href=\"#\">Chair</a>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class=\"item\">\n                    <div class=\"col-md-12\">\n                        <div class=\"single-banner\">\n                            <div class=\"banner-img\">\n                                <a href=\"#\">\n                                    <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm6-tb2.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                </a>\n                                <div class=\"banner-content hm3-bs1\">\n                                    <div class=\"as-text\">\n                                        <a href=\"#\">sofa</a>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class=\"item\">\n                    <div class=\"col-md-12\">\n                        <div class=\"single-banner\">\n                            <div class=\"banner-img\">\n                                <a href=\"#\">\n                                    <img src=\"{{media url=\"wysiwyg/marcus/fashion/hm6-tb3.jpg\"}}\" width=\"auto\" height=\"auto\" alt=\"banner\" />\n                                </a>\n                                <div class=\"banner-content hm3-bs1\">\n                                    <div class=\"as-text\">\n                                        <a href=\"#\">bed</a>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div id=\"product-tabs-slider\" class=\"scroll-tabs\">\n					<div class=\"row\">\n						<div class=\"col-sm-12\">\n							<div class=\"more-info-tab clearfix \">\n								<div class=\"page-title pgt-s6 pgt-tb\">\n									<h2 class=\"section-title\">new arrivals.</h2>\n									<ul class=\"nav nav-tabs nav-tab-line pull-right\" id=\"new-products-tabs\">\n										<li class=\"active\"><a data-transition-type=\"backSlide\" href=\"#tbnp-1\" data-toggle=\"tab\">New</a></li>\n										<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-2\" data-toggle=\"tab\">Featured</a></li>\n										<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-3\" data-toggle=\"tab\">Special</a></li>\n									</ul>\n								</div>\n							</div>\n							<div class=\"tab-content outer-top-xs\">\n								<div class=\"tab-pane active\" id=\"tbnp-1\">\n									{{block type=\"fltproducts/newproduct_home_list\" column_count=\"5\" column_lg=\"5\" column_md=\"4\" column_sm=\"4\" column_xs=\"3\" column_xxs=\"2\" row_count=\"2\" limit=\"12\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-2\">\n									{{block type=\"fltproducts/featured_home_list\" column_count=\"5\" column_lg=\"5\" column_md=\"4\" column_sm=\"4\" column_xs=\"3\" column_xxs=\"2\" row_count=\"2\" limit=\"10\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-3\">\n									{{block type=\"fltproducts/specials_home_list\" column_count=\"5\" column_lg=\"5\" column_md=\"4\" column_sm=\"4\" column_xs=\"3\" column_xxs=\"2\" row_count=\"2\" limit=\"10\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner6 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/hm6-mb1.jpg\"}})\">\n	<div class=\"container text-center\">\n		<h3>sale on product <span class=\"theme-color\">40%</span></h3>\n		<a href=\"#\">Shop collection</a>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-md-12 col-sm-12\">\n				<div class=\"page-title pgt-s6\">\n					<h2 class=\"section-title\">specials.</h2>\n				</div>\n				{{block type=\"fltproducts/specials_home_list\" column_count=\"5\" column_lg=\"5\" column_md=\"4\" column_sm=\"4\" column_xs=\"3\" column_xxs=\"2\" limit=\"6\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner7 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/h1_newsletter_bg.jpg\"}})\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-lg-12 text-center\">\n				<h6>Sale up to <span class=\"theme-color\">60%</span> off for 1000+ products</h6>\n				<div class=\"date-px\">09 June to 16 July</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title pgt-s6\">\n					<h2 class=\"section-title\">furniture collection.</h2>\n				</div>\n				{{block type=\"fltproducts/allproducts_home_list\" product_ids=\"27,29,32,34,28,31,36\" column_count=\"3\" column_lg=\"3\" column_md=\"2\" column_sm=\"2\" column_xs=\"1\" column_xxs=\"1\" row_count=\"1\" row_count=\"2\" limit=\"8\" template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"last-news blg-s2\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n			<div class=\"page-title pgt-s6\">\n				<h2 class=\"section-title\">Latest news.</h2>\n			</div>\n			{{widget type=\"blog/slider\" blocks_count=\"3\" column_count=\"3\" column_lg=\"3\" column_md=\"3\" column_sm=\"2\" column_xs=\"1\"}}\n			</div>\n		</div>\n	</div>\n</section>', '2018-11-14 14:39:42', '2018-11-14 14:39:42', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jeu6_cms_page` (`page_id`, `title`, `root_template`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES
(17, 'Marcus - Homepage 7', 'one_column', NULL, NULL, 'marcus-style-7', NULL, '{{block type=\"mainslider/mainslider\" name=\"mainslider\" template=\"perfectus/mainslider/slider.phtml\"}}\n<section class=\"banner ptb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"banner-slider banners-carousel owl-carousel\" data-item=\"1\" data-lg=\"1\" data-md=\"1\" data-sm=\"1\" data-xs=\"1\">\n				<div class=\"item\">\n					<div class=\"col-md-6 col-xs-6 col-xxs-12\">\n						<div class=\"single-banner banner-img \">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb1.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1 f-ban\">\n								<div class=\"as-text\">\n									<h3>Men’s</h3>\n									<h4>Fashion year</h4>\n									<a href=\"#\">Shop now</a>\n								</div>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3 col-xs-3 col-xxs-6\">\n						<div class=\"single-banner banner-img \">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb2.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1\">\n								<div class=\"as-text\">\n									<a href=\"#\">T-Shirt</a>\n								</div>\n							</div>\n						</div>\n						<div class=\"single-banner banner-img bmgr\">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb3.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1\">\n								<div class=\"as-text\">\n									<a href=\"#\">jeans</a>\n								</div>\n							</div>\n						</div>\n					</div>\n					<div class=\"col-md-3 col-xs-3 col-xxs-6\">\n						<div class=\"single-banner banner-img \">\n							<a href=\"#\">\n								<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb4.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n							</a>\n							<div class=\"banner-content hm1-bs1\">\n								<div class=\"as-text\">\n									<a href=\"#\">shoes</a>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area pb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div id=\"product-tabs-slider\" class=\"scroll-tabs\">\n					<div class=\"row\">\n						<div class=\"col-sm-12\">\n							<div class=\"more-info-tab clearfix \">\n								<div class=\"page-title\">\n								<h2 class=\"new-product-title pull-left\">new<span>arrivals</span></h2>\n								<ul class=\"nav nav-tabs nav-tab-line pull-right\" id=\"new-products-tabs\">\n									<li class=\"active\"><a data-transition-type=\"backSlide\" href=\"#tbnp-1\" data-toggle=\"tab\">Men</a></li>\n									<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-2\" data-toggle=\"tab\">Woman</a></li>\n									<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-3\" data-toggle=\"tab\">Gifts</a></li>\n								</ul>\n							</div>\n							<div class=\"tab-content outer-top-xs\">\n								<div class=\"tab-pane active\" id=\"tbnp-1\">\n									{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"7\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"29\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-2\">\n									{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"7\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"3\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n								<div class=\"tab-pane\" id=\"tbnp-3\">\n									{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"7\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"59\" template=\"perfectus/fltproducts/slider.phtml\"}}\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/hm1-mb1.jpg\"}})\">\n	<div class=\"container text-center\">\n		<h3>2017 new style</h3>\n		<h2>SALE OFF UP TO 70%</h2>\n		<a href=\"#\">Shop now</a>\n	</div>\n</section>\n<section class=\"products-area pb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-sm-12\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">special<span>deals</span></h2>\n				</div>\n				{{block type=\"fltproducts/specials_home_list\" column_count=\"6\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" limit=\"8\" template=\"perfectus/fltproducts/slider.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"parallax_banner7 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/h1_newsletter_bg.jpg\"}})\">\n	<div alt=\"banner\" height=\"auto\" width=\"auto\">\n		<div class=\"container\">\n			<div class=\"row\">\n				<div class=\"col-lg-12 text-center\">\n					<h6>Sale up to <span class=\"theme-color\">60%</span> off for 1000+ products</h6>\n					<div class=\"date-px\">09 June to 16 July</div>		\n				</div>\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"products-area micro-product-area pb-30\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xl-3 col-lg-4 col-md-4 col-sm-6 col-xs-12 pb-20\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">best<span>seller</span></h2>\n				</div>\n				{{block type=\"fltproducts/bestsellers_home_list\" column_count=\'1\' row_count=\'2\' template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n			<div class=\"col-xl-3 col-lg-4 col-md-4 col-sm-6 col-xs-12 pb-20\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">on<span>sale</span></h2>						\n				</div>\n				{{block type=\"fltproducts/specials_home_list\" column_count=\'1\' row_count=\'2\' template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n			<div class=\"col-xl-3 col-lg-4 col-md-4 hidden-sm col-xs-12 pb-20\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">top<span>product</span></h2>	\n				</div>\n				{{block type=\"fltproducts/allproducts_home_list\" product_ids=\"10,2\" column_count=\'1\' row_count=\'2\' limit=\"2\" template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n			<div class=\"col-xl-3 hidden-lg hidden-md hidden-sm col-xs-12 pb-20\">\n				<div class=\"page-title\">\n					<h2 class=\"section-title\">featured<span>product</span></h2>	\n				</div>\n				{{block type=\"fltproducts/featured_home_list\" product_ids=\"10,2\" column_count=\'1\' row_count=\'2\' limit=\"2\" template=\"perfectus/fltproducts/micro.phtml\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"last-news blg-s1 mb-50\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n			<div class=\"page-title\">\n				<h2 class=\"section-title\">latest <span>news</span></h2>\n			</div>\n			{{widget type=\"blog/slider\" blocks_count=\"6\" column_count=\"5\" column_lg=\"3\" column_md=\"3\" column_sm=\"2\" column_xs=\"1\"}}\n			</div>\n		</div>\n	</div>\n</section>\n<section class=\"brands-sec\">\n	<div class=\"container\">\n		<div class=\"row\">\n			<div class=\"col-xs-12\">\n				<div class=\"product-slider row outer-top-xs logo-slider\">\n					<div id=\"brands-carousel\" class=\"logo-slider col-sm-12\">\n						<div class=\"page-title\"><h2>our <span>brands</span></h2></div>\n							<div class=\"logo-slider-inner owl-center-cont\">	\n								<div id=\"brand-slider\" class=\"owl-carousel home-owl-carousel custom-carousel\" data-item=\"8\" data-lg=\"5\" data-md=\"3\" data-sm=\"2\" data-xs=\"1\">\n									<div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											<img class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand1.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>\n									</div>\n									<div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											  <img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand2.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>	\n									</div>\n									<div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand3.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>	\n									</div>\n									<div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand4.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>	\n									</div>\n									<div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand5.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>	\n									</div>\n									<div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand6.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>	\n									</div>\n									 <div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand1.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>\n									</div>\n									<div class=\"item \">\n										<a href=\"#\" class=\"image\">\n											<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand2.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>	\n									</div>\n									<div class=\"item\">\n										<a href=\"#\" class=\"image\">\n											<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand3.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n										</a>	\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>', '2018-11-14 14:39:43', '2018-11-14 14:39:43', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'About Us', 'one_column', NULL, NULL, 'about-us', NULL, '<div class=\"page-content\">\n	<div class=\"row\">\n		<div class=\"col-md-12 mb-30\">\n			<div class=\"about-image\">\n				<img src=\"{{media url=\"wysiwyg/marcus/about/about-com.jpg\"}}\" alt=\"about\" />\n			</div>\n			<div class=\"about-text\">\n				<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.</p>\n				<div class=\"row\">\n					<div class=\"col-sm-6\">\n						<div class=\"col-sm-1 col-xs-1\">\n							<i class=\"material-icons\">beenhere</i>\n						</div>\n						<div class=\"col-sm-11 col-xs-11\">\n							<h6>Best Service</h6>\n							<p>Must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth.</p>\n						</div>\n					</div>\n					<div class=\"col-sm-6\">\n						<div class=\"col-sm-1 col-xs-1\">\n							<i class=\"material-icons\">thumb_up</i>\n						</div>\n						<div class=\"col-sm-11 col-xs-11\">\n							<h6>Best Service</h6>\n							<p>Must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth.</p>\n						</div>\n					</div>\n					<div class=\"col-sm-6\">\n						<div class=\"col-sm-1 col-xs-1\">\n							<i class=\"material-icons\">live_help</i>\n						</div>\n						<div class=\"col-sm-11 col-xs-11\">\n							<h6>Best Service</h6>\n							<p>Must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth.</p>\n						</div>\n					</div>\n					<div class=\"col-sm-6\">\n						<div class=\"col-sm-1 col-xs-1\">\n							<i class=\"material-icons\">settings</i>\n						</div>\n						<div class=\"col-sm-11 col-xs-11\">\n							<h6>Best Service</h6>\n							<p>Must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth.</p>\n						</div>\n					</div>\n				</div>\n			</div>\n			<!-- about-text -->\n		</div>\n		<div class=\"col-sm-12\">\n			<div class=\"page-title\">\n				<h2>meet our <span>team</span></h2>\n			</div>\n			<div class=\"product-slider mprod-s1\">\n				<div class=\"home-owl-carousel custom-carousel team-slider owl-carousel owl-theme outer-top-xs\" data-stype=\"slider\" data-item=\"4\" data-lg=\"4\" data-md=\"3\" data-sm=\"3\" data-xs=\"2\" data-xxs=\"1\">\n					<div class=\"our-team \">\n						<div class=\"our-team-img\">\n							<img src=\"{{media url=\"wysiwyg/marcus/about/t1.jpg\"}}\" alt=\"our team\" />\n						</div>\n						<div class=\"our-team-hover\">\n							<span>\n								<strong>Joan Burgess</strong>\n								<p>UI designer</p>\n								<ul>\n									<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-pinterest-p\" aria-hidden=\"true\"></i></a></li>							\n								</ul>		\n							</span>\n						</div>\n					</div>\n					<div class=\"our-team \">\n						<div class=\"our-team-img\">\n							<img src=\"{{media url=\"wysiwyg/marcus/about/t2.jpg\"}}\" alt=\"our team\" />\n						</div>\n						<div class=\"our-team-hover\">\n							<span>\n								<strong>Joan Burgess</strong>\n								<p>UI designer</p>\n								<ul>\n									<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-pinterest-p\" aria-hidden=\"true\"></i></a></li>							\n								</ul>		\n							</span>\n						</div>\n					</div>\n					<div class=\"our-team \">\n						<div class=\"our-team-img\">\n							<img src=\"{{media url=\"wysiwyg/marcus/about/t3.jpg\"}}\" alt=\"our team\" />\n						</div>\n						<div class=\"our-team-hover\">\n							<span>\n								<strong>Joan Burgess</strong>\n								<p>UI designer</p>\n								<ul>\n									<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-pinterest-p\" aria-hidden=\"true\"></i></a></li>							\n								</ul>		\n							</span>\n						</div>\n					</div>\n					<div class=\"our-team \">\n						<div class=\"our-team-img\">\n							<img src=\"{{media url=\"wysiwyg/marcus/about/t4.jpg\"}}\" alt=\"our team\" />\n						</div>\n						<div class=\"our-team-hover\">\n							<span>\n								<strong>Joan Burgess</strong>\n								<p>UI designer</p>\n								<ul>\n									<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-pinterest-p\" aria-hidden=\"true\"></i></a></li>							\n								</ul>		\n							</span>\n						</div>\n					</div>\n					<div class=\"our-team \">\n						<div class=\"our-team-img\">\n							<img src=\"{{media url=\"wysiwyg/marcus/about/t1.jpg\"}}\" alt=\"our team\" />\n						</div>\n						<div class=\"our-team-hover\">\n							<span>\n								<strong>Joan Burgess</strong>\n								<p>UI designer</p>\n								<ul>\n									<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-pinterest-p\" aria-hidden=\"true\"></i></a></li>							\n								</ul>		\n							</span>\n						</div>\n					</div>\n					<div class=\"our-team \">\n						<div class=\"our-team-img\">\n							<img src=\"{{media url=\"wysiwyg/marcus/about/t2.jpg\"}}\" alt=\"our team\" />\n						</div>\n						<div class=\"our-team-hover\">\n							<span>\n								<strong>Joan Burgess</strong>\n								<p>UI designer</p>\n								<ul>\n									<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-pinterest-p\" aria-hidden=\"true\"></i></a></li>							\n								</ul>		\n							</span>\n						</div>\n					</div>\n					<div class=\"our-team \">\n						<div class=\"our-team-img\">\n							<img src=\"{{media url=\"wysiwyg/marcus/about/t3.jpg\"}}\" alt=\"our team\" />\n						</div>\n						<div class=\"our-team-hover\">\n							<span>\n								<strong>Joan Burgess</strong>\n								<p>UI designer</p>\n								<ul>\n									<li><a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a></li>\n									<li><a href=\"#\"><i class=\"fa fa-pinterest-p\" aria-hidden=\"true\"></i></a></li>							\n								</ul>		\n							</span>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</div>', '2018-11-14 14:39:43', '2018-11-14 14:39:43', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Marcus - Homepage 8', 'one_column', NULL, NULL, 'marcus-style-8', NULL, '<div class=\"container\">\n<div class=\"mt-40 home-2columns-left\">\n	<div class=\"row\">\n		<div class=\"col-main col-xl-10 col-lg-9 col-md-9 col-xs-12 pull-right col-main\">\n			<section class=\"banner mb-50\">\n					<div class=\"row\">\n						<div class=\"banner-slider banners-carousel owl-carousel\" data-item=\"1\" data-lg=\"1\" data-md=\"1\" data-sm=\"1\" data-xs=\"1\">\n							<div class=\"item\">\n								<div class=\"col-md-6 col-xs-6 col-xxs-12\">\n									<div class=\"single-banner banner-img \">\n										<a href=\"#\">\n											<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb1.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n										</a>\n										<div class=\"banner-content hm1-bs1 f-ban\">\n											<div class=\"as-text\">\n												<h3>Men’s</h3>\n												<h4>Fashion year</h4>\n												<a href=\"#\">Shop now</a>\n											</div>\n										</div>\n									</div>\n								</div>\n								<div class=\"col-md-3 col-xs-3 col-xxs-6\">\n									<div class=\"single-banner banner-img \">\n										<a href=\"#\">\n											<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb2.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n										</a>\n										<div class=\"banner-content hm1-bs1\">\n											<div class=\"as-text\">\n												<a href=\"#\">T-Shirt</a>\n											</div>\n										</div>\n									</div>\n									<div class=\"single-banner banner-img bmgr\">\n										<a href=\"#\">\n											<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb3.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n										</a>\n										<div class=\"banner-content hm1-bs1\">\n											<div class=\"as-text\">\n												<a href=\"#\">jeans</a>\n											</div>\n										</div>\n									</div>\n								</div>\n								<div class=\"col-md-3 col-xs-3 col-xxs-6\">\n									<div class=\"single-banner banner-img \">\n										<a href=\"#\">\n											<img class=\"img-responsive\" src=\"{{media url=\"wysiwyg/marcus/fashion/hm1-tb4.jpg\"}}\" alt=\"Banner\" title=\"\" width=\"auto\" height=\"auto\">\n										</a>\n										<div class=\"banner-content hm1-bs1\">\n											<div class=\"as-text\">\n												<a href=\"#\">shoes</a>\n											</div>\n										</div>\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n			</section>\n			<section class=\"products-area pb-50\">\n					<div class=\"row\">\n						<div class=\"col-sm-12\">\n							<div id=\"product-tabs-slider\" class=\"scroll-tabs\">\n								<div class=\"row\">\n									<div class=\"col-sm-12\">\n										<div class=\"more-info-tab clearfix \">\n											<div class=\"page-title\">\n												<h2 class=\"new-product-title pull-left\">new<span>arrivals</span></h2>\n												<ul class=\"nav nav-tabs nav-tab-line pull-right\" id=\"new-products-tabs\">\n													<li class=\"active\"><a data-transition-type=\"backSlide\" href=\"#tbnp-1\" data-toggle=\"tab\">Men</a></li>\n													<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-2\" data-toggle=\"tab\">Woman</a></li>\n													<li class=\"\"><a data-transition-type=\"backSlide\" href=\"#tbnp-3\" data-toggle=\"tab\">Gifts</a></li>\n												</ul>\n											</div>\n											<div class=\"tab-content outer-top-xs\">\n												<div class=\"tab-pane active\" id=\"tbnp-1\">\n													{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"6\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"29\" template=\"perfectus/fltproducts/slider.phtml\"}}\n												</div>\n												<div class=\"tab-pane\" id=\"tbnp-2\">\n													{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"6\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"3\" template=\"perfectus/fltproducts/slider.phtml\"}}\n												</div>\n												<div class=\"tab-pane\" id=\"tbnp-3\">\n													{{block type=\"fltproducts/newproductcattabs_home_list\" column_count=\"6\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" category_ids=\"59\" template=\"perfectus/fltproducts/slider.phtml\"}}\n												</div>\n											</div>\n										</div>\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n			</section>\n			<section class=\"parallax_banner mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/hm1-mb1.jpg\"}})\">\n				<div class=\"text-center\">\n					<h3>2017 new style</h3>\n					<h2>SALE OFF UP TO 70%</h2>\n					<a href=\"#\">Shop now</a>\n				</div>\n			</section>\n			<section class=\"products-area pb-50\">\n					<div class=\"row\">\n						<div class=\"col-sm-12\">\n							<div class=\"page-title\">\n								<h2 class=\"section-title\">special<span>deals</span></h2>\n							</div>\n							{{block type=\"fltproducts/specials_home_list\" column_count=\"6\" column_lg=\"4\" column_md=\"3\" column_sm=\"3\" column_xs=\"2\" column_xxs=\"1\" limit=\"8\" template=\"perfectus/fltproducts/slider.phtml\"}}\n						</div>\n					</div>\n			</section>\n			<section class=\"parallax_banner7 mb-50\" style=\"background-image: url({{media url=\"wysiwyg/marcus/fashion/h1_newsletter_bg.jpg\"}})\">\n				<div alt=\"banner\" height=\"auto\" width=\"auto\">\n						<div class=\"row\">\n							<div class=\"col-lg-12 text-center\">\n								<h6>Sale up to <span class=\"theme-color\">60%</span> off for 1000+ products</h6>\n								<div class=\"date-px\">09 June to 16 July</div>		\n							</div>\n						</div>\n				</div>\n			</section>\n			<section class=\"last-news blg-s1 mb-50\">\n				<div class=\"container\">\n					<div class=\"row\">\n						<div class=\"col-xs-12\">\n						<div class=\"page-title\">\n							<h2 class=\"section-title\">latest <span>news</span></h2>\n						</div>\n						{{widget type=\"blog/slider\" blocks_count=\"6\" column_count=\"5\" column_lg=\"3\" column_md=\"3\" column_sm=\"2\" column_xs=\"1\"}}\n						</div>\n					</div>\n				</div>\n			</section>\n		</div>\n		<div class=\"col-left col-xl-2 col-lg-3 col-md-3 hidden-sm hidden-xs sidebar pull-left sidebar sidebar-home\">\n			{{block type=\"megamenu/sidebarnav\" name=\"sidebarnav\" template=\"perfectus/megamenu/sidebar.phtml\"}}\n			{{block type=\"fltproducts/newproduct_home_list\" block-title=\"New Products\" column_count=\"1\" row_count=\"3\" limit=\"6\"  name=\"newsprod-sidebar\" template=\"perfectus/fltproducts/sidebar_block.phtml\"}}\n			{{block type=\"fltproducts/specials_home_list\" block-title=\"Special Offer\" column_count=\"1\" row_count=\"4\" limit=\"4\" name=\"newproducts-sidebar\" template=\"perfectus/fltproducts/sidebar_block.phtml\"}}\n			{{block type=\"cms/block\" block_id=\"sidebar_banners\"}}\n			{{block type=\"newsletter/subscribe\" name=\"newsletter\" template=\"newsletter/homesidebar_subscribe.phtml\"}}\n		</div>\n		<div class=\"col-md-12 col-sm-12 col-xs-12\">\n			<section class=\"brands-sec\">\n				<div class=\"container\">\n					<div class=\"row\">\n						<div class=\"col-xs-12\">\n							<div class=\"product-slider row outer-top-xs logo-slider\">\n								<div id=\"brands-carousel\" class=\"logo-slider col-sm-12\">\n										<div class=\"logo-slider-inner owl-center-cont\">	\n											<div id=\"brand-slider\" class=\"owl-carousel home-owl-carousel custom-carousel\" data-item=\"8\" data-lg=\"5\" data-md=\"3\" data-sm=\"2\" data-xs=\"1\">\n												<div class=\"item\">\n													<a href=\"#\" class=\"image\">\n														<img class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand1.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>\n												</div>\n												<div class=\"item\">\n													<a href=\"#\" class=\"image\">\n														  <img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand2.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>	\n												</div>\n												<div class=\"item\">\n													<a href=\"#\" class=\"image\">\n														<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand3.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>	\n												</div>\n												<div class=\"item\">\n													<a href=\"#\" class=\"image\">\n														<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand4.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>	\n												</div>\n												<div class=\"item\">\n													<a href=\"#\" class=\"image\">\n														<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand5.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>	\n												</div>\n												<div class=\"item\">\n													<a href=\"#\" class=\"image\">\n														<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand6.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>	\n												</div>\n												 <div class=\"item\">\n													<a href=\"#\" class=\"image\">\n														<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand1.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>\n												</div>\n												<div class=\"item \">\n													<a href=\"#\" class=\"image\">\n														<img  class=\"lazyOwl\" data-src=\"{{media url=\"wysiwyg/marcus/brands/brand2.png\"}}\" src=\"{{media url=\"wysiwyg/marcus/blank.gif\"}}\" alt=\"Brand\" title=\"Brand\" width=\"auto\" height=\"auto\">\n													</a>	\n												</div>\n											</div>\n										</div>\n									</div>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</section>\n		</div>\n	</div>\n</div>\n</div>', '2018-11-14 14:39:43', '2018-11-14 14:39:43', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cms_page_store`
--

CREATE TABLE `jeu6_cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

--
-- Dumping data for table `jeu6_cms_page_store`
--

INSERT INTO `jeu6_cms_page_store` (`page_id`, `store_id`) VALUES
(1, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_cache`
--

CREATE TABLE `jeu6_core_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_cache_option`
--

CREATE TABLE `jeu6_core_cache_option` (
  `code` varchar(32) NOT NULL COMMENT 'Code',
  `value` smallint(6) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache Options';

--
-- Dumping data for table `jeu6_core_cache_option`
--

INSERT INTO `jeu6_core_cache_option` (`code`, `value`) VALUES
('block_html', 0),
('collections', 0),
('config', 0),
('config_api', 0),
('eav', 0),
('layout', 0),
('translate', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_cache_tag`
--

CREATE TABLE `jeu6_core_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_config_data`
--

CREATE TABLE `jeu6_core_config_data` (
  `config_id` int(10) UNSIGNED NOT NULL COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config Data';

--
-- Dumping data for table `jeu6_core_config_data`
--

INSERT INTO `jeu6_core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES
(1, 'default', 0, 'catalog/category/root_id', '2'),
(5, 'default', 0, 'general/locale/code', 'en_US'),
(6, 'default', 0, 'general/locale/timezone', 'America/Los_Angeles'),
(7, 'default', 0, 'currency/options/base', 'PKR'),
(8, 'default', 0, 'currency/options/default', 'PKR'),
(9, 'default', 0, 'currency/options/allow', 'PKR'),
(10, 'default', 0, 'admin/dashboard/enable_charts', '1'),
(11, 'default', 0, 'web/secure/base_url', 'http://devplugin.aamirsalman.com/'),
(12, 'default', 0, 'web/unsecure/base_url', 'http://devplugin.aamirsalman.com/'),
(13, 'default', 0, 'web/seo/use_rewrites', '1'),
(14, 'default', 0, 'advanced/modules_disable_output/Mage_AdminNotification', '1'),
(15, 'default', 0, 'general/region/display_all', '1'),
(16, 'default', 0, 'general/region/state_required', 'PK'),
(17, 'default', 0, 'payment/paypal_express/skip_order_review_step', '0'),
(18, 'default', 0, 'admin/emails/forgot_email_template', 'admin_emails_forgot_email_template'),
(19, 'default', 0, 'admin/emails/forgot_email_identity', 'general'),
(20, 'default', 0, 'admin/emails/password_reset_link_expiration_period', '2'),
(21, 'default', 0, 'admin/startup/page', 'dashboard'),
(22, 'default', 0, 'admin/url/use_custom', '0'),
(23, 'default', 0, 'admin/url/use_custom_path', '0'),
(24, 'default', 0, 'admin/security/use_form_key', '1'),
(25, 'default', 0, 'admin/security/use_case_sensitive_login', '0'),
(26, 'default', 0, 'admin/security/session_cookie_lifetime', NULL),
(27, 'default', 0, 'admin/security/domain_policy_backend', '2'),
(28, 'default', 0, 'admin/security/validate_formkey_checkout', '1'),
(29, 'default', 0, 'admin/security/domain_policy_frontend', '2'),
(30, 'default', 0, 'admin/security/extensions_compatibility_mode', '1'),
(31, 'default', 0, 'admin/security/crate_admin_user_notification', '0'),
(32, 'default', 0, 'admin/security/forgot_password_flow_secure', '1'),
(33, 'default', 0, 'admin/security/forgot_password_ip_times', '5'),
(34, 'default', 0, 'admin/security/forgot_password_email_times', '5'),
(35, 'default', 0, 'admin/captcha/enable', '0'),
(36, 'default', 0, 'dev/restrict/allow_ips', NULL),
(37, 'default', 0, 'dev/debug/profiler', '0'),
(38, 'default', 0, 'dev/translate_inline/active', '0'),
(39, 'default', 0, 'dev/translate_inline/active_admin', '0'),
(40, 'default', 0, 'dev/log/active', '1'),
(41, 'default', 0, 'dev/log/file', 'product-updates.log'),
(42, 'default', 0, 'dev/log/exception_file', 'exception.log'),
(43, 'default', 0, 'dev/js/merge_files', '0'),
(44, 'default', 0, 'dev/css/merge_css_files', '0'),
(45, 'default', 0, 'advanced/modules_disable_output/Cm_RedisSession', '0'),
(46, 'default', 0, 'advanced/modules_disable_output/Mage_Admin', '0'),
(47, 'default', 0, 'advanced/modules_disable_output/Mage_Api', '0'),
(48, 'default', 0, 'advanced/modules_disable_output/Mage_Api2', '0'),
(49, 'default', 0, 'advanced/modules_disable_output/Mage_Authorizenet', '0'),
(50, 'default', 0, 'advanced/modules_disable_output/Mage_Backup', '0'),
(51, 'default', 0, 'advanced/modules_disable_output/Mage_Bundle', '0'),
(52, 'default', 0, 'advanced/modules_disable_output/Mage_Captcha', '0'),
(53, 'default', 0, 'advanced/modules_disable_output/Mage_Catalog', '0'),
(54, 'default', 0, 'advanced/modules_disable_output/Mage_CatalogIndex', '0'),
(55, 'default', 0, 'advanced/modules_disable_output/Mage_CatalogInventory', '0'),
(56, 'default', 0, 'advanced/modules_disable_output/Mage_CatalogRule', '0'),
(57, 'default', 0, 'advanced/modules_disable_output/Mage_CatalogSearch', '0'),
(58, 'default', 0, 'advanced/modules_disable_output/Mage_Centinel', '0'),
(59, 'default', 0, 'advanced/modules_disable_output/Mage_Checkout', '0'),
(60, 'default', 0, 'advanced/modules_disable_output/Mage_Cms', '0'),
(61, 'default', 0, 'advanced/modules_disable_output/Mage_Compiler', '0'),
(62, 'default', 0, 'advanced/modules_disable_output/Mage_ConfigurableSwatches', '0'),
(63, 'default', 0, 'advanced/modules_disable_output/Mage_Connect', '0'),
(64, 'default', 0, 'advanced/modules_disable_output/Mage_Contacts', '0'),
(65, 'default', 0, 'advanced/modules_disable_output/Mage_Core', '0'),
(66, 'default', 0, 'advanced/modules_disable_output/Mage_Cron', '0'),
(67, 'default', 0, 'advanced/modules_disable_output/Mage_CurrencySymbol', '0'),
(68, 'default', 0, 'advanced/modules_disable_output/Mage_Customer', '0'),
(69, 'default', 0, 'advanced/modules_disable_output/Mage_Dataflow', '0'),
(70, 'default', 0, 'advanced/modules_disable_output/Mage_Directory', '0'),
(71, 'default', 0, 'advanced/modules_disable_output/Mage_Downloadable', '0'),
(72, 'default', 0, 'advanced/modules_disable_output/Mage_Eav', '0'),
(73, 'default', 0, 'advanced/modules_disable_output/Mage_GiftMessage', '0'),
(74, 'default', 0, 'advanced/modules_disable_output/Mage_GoogleAnalytics', '0'),
(75, 'default', 0, 'advanced/modules_disable_output/Mage_GoogleCheckout', '0'),
(76, 'default', 0, 'advanced/modules_disable_output/Mage_ImportExport', '0'),
(77, 'default', 0, 'advanced/modules_disable_output/Mage_Index', '0'),
(78, 'default', 0, 'advanced/modules_disable_output/Mage_Install', '0'),
(79, 'default', 0, 'advanced/modules_disable_output/Mage_Log', '0'),
(80, 'default', 0, 'advanced/modules_disable_output/Mage_Media', '0'),
(81, 'default', 0, 'advanced/modules_disable_output/Mage_Newsletter', '0'),
(82, 'default', 0, 'advanced/modules_disable_output/Mage_Oauth', '0'),
(83, 'default', 0, 'advanced/modules_disable_output/Mage_Page', '0'),
(84, 'default', 0, 'advanced/modules_disable_output/Mage_PageCache', '0'),
(85, 'default', 0, 'advanced/modules_disable_output/Mage_Paygate', '0'),
(86, 'default', 0, 'advanced/modules_disable_output/Mage_Payment', '0'),
(87, 'default', 0, 'advanced/modules_disable_output/Mage_Paypal', '0'),
(88, 'default', 0, 'advanced/modules_disable_output/Mage_PaypalUk', '0'),
(89, 'default', 0, 'advanced/modules_disable_output/Mage_Persistent', '0'),
(90, 'default', 0, 'advanced/modules_disable_output/Mage_Poll', '0'),
(91, 'default', 0, 'advanced/modules_disable_output/Mage_ProductAlert', '0'),
(92, 'default', 0, 'advanced/modules_disable_output/Mage_ProductLogUpdate', '0'),
(93, 'default', 0, 'advanced/modules_disable_output/Mage_Rating', '0'),
(94, 'default', 0, 'advanced/modules_disable_output/Mage_Reports', '0'),
(95, 'default', 0, 'advanced/modules_disable_output/Mage_Review', '0'),
(96, 'default', 0, 'advanced/modules_disable_output/Mage_Rss', '0'),
(97, 'default', 0, 'advanced/modules_disable_output/Mage_Rule', '0'),
(98, 'default', 0, 'advanced/modules_disable_output/Mage_Sales', '0'),
(99, 'default', 0, 'advanced/modules_disable_output/Mage_SalesRule', '0'),
(100, 'default', 0, 'advanced/modules_disable_output/Mage_Sendfriend', '0'),
(101, 'default', 0, 'advanced/modules_disable_output/Mage_Shipping', '0'),
(102, 'default', 0, 'advanced/modules_disable_output/Mage_Sitemap', '0'),
(103, 'default', 0, 'advanced/modules_disable_output/Mage_Tag', '0'),
(104, 'default', 0, 'advanced/modules_disable_output/Mage_Tax', '0'),
(105, 'default', 0, 'advanced/modules_disable_output/Mage_Uploader', '0'),
(106, 'default', 0, 'advanced/modules_disable_output/Mage_Usa', '0'),
(107, 'default', 0, 'advanced/modules_disable_output/Mage_Weee', '0'),
(108, 'default', 0, 'advanced/modules_disable_output/Mage_Widget', '0'),
(109, 'default', 0, 'advanced/modules_disable_output/Mage_Wishlist', '0'),
(110, 'default', 0, 'advanced/modules_disable_output/Mage_XmlConnect', '0'),
(111, 'default', 0, 'advanced/modules_disable_output/Phoenix_Moneybookers', '0'),
(112, 'default', 0, 'configswatches/general/enabled', '1'),
(113, 'default', 0, 'configswatches/general/swatch_attributes', '83'),
(114, 'default', 0, 'configswatches/general/product_list_attribute', NULL),
(115, 'default', 0, 'configswatches/general/product_list_price_change', '0'),
(116, 'default', 0, 'configswatches/product_detail_dimensions/width', '21'),
(117, 'default', 0, 'configswatches/product_detail_dimensions/height', '21'),
(118, 'default', 0, 'configswatches/product_listing_dimensions/width', '15'),
(119, 'default', 0, 'configswatches/product_listing_dimensions/height', '15'),
(120, 'default', 0, 'configswatches/layered_nav_dimensions/width', '15'),
(121, 'default', 0, 'configswatches/layered_nav_dimensions/height', '15'),
(122, 'default', 0, 'design/package/name', 'perfectus'),
(123, 'default', 0, 'design/package/ua_regexp', 'a:0:{}'),
(124, 'default', 0, 'design/theme/locale', NULL),
(125, 'default', 0, 'design/theme/template', 'marcus'),
(126, 'default', 0, 'design/theme/template_ua_regexp', 'a:0:{}'),
(127, 'default', 0, 'design/theme/skin', 'marcus'),
(128, 'default', 0, 'design/theme/skin_ua_regexp', 'a:0:{}'),
(129, 'default', 0, 'design/theme/layout', 'marcus'),
(130, 'default', 0, 'design/theme/layout_ua_regexp', 'a:0:{}'),
(131, 'default', 0, 'design/theme/default', 'marcus'),
(132, 'default', 0, 'design/theme/default_ua_regexp', 'a:0:{}'),
(133, 'default', 0, 'design/head/default_title', 'Magento Commerce'),
(134, 'default', 0, 'design/head/title_prefix', NULL),
(135, 'default', 0, 'design/head/title_suffix', NULL),
(136, 'default', 0, 'design/head/default_description', 'Default Description'),
(137, 'default', 0, 'design/head/default_keywords', 'Magento, Varien, E-commerce'),
(138, 'default', 0, 'design/head/default_robots', 'INDEX,FOLLOW'),
(139, 'default', 0, 'design/head/includes', NULL),
(140, 'default', 0, 'design/head/demonotice', '0'),
(141, 'default', 0, 'design/header/logo_src', 'images/logo.gif'),
(142, 'default', 0, 'design/header/logo_alt', 'Magento Commerce'),
(143, 'default', 0, 'design/header/logo_src_small', 'images/logo.gif'),
(144, 'default', 0, 'design/header/welcome', 'Default welcome msg!'),
(145, 'default', 0, 'design/footer/copyright', '&copy; 2018 Magento Demo Store. All Rights Reserved.'),
(146, 'default', 0, 'design/footer/absolute_footer', NULL),
(147, 'default', 0, 'design/watermark/image_size', NULL),
(148, 'default', 0, 'design/watermark/image_imageOpacity', NULL),
(149, 'default', 0, 'design/watermark/image_position', 'stretch'),
(150, 'default', 0, 'design/watermark/small_image_size', NULL),
(151, 'default', 0, 'design/watermark/small_image_imageOpacity', NULL),
(152, 'default', 0, 'design/watermark/small_image_position', 'stretch'),
(153, 'default', 0, 'design/watermark/thumbnail_size', NULL),
(154, 'default', 0, 'design/watermark/thumbnail_imageOpacity', NULL),
(155, 'default', 0, 'design/watermark/thumbnail_position', 'stretch'),
(156, 'default', 0, 'design/pagination/pagination_frame', '5'),
(157, 'default', 0, 'design/pagination/pagination_frame_skip', NULL),
(158, 'default', 0, 'design/pagination/anchor_text_for_previous', NULL),
(159, 'default', 0, 'design/pagination/anchor_text_for_next', NULL),
(160, 'default', 0, 'design/email/logo_alt', NULL),
(161, 'default', 0, 'design/email/logo_width', NULL),
(162, 'default', 0, 'design/email/logo_height', NULL),
(163, 'default', 0, 'design/email/header', 'design_email_header'),
(164, 'default', 0, 'design/email/footer', 'design_email_footer'),
(165, 'default', 0, 'design/email/css_non_inline', 'email-non-inline.css'),
(166, 'default', 0, 'marcus_settings/general/store_layout', '0'),
(167, 'default', 0, 'marcus_settings/general/product_style', 'mprod-s1'),
(168, 'default', 0, 'marcus_settings/header/style', '1'),
(169, 'default', 0, 'marcus_settings/header/header_banner_enable', '1'),
(170, 'default', 0, 'marcus_settings/header/header_banner_id', 'header_topbar_banner_slider'),
(171, 'default', 0, 'marcus_settings/header/logo_alt', 'Marcus'),
(172, 'default', 0, 'marcus_settings/header/header_contact', '(400) 888 888 868 '),
(173, 'default', 0, 'marcus_settings/header/header_time', 'Mon to Sat : 08:00AM to 09:00PM'),
(174, 'default', 0, 'marcus_settings/header/social_links_block_id', 'social_links'),
(175, 'default', 0, 'marcus_settings/header/compare_link', '1'),
(176, 'default', 0, 'marcus_settings/header/sticky_nav', '1'),
(177, 'default', 0, 'marcus_settings/footer/style', '1'),
(178, 'default', 0, 'marcus_settings/footer/active_intagram', '1'),
(179, 'default', 0, 'marcus_settings/footer/insta_userid', '2324131028'),
(180, 'default', 0, 'marcus_settings/footer/insta_clientid', '422b4d6cf31747f7990a723ca097f64e'),
(181, 'default', 0, 'marcus_settings/footer/insta_accesstoken', '2324131028.422b4d6.d6d71d31431a4e8fbf6cb1efa1a2dfdc'),
(182, 'default', 0, 'marcus_settings/footer/insta_cont', '<div class=\"instagram-text text-center\"><p><i class=\"fa fa-instagram\"></i>marcus_theme<span> on Instagram</span></p></div>'),
(183, 'default', 0, 'marcus_settings/footer/copyrights_text', 'Copyright &copy; 2018  Marcus -  All rights Reserved'),
(184, 'default', 0, 'marcus_settings/category/category_layout', '0'),
(185, 'default', 0, 'marcus_settings/category/categoryinfo_layout', 'inside'),
(186, 'default', 0, 'marcus_settings/category/categoryinfo_image', '1'),
(187, 'default', 0, 'marcus_settings/category/categoryinfo_title', 'inside'),
(188, 'default', 0, 'marcus_settings/category/categoryinfo_desc', 'inside'),
(189, 'default', 0, 'marcus_settings/category_products/catgrid_1col_xl', '6'),
(190, 'default', 0, 'marcus_settings/category_products/catgrid_1col_lg', '4'),
(191, 'default', 0, 'marcus_settings/category_products/catgrid_1col_md', '3'),
(192, 'default', 0, 'marcus_settings/category_products/catgrid_1col_sm', '3'),
(193, 'default', 0, 'marcus_settings/category_products/catgrid_1col_xs', '2'),
(194, 'default', 0, 'marcus_settings/category_products/catgrid_1col_xxs', '1'),
(195, 'default', 0, 'marcus_settings/category_products/catgrid_2col_xl', '5'),
(196, 'default', 0, 'marcus_settings/category_products/catgrid_2col_lg', '3'),
(197, 'default', 0, 'marcus_settings/category_products/catgrid_2col_md', '2'),
(198, 'default', 0, 'marcus_settings/category_products/catgrid_2col_sm', '3'),
(199, 'default', 0, 'marcus_settings/category_products/catgrid_2col_xs', '2'),
(200, 'default', 0, 'marcus_settings/category_products/catgrid_2col_xxs', '1'),
(201, 'default', 0, 'marcus_settings/category_products/catgrid_3col_xl', '4'),
(202, 'default', 0, 'marcus_settings/category_products/catgrid_3col_lg', '2'),
(203, 'default', 0, 'marcus_settings/category_products/catgrid_3col_md', '2'),
(204, 'default', 0, 'marcus_settings/category_products/catgrid_3col_sm', '3'),
(205, 'default', 0, 'marcus_settings/category_products/catgrid_3col_xs', '2'),
(206, 'default', 0, 'marcus_settings/category_products/catgrid_3col_xxs', '1'),
(207, 'default', 0, 'marcus_settings/category_products/catprod_altimg_enable', '1'),
(208, 'default', 0, 'marcus_settings/category_products/catprod_aspratio', '0'),
(209, 'default', 0, 'marcus_settings/category_products/catprodimg_width', '276'),
(210, 'default', 0, 'marcus_settings/category_products/catprodimg_height', '342'),
(211, 'default', 0, 'marcus_settings/category_products/catprod_sku_enable', '0'),
(212, 'default', 0, 'marcus_settings/category_products/catprod_price_enable', '1'),
(213, 'default', 0, 'marcus_settings/category_products/catprod_rating_enable', '1'),
(214, 'default', 0, 'marcus_settings/category_products/catprod_wishlist_enable', '1'),
(215, 'default', 0, 'marcus_settings/category_products/catprod_compare_enable', '1'),
(216, 'default', 0, 'marcus_settings/category_products/catprod_addtocart_enable', '1'),
(217, 'default', 0, 'marcus_settings/category_products/catprod_quickview_enable', '1'),
(218, 'default', 0, 'marcus_settings/product_info/product_layout', '2columns-right'),
(219, 'default', 0, 'marcus_settings/product_info/productinfo_sku_enable', '1'),
(220, 'default', 0, 'marcus_settings/product_info/productinfo_quickinfo_enable', '1'),
(221, 'default', 0, 'marcus_settings/product_info/product_imgview', 'm'),
(222, 'default', 0, 'marcus_settings/product_info/product_aspratio', '1'),
(223, 'default', 0, 'marcus_settings/product_info/product_image_width', '336'),
(224, 'default', 0, 'marcus_settings/product_info/product_image_height', '417'),
(225, 'default', 0, 'marcus_settings/product_info/elevate_enable', '1'),
(226, 'default', 0, 'marcus_settings/product_info/zoom_type', 'window'),
(227, 'default', 0, 'marcus_settings/product_info/zoom_window_width', '400'),
(228, 'default', 0, 'marcus_settings/product_info/zoom_window_height', '400'),
(229, 'default', 0, 'marcus_settings/product_info/elevate_lenssize', '200'),
(230, 'default', 0, 'marcus_settings/product_info/elevate_lenstype', 'square'),
(231, 'default', 0, 'marcus_settings/product_info/elevate_bordersize', '1'),
(232, 'default', 0, 'marcus_settings/product_info/elevate_bordercolor', '888888'),
(233, 'default', 0, 'marcus_settings/product_info/elevate_tint', '1'),
(234, 'default', 0, 'marcus_settings/product_info/elevate_scrollzoom', '1'),
(235, 'default', 0, 'marcus_settings/product_info/elevate_easing', '1'),
(236, 'default', 0, 'marcus_settings/product_info/elevate_cursor', 'pointer'),
(237, 'default', 0, 'marcus_settings/product_info/elevate_lightbox', '1'),
(238, 'default', 0, 'marcus_settings/product_info/productinfo_tabs_enable', '1'),
(239, 'default', 0, 'marcus_settings/product_info/productinfo_custom_tab_enable', '1'),
(240, 'default', 0, 'marcus_settings/product_info/pinfo_cmsblock_tab_1_enable', '1'),
(241, 'default', 0, 'marcus_settings/product_info/pinfo_cmsblock_tab_2_enable', '0'),
(242, 'default', 0, 'marcus_settings/product_info/pinfo_cmsblock_tab_3_enable', '0'),
(243, 'default', 0, 'marcus_settings/product_info/pinfo_cmsblock_tab_4_enable', '0'),
(244, 'default', 0, 'marcus_settings/product_info/pinfo_cmsblock_tab_5_enable', '0'),
(245, 'default', 0, 'marcus_settings/products_slider/prodslider_altimg_enable', '1'),
(246, 'default', 0, 'marcus_settings/products_slider/prodslider_aspratio', '0'),
(247, 'default', 0, 'marcus_settings/products_slider/prodsliderimg_width', '276'),
(248, 'default', 0, 'marcus_settings/products_slider/prodsliderimg_height', '342'),
(249, 'default', 0, 'marcus_settings/products_slider/prodmslider_altimg_enable', '0'),
(250, 'default', 0, 'marcus_settings/products_slider/prodmslider_aspratio', '0'),
(251, 'default', 0, 'marcus_settings/products_slider/prodmsliderimg_width', '110'),
(252, 'default', 0, 'marcus_settings/products_slider/prodmsliderimg_height', '136'),
(253, 'default', 0, 'marcus_settings/products_slider/prodslider_sku_enable', '0'),
(254, 'default', 0, 'marcus_settings/products_slider/prodslider_price_enable', '1'),
(255, 'default', 0, 'marcus_settings/products_slider/prodslider_rating_enable', '1'),
(256, 'default', 0, 'marcus_settings/products_slider/prodslider_wishlist_enable', '1'),
(257, 'default', 0, 'marcus_settings/products_slider/prodslider_compare_enable', '1'),
(258, 'default', 0, 'marcus_settings/products_slider/prodslider_addtocart_enable', '1'),
(259, 'default', 0, 'marcus_settings/products_slider/prodslider_quickview_enable', '1'),
(260, 'default', 0, 'marcus_settings/product_related/relatedprod_enable', '1'),
(261, 'default', 0, 'marcus_settings/product_related/relatedprod_title', 'Related Products'),
(262, 'default', 0, 'marcus_settings/product_related/relatedprod_max', '12'),
(263, 'default', 0, 'marcus_settings/product_related/relatedprod_1col_xl', '6'),
(264, 'default', 0, 'marcus_settings/product_related/relatedprod_1col_lg', '4'),
(265, 'default', 0, 'marcus_settings/product_related/relatedprod_1col_md', '3'),
(266, 'default', 0, 'marcus_settings/product_related/relatedprod_1col_sm', '3'),
(267, 'default', 0, 'marcus_settings/product_related/relatedprod_1col_xs', '2'),
(268, 'default', 0, 'marcus_settings/product_related/relatedprod_1col_xxs', '1'),
(269, 'default', 0, 'marcus_settings/product_related/relatedprod_2col_xl', '5'),
(270, 'default', 0, 'marcus_settings/product_related/relatedprod_2col_lg', '3'),
(271, 'default', 0, 'marcus_settings/product_related/relatedprod_2col_md', '2'),
(272, 'default', 0, 'marcus_settings/product_related/relatedprod_2col_sm', '3'),
(273, 'default', 0, 'marcus_settings/product_related/relatedprod_2col_xs', '2'),
(274, 'default', 0, 'marcus_settings/product_related/relatedprod_2col_xxs', '1'),
(275, 'default', 0, 'marcus_settings/product_related/relatedprod_3col_xl', '4'),
(276, 'default', 0, 'marcus_settings/product_related/relatedprod_3col_lg', '2'),
(277, 'default', 0, 'marcus_settings/product_related/relatedprod_3col_md', '2'),
(278, 'default', 0, 'marcus_settings/product_related/relatedprod_3col_sm', '3'),
(279, 'default', 0, 'marcus_settings/product_related/relatedprod_3col_xs', '2'),
(280, 'default', 0, 'marcus_settings/product_related/relatedprod_3col_xxs', '1'),
(281, 'default', 0, 'marcus_settings/product_related/relatedprod_sku_enable', '0'),
(282, 'default', 0, 'marcus_settings/product_related/relatedprod_price_enable', '1'),
(283, 'default', 0, 'marcus_settings/product_related/relatedprod_rating_enable', '1'),
(284, 'default', 0, 'marcus_settings/product_related/relatedprod_wishlist_enable', '1'),
(285, 'default', 0, 'marcus_settings/product_related/relatedprod_quickview_enable', '0'),
(286, 'default', 0, 'marcus_settings/product_upsell/upsellprod_enable', '1'),
(287, 'default', 0, 'marcus_settings/product_upsell/upsellprod_title', 'Upsell Products'),
(288, 'default', 0, 'marcus_settings/product_upsell/upsellprod_max', '12'),
(289, 'default', 0, 'marcus_settings/product_upsell/upsellprod_1col_xl', '6'),
(290, 'default', 0, 'marcus_settings/product_upsell/upsellprod_1col_lg', '4'),
(291, 'default', 0, 'marcus_settings/product_upsell/upsellprod_1col_md', '3'),
(292, 'default', 0, 'marcus_settings/product_upsell/upsellprod_1col_sm', '3'),
(293, 'default', 0, 'marcus_settings/product_upsell/upsellprod_1col_xs', '2'),
(294, 'default', 0, 'marcus_settings/product_upsell/upsellprod_1col_xxs', '1'),
(295, 'default', 0, 'marcus_settings/product_upsell/upsellprod_2col_xl', '5'),
(296, 'default', 0, 'marcus_settings/product_upsell/upsellprod_2col_lg', '3'),
(297, 'default', 0, 'marcus_settings/product_upsell/upsellprod_2col_md', '2'),
(298, 'default', 0, 'marcus_settings/product_upsell/upsellprod_2col_sm', '3'),
(299, 'default', 0, 'marcus_settings/product_upsell/upsellprod_2col_xs', '2'),
(300, 'default', 0, 'marcus_settings/product_upsell/upsellprod_2col_xxs', '1'),
(301, 'default', 0, 'marcus_settings/product_upsell/upsellprod_3col_xl', '4'),
(302, 'default', 0, 'marcus_settings/product_upsell/upsellprod_3col_lg', '2'),
(303, 'default', 0, 'marcus_settings/product_upsell/upsellprod_3col_md', '2'),
(304, 'default', 0, 'marcus_settings/product_upsell/upsellprod_3col_sm', '3'),
(305, 'default', 0, 'marcus_settings/product_upsell/upsellprod_3col_xs', '2'),
(306, 'default', 0, 'marcus_settings/product_upsell/upsellprod_3col_xxs', '1'),
(307, 'default', 0, 'marcus_settings/product_upsell/upsellprod_sku_enable', '0'),
(308, 'default', 0, 'marcus_settings/product_upsell/upsellprod_price_enable', '1'),
(309, 'default', 0, 'marcus_settings/product_upsell/upsellprod_rating_enable', '1'),
(310, 'default', 0, 'marcus_settings/product_upsell/upsellprod_wishlist_enable', '1'),
(311, 'default', 0, 'marcus_settings/product_upsell/upsellprod_quickview_enable', '0'),
(312, 'default', 0, 'marcus_settings/product_labels/new', '1'),
(313, 'default', 0, 'marcus_settings/product_labels/sale', '2'),
(314, 'default', 0, 'marcus_settings/newsletter_popup/enabled', '1'),
(315, 'default', 0, 'marcus_settings/newsletter_popup/newsletter_pop_cont', '<h2 class=\"heading font34 inverse\">Newsletter</h2><h3>enjoy <span class=\"theme-color\">25%</span> off</h3><p class=\"scissor text-center\">Sign Up Our Newsletter &amp;	<br> Get Discount For Your Next Purchase!</p>'),
(316, 'default', 0, 'marcus_settings/newsletter_popup/newsletter_pop_dtime', '2000'),
(317, 'default', 0, 'marcus_settings/newsletter_popup/newsletter_pop_width', '900px'),
(318, 'default', 0, 'marcus_settings/newsletter_popup/newsletter_pop_height', '450px'),
(319, 'default', 0, 'marcus_settings/newsletter_popup/newsletter_pop_bgcolor', 'F5F5F5'),
(320, 'default', 0, 'marcus_settings/contacts/gmap_enabled', '1'),
(321, 'default', 0, 'marcus_settings/contacts/custom_store_info', 'contacts_store_information'),
(322, 'default', 0, 'marcus_settings/theme_install/overwrite_blocks', '1'),
(323, 'default', 0, 'marcus_settings/theme_install/overwrite_pages', '1'),
(324, 'default', 0, 'web/default/cms_home_page', 'marcus-style-1'),
(325, 'default', 0, 'web/default/cms_no_route', 'no-route'),
(326, 'default', 0, 'cms_wysiwyg/wysiwyg/enabled', '0'),
(327, 'default', 0, 'marcus_design/basic/general_color_themesettings', '0'),
(328, 'default', 0, 'marcus_design/basic/theme_color', 'FA4E64'),
(329, 'default', 0, 'marcus_design/basic/text_color', '252525'),
(330, 'default', 0, 'marcus_design/basic/link_color', '252525'),
(331, 'default', 0, 'marcus_design/basic/link_hover_color', 'FA4E64'),
(332, 'default', 0, 'marcus_design/basic/btn_bg_color', 'F2F2F2'),
(333, 'default', 0, 'marcus_design/basic/btn_text_color', '252525'),
(334, 'default', 0, 'marcus_design/basic/btn_border_color', 'F2F2F2'),
(335, 'default', 0, 'marcus_design/basic/btn_hbg_color', 'FA4E64'),
(336, 'default', 0, 'marcus_design/basic/btn_htext_color', 'fff'),
(337, 'default', 0, 'marcus_design/basic/btn_hborder_color', 'FA4E64'),
(338, 'default', 0, 'marcus_design/basic/btn2_bg_color', 'FA4E64'),
(339, 'default', 0, 'marcus_design/basic/btn2_text_color', 'FFFFFF'),
(340, 'default', 0, 'marcus_design/basic/btn2_border_color', 'FA4E64'),
(341, 'default', 0, 'marcus_design/basic/btn2_hbg_color', '333E48'),
(342, 'default', 0, 'marcus_design/basic/btn2_htext_color', 'FFFFFF'),
(343, 'default', 0, 'marcus_design/basic/btn2_hborder_color', '333E48'),
(344, 'default', 0, 'marcus_design/basic/btn3_bg_color', '333E48'),
(345, 'default', 0, 'marcus_design/basic/btn3_text_color', 'FFFFFF'),
(346, 'default', 0, 'marcus_design/basic/btn3_border_color', '333E48'),
(347, 'default', 0, 'marcus_design/basic/btn3_hbg_color', 'FA4E64'),
(348, 'default', 0, 'marcus_design/basic/btn3_htext_color', 'FFFFFF'),
(349, 'default', 0, 'marcus_design/basic/btn3_hborder_color', 'FA4E64'),
(350, 'default', 0, 'marcus_design/basic/newlabel_color', '2ECC71'),
(351, 'default', 0, 'marcus_design/basic/salelabel_color', 'E59F02'),
(352, 'default', 0, 'marcus_design/header/header_color_themesettings', '0'),
(353, 'default', 0, 'marcus_design/header/topbar_banner_bg', 'FB6F81'),
(354, 'default', 0, 'marcus_design/header/topbar_banner_text', 'FFFFFF'),
(355, 'default', 0, 'marcus_design/header/topbar_bg', 'FFFFFF'),
(356, 'default', 0, 'marcus_design/header/topbar_text', '252525'),
(357, 'default', 0, 'marcus_design/header/topbar_link_color', '252525'),
(358, 'default', 0, 'marcus_design/header/topbar_link_hcolor', 'FA4E64'),
(359, 'default', 0, 'marcus_design/header/topbar_link_border_color', 'E2E2E2'),
(360, 'default', 0, 'marcus_design/header/topbar_welcomtext_color', 'FA4E64'),
(361, 'default', 0, 'marcus_design/header/header_bg', 'FFFFFF'),
(362, 'default', 0, 'marcus_design/header/header_text_color', '252525'),
(363, 'default', 0, 'marcus_design/header/header_search_bg', 'F6F6F6'),
(364, 'default', 0, 'marcus_design/header/header_search_color', '252525'),
(365, 'default', 0, 'marcus_design/footer/footer_color_themesettings', '0'),
(366, 'default', 0, 'marcus_design/footer/fbot_bg', 'F5F5F5'),
(367, 'default', 0, 'marcus_design/footer/fbot_text', '252525'),
(368, 'default', 0, 'marcus_design/footer/fbot_bhead_text', '252525'),
(369, 'default', 0, 'marcus_design/footer/fbot_link', '252525'),
(370, 'default', 0, 'marcus_design/footer/fbot_hlink', 'FA4E64'),
(371, 'default', 0, 'marcus_design/footer/fcopyrights_bg', 'FFFFFF'),
(372, 'default', 0, 'marcus_design/footer/fcopyrights_text', '252525'),
(373, 'default', 0, 'marcus_design/fonts/font_family', 'default'),
(374, 'default', 0, 'marcus_design/fonts/google_fontfamily', 'Poppins'),
(375, 'default', 0, 'marcus_design/fonts/googleprimary_char_latin_ext', ''),
(376, 'default', 0, 'marcus_design/fonts/general_fontsize', 'default'),
(377, 'default', 0, 'marcus_design/fonts/head_font_family', 'default'),
(378, 'default', 0, 'marcus_design/fonts/head_google_fontfamily', 'Poppins'),
(379, 'default', 0, 'marcus_design/fonts/head_googleprimary_char_latin_ext', ''),
(380, 'default', 0, 'marcus_design/fonts/head_fontweight', 'default'),
(381, 'default', 0, 'marcus_design/megamenu/megamenu_color_themesettings', '0'),
(382, 'default', 0, 'marcus_design/megamenu/nav_bg', 'F5F5F5'),
(383, 'default', 0, 'marcus_design/megamenu/nav_item_hbg', 'EEEEEE'),
(384, 'default', 0, 'marcus_design/megamenu/nav_fontsize', 'default'),
(385, 'default', 0, 'marcus_design/megamenu/nav_text', '252525'),
(386, 'default', 0, 'marcus_design/megamenu/nav_item_htext', 'FA4E64'),
(387, 'default', 0, 'marcus_design/megamenu/megamenu_bg', 'FFFFFF'),
(388, 'default', 0, 'marcus_design/megamenu/megamenu_text', '252525'),
(389, 'default', 0, 'marcus_design/megamenu/megamenu_col_headtext', '252525'),
(390, 'default', 0, 'marcus_design/megamenu/megamenu_col_headb', '252525'),
(391, 'default', 0, 'marcus_design/megamenu/megamenu_link', '252525'),
(392, 'default', 0, 'marcus_design/megamenu/megamenu_hlink', 'FA4E64'),
(393, 'default', 0, 'marcus_design/category/category_color_themesettings', '0'),
(394, 'default', 0, 'marcus_design/category/category_title_color', 'ddd'),
(395, 'default', 0, 'marcus_design/category/category_desc_color', 'ddd'),
(396, 'default', 0, 'marcus_design/product_info/productinfo_color_themesettings', '0'),
(397, 'default', 0, 'marcus_design/product_info/product_tabs_text', '252525'),
(398, 'default', 0, 'marcus_design/product_info/product_tabs_htext', 'FA4E64'),
(399, 'default', 0, 'marcus_design/product_info/product_tabs_atext', 'FA4E64'),
(400, 'default', 0, 'marcus_settings/header/theme_logo', 'logo.png'),
(401, 'default', 0, 'marcus_settings/footer/footer_logo', 'logo.png'),
(402, 'default', 0, 'marcus_settings/product_info/elevate_tint_color', '000000'),
(403, 'default', 0, 'marcus_settings/product_info/elevate_tint_opacity', '0.3'),
(404, 'default', 0, 'marcus_settings/product_info/elevate_easingduration', '1000'),
(405, 'default', 0, 'marcus_settings/product_info/pinfo_cmsblock_tab_1_id', 'productinfo_custom_tab'),
(406, 'default', 0, 'marcus_settings/product_related/relatedprod_compare_enable', '1'),
(407, 'default', 0, 'marcus_settings/product_related/relatedprod_addtocart_enable', '1'),
(408, 'default', 0, 'marcus_settings/product_upsell/upsellprod_compare_enable', '1'),
(409, 'default', 0, 'marcus_settings/product_upsell/upsellprod_addtocart_enable', '1'),
(410, 'default', 0, 'marcus_settings/newsletter_popup/newsletter_pop_logo', 'images/logo_mid.png'),
(411, 'default', 0, 'marcus_settings/newsletter_popup/newsletter_pop_bgimage', 'newsletterpop_bg.jpg'),
(412, 'default', 0, 'marcus_settings/contacts/custom_gmap', 'contacts_google_map'),
(413, 'default', 0, 'perfectus_mainslider/settings/mainslider_enable', '1'),
(414, 'default', 0, 'perfectus_mainslider/options/full_width', '1'),
(415, 'default', 0, 'perfectus_mainslider/options/slider_width', '1140'),
(416, 'default', 0, 'perfectus_mainslider/options/auto_height', '0'),
(417, 'default', 0, 'perfectus_mainslider/options/slider_height', '800'),
(418, 'default', 0, 'perfectus_mainslider/options/slider_onhoverpause', '1'),
(419, 'default', 0, 'perfectus_mainslider/options/slider_controls', '1'),
(420, 'default', 0, 'perfectus_mainslider/options/slider_pager', '1'),
(421, 'default', 0, 'perfectus_mainslider/options/slider_autoplay', '1'),
(422, 'default', 0, 'perfectus_mainslider/options/slider_slidetransspeed', '2000'),
(423, 'default', 0, 'perfectus_mainslider/options/slider_effecttype', 'slide'),
(424, 'default', 0, 'perfectus_mainslider/options/slider_infinite', '1'),
(425, 'default', 0, 'price_ajaxfilter/ajax_conf/layered', '1'),
(426, 'default', 0, 'price_ajaxfilter/ajax_conf/ajaxfilter', '1'),
(427, 'default', 0, 'price_ajaxfilter/ajax_conf/toolbar', '1'),
(428, 'default', 0, 'price_ajaxfilter/ajax_conf/overlay_color', '000000'),
(429, 'default', 0, 'price_ajaxfilter/ajax_conf/overlay_opacity', '0.1'),
(430, 'default', 0, 'price_ajaxfilter/ajax_conf/loading_image', 'default/ajax-loader.gif'),
(431, 'default', 0, 'price_ajaxfilter/ajax_conf/loading_text_color', ''),
(432, 'default', 0, 'price_ajaxfilter/ajax_conf/loading_text', ''),
(433, 'default', 0, 'price_ajaxfilter/ajax_conf/afterAjax', ''),
(434, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_settings/ajaxfilter_loader_active', '1'),
(435, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_settings/include_jquery', '0'),
(436, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_settings/include_jquery_ui', '1'),
(437, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/timeout', '100'),
(438, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/use_image', '0'),
(439, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/handle_image', ''),
(440, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/background_image', ''),
(441, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/range_image', ''),
(442, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/handle_color', 'FFFFFF'),
(443, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/handle_border_color', 'FA4E64'),
(444, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/background_color', 'F1F1F1'),
(445, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/range_color', 'C3C3C3'),
(446, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/handle_width', '20'),
(447, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/handle_height', '20'),
(448, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/ajaxfilter_width', 'auto'),
(449, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/ajaxfilter_height', '6'),
(450, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/amount_style', ''),
(451, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/textbox', '1'),
(452, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/textBoxCss', 'border:1px solid #f2f2f2; color:#555; padding:3px; width:50px;'),
(453, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/goBtnText', 'Filter'),
(454, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/goBtnCss', ''),
(455, 'default', 0, 'price_ajaxfilter/price_ajaxfilter_conf/onSlide', ''),
(456, 'default', 0, 'ajaxpkt/ajaxpkt_conf/ajaxpkt_active', '1'),
(457, 'default', 0, 'perfectus_megamenu/general/enabled', '1'),
(458, 'default', 0, 'perfectus_megamenu/general/web_menu', '1'),
(459, 'default', 0, 'perfectus_megamenu/general/max_level', '4'),
(460, 'default', 0, 'perfectus_megamenu/general/show_home_link', 'lnk-icon'),
(461, 'default', 0, 'perfectus_megamenu/general/display_empty_categories', '1'),
(462, 'default', 0, 'perfectus_megamenu/general/default_menu_type', 'full_width'),
(463, 'default', 0, 'perfectus_megamenu/general/default_menu_columns', '4'),
(464, 'default', 0, 'perfectus_megamenu/general/mobile_menu', '1'),
(465, 'default', 0, 'perfectus_megamenu/general/navmenu_before_block', 'pu_before_navmenu_links'),
(466, 'default', 0, 'perfectus_megamenu/general/navmenu_after_block', 'pu_after_navmenu_links'),
(467, 'default', 0, 'perfectus_megamenu/general/sidebar_enabled', '1'),
(468, 'default', 0, 'perfectus_megamenu/general/showsidebar_home_link', 'lnk'),
(469, 'default', 0, 'perfectus_megamenu/category_labels/label_1', 'New'),
(470, 'default', 0, 'perfectus_megamenu/category_labels/label_2', 'Hot!'),
(471, 'default', 0, 'fltproducts/newprodcattabs/active', '1'),
(472, 'default', 0, 'fltproducts/newprodcattabs/title', 'New Products'),
(473, 'default', 0, 'fltproducts/newprodcattabs/max_cat', '5'),
(474, 'default', 0, 'fltproducts/newprodcattabs/max_product', '25'),
(475, 'default', 0, 'fltproducts/newprodcattabs/column_count', '1'),
(476, 'default', 0, 'fltproducts/newprodcattabs/row_count', '1'),
(477, 'default', 0, 'fltproducts/newproduct/active', '1'),
(478, 'default', 0, 'fltproducts/newproduct/title', 'new arrivals'),
(479, 'default', 0, 'fltproducts/newproduct/max_product', '6'),
(480, 'default', 0, 'fltproducts/newproduct/products_styles', 'slider'),
(481, 'default', 0, 'fltproducts/newproduct/column_count', '1'),
(482, 'default', 0, 'fltproducts/newproduct/row_count', '1'),
(483, 'default', 0, 'fltproducts/featured/active', '1'),
(484, 'default', 0, 'fltproducts/featured/title', 'Featured Products'),
(485, 'default', 0, 'fltproducts/featured/max_product', '18'),
(486, 'default', 0, 'fltproducts/featured/products_styles', 'micro'),
(487, 'default', 0, 'fltproducts/featured/column_count', '1'),
(488, 'default', 0, 'fltproducts/featured/row_count', '1'),
(489, 'default', 0, 'fltproducts/bestsellers/active', '0'),
(490, 'default', 0, 'fltproducts/bestsellers/title', 'Best Seller'),
(491, 'default', 0, 'fltproducts/bestsellers/max_product', '6'),
(492, 'default', 0, 'fltproducts/bestsellers/products_styles', 'slider'),
(493, 'default', 0, 'fltproducts/bestsellers/column_count', '1'),
(494, 'default', 0, 'fltproducts/bestsellers/row_count', '1'),
(495, 'default', 0, 'fltproducts/specials/active', '1'),
(496, 'default', 0, 'fltproducts/specials/title', 'special deals'),
(497, 'default', 0, 'fltproducts/specials/max_product', '6'),
(498, 'default', 0, 'fltproducts/specials/products_styles', 'slider'),
(499, 'default', 0, 'fltproducts/specials/column_count', '1'),
(500, 'default', 0, 'fltproducts/specials/row_count', '1'),
(501, 'default', 0, 'fltproducts/mostviewed/active', '0'),
(502, 'default', 0, 'fltproducts/mostviewed/title', 'Most Viewed'),
(503, 'default', 0, 'fltproducts/mostviewed/max_product', '15'),
(504, 'default', 0, 'fltproducts/mostviewed/products_styles', 'slider'),
(505, 'default', 0, 'fltproducts/mostviewed/column_count', '1'),
(506, 'default', 0, 'fltproducts/mostviewed/row_count', '1'),
(507, 'default', 0, 'fltproducts/allproducts/active', '0'),
(508, 'default', 0, 'fltproducts/allproducts/title', 'All Products'),
(509, 'default', 0, 'fltproducts/allproducts/max_product', '20'),
(510, 'default', 0, 'fltproducts/allproducts/products_styles', 'slider'),
(511, 'default', 0, 'fltproducts/allproducts/column_count', '1'),
(512, 'default', 0, 'fltproducts/allproducts/row_count', '1'),
(513, 'default', 0, 'fltproducts/promotional/active', '0'),
(514, 'default', 0, 'fltproducts/promotional/title', 'Promotional Products'),
(515, 'default', 0, 'fltproducts/promotional/max_product', '6'),
(516, 'default', 0, 'fltproducts/promotional/products_styles', 'slider'),
(517, 'default', 0, 'fltproducts/promotional/column_count', '1'),
(518, 'default', 0, 'fltproducts/promotional/row_count', '1'),
(519, 'default', 0, 'fltproducts/lastordered/active', '0'),
(520, 'default', 0, 'fltproducts/lastordered/title', 'Recently Ordered'),
(521, 'default', 0, 'fltproducts/lastordered/max_product', '15'),
(522, 'default', 0, 'fltproducts/lastordered/products_styles', 'slider'),
(523, 'default', 0, 'fltproducts/lastordered/column_count', '1'),
(524, 'default', 0, 'fltproducts/lastordered/row_count', '1'),
(525, 'default', 0, 'paypal/general/merchant_country', 'US'),
(526, 'default', 0, 'payment/payflow_advanced/partner', 'PayPal'),
(527, 'default', 0, 'payment/payflow_advanced/vendor', 'PayPal'),
(528, 'default', 0, 'payment/payflow_advanced/user', 'PayPal'),
(529, 'default', 0, 'payment/payflow_advanced/pwd', NULL),
(530, 'default', 0, 'payment/payflow_advanced/sandbox_flag', '0'),
(531, 'default', 0, 'payment/payflow_advanced/use_proxy', '0'),
(532, 'default', 0, 'paypal/general/business_account', NULL),
(533, 'default', 0, 'paypal/wpp/api_authentication', '0'),
(534, 'default', 0, 'paypal/wpp/api_username', NULL),
(535, 'default', 0, 'paypal/wpp/api_password', NULL),
(536, 'default', 0, 'paypal/wpp/api_signature', NULL),
(537, 'default', 0, 'paypal/wpp/sandbox_flag', '0'),
(538, 'default', 0, 'paypal/wpp/use_proxy', '0'),
(539, 'default', 0, 'payment/payflow_advanced/active', '0'),
(540, 'default', 0, 'payment/paypal_express_bml/active', '0'),
(541, 'default', 0, 'payment/paypal_express_bml/publisher_id', NULL),
(542, 'default', 0, 'payment/paypal_express_bml/homepage_display', '0'),
(543, 'default', 0, 'payment/paypal_express_bml/homepage_position', '0'),
(544, 'default', 0, 'payment/paypal_express_bml/homepage_size', '190x100'),
(545, 'default', 0, 'payment/paypal_express_bml/categorypage_display', '0'),
(546, 'default', 0, 'payment/paypal_express_bml/categorypage_position', '0'),
(547, 'default', 0, 'payment/paypal_express_bml/categorypage_size', '190x100'),
(548, 'default', 0, 'payment/paypal_express_bml/productpage_display', '0'),
(549, 'default', 0, 'payment/paypal_express_bml/productpage_position', '0'),
(550, 'default', 0, 'payment/paypal_express_bml/productpage_size', '190x100'),
(551, 'default', 0, 'payment/paypal_express_bml/checkout_display', '0'),
(552, 'default', 0, 'payment/paypal_express_bml/checkout_position', '0'),
(553, 'default', 0, 'payment/paypal_express_bml/checkout_size', '234x60'),
(554, 'default', 0, 'payment/payflow_advanced/title', 'Credit Card'),
(555, 'default', 0, 'payment/payflow_advanced/sort_order', NULL),
(556, 'default', 0, 'payment/payflow_advanced/payment_action', 'Authorization'),
(557, 'default', 0, 'payment/payflow_advanced/allowspecific', '0'),
(558, 'default', 0, 'payment/payflow_advanced/debug', '0'),
(559, 'default', 0, 'payment/payflow_advanced/verify_peer', '1'),
(560, 'default', 0, 'payment/payflow_advanced/csc_editable', '1'),
(561, 'default', 0, 'payment/payflow_advanced/csc_required', '1'),
(562, 'default', 0, 'payment/payflow_advanced/email_confirmation', '0'),
(563, 'default', 0, 'payment/payflow_advanced/url_method', 'GET'),
(564, 'default', 0, 'payment/payflow_advanced/mobile_optimized', '0'),
(565, 'default', 0, 'payment/paypal_billing_agreement/active', '1'),
(566, 'default', 0, 'payment/paypal_billing_agreement/title', 'PayPal Billing Agreement'),
(567, 'default', 0, 'payment/paypal_billing_agreement/sort_order', NULL),
(568, 'default', 0, 'payment/paypal_billing_agreement/payment_action', 'Authorization'),
(569, 'default', 0, 'payment/paypal_billing_agreement/allowspecific', '0'),
(570, 'default', 0, 'payment/paypal_billing_agreement/debug', '0'),
(571, 'default', 0, 'payment/paypal_billing_agreement/verify_peer', '1'),
(572, 'default', 0, 'payment/paypal_billing_agreement/line_items_enabled', '0'),
(573, 'default', 0, 'payment/paypal_billing_agreement/allow_billing_agreement_wizard', '1'),
(574, 'default', 0, 'paypal/fetch_reports/ftp_login', NULL),
(575, 'default', 0, 'paypal/fetch_reports/ftp_password', NULL),
(576, 'default', 0, 'paypal/fetch_reports/ftp_sandbox', '0'),
(577, 'default', 0, 'paypal/fetch_reports/ftp_ip', NULL),
(578, 'default', 0, 'paypal/fetch_reports/ftp_path', NULL),
(579, 'default', 0, 'paypal/fetch_reports/active', '0'),
(580, 'default', 0, 'paypal/fetch_reports/schedule', '1'),
(581, 'default', 0, 'paypal/fetch_reports/time', '00,00,00'),
(582, 'default', 0, 'paypal/style/logo', 'nowAccepting_150x60'),
(583, 'default', 0, 'paypal/style/page_style', NULL),
(584, 'default', 0, 'paypal/style/paypal_hdrimg', NULL),
(585, 'default', 0, 'paypal/style/paypal_hdrbackcolor', NULL),
(586, 'default', 0, 'paypal/style/paypal_hdrbordercolor', NULL),
(587, 'default', 0, 'paypal/style/paypal_payflowcolor', NULL),
(588, 'default', 0, 'payment/paypal_express/title', 'PayPal Express Checkout'),
(589, 'default', 0, 'payment/paypal_express/sort_order', NULL),
(590, 'default', 0, 'payment/paypal_express/payment_action', 'Authorization'),
(591, 'default', 0, 'payment/paypal_express/visible_on_product', '1'),
(592, 'default', 0, 'payment/paypal_express/visible_on_cart', '1'),
(593, 'default', 0, 'payment/paypal_express/allowspecific', '0'),
(594, 'default', 0, 'payment/paypal_express/debug', '0'),
(595, 'default', 0, 'payment/paypal_express/verify_peer', '1'),
(596, 'default', 0, 'payment/paypal_express/line_items_enabled', '1'),
(597, 'default', 0, 'payment/paypal_express/transfer_shipping_options', '0'),
(598, 'default', 0, 'paypal/wpp/button_flavor', 'dynamic'),
(599, 'default', 0, 'payment/paypal_express/solution_type', 'Mark'),
(600, 'default', 0, 'payment/paypal_express/require_billing_address', '0'),
(601, 'default', 0, 'payment/paypal_express/allow_ba_signup', 'never'),
(602, 'default', 0, 'payment/paypal_direct/active', '0'),
(603, 'default', 0, 'payment/paypal_direct/title', 'PayPal Payments Pro'),
(604, 'default', 0, 'payment/paypal_direct/sort_order', NULL),
(605, 'default', 0, 'payment/paypal_direct/payment_action', 'Authorization'),
(606, 'default', 0, 'payment/paypal_direct/cctypes', 'VI,MC'),
(607, 'default', 0, 'payment/paypal_direct/allowspecific', '0'),
(608, 'default', 0, 'payment/paypal_direct/debug', '0'),
(609, 'default', 0, 'payment/paypal_direct/verify_peer', '1'),
(610, 'default', 0, 'payment/paypal_direct/line_items_enabled', '0'),
(611, 'default', 0, 'payment/paypal_direct/useccv', '1'),
(612, 'default', 0, 'payment/paypal_direct/centinel', '0'),
(613, 'default', 0, 'payment/paypal_wps_express/active', '0'),
(614, 'default', 0, 'payment/verisign/partner', NULL),
(615, 'default', 0, 'payment/verisign/user', NULL),
(616, 'default', 0, 'payment/verisign/vendor', NULL),
(617, 'default', 0, 'payment/verisign/pwd', NULL),
(618, 'default', 0, 'payment/verisign/sandbox_flag', '0'),
(619, 'default', 0, 'payment/verisign/use_proxy', '0'),
(620, 'default', 0, 'payment/verisign/active', '0'),
(621, 'default', 0, 'payment/paypaluk_express_bml/active', '0'),
(622, 'default', 0, 'payment/verisign/title', 'Payflow Pro'),
(623, 'default', 0, 'payment/verisign/sort_order', NULL),
(624, 'default', 0, 'payment/verisign/payment_action', 'Authorization'),
(625, 'default', 0, 'payment/verisign/cctypes', 'AE,VI'),
(626, 'default', 0, 'payment/verisign/allowspecific', '0'),
(627, 'default', 0, 'payment/verisign/debug', '0'),
(628, 'default', 0, 'payment/verisign/verify_peer', '1'),
(629, 'default', 0, 'payment/verisign/useccv', '1'),
(630, 'default', 0, 'payment/verisign/centinel', '0'),
(631, 'default', 0, 'payment/paypaluk_express/active', '0'),
(632, 'default', 0, 'payment/paypaluk_express/title', 'PayPal Express Checkout Payflow Edition'),
(633, 'default', 0, 'payment/paypaluk_express/sort_order', NULL),
(634, 'default', 0, 'payment/paypaluk_express/payment_action', 'Authorization'),
(635, 'default', 0, 'payment/paypaluk_express/visible_on_product', '1'),
(636, 'default', 0, 'payment/paypaluk_express/visible_on_cart', '1'),
(637, 'default', 0, 'payment/paypaluk_express/allowspecific', '0'),
(638, 'default', 0, 'payment/paypaluk_express/debug', '0'),
(639, 'default', 0, 'payment/paypaluk_express/verify_peer', '1'),
(640, 'default', 0, 'payment/paypaluk_express/line_items_enabled', '1'),
(641, 'default', 0, 'payment/payflow_link/partner', NULL),
(642, 'default', 0, 'payment/payflow_link/vendor', NULL),
(643, 'default', 0, 'payment/payflow_link/user', NULL),
(644, 'default', 0, 'payment/payflow_link/pwd', NULL),
(645, 'default', 0, 'payment/payflow_link/sandbox_flag', '0'),
(646, 'default', 0, 'payment/payflow_link/use_proxy', '0'),
(647, 'default', 0, 'payment/payflow_link/active', '0'),
(648, 'default', 0, 'payment/paypal_express/active', '0'),
(649, 'default', 0, 'payment/payflow_link/title', 'Credit Card'),
(650, 'default', 0, 'payment/payflow_link/sort_order', NULL),
(651, 'default', 0, 'payment/payflow_link/payment_action', 'Authorization'),
(652, 'default', 0, 'payment/payflow_link/allowspecific', '0'),
(653, 'default', 0, 'payment/payflow_link/debug', '0'),
(654, 'default', 0, 'payment/payflow_link/verify_peer', '1'),
(655, 'default', 0, 'payment/payflow_link/csc_editable', '1'),
(656, 'default', 0, 'payment/payflow_link/csc_required', '1'),
(657, 'default', 0, 'payment/payflow_link/email_confirmation', '0'),
(658, 'default', 0, 'payment/payflow_link/url_method', 'GET'),
(659, 'default', 0, 'payment/payflow_link/mobile_optimized', '0'),
(660, 'default', 0, 'payment/ccsave/active', '1'),
(661, 'default', 0, 'payment/ccsave/title', 'Credit Card (saved)'),
(662, 'default', 0, 'payment/ccsave/order_status', 'pending'),
(663, 'default', 0, 'payment/ccsave/cctypes', 'AE,VI,MC,DI'),
(664, 'default', 0, 'payment/ccsave/useccv', '0'),
(665, 'default', 0, 'payment/ccsave/centinel', '0'),
(666, 'default', 0, 'payment/ccsave/allowspecific', '0'),
(667, 'default', 0, 'payment/ccsave/min_order_total', NULL),
(668, 'default', 0, 'payment/ccsave/max_order_total', NULL),
(669, 'default', 0, 'payment/ccsave/sort_order', NULL),
(670, 'default', 0, 'payment/checkmo/active', '0'),
(671, 'default', 0, 'payment/checkmo/title', 'Check / Money order'),
(672, 'default', 0, 'payment/checkmo/order_status', 'pending'),
(673, 'default', 0, 'payment/checkmo/allowspecific', '0'),
(674, 'default', 0, 'payment/checkmo/payable_to', NULL),
(675, 'default', 0, 'payment/checkmo/mailing_address', NULL),
(676, 'default', 0, 'payment/checkmo/min_order_total', NULL),
(677, 'default', 0, 'payment/checkmo/max_order_total', NULL),
(678, 'default', 0, 'payment/checkmo/sort_order', NULL),
(679, 'default', 0, 'payment/free/title', 'No Payment Information Required'),
(680, 'default', 0, 'payment/free/active', '1'),
(681, 'default', 0, 'payment/free/order_status', 'pending'),
(682, 'default', 0, 'payment/free/allowspecific', '0'),
(683, 'default', 0, 'payment/free/sort_order', '1'),
(684, 'default', 0, 'payment/banktransfer/active', '1'),
(685, 'default', 0, 'payment/banktransfer/title', 'Bank Transfer Payment'),
(686, 'default', 0, 'payment/banktransfer/order_status', 'pending'),
(687, 'default', 0, 'payment/banktransfer/allowspecific', '1'),
(688, 'default', 0, 'payment/banktransfer/instructions', 'please transfer on bank account the order dispatch'),
(689, 'default', 0, 'payment/banktransfer/min_order_total', NULL),
(690, 'default', 0, 'payment/banktransfer/max_order_total', NULL),
(691, 'default', 0, 'payment/banktransfer/sort_order', NULL),
(692, 'default', 0, 'payment/cashondelivery/active', '1'),
(693, 'default', 0, 'payment/cashondelivery/title', 'Cash On Delivery'),
(694, 'default', 0, 'payment/cashondelivery/order_status', 'pending'),
(695, 'default', 0, 'payment/cashondelivery/allowspecific', '1'),
(696, 'default', 0, 'payment/cashondelivery/instructions', 'please keep cash ready exact  amount for our courier'),
(697, 'default', 0, 'payment/cashondelivery/min_order_total', NULL),
(698, 'default', 0, 'payment/cashondelivery/max_order_total', NULL),
(699, 'default', 0, 'payment/cashondelivery/sort_order', NULL),
(700, 'default', 0, 'payment/purchaseorder/active', '0'),
(701, 'default', 0, 'payment/purchaseorder/title', 'Purchase Order'),
(702, 'default', 0, 'payment/purchaseorder/order_status', 'pending'),
(703, 'default', 0, 'payment/purchaseorder/allowspecific', '0'),
(704, 'default', 0, 'payment/purchaseorder/min_order_total', NULL),
(705, 'default', 0, 'payment/purchaseorder/max_order_total', NULL),
(706, 'default', 0, 'payment/purchaseorder/sort_order', NULL),
(707, 'default', 0, 'payment/authorizenet_directpost/active', '0'),
(708, 'default', 0, 'payment/authorizenet_directpost/payment_action', 'authorize'),
(709, 'default', 0, 'payment/authorizenet_directpost/title', 'Credit Card Direct Post (Authorize.net)'),
(710, 'default', 0, 'payment/authorizenet_directpost/login', NULL),
(711, 'default', 0, 'payment/authorizenet_directpost/trans_key', NULL);
INSERT INTO `jeu6_core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES
(712, 'default', 0, 'payment/authorizenet_directpost/trans_md5', NULL),
(713, 'default', 0, 'payment/authorizenet_directpost/order_status', 'processing'),
(714, 'default', 0, 'payment/authorizenet_directpost/test', '1'),
(715, 'default', 0, 'payment/authorizenet_directpost/cgi_url', 'https://secure.authorize.net/gateway/transact.dll'),
(716, 'default', 0, 'payment/authorizenet_directpost/currency', 'USD'),
(717, 'default', 0, 'payment/authorizenet_directpost/debug', '0'),
(718, 'default', 0, 'payment/authorizenet_directpost/email_customer', '0'),
(719, 'default', 0, 'payment/authorizenet_directpost/merchant_email', NULL),
(720, 'default', 0, 'payment/authorizenet_directpost/cctypes', 'AE,VI,MC,DI'),
(721, 'default', 0, 'payment/authorizenet_directpost/useccv', '0'),
(722, 'default', 0, 'payment/authorizenet_directpost/allowspecific', '0'),
(723, 'default', 0, 'payment/authorizenet_directpost/min_order_total', NULL),
(724, 'default', 0, 'payment/authorizenet_directpost/max_order_total', NULL),
(725, 'default', 0, 'payment/authorizenet_directpost/sort_order', NULL),
(726, 'default', 0, 'payment/authorizenet/active', '0'),
(727, 'default', 0, 'payment/authorizenet/payment_action', 'authorize'),
(728, 'default', 0, 'payment/authorizenet/login', NULL),
(729, 'default', 0, 'payment/authorizenet/merchant_email', NULL),
(730, 'default', 0, 'payment/authorizenet/title', 'Credit Card (Authorize.net)'),
(731, 'default', 0, 'payment/authorizenet/trans_key', NULL),
(732, 'default', 0, 'payment/authorizenet/cgi_url', 'https://secure.authorize.net/gateway/transact.dll'),
(733, 'default', 0, 'payment/authorizenet/cgi_url_td', 'https://api.authorize.net/xml/v1/request.api'),
(734, 'default', 0, 'payment/authorizenet/order_status', 'processing'),
(735, 'default', 0, 'payment/authorizenet/test', '1'),
(736, 'default', 0, 'payment/authorizenet/debug', '0'),
(737, 'default', 0, 'payment/authorizenet/currency', 'USD'),
(738, 'default', 0, 'payment/authorizenet/email_customer', '0'),
(739, 'default', 0, 'payment/authorizenet/cctypes', 'AE,VI,MC,DI'),
(740, 'default', 0, 'payment/authorizenet/allowspecific', '0'),
(741, 'default', 0, 'payment/authorizenet/useccv', '0'),
(742, 'default', 0, 'payment/authorizenet/min_order_total', NULL),
(743, 'default', 0, 'payment/authorizenet/max_order_total', NULL),
(744, 'default', 0, 'payment/authorizenet/sort_order', NULL),
(745, 'default', 0, 'payment/authorizenet/allow_partial_authorization', '0'),
(746, 'default', 0, 'payment/authorizenet/centinel', '0'),
(747, 'default', 0, 'payment/banktransfer/specificcountry', 'PK'),
(748, 'default', 0, 'payment/cashondelivery/specificcountry', 'PK'),
(749, 'default', 0, 'currency/webservicex/timeout', '100'),
(750, 'default', 0, 'currency/import/enabled', '0'),
(751, 'default', 0, 'currency/import/service', 'webservicex'),
(752, 'default', 0, 'crontab/jobs/currency_rates_update/schedule/cron_expr', '0 0 * * *'),
(753, 'default', 0, 'currency/import/time', '00,00,00'),
(754, 'default', 0, 'currency/import/frequency', 'D'),
(755, 'default', 0, 'currency/import/error_email', NULL),
(756, 'default', 0, 'currency/import/error_email_identity', 'general'),
(757, 'default', 0, 'currency/import/error_email_template', 'currency_import_error_email_template'),
(758, 'default', 0, 'shipping/origin/country_id', 'PK'),
(759, 'default', 0, 'shipping/origin/region_id', NULL),
(760, 'default', 0, 'shipping/origin/postcode', '90034'),
(761, 'default', 0, 'shipping/origin/city', NULL),
(762, 'default', 0, 'shipping/origin/street_line1', NULL),
(763, 'default', 0, 'shipping/origin/street_line2', NULL),
(764, 'default', 0, 'shipping/option/checkout_multiple', '0'),
(765, 'default', 0, 'shipping/option/checkout_multiple_maximum_qty', '100'),
(766, 'default', 0, 'carriers/flatrate/active', '1'),
(767, 'default', 0, 'carriers/flatrate/title', 'Flat Rate'),
(768, 'default', 0, 'carriers/flatrate/name', 'Fixed'),
(769, 'default', 0, 'carriers/flatrate/type', 'I'),
(770, 'default', 0, 'carriers/flatrate/price', '5.00'),
(771, 'default', 0, 'carriers/flatrate/handling_type', 'F'),
(772, 'default', 0, 'carriers/flatrate/handling_fee', NULL),
(773, 'default', 0, 'carriers/flatrate/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(774, 'default', 0, 'carriers/flatrate/sallowspecific', '0'),
(775, 'default', 0, 'carriers/flatrate/specificcountry', NULL),
(776, 'default', 0, 'carriers/flatrate/showmethod', '0'),
(777, 'default', 0, 'carriers/flatrate/sort_order', NULL),
(778, 'default', 0, 'carriers/tablerate/active', '0'),
(779, 'default', 0, 'carriers/tablerate/title', 'Best Way'),
(780, 'default', 0, 'carriers/tablerate/name', 'Table Rate'),
(781, 'default', 0, 'carriers/tablerate/condition_name', 'package_weight'),
(782, 'default', 0, 'carriers/tablerate/include_virtual_price', '1'),
(783, 'default', 0, 'carriers/tablerate/handling_type', 'F'),
(784, 'default', 0, 'carriers/tablerate/handling_fee', NULL),
(785, 'default', 0, 'carriers/tablerate/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(786, 'default', 0, 'carriers/tablerate/sallowspecific', '0'),
(787, 'default', 0, 'carriers/tablerate/specificcountry', NULL),
(788, 'default', 0, 'carriers/tablerate/showmethod', '0'),
(789, 'default', 0, 'carriers/tablerate/sort_order', NULL),
(790, 'default', 0, 'carriers/freeshipping/active', '0'),
(791, 'default', 0, 'carriers/freeshipping/title', 'Free Shipping'),
(792, 'default', 0, 'carriers/freeshipping/name', 'Free'),
(793, 'default', 0, 'carriers/freeshipping/free_shipping_subtotal', NULL),
(794, 'default', 0, 'carriers/freeshipping/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(795, 'default', 0, 'carriers/freeshipping/sallowspecific', '0'),
(796, 'default', 0, 'carriers/freeshipping/specificcountry', NULL),
(797, 'default', 0, 'carriers/freeshipping/showmethod', '0'),
(798, 'default', 0, 'carriers/freeshipping/sort_order', NULL),
(799, 'default', 0, 'carriers/ups/active', '0'),
(800, 'default', 0, 'carriers/ups/type', 'UPS'),
(801, 'default', 0, 'carriers/ups/gateway_xml_url', 'https://onlinetools.ups.com/ups.app/xml/Rate'),
(802, 'default', 0, 'carriers/ups/tracking_xml_url', 'https://onlinetools.ups.com/ups.app/xml/Track'),
(803, 'default', 0, 'carriers/ups/shipconfirm_xml_url', 'https://onlinetools.ups.com/ups.app/xml/ShipConfirm'),
(804, 'default', 0, 'carriers/ups/shipaccept_xml_url', 'https://onlinetools.ups.com/ups.app/xml/ShipAccept'),
(805, 'default', 0, 'carriers/ups/origin_shipment', 'Shipments Originating in United States'),
(806, 'default', 0, 'carriers/ups/access_license_number', NULL),
(807, 'default', 0, 'carriers/ups/username', NULL),
(808, 'default', 0, 'carriers/ups/password', NULL),
(809, 'default', 0, 'carriers/ups/mode_xml', '1'),
(810, 'default', 0, 'carriers/ups/gateway_url', 'http://www.ups.com/using/services/rave/qcostcgi.cgi'),
(811, 'default', 0, 'carriers/ups/title', 'United Parcel Service'),
(812, 'default', 0, 'carriers/ups/negotiated_active', '0'),
(813, 'default', 0, 'carriers/ups/verify_peer', '0'),
(814, 'default', 0, 'carriers/ups/shipment_requesttype', '0'),
(815, 'default', 0, 'carriers/ups/container', 'CP'),
(816, 'default', 0, 'carriers/ups/shipper_number', NULL),
(817, 'default', 0, 'carriers/ups/dest_type', 'RES'),
(818, 'default', 0, 'carriers/ups/unit_of_measure', 'LBS'),
(819, 'default', 0, 'carriers/ups/max_package_weight', '150'),
(820, 'default', 0, 'carriers/ups/pickup', 'CC'),
(821, 'default', 0, 'carriers/ups/min_package_weight', '0.1'),
(822, 'default', 0, 'carriers/ups/handling_type', 'F'),
(823, 'default', 0, 'carriers/ups/handling_action', 'O'),
(824, 'default', 0, 'carriers/ups/handling_fee', NULL),
(825, 'default', 0, 'carriers/ups/allowed_methods', '1DM,1DML,1DA,1DAL,1DAPI,1DP,1DPL,2DM,2DML,2DA,2DAL,3DS,GND,GNDCOM,GNDRES,STD,XPR,WXS,XPRL,XDM,XDML,XPD'),
(826, 'default', 0, 'carriers/ups/free_method', 'GND'),
(827, 'default', 0, 'carriers/ups/free_shipping_enable', '0'),
(828, 'default', 0, 'carriers/ups/free_shipping_subtotal', NULL),
(829, 'default', 0, 'carriers/ups/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(830, 'default', 0, 'carriers/ups/sallowspecific', '0'),
(831, 'default', 0, 'carriers/ups/specificcountry', NULL),
(832, 'default', 0, 'carriers/ups/showmethod', '0'),
(833, 'default', 0, 'carriers/ups/debug', '0'),
(834, 'default', 0, 'carriers/ups/sort_order', NULL),
(835, 'default', 0, 'carriers/usps/active', '0'),
(836, 'default', 0, 'carriers/usps/gateway_url', 'http://production.shippingapis.com/ShippingAPI.dll'),
(837, 'default', 0, 'carriers/usps/gateway_secure_url', 'https://secure.shippingapis.com/ShippingAPI.dll'),
(838, 'default', 0, 'carriers/usps/title', 'United States Postal Service'),
(839, 'default', 0, 'carriers/usps/userid', NULL),
(840, 'default', 0, 'carriers/usps/password', NULL),
(841, 'default', 0, 'carriers/usps/mode', '0'),
(842, 'default', 0, 'carriers/usps/shipment_requesttype', '0'),
(843, 'default', 0, 'carriers/usps/container', 'VARIABLE'),
(844, 'default', 0, 'carriers/usps/size', 'REGULAR'),
(845, 'default', 0, 'carriers/usps/machinable', 'true'),
(846, 'default', 0, 'carriers/usps/max_package_weight', '70'),
(847, 'default', 0, 'carriers/usps/handling_type', 'F'),
(848, 'default', 0, 'carriers/usps/handling_action', 'O'),
(849, 'default', 0, 'carriers/usps/handling_fee', NULL),
(850, 'default', 0, 'carriers/usps/allowed_methods', '0_FCLE,0_FCL,0_FCSL,0_FCP,0_FCPC,1,2,3,4,6,7,13,15,16,17,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,53,57,58,59,61,62,63,64,72,INT_1,INT_2,INT_4,INT_5,INT_6,INT_7,INT_8,INT_9,INT_10,INT_11,INT_12,INT_13,INT_14,INT_15,INT_16,INT_17,INT_18,INT_19,INT_20,INT_21,INT_22,INT_23,INT_24,INT_25,INT_27'),
(851, 'default', 0, 'carriers/usps/free_method', NULL),
(852, 'default', 0, 'carriers/usps/free_shipping_subtotal', NULL),
(853, 'default', 0, 'carriers/usps/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(854, 'default', 0, 'carriers/usps/sallowspecific', '0'),
(855, 'default', 0, 'carriers/usps/specificcountry', NULL),
(856, 'default', 0, 'carriers/usps/debug', '0'),
(857, 'default', 0, 'carriers/usps/showmethod', '0'),
(858, 'default', 0, 'carriers/usps/sort_order', NULL),
(859, 'default', 0, 'carriers/usps/free_shipping_enable', '0'),
(860, 'default', 0, 'carriers/fedex/active', '0'),
(861, 'default', 0, 'carriers/fedex/title', 'Federal Express'),
(862, 'default', 0, 'carriers/fedex/account', NULL),
(863, 'default', 0, 'carriers/fedex/meter_number', NULL),
(864, 'default', 0, 'carriers/fedex/key', NULL),
(865, 'default', 0, 'carriers/fedex/password', NULL),
(866, 'default', 0, 'carriers/fedex/sandbox_mode', '0'),
(867, 'default', 0, 'carriers/fedex/shipment_requesttype', '0'),
(868, 'default', 0, 'carriers/fedex/packaging', 'YOUR_PACKAGING'),
(869, 'default', 0, 'carriers/fedex/dropoff', 'REGULAR_PICKUP'),
(870, 'default', 0, 'carriers/fedex/unit_of_measure', 'LB'),
(871, 'default', 0, 'carriers/fedex/max_package_weight', '150'),
(872, 'default', 0, 'carriers/fedex/handling_type', 'F'),
(873, 'default', 0, 'carriers/fedex/handling_action', 'O'),
(874, 'default', 0, 'carriers/fedex/handling_fee', NULL),
(875, 'default', 0, 'carriers/fedex/residence_delivery', '0'),
(876, 'default', 0, 'carriers/fedex/allowed_methods', 'EUROPE_FIRST_INTERNATIONAL_PRIORITY,FEDEX_1_DAY_FREIGHT,FEDEX_2_DAY_FREIGHT,FEDEX_2_DAY,FEDEX_2_DAY_AM,FEDEX_3_DAY_FREIGHT,FEDEX_EXPRESS_SAVER,FEDEX_GROUND,FIRST_OVERNIGHT,GROUND_HOME_DELIVERY,INTERNATIONAL_ECONOMY,INTERNATIONAL_ECONOMY_FREIGHT,INTERNATIONAL_FIRST,INTERNATIONAL_GROUND,INTERNATIONAL_PRIORITY,INTERNATIONAL_PRIORITY_FREIGHT,PRIORITY_OVERNIGHT,SMART_POST,STANDARD_OVERNIGHT,FEDEX_FREIGHT,FEDEX_NATIONAL_FREIGHT'),
(877, 'default', 0, 'carriers/fedex/smartpost_hubid', NULL),
(878, 'default', 0, 'carriers/fedex/free_method', 'FEDEX_GROUND'),
(879, 'default', 0, 'carriers/fedex/free_shipping_enable', '0'),
(880, 'default', 0, 'carriers/fedex/free_shipping_subtotal', NULL),
(881, 'default', 0, 'carriers/fedex/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(882, 'default', 0, 'carriers/fedex/sallowspecific', '0'),
(883, 'default', 0, 'carriers/fedex/specificcountry', NULL),
(884, 'default', 0, 'carriers/fedex/debug', '0'),
(885, 'default', 0, 'carriers/fedex/showmethod', '0'),
(886, 'default', 0, 'carriers/fedex/sort_order', NULL),
(887, 'default', 0, 'carriers/dhl/active', '0'),
(888, 'default', 0, 'carriers/dhl/title', 'DHL (Deprecated)'),
(889, 'default', 0, 'carriers/dhl/gateway_url', 'https://eCommerce.airborne.com/ApiLandingTest.asp'),
(890, 'default', 0, 'carriers/dhl/verify_peer', '0'),
(891, 'default', 0, 'carriers/dhl/id', NULL),
(892, 'default', 0, 'carriers/dhl/password', NULL),
(893, 'default', 0, 'carriers/dhl/account', NULL),
(894, 'default', 0, 'carriers/dhl/shipping_key', NULL),
(895, 'default', 0, 'carriers/dhl/shipping_intlkey', NULL),
(896, 'default', 0, 'carriers/dhl/shipment_requesttype', '0'),
(897, 'default', 0, 'carriers/dhl/shipment_type', 'P'),
(898, 'default', 0, 'carriers/dhl/handling_type', 'F'),
(899, 'default', 0, 'carriers/dhl/handling_action', 'O'),
(900, 'default', 0, 'carriers/dhl/contentdesc', 'Big Box'),
(901, 'default', 0, 'carriers/dhl/handling_fee', NULL),
(902, 'default', 0, 'carriers/dhl/max_package_weight', '150'),
(903, 'default', 0, 'carriers/dhl/dutiable', '0'),
(904, 'default', 0, 'carriers/dhl/dutypaymenttype', 'R'),
(905, 'default', 0, 'carriers/dhl/allowed_methods', 'IE,E SAT,E 10:30AM,E,N,S,G'),
(906, 'default', 0, 'carriers/dhl/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(907, 'default', 0, 'carriers/dhl/free_method', 'G'),
(908, 'default', 0, 'carriers/dhl/free_shipping_enable', '0'),
(909, 'default', 0, 'carriers/dhl/free_shipping_subtotal', NULL),
(910, 'default', 0, 'carriers/dhl/additional_protection_enabled', '0'),
(911, 'default', 0, 'carriers/dhl/additional_protection_min_value', NULL),
(912, 'default', 0, 'carriers/dhl/additional_protection_use_subtotal', '0'),
(913, 'default', 0, 'carriers/dhl/additional_protection_value', NULL),
(914, 'default', 0, 'carriers/dhl/additional_protection_rounding', '0'),
(915, 'default', 0, 'carriers/dhl/hazardous_materials', '0'),
(916, 'default', 0, 'carriers/dhl/default_length', NULL),
(917, 'default', 0, 'carriers/dhl/default_width', NULL),
(918, 'default', 0, 'carriers/dhl/default_height', NULL),
(919, 'default', 0, 'carriers/dhl/shipment_days', 'Mon,Tue,Wed,Thu,Fri,Sat'),
(920, 'default', 0, 'carriers/dhl/intl_shipment_days', 'Mon,Tue,Wed,Thu,Fri'),
(921, 'default', 0, 'carriers/dhl/sallowspecific', '0'),
(922, 'default', 0, 'carriers/dhl/specificcountry', NULL),
(923, 'default', 0, 'carriers/dhl/showmethod', '0'),
(924, 'default', 0, 'carriers/dhl/debug', '0'),
(925, 'default', 0, 'carriers/dhl/sort_order', NULL),
(926, 'default', 0, 'carriers/dhlint/active', '0'),
(927, 'default', 0, 'carriers/dhlint/gateway_url', 'https://xmlpi-ea.dhl.com/XMLShippingServlet'),
(928, 'default', 0, 'carriers/dhlint/title', 'DHL'),
(929, 'default', 0, 'carriers/dhlint/verify_peer', '0'),
(930, 'default', 0, 'carriers/dhlint/id', NULL),
(931, 'default', 0, 'carriers/dhlint/password', NULL),
(932, 'default', 0, 'carriers/dhlint/account', NULL),
(933, 'default', 0, 'carriers/dhlint/content_type', 'D'),
(934, 'default', 0, 'carriers/dhlint/handling_type', 'F'),
(935, 'default', 0, 'carriers/dhlint/handling_action', 'O'),
(936, 'default', 0, 'carriers/dhlint/handling_fee', NULL),
(937, 'default', 0, 'carriers/dhlint/divide_order_weight', '1'),
(938, 'default', 0, 'carriers/dhlint/unit_of_measure', 'K'),
(939, 'default', 0, 'carriers/dhlint/size', '0'),
(940, 'default', 0, 'carriers/dhlint/doc_methods', '2,5,6,7,9,B,C,D,U,K,L,G,W,I,N,O,R,S,T,X'),
(941, 'default', 0, 'carriers/dhlint/ready_time', NULL),
(942, 'default', 0, 'carriers/dhlint/specificerrmsg', 'This shipping method is currently unavailable. If you would like to ship using this shipping method, please contact us.'),
(943, 'default', 0, 'carriers/dhlint/free_method_doc', NULL),
(944, 'default', 0, 'carriers/dhlint/free_shipping_enable', '0'),
(945, 'default', 0, 'carriers/dhlint/free_shipping_subtotal', NULL),
(946, 'default', 0, 'carriers/dhlint/sallowspecific', '0'),
(947, 'default', 0, 'carriers/dhlint/specificcountry', NULL),
(948, 'default', 0, 'carriers/dhlint/showmethod', '0'),
(949, 'default', 0, 'carriers/dhlint/debug', '0'),
(950, 'default', 0, 'carriers/dhlint/sort_order', NULL),
(951, 'default', 0, 'general/country/default', 'PK'),
(952, 'default', 0, 'general/country/allow', 'AF,AX,AL,DZ,AS,AD,AO,AI,AQ,AG,AR,AM,AW,AU,AT,AZ,BS,BH,BD,BB,BY,BE,BZ,BJ,BM,BT,BO,BA,BW,BV,BR,IO,VG,BN,BG,BF,BI,KH,CM,CA,CV,KY,CF,TD,CL,CN,CX,CC,CO,KM,CG,CD,CK,CR,CI,HR,CU,CY,CZ,DK,DJ,DM,DO,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FJ,FI,FR,GF,PF,TF,GA,GM,GE,DE,GH,GI,GR,GL,GD,GP,GU,GT,GG,GN,GW,GY,HT,HM,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IM,IL,IT,JM,JP,JE,JO,KZ,KE,KI,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,FM,MD,MC,MN,ME,MS,MA,MZ,MM,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,MP,KP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PN,PL,PT,PR,QA,RE,RO,RU,RW,BL,SH,KN,LC,MF,PM,WS,SM,ST,SA,SN,RS,SC,SL,SG,SK,SI,SB,SO,ZA,GS,KR,ES,LK,VC,SD,SR,SJ,SZ,SE,CH,SY,TW,TJ,TZ,TH,TL,TG,TK,TO,TT,TN,TR,TM,TC,TV,UG,UA,AE,GB,US,UY,UM,VI,UZ,VU,VA,VE,VN,WF,EH,YE,ZM,ZW'),
(953, 'default', 0, 'general/country/optional_zip_countries', 'HK,IE,MO,PA'),
(954, 'default', 0, 'general/country/eu_countries', 'AT,BE,BG,CY,CZ,DK,EE,FI,FR,DE,GR,HU,IE,IT,LV,LT,LU,MT,NL,PL,PT,RO,SK,SI,ES,SE,GB'),
(955, 'default', 0, 'general/locale/firstday', '0'),
(956, 'default', 0, 'general/locale/weekend', '0,6'),
(957, 'default', 0, 'general/store_information/name', NULL),
(958, 'default', 0, 'general/store_information/phone', NULL),
(959, 'default', 0, 'general/store_information/hours', NULL),
(960, 'default', 0, 'general/store_information/merchant_country', NULL),
(961, 'default', 0, 'general/store_information/merchant_vat_number', NULL),
(962, 'default', 0, 'general/store_information/address', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_email_queue`
--

CREATE TABLE `jeu6_core_email_queue` (
  `message_id` int(10) UNSIGNED NOT NULL COMMENT 'Message Id',
  `entity_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Entity ID',
  `entity_type` varchar(128) DEFAULT NULL COMMENT 'Entity Type',
  `event_type` varchar(128) DEFAULT NULL COMMENT 'Event Type',
  `message_body_hash` varchar(64) NOT NULL COMMENT 'Message Body Hash',
  `message_body` mediumtext NOT NULL COMMENT 'Message Body',
  `message_parameters` text NOT NULL COMMENT 'Message Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `processed_at` timestamp NULL DEFAULT NULL COMMENT 'Finish Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Queue';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_email_queue_recipients`
--

CREATE TABLE `jeu6_core_email_queue_recipients` (
  `recipient_id` int(10) UNSIGNED NOT NULL COMMENT 'Recipient Id',
  `message_id` int(10) UNSIGNED NOT NULL COMMENT 'Message ID',
  `recipient_email` varchar(128) NOT NULL COMMENT 'Recipient Email',
  `recipient_name` varchar(255) NOT NULL COMMENT 'Recipient Name',
  `email_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Email Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Queue';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_email_template`
--

CREATE TABLE `jeu6_core_email_template` (
  `template_id` int(10) UNSIGNED NOT NULL COMMENT 'Template Id',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Creation',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_flag`
--

CREATE TABLE `jeu6_core_flag` (
  `flag_id` int(10) UNSIGNED NOT NULL COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flag';

--
-- Dumping data for table `jeu6_core_flag`
--

INSERT INTO `jeu6_core_flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1, 'admin_notification_survey', 0, 'a:1:{s:13:\"survey_viewed\";b:1;}', '2011-08-18 22:29:30'),
(2, 'catalog_product_flat', 0, 'a:2:{s:8:\"is_built\";b:1;s:16:\"is_store_built_1\";b:1;}', '2018-10-27 12:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_layout_link`
--

CREATE TABLE `jeu6_core_layout_link` (
  `layout_link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `area` varchar(64) DEFAULT NULL COMMENT 'Area',
  `package` varchar(64) DEFAULT NULL COMMENT 'Package',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `layout_update_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Layout Update Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_layout_update`
--

CREATE TABLE `jeu6_core_layout_update` (
  `layout_update_id` int(10) UNSIGNED NOT NULL COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_resource`
--

CREATE TABLE `jeu6_core_resource` (
  `code` varchar(50) NOT NULL COMMENT 'Resource Code',
  `version` varchar(50) DEFAULT NULL COMMENT 'Resource Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resources';

--
-- Dumping data for table `jeu6_core_resource`
--

INSERT INTO `jeu6_core_resource` (`code`, `version`, `data_version`) VALUES
('adminnotification_setup', '1.6.0.0', '1.6.0.0'),
('admin_setup', '1.6.1.2', '1.6.1.2'),
('ajaxfilter_setup', '1.0.0', '1.0.0'),
('ajax_setup', '1.0.0', '1.0.0'),
('api2_setup', '1.0.0.0', '1.0.0.0'),
('api_setup', '1.6.0.1', '1.6.0.1'),
('backup_setup', '1.6.0.0', '1.6.0.0'),
('blog_setup', '1.3.16', '1.3.16'),
('bundle_setup', '1.6.0.0.1', '1.6.0.0.1'),
('captcha_setup', '1.7.0.0.0', '1.7.0.0.0'),
('catalogindex_setup', '1.6.0.0', '1.6.0.0'),
('cataloginventory_setup', '1.6.0.0.2', '1.6.0.0.2'),
('catalogrule_setup', '1.6.0.3', '1.6.0.3'),
('catalogsearch_setup', '1.8.2.0', '1.8.2.0'),
('catalog_setup', '1.6.0.0.19.1.5', '1.6.0.0.19.1.5'),
('checkout_setup', '1.6.0.0', '1.6.0.0'),
('cms_setup', '1.6.0.0.2', '1.6.0.0.2'),
('compiler_setup', '1.6.0.0', '1.6.0.0'),
('contacts_setup', '1.6.0.0', '1.6.0.0'),
('core_setup', '1.6.0.7', '1.6.0.7'),
('cron_setup', '1.6.0.0', '1.6.0.0'),
('customer_setup', '1.6.2.0.7', '1.6.2.0.7'),
('dataflow_setup', '1.6.0.0', '1.6.0.0'),
('directory_setup', '1.6.0.3', '1.6.0.3'),
('downloadable_setup', '1.6.0.0.3', '1.6.0.0.3'),
('eav_setup', '1.6.0.1', '1.6.0.1'),
('find_feed_setup', '1.6.0.0', '1.6.0.0'),
('fltproducts_setup', '0.1.0', '0.1.0'),
('giftmessage_setup', '1.6.0.0', '1.6.0.0'),
('googleanalytics_setup', '1.6.0.0', '1.6.0.0'),
('googlebase_setup', '1.6.0.0', '1.6.0.0'),
('googlecheckout_setup', '1.6.0.0', '1.6.0.0'),
('googleoptimizer_setup', '1.6.0.0', '1.6.0.0'),
('importexport_setup', '1.6.0.2', '1.6.0.2'),
('index_setup', '1.6.0.0', '1.6.0.0'),
('log_setup', '1.6.1.1', '1.6.1.1'),
('mainslider_setup', '0.1.0', '0.1.0'),
('megamenu_setup', '0.1.0', '0.1.0'),
('moneybookers_setup', '1.6.0.0', '1.6.0.0'),
('newsletter_setup', '1.6.0.2', '1.6.0.2'),
('oauth_setup', '1.0.0.0', '1.0.0.0'),
('paygate_setup', '1.6.0.0', '1.6.0.0'),
('payment_setup', '1.6.0.0', '1.6.0.0'),
('paypaluk_setup', '1.6.0.0', '1.6.0.0'),
('paypal_setup', '1.6.0.6', '1.6.0.6'),
('perfectus_marcus', '0.1.0', '0.1.0'),
('persistent_setup', '1.0.0.0', '1.0.0.0'),
('poll_setup', '1.6.0.1', '1.6.0.1'),
('productalert_setup', '1.6.0.0', '1.6.0.0'),
('rating_setup', '1.6.0.1', '1.6.0.1'),
('reports_setup', '1.6.0.0.1', '1.6.0.0.1'),
('review_setup', '1.6.0.0', '1.6.0.0'),
('rss_setup', '1.6.0.0', '1.6.0.0'),
('salesrule_setup', '1.6.0.3', '1.6.0.3'),
('sales_setup', '1.6.0.10', '1.6.0.10'),
('sendfriend_setup', '1.6.0.1', '1.6.0.1'),
('shipping_setup', '1.6.0.0', '1.6.0.0'),
('sitemap_setup', '1.6.0.0', '1.6.0.0'),
('skuautogenerate_setup', '0.1.0', '0.1.0'),
('tag_setup', '1.6.0.0', '1.6.0.0'),
('tax_setup', '1.6.0.4', '1.6.0.4'),
('usa_setup', '1.6.0.3', '1.6.0.3'),
('weee_setup', '1.6.0.0', '1.6.0.0'),
('widget_setup', '1.6.0.0', '1.6.0.0'),
('wishlist_setup', '1.6.0.0', '1.6.0.0'),
('xmlconnect_setup', '1.6.0.0', '1.6.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_session`
--

CREATE TABLE `jeu6_core_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_store`
--

CREATE TABLE `jeu6_core_store` (
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Activity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores';

--
-- Dumping data for table `jeu6_core_store`
--

INSERT INTO `jeu6_core_store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'Default Store View', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_store_group`
--

CREATE TABLE `jeu6_core_store_group` (
  `group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Group Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store Groups';

--
-- Dumping data for table `jeu6_core_store_group`
--

INSERT INTO `jeu6_core_store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`) VALUES
(0, 0, 'Default', 0, 0),
(1, 1, 'Main Website Store', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_translate`
--

CREATE TABLE `jeu6_core_translate` (
  `key_id` int(10) UNSIGNED NOT NULL COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_url_rewrite`
--

CREATE TABLE `jeu6_core_url_rewrite` (
  `url_rewrite_id` int(10) UNSIGNED NOT NULL COMMENT 'Rewrite Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `id_path` varchar(255) DEFAULT NULL COMMENT 'Id Path',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `is_system` smallint(5) UNSIGNED DEFAULT '1' COMMENT 'Defines is Rewrite System',
  `options` varchar(255) DEFAULT NULL COMMENT 'Options',
  `description` varchar(255) DEFAULT NULL COMMENT 'Deascription',
  `category_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Category Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';

--
-- Dumping data for table `jeu6_core_url_rewrite`
--

INSERT INTO `jeu6_core_url_rewrite` (`url_rewrite_id`, `store_id`, `id_path`, `request_path`, `target_path`, `is_system`, `options`, `description`, `category_id`, `product_id`) VALUES
(8, 1, 'category/3', 'home.html', 'catalog/category/view/id/3', 1, NULL, NULL, 3, NULL),
(11, 1, 'product/8', 'test.html', 'catalog/product/view/id/8', 1, NULL, NULL, NULL, 8),
(12, 1, 'product/9', 'aqfwf-fev-eve.html', 'catalog/product/view/id/9', 1, NULL, NULL, NULL, 9),
(13, 1, 'product/10', 'color-switcher-red.html', 'catalog/product/view/id/10', 1, NULL, NULL, NULL, 10),
(14, 1, 'product/11', 'color-switcher-red-11.html', 'catalog/product/view/id/11', 1, NULL, NULL, NULL, 11),
(15, 1, 'product/12/3', 'home/color-switcher.html', 'catalog/product/view/id/12/category/3', 1, NULL, NULL, 3, 12),
(16, 1, 'product/12', 'color-switcher.html', 'catalog/product/view/id/12', 1, NULL, NULL, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_variable`
--

CREATE TABLE `jeu6_core_variable` (
  `variable_id` int(10) UNSIGNED NOT NULL COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_variable_value`
--

CREATE TABLE `jeu6_core_variable_value` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Variable Value Id',
  `variable_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_core_website`
--

CREATE TABLE `jeu6_core_website` (
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Defines Is Website Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Websites';

--
-- Dumping data for table `jeu6_core_website`
--

INSERT INTO `jeu6_core_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Devplugin', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_coupon_aggregated`
--

CREATE TABLE `jeu6_coupon_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_coupon_aggregated_order`
--

CREATE TABLE `jeu6_coupon_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_coupon_aggregated_updated`
--

CREATE TABLE `jeu6_coupon_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Jeu6 Coupon Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_cron_schedule`
--

CREATE TABLE `jeu6_cron_schedule` (
  `schedule_id` int(10) UNSIGNED NOT NULL COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_address_entity`
--

CREATE TABLE `jeu6_customer_address_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_address_entity_datetime`
--

CREATE TABLE `jeu6_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_address_entity_decimal`
--

CREATE TABLE `jeu6_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_address_entity_int`
--

CREATE TABLE `jeu6_customer_address_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_address_entity_text`
--

CREATE TABLE `jeu6_customer_address_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_address_entity_varchar`
--

CREATE TABLE `jeu6_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_eav_attribute`
--

CREATE TABLE `jeu6_customer_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

--
-- Dumping data for table `jeu6_customer_eav_attribute`
--

INSERT INTO `jeu6_customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES
(1, 1, NULL, 0, NULL, 1, 10, NULL),
(2, 0, NULL, 0, NULL, 1, 0, NULL),
(3, 1, NULL, 0, NULL, 1, 20, NULL),
(4, 0, NULL, 0, NULL, 0, 30, NULL),
(5, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 40, NULL),
(6, 1, NULL, 0, NULL, 1, 50, NULL),
(7, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 60, NULL),
(8, 0, NULL, 0, NULL, 0, 70, NULL),
(9, 1, NULL, 0, 'a:1:{s:16:\"input_validation\";s:5:\"email\";}', 1, 80, NULL),
(10, 1, NULL, 0, NULL, 1, 25, NULL),
(11, 0, 'date', 0, 'a:1:{s:16:\"input_validation\";s:4:\"date\";}', 0, 90, NULL),
(12, 0, NULL, 0, NULL, 1, 0, NULL),
(13, 0, NULL, 0, NULL, 1, 0, NULL),
(14, 0, NULL, 0, NULL, 1, 0, NULL),
(15, 0, NULL, 0, 'a:1:{s:15:\"max_text_length\";i:255;}', 0, 100, NULL),
(16, 0, NULL, 0, NULL, 1, 0, NULL),
(17, 0, 'datetime', 0, NULL, 0, 0, NULL),
(18, 0, NULL, 0, 'a:0:{}', 0, 110, NULL),
(19, 0, NULL, 0, NULL, 0, 10, NULL),
(20, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 20, NULL),
(21, 1, NULL, 0, NULL, 1, 30, NULL),
(22, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 40, NULL),
(23, 0, NULL, 0, NULL, 0, 50, NULL),
(24, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 60, NULL),
(25, 1, NULL, 2, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 70, NULL),
(26, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 80, NULL),
(27, 1, NULL, 0, NULL, 1, 90, NULL),
(28, 1, NULL, 0, NULL, 1, 100, NULL),
(29, 1, NULL, 0, NULL, 1, 100, NULL),
(30, 1, NULL, 0, 'a:0:{}', 1, 110, 'customer/attribute_data_postcode'),
(31, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 120, NULL),
(32, 1, NULL, 0, 'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}', 1, 130, NULL),
(126, 0, NULL, 0, NULL, 1, 0, NULL),
(127, 0, NULL, 0, 'a:1:{s:16:\"input_validation\";s:4:\"date\";}', 1, 0, NULL),
(128, 1, NULL, 0, NULL, 1, 28, NULL),
(129, 1, NULL, 0, NULL, 1, 140, NULL),
(130, 0, NULL, 0, NULL, 1, 0, NULL),
(131, 0, NULL, 0, NULL, 1, 0, NULL),
(132, 0, NULL, 0, NULL, 1, 0, NULL),
(133, 0, NULL, 0, NULL, 1, 0, NULL),
(134, 0, NULL, 0, NULL, 1, 0, NULL),
(135, 0, NULL, 0, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_eav_attribute_website`
--

CREATE TABLE `jeu6_customer_eav_attribute_website` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Multiline Count'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_entity`
--

CREATE TABLE `jeu6_customer_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `website_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_entity_datetime`
--

CREATE TABLE `jeu6_customer_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_entity_decimal`
--

CREATE TABLE `jeu6_customer_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_entity_int`
--

CREATE TABLE `jeu6_customer_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_entity_text`
--

CREATE TABLE `jeu6_customer_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_entity_varchar`
--

CREATE TABLE `jeu6_customer_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_flowpassword`
--

CREATE TABLE `jeu6_customer_flowpassword` (
  `flowpassword_id` int(10) UNSIGNED NOT NULL COMMENT 'Flow password Id',
  `ip` varchar(50) NOT NULL COMMENT 'User IP',
  `email` varchar(255) NOT NULL COMMENT 'Requested email for change',
  `requested_date` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Requested date for change'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer flow password';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_form_attribute`
--

CREATE TABLE `jeu6_customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

--
-- Dumping data for table `jeu6_customer_form_attribute`
--

INSERT INTO `jeu6_customer_form_attribute` (`form_code`, `attribute_id`) VALUES
('adminhtml_customer', 1),
('adminhtml_customer', 3),
('adminhtml_customer', 4),
('checkout_register', 4),
('customer_account_create', 4),
('customer_account_edit', 4),
('adminhtml_customer', 5),
('checkout_register', 5),
('customer_account_create', 5),
('customer_account_edit', 5),
('adminhtml_checkout', 6),
('adminhtml_customer', 6),
('checkout_register', 6),
('customer_account_create', 6),
('customer_account_edit', 6),
('adminhtml_customer', 7),
('checkout_register', 7),
('customer_account_create', 7),
('customer_account_edit', 7),
('adminhtml_customer', 8),
('checkout_register', 8),
('customer_account_create', 8),
('customer_account_edit', 8),
('adminhtml_checkout', 9),
('adminhtml_customer', 9),
('checkout_register', 9),
('customer_account_create', 9),
('customer_account_edit', 9),
('adminhtml_checkout', 10),
('adminhtml_customer', 10),
('adminhtml_checkout', 11),
('adminhtml_customer', 11),
('checkout_register', 11),
('customer_account_create', 11),
('customer_account_edit', 11),
('adminhtml_checkout', 15),
('adminhtml_customer', 15),
('checkout_register', 15),
('customer_account_create', 15),
('customer_account_edit', 15),
('adminhtml_customer', 17),
('checkout_register', 17),
('customer_account_create', 17),
('customer_account_edit', 17),
('adminhtml_checkout', 18),
('adminhtml_customer', 18),
('checkout_register', 18),
('customer_account_create', 18),
('customer_account_edit', 18),
('adminhtml_customer_address', 19),
('customer_address_edit', 19),
('customer_register_address', 19),
('adminhtml_customer_address', 20),
('customer_address_edit', 20),
('customer_register_address', 20),
('adminhtml_customer_address', 21),
('customer_address_edit', 21),
('customer_register_address', 21),
('adminhtml_customer_address', 22),
('customer_address_edit', 22),
('customer_register_address', 22),
('adminhtml_customer_address', 23),
('customer_address_edit', 23),
('customer_register_address', 23),
('adminhtml_customer_address', 24),
('customer_address_edit', 24),
('customer_register_address', 24),
('adminhtml_customer_address', 25),
('customer_address_edit', 25),
('customer_register_address', 25),
('adminhtml_customer_address', 26),
('customer_address_edit', 26),
('customer_register_address', 26),
('adminhtml_customer_address', 27),
('customer_address_edit', 27),
('customer_register_address', 27),
('adminhtml_customer_address', 28),
('customer_address_edit', 28),
('customer_register_address', 28),
('adminhtml_customer_address', 29),
('customer_address_edit', 29),
('customer_register_address', 29),
('adminhtml_customer_address', 30),
('customer_address_edit', 30),
('customer_register_address', 30),
('adminhtml_customer_address', 31),
('customer_address_edit', 31),
('customer_register_address', 31),
('adminhtml_customer_address', 32),
('customer_address_edit', 32),
('customer_register_address', 32),
('adminhtml_customer', 128),
('adminhtml_customer_address', 129),
('customer_address_edit', 129),
('customer_register_address', 129);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_customer_group`
--

CREATE TABLE `jeu6_customer_group` (
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Tax Class Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Group';

--
-- Dumping data for table `jeu6_customer_group`
--

INSERT INTO `jeu6_customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_dataflow_batch`
--

CREATE TABLE `jeu6_dataflow_batch` (
  `batch_id` int(10) UNSIGNED NOT NULL COMMENT 'Batch Id',
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Profile ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `adapter` varchar(128) DEFAULT NULL COMMENT 'Adapter',
  `params` text COMMENT 'Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_dataflow_batch_export`
--

CREATE TABLE `jeu6_dataflow_batch_export` (
  `batch_export_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Batch Export Id',
  `batch_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Export';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_dataflow_batch_import`
--

CREATE TABLE `jeu6_dataflow_batch_import` (
  `batch_import_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Batch Import Id',
  `batch_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Import';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_dataflow_import_data`
--

CREATE TABLE `jeu6_dataflow_import_data` (
  `import_id` int(11) NOT NULL COMMENT 'Import Id',
  `session_id` int(11) DEFAULT NULL COMMENT 'Session Id',
  `serial_number` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial Number',
  `value` text COMMENT 'Value',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Import Data';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_dataflow_profile`
--

CREATE TABLE `jeu6_dataflow_profile` (
  `profile_id` int(10) UNSIGNED NOT NULL COMMENT 'Profile Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `actions_xml` text COMMENT 'Actions Xml',
  `gui_data` text COMMENT 'Gui Data',
  `direction` varchar(6) DEFAULT NULL COMMENT 'Direction',
  `entity_type` varchar(64) DEFAULT NULL COMMENT 'Entity Type',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `data_transfer` varchar(11) DEFAULT NULL COMMENT 'Data Transfer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile';

--
-- Dumping data for table `jeu6_dataflow_profile`
--

INSERT INTO `jeu6_dataflow_profile` (`profile_id`, `name`, `created_at`, `updated_at`, `actions_xml`, `gui_data`, `direction`, `entity_type`, `store_id`, `data_transfer`) VALUES
(1, 'Export All Products', '2011-08-18 22:28:06', '2011-08-18 22:28:06', '<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'export', 'product', 0, 'file'),
(2, 'Export Product Stocks', '2011-08-18 22:28:06', '2011-08-18 22:28:06', '<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:25:\"export_product_stocks.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:4:\"true\";s:7:\"product\";a:2:{s:2:\"db\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}s:4:\"file\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'export', 'product', 0, 'file'),
(3, 'Import All Products', '2011-08-18 22:28:06', '2011-08-18 22:28:06', '<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'import', 'product', 0, 'interactive'),
(4, 'Import Product Stocks', '2011-08-18 22:28:06', '2011-08-18 22:28:06', '<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:18:\"export_product.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'import', 'product', 0, 'interactive'),
(5, 'Export Customers', '2011-08-18 22:28:06', '2011-08-18 22:28:06', '<action type=\"customer/convert_adapter_customer\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"filter/adressType\"><![CDATA[default_billing]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"customer/convert_parser_customer\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_customers.csv]]></var>\\r\\n</action>\\r\\n\\r\\n', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:20:\"export_customers.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'export', 'customer', 0, 'file'),
(6, 'Import Customers', '2011-08-18 22:28:06', '2011-08-18 22:28:06', '<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">customer/convert_adapter_customer</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>', 'a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:19:\"export_customer.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}', 'import', 'customer', 0, 'interactive');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_dataflow_profile_history`
--

CREATE TABLE `jeu6_dataflow_profile_history` (
  `history_id` int(10) UNSIGNED NOT NULL COMMENT 'History Id',
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `action_code` varchar(64) DEFAULT NULL COMMENT 'Action Code',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'User Id',
  `performed_at` timestamp NULL DEFAULT NULL COMMENT 'Performed At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile History';

--
-- Dumping data for table `jeu6_dataflow_profile_history`
--

INSERT INTO `jeu6_dataflow_profile_history` (`history_id`, `profile_id`, `action_code`, `user_id`, `performed_at`) VALUES
(1, 1, 'create', 0, '2011-08-18 22:28:06'),
(2, 2, 'create', 0, '2011-08-18 22:28:06'),
(3, 3, 'create', 0, '2011-08-18 22:28:06'),
(4, 4, 'create', 0, '2011-08-18 22:28:06'),
(5, 5, 'create', 0, '2011-08-18 22:28:06'),
(6, 6, 'create', 0, '2011-08-18 22:28:06');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_dataflow_session`
--

CREATE TABLE `jeu6_dataflow_session` (
  `session_id` int(11) NOT NULL COMMENT 'Session Id',
  `user_id` int(11) NOT NULL COMMENT 'User Id',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Created Date',
  `file` varchar(255) DEFAULT NULL COMMENT 'File',
  `type` varchar(32) DEFAULT NULL COMMENT 'Type',
  `direction` varchar(32) DEFAULT NULL COMMENT 'Direction',
  `comment` varchar(255) DEFAULT NULL COMMENT 'Comment'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Session';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_design_change`
--

CREATE TABLE `jeu6_design_change` (
  `design_change_id` int(11) NOT NULL COMMENT 'Design Change Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_directory_country`
--

CREATE TABLE `jeu6_directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) NOT NULL DEFAULT '' COMMENT 'Country ISO-3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

--
-- Dumping data for table `jeu6_directory_country`
--

INSERT INTO `jeu6_directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PR', 'PR', 'PRI'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_directory_country_format`
--

CREATE TABLE `jeu6_directory_country_format` (
  `country_format_id` int(10) UNSIGNED NOT NULL COMMENT 'Country Format Id',
  `country_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country Id in ISO-2',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_directory_country_region`
--

CREATE TABLE `jeu6_directory_country_region` (
  `region_id` int(10) UNSIGNED NOT NULL COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';

--
-- Dumping data for table `jeu6_directory_country_region`
--

INSERT INTO `jeu6_directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AE', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AE', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AE', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Thüringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Niederösterreich'),
(97, 'AT', 'OO', 'Oberösterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'Kärnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Vorarlberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Freiburg'),
(111, 'CH', 'GE', 'Genf'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graubünden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Luzern'),
(116, 'CH', 'NE', 'Neuenburg'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Tessin'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Waadt'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Zürich'),
(130, 'ES', 'A Coruсa', 'A Coruña'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '1', 'Ain'),
(183, 'FR', '2', 'Aisne'),
(184, 'FR', '3', 'Allier'),
(185, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 'FR', '5', 'Hautes-Alpes'),
(187, 'FR', '6', 'Alpes-Maritimes'),
(188, 'FR', '7', 'Ardèche'),
(189, 'FR', '8', 'Ardennes'),
(190, 'FR', '9', 'Ariège'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rhône'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corrèze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'Côte-d\'Or'),
(204, 'FR', '22', 'Côtes-d\'Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Drôme'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finistère'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'Hérault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Isère'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Lozère'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Nièvre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-Dôme'),
(246, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyrénées'),
(248, 'FR', '66', 'Pyrénées-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rhône'),
(252, 'FR', '70', 'Haute-Saône'),
(253, 'FR', '71', 'Saône-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-Sèvres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vendée'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d\'Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Argeş'),
(281, 'RO', 'BC', 'Bacău'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 'RO', 'BT', 'Botoşani'),
(285, 'RO', 'BV', 'Braşov'),
(286, 'RO', 'BR', 'Brăila'),
(287, 'RO', 'B', 'Bucureşti'),
(288, 'RO', 'BZ', 'Buzău'),
(289, 'RO', 'CS', 'Caraş-Severin'),
(290, 'RO', 'CL', 'Călăraşi'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constanţa'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'Dâmboviţa'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Galaţi'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomiţa'),
(302, 'RO', 'IS', 'Iaşi'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramureş'),
(305, 'RO', 'MH', 'Mehedinţi'),
(306, 'RO', 'MS', 'Mureş'),
(307, 'RO', 'NT', 'Neamţ'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'Sălaj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timiş'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'Vâlcea'),
(319, 'RO', 'VN', 'Vrancea'),
(320, 'FI', 'Lappi', 'Lappi'),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 'FI', 'Kainuu', 'Kainuu'),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 'FI', 'Satakunta', 'Satakunta'),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 'EE', 'EE-37', 'Harjumaa'),
(341, 'EE', 'EE-39', 'Hiiumaa'),
(342, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 'EE', 'EE-51', 'Järvamaa'),
(345, 'EE', 'EE-57', 'Läänemaa'),
(346, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 'EE', 'EE-65', 'Põlvamaa'),
(348, 'EE', 'EE-67', 'Pärnumaa'),
(349, 'EE', 'EE-70', 'Raplamaa'),
(350, 'EE', 'EE-74', 'Saaremaa'),
(351, 'EE', 'EE-78', 'Tartumaa'),
(352, 'EE', 'EE-82', 'Valgamaa'),
(353, 'EE', 'EE-84', 'Viljandimaa'),
(354, 'EE', 'EE-86', 'Võrumaa'),
(355, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 'LV', 'LV-JEL', 'Jelgava'),
(357, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 'LV', 'LV-LPX', 'Liepāja'),
(360, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 'LV', 'LV-RIX', 'Rīga'),
(363, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 'LV', 'Valmiera', 'Valmiera'),
(365, 'LV', 'LV-VEN', 'Ventspils'),
(366, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 'LV', 'Apes novads', 'Apes novads'),
(375, 'LV', 'Auces novads', 'Auces novads'),
(376, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 'LV', 'LV-BL', 'Balvu novads'),
(380, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 'LV', 'Engures novads', 'Engures novads'),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 'LV', 'LV-MA', 'Madonas novads'),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 'LV', 'LV-OG', 'Ogres novads'),
(427, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 'LV', 'Salas novads', 'Salas novads'),
(446, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 'LV', 'LV-SA', 'Saldus novads'),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 'LV', 'LV-TA', 'Talsu novads'),
(457, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 'LV', 'LV-VK', 'Valkas novads'),
(461, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_directory_country_region_name`
--

CREATE TABLE `jeu6_directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `region_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Region Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

--
-- Dumping data for table `jeu6_directory_country_region_name`
--

INSERT INTO `jeu6_directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-Württemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Thüringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Niederösterreich'),
('en_US', 97, 'Oberösterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'Kärnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Vorarlberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Freiburg'),
('en_US', 111, 'Genf'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graubünden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Luzern'),
('en_US', 116, 'Neuenburg'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Tessin'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Waadt'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Zürich'),
('en_US', 130, 'A Coruña'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ardèche'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ariège'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rhône'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corrèze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'Côte-d\'Or'),
('en_US', 204, 'Côtes-d\'Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Drôme'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finistère'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'Hérault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Isère'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Lozère'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Nièvre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-Dôme'),
('en_US', 246, 'Pyrénées-Atlantiques'),
('en_US', 247, 'Hautes-Pyrénées'),
('en_US', 248, 'Pyrénées-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rhône'),
('en_US', 252, 'Haute-Saône'),
('en_US', 253, 'Saône-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-Sèvres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vendée'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d\'Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Argeş'),
('en_US', 281, 'Bacău'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistriţa-Năsăud'),
('en_US', 284, 'Botoşani'),
('en_US', 285, 'Braşov'),
('en_US', 286, 'Brăila'),
('en_US', 287, 'Bucureşti'),
('en_US', 288, 'Buzău'),
('en_US', 289, 'Caraş-Severin'),
('en_US', 290, 'Călăraşi'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constanţa'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'Dâmboviţa'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Galaţi'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomiţa'),
('en_US', 302, 'Iaşi'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramureş'),
('en_US', 305, 'Mehedinţi'),
('en_US', 306, 'Mureş'),
('en_US', 307, 'Neamţ'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'Sălaj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timiş'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'Vâlcea'),
('en_US', 319, 'Vrancea'),
('en_US', 320, 'Lappi'),
('en_US', 321, 'Pohjois-Pohjanmaa'),
('en_US', 322, 'Kainuu'),
('en_US', 323, 'Pohjois-Karjala'),
('en_US', 324, 'Pohjois-Savo'),
('en_US', 325, 'Etelä-Savo'),
('en_US', 326, 'Etelä-Pohjanmaa'),
('en_US', 327, 'Pohjanmaa'),
('en_US', 328, 'Pirkanmaa'),
('en_US', 329, 'Satakunta'),
('en_US', 330, 'Keski-Pohjanmaa'),
('en_US', 331, 'Keski-Suomi'),
('en_US', 332, 'Varsinais-Suomi'),
('en_US', 333, 'Etelä-Karjala'),
('en_US', 334, 'Päijät-Häme'),
('en_US', 335, 'Kanta-Häme'),
('en_US', 336, 'Uusimaa'),
('en_US', 337, 'Itä-Uusimaa'),
('en_US', 338, 'Kymenlaakso'),
('en_US', 339, 'Ahvenanmaa'),
('en_US', 340, 'Harjumaa'),
('en_US', 341, 'Hiiumaa'),
('en_US', 342, 'Ida-Virumaa'),
('en_US', 343, 'Jõgevamaa'),
('en_US', 344, 'Järvamaa'),
('en_US', 345, 'Läänemaa'),
('en_US', 346, 'Lääne-Virumaa'),
('en_US', 347, 'Põlvamaa'),
('en_US', 348, 'Pärnumaa'),
('en_US', 349, 'Raplamaa'),
('en_US', 350, 'Saaremaa'),
('en_US', 351, 'Tartumaa'),
('en_US', 352, 'Valgamaa'),
('en_US', 353, 'Viljandimaa'),
('en_US', 354, 'Võrumaa'),
('en_US', 355, 'Daugavpils'),
('en_US', 356, 'Jelgava'),
('en_US', 357, 'Jēkabpils'),
('en_US', 358, 'Jūrmala'),
('en_US', 359, 'Liepāja'),
('en_US', 360, 'Liepājas novads'),
('en_US', 361, 'Rēzekne'),
('en_US', 362, 'Rīga'),
('en_US', 363, 'Rīgas novads'),
('en_US', 364, 'Valmiera'),
('en_US', 365, 'Ventspils'),
('en_US', 366, 'Aglonas novads'),
('en_US', 367, 'Aizkraukles novads'),
('en_US', 368, 'Aizputes novads'),
('en_US', 369, 'Aknīstes novads'),
('en_US', 370, 'Alojas novads'),
('en_US', 371, 'Alsungas novads'),
('en_US', 372, 'Alūksnes novads'),
('en_US', 373, 'Amatas novads'),
('en_US', 374, 'Apes novads'),
('en_US', 375, 'Auces novads'),
('en_US', 376, 'Babītes novads'),
('en_US', 377, 'Baldones novads'),
('en_US', 378, 'Baltinavas novads'),
('en_US', 379, 'Balvu novads'),
('en_US', 380, 'Bauskas novads'),
('en_US', 381, 'Beverīnas novads'),
('en_US', 382, 'Brocēnu novads'),
('en_US', 383, 'Burtnieku novads'),
('en_US', 384, 'Carnikavas novads'),
('en_US', 385, 'Cesvaines novads'),
('en_US', 386, 'Ciblas novads'),
('en_US', 387, 'Cēsu novads'),
('en_US', 388, 'Dagdas novads'),
('en_US', 389, 'Daugavpils novads'),
('en_US', 390, 'Dobeles novads'),
('en_US', 391, 'Dundagas novads'),
('en_US', 392, 'Durbes novads'),
('en_US', 393, 'Engures novads'),
('en_US', 394, 'Garkalnes novads'),
('en_US', 395, 'Grobiņas novads'),
('en_US', 396, 'Gulbenes novads'),
('en_US', 397, 'Iecavas novads'),
('en_US', 398, 'Ikšķiles novads'),
('en_US', 399, 'Ilūkstes novads'),
('en_US', 400, 'Inčukalna novads'),
('en_US', 401, 'Jaunjelgavas novads'),
('en_US', 402, 'Jaunpiebalgas novads'),
('en_US', 403, 'Jaunpils novads'),
('en_US', 404, 'Jelgavas novads'),
('en_US', 405, 'Jēkabpils novads'),
('en_US', 406, 'Kandavas novads'),
('en_US', 407, 'Kokneses novads'),
('en_US', 408, 'Krimuldas novads'),
('en_US', 409, 'Krustpils novads'),
('en_US', 410, 'Krāslavas novads'),
('en_US', 411, 'Kuldīgas novads'),
('en_US', 412, 'Kārsavas novads'),
('en_US', 413, 'Lielvārdes novads'),
('en_US', 414, 'Limbažu novads'),
('en_US', 415, 'Lubānas novads'),
('en_US', 416, 'Ludzas novads'),
('en_US', 417, 'Līgatnes novads'),
('en_US', 418, 'Līvānu novads'),
('en_US', 419, 'Madonas novads'),
('en_US', 420, 'Mazsalacas novads'),
('en_US', 421, 'Mālpils novads'),
('en_US', 422, 'Mārupes novads'),
('en_US', 423, 'Naukšēnu novads'),
('en_US', 424, 'Neretas novads'),
('en_US', 425, 'Nīcas novads'),
('en_US', 426, 'Ogres novads'),
('en_US', 427, 'Olaines novads'),
('en_US', 428, 'Ozolnieku novads'),
('en_US', 429, 'Preiļu novads'),
('en_US', 430, 'Priekules novads'),
('en_US', 431, 'Priekuļu novads'),
('en_US', 432, 'Pārgaujas novads'),
('en_US', 433, 'Pāvilostas novads'),
('en_US', 434, 'Pļaviņu novads'),
('en_US', 435, 'Raunas novads'),
('en_US', 436, 'Riebiņu novads'),
('en_US', 437, 'Rojas novads'),
('en_US', 438, 'Ropažu novads'),
('en_US', 439, 'Rucavas novads'),
('en_US', 440, 'Rugāju novads'),
('en_US', 441, 'Rundāles novads'),
('en_US', 442, 'Rēzeknes novads'),
('en_US', 443, 'Rūjienas novads'),
('en_US', 444, 'Salacgrīvas novads'),
('en_US', 445, 'Salas novads'),
('en_US', 446, 'Salaspils novads'),
('en_US', 447, 'Saldus novads'),
('en_US', 448, 'Saulkrastu novads'),
('en_US', 449, 'Siguldas novads'),
('en_US', 450, 'Skrundas novads'),
('en_US', 451, 'Skrīveru novads'),
('en_US', 452, 'Smiltenes novads'),
('en_US', 453, 'Stopiņu novads'),
('en_US', 454, 'Strenču novads'),
('en_US', 455, 'Sējas novads'),
('en_US', 456, 'Talsu novads'),
('en_US', 457, 'Tukuma novads'),
('en_US', 458, 'Tērvetes novads'),
('en_US', 459, 'Vaiņodes novads'),
('en_US', 460, 'Valkas novads'),
('en_US', 461, 'Valmieras novads'),
('en_US', 462, 'Varakļānu novads'),
('en_US', 463, 'Vecpiebalgas novads'),
('en_US', 464, 'Vecumnieku novads'),
('en_US', 465, 'Ventspils novads'),
('en_US', 466, 'Viesītes novads'),
('en_US', 467, 'Viļakas novads'),
('en_US', 468, 'Viļānu novads'),
('en_US', 469, 'Vārkavas novads'),
('en_US', 470, 'Zilupes novads'),
('en_US', 471, 'Ādažu novads'),
('en_US', 472, 'Ērgļu novads'),
('en_US', 473, 'Ķeguma novads'),
('en_US', 474, 'Ķekavas novads'),
('en_US', 475, 'Alytaus Apskritis'),
('en_US', 476, 'Kauno Apskritis'),
('en_US', 477, 'Klaipėdos Apskritis'),
('en_US', 478, 'Marijampolės Apskritis'),
('en_US', 479, 'Panevėžio Apskritis'),
('en_US', 480, 'Šiaulių Apskritis'),
('en_US', 481, 'Tauragės Apskritis'),
('en_US', 482, 'Telšių Apskritis'),
('en_US', 483, 'Utenos Apskritis'),
('en_US', 484, 'Vilniaus Apskritis');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_directory_currency_rate`
--

CREATE TABLE `jeu6_directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

--
-- Dumping data for table `jeu6_directory_currency_rate`
--

INSERT INTO `jeu6_directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', '1.000000000000'),
('EUR', 'USD', '1.415000000000'),
('USD', 'EUR', '0.706700000000'),
('USD', 'USD', '1.000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_downloadable_link`
--

CREATE TABLE `jeu6_downloadable_link` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_downloadable_link_price`
--

CREATE TABLE `jeu6_downloadable_link_price` (
  `price_id` int(10) UNSIGNED NOT NULL COMMENT 'Price ID',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_downloadable_link_purchased`
--

CREATE TABLE `jeu6_downloadable_link_purchased` (
  `purchased_id` int(10) UNSIGNED NOT NULL COMMENT 'Purchased ID',
  `order_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of modification',
  `customer_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_downloadable_link_purchased_item`
--

CREATE TABLE `jeu6_downloadable_link_purchased_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item ID',
  `purchased_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_downloadable_link_title`
--

CREATE TABLE `jeu6_downloadable_link_title` (
  `title_id` int(10) UNSIGNED NOT NULL COMMENT 'Title ID',
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_downloadable_sample`
--

CREATE TABLE `jeu6_downloadable_sample` (
  `sample_id` int(10) UNSIGNED NOT NULL COMMENT 'Sample ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_downloadable_sample_title`
--

CREATE TABLE `jeu6_downloadable_sample_title` (
  `title_id` int(10) UNSIGNED NOT NULL COMMENT 'Title ID',
  `sample_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_attribute`
--

CREATE TABLE `jeu6_eav_attribute` (
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';

--
-- Dumping data for table `jeu6_eav_attribute`
--

INSERT INTO `jeu6_eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'customer/customer_attribute_backend_website', 'static', NULL, NULL, 'select', 'Associate to Website', NULL, 'customer/customer_attribute_source_website', 1, 0, NULL, 0, NULL),
(2, 1, 'store_id', NULL, 'customer/customer_attribute_backend_store', 'static', NULL, NULL, 'select', 'Create In', NULL, 'customer/customer_attribute_source_store', 1, 0, NULL, 0, NULL),
(3, 1, 'created_in', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Created From', NULL, NULL, 0, 0, NULL, 0, NULL),
(4, 1, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(5, 1, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(6, 1, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(7, 1, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(8, 1, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(9, 1, 'email', NULL, NULL, 'static', NULL, NULL, 'text', 'Email', NULL, NULL, 1, 0, NULL, 0, NULL),
(10, 1, 'group_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Group', NULL, 'customer/customer_attribute_source_group', 1, 0, NULL, 0, NULL),
(11, 1, 'dob', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, 'eav/entity_attribute_frontend_datetime', 'date', 'Date Of Birth', NULL, NULL, 0, 0, NULL, 0, NULL),
(12, 1, 'password_hash', NULL, 'customer/customer_attribute_backend_password', 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(13, 1, 'default_billing', NULL, 'customer/customer_attribute_backend_billing', 'int', NULL, NULL, 'text', 'Default Billing Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(14, 1, 'default_shipping', NULL, 'customer/customer_attribute_backend_shipping', 'int', NULL, NULL, 'text', 'Default Shipping Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(15, 1, 'taxvat', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Tax/VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(16, 1, 'confirmation', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Is Confirmed', NULL, NULL, 0, 0, NULL, 0, NULL),
(17, 1, 'created_at', NULL, NULL, 'static', NULL, NULL, 'datetime', 'Created At', NULL, NULL, 0, 0, NULL, 0, NULL),
(18, 1, 'gender', NULL, NULL, 'int', NULL, NULL, 'select', 'Gender', NULL, 'eav/entity_attribute_source_table', 0, 0, NULL, 0, NULL),
(19, 2, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(20, 2, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(21, 2, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(22, 2, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(23, 2, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(24, 2, 'company', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Company', NULL, NULL, 0, 0, NULL, 0, NULL),
(25, 2, 'street', NULL, 'customer/entity_address_attribute_backend_street', 'text', NULL, NULL, 'multiline', 'Street Address', NULL, NULL, 1, 0, NULL, 0, NULL),
(26, 2, 'city', NULL, NULL, 'varchar', NULL, NULL, 'text', 'City', NULL, NULL, 1, 0, NULL, 0, NULL),
(27, 2, 'country_id', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country', NULL, 'customer/entity_address_attribute_source_country', 1, 0, NULL, 0, NULL),
(28, 2, 'region', NULL, 'customer/entity_address_attribute_backend_region', 'varchar', NULL, NULL, 'text', 'State/Province', NULL, NULL, 0, 0, NULL, 0, NULL),
(29, 2, 'region_id', NULL, NULL, 'int', NULL, NULL, 'hidden', 'State/Province', NULL, 'customer/entity_address_attribute_source_region', 0, 0, NULL, 0, NULL),
(30, 2, 'postcode', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Zip/Postal Code', NULL, NULL, 1, 0, NULL, 0, NULL),
(31, 2, 'telephone', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Telephone', NULL, NULL, 1, 0, NULL, 0, NULL),
(32, 2, 'fax', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Fax', NULL, NULL, 0, 0, NULL, 0, NULL),
(33, 3, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(34, 3, 'is_active', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Active', NULL, 'eav/entity_attribute_source_boolean', 1, 0, NULL, 0, NULL),
(35, 3, 'url_key', NULL, 'catalog/category_attribute_backend_urlkey', 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(36, 3, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(37, 3, 'image', NULL, 'catalog/category_attribute_backend_image', 'varchar', NULL, NULL, 'image', 'Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(38, 3, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Page Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(39, 3, 'meta_keywords', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(40, 3, 'meta_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(41, 3, 'display_mode', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Mode', NULL, 'catalog/category_attribute_source_mode', 0, 0, NULL, 0, NULL),
(42, 3, 'landing_page', NULL, NULL, 'int', NULL, NULL, 'select', 'CMS Block', NULL, 'catalog/category_attribute_source_page', 0, 0, NULL, 0, NULL),
(43, 3, 'is_anchor', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Anchor', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(44, 3, 'path', NULL, NULL, 'static', NULL, NULL, 'text', 'Path', NULL, NULL, 0, 0, NULL, 0, NULL),
(45, 3, 'position', NULL, NULL, 'static', NULL, NULL, 'text', 'Position', NULL, NULL, 0, 0, NULL, 0, NULL),
(46, 3, 'all_children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(47, 3, 'path_in_store', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(48, 3, 'children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(49, 3, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(50, 3, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'core/design_source_design', 0, 0, NULL, 0, NULL),
(51, 3, 'custom_design_from', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(52, 3, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(53, 3, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'catalog/category_attribute_source_layout', 0, 0, NULL, 0, NULL),
(54, 3, 'custom_layout_update', NULL, 'catalog/attribute_backend_customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(55, 3, 'level', NULL, NULL, 'static', NULL, NULL, 'text', 'Level', NULL, NULL, 0, 0, NULL, 0, NULL),
(56, 3, 'children_count', NULL, NULL, 'static', NULL, NULL, 'text', 'Children Count', NULL, NULL, 0, 0, NULL, 0, NULL),
(57, 3, 'available_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'text', NULL, NULL, 'multiselect', 'Available Product Listing Sort By', NULL, 'catalog/category_attribute_source_sortby', 1, 0, NULL, 0, NULL),
(58, 3, 'default_sort_by', NULL, 'catalog/category_attribute_backend_sortby', 'varchar', NULL, NULL, 'select', 'Default Product Listing Sort By', NULL, 'catalog/category_attribute_source_sortby', 1, 0, NULL, 0, NULL),
(59, 3, 'include_in_menu', NULL, NULL, 'int', NULL, NULL, 'select', 'Include in Navigation Menu', NULL, 'eav/entity_attribute_source_boolean', 1, 0, '1', 0, NULL),
(60, 3, 'custom_use_parent_settings', NULL, NULL, 'int', NULL, NULL, 'select', 'Use Parent Category Settings', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(61, 3, 'custom_apply_to_products', NULL, NULL, 'int', NULL, NULL, 'select', 'Apply To Products', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(62, 3, 'filter_price_range', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Layered Navigation Price Step', NULL, NULL, 0, 0, NULL, 0, NULL),
(63, 4, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(64, 4, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 1, 0, NULL, 0, NULL),
(65, 4, 'short_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Short Description', NULL, NULL, 1, 0, NULL, 0, NULL),
(66, 4, 'sku', NULL, 'catalog/product_attribute_backend_sku', 'static', NULL, NULL, 'text', 'SKU', NULL, NULL, 1, 0, NULL, 1, NULL),
(67, 4, 'price', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Price', NULL, NULL, 1, 0, NULL, 0, NULL),
(68, 4, 'special_price', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Special Price', 'validate-special-price', NULL, 0, 0, NULL, 0, NULL),
(69, 4, 'special_from_date', NULL, 'catalog/product_attribute_backend_startdate_specialprice', 'datetime', NULL, NULL, 'date', 'Special Price From Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(70, 4, 'special_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Special Price To Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(71, 4, 'cost', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Cost', NULL, NULL, 0, 1, NULL, 0, NULL),
(72, 4, 'weight', NULL, NULL, 'decimal', NULL, NULL, 'weight', 'Weight', NULL, NULL, 1, 0, NULL, 0, NULL),
(73, 4, 'manufacturer', NULL, NULL, 'int', NULL, NULL, 'select', 'Manufacturer', NULL, NULL, 0, 1, NULL, 0, NULL),
(74, 4, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Meta Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(75, 4, 'meta_keyword', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(76, 4, 'meta_description', NULL, NULL, 'varchar', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, 'Maximum 255 chars'),
(77, 4, 'image', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Base Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(78, 4, 'small_image', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Small Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(79, 4, 'thumbnail', NULL, NULL, 'varchar', NULL, 'catalog/product_attribute_frontend_image', 'media_image', 'Thumbnail', NULL, NULL, 0, 0, NULL, 0, NULL),
(80, 4, 'media_gallery', NULL, 'catalog/product_attribute_backend_media', 'varchar', NULL, NULL, 'gallery', 'Media Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(81, 4, 'old_id', NULL, NULL, 'int', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(82, 4, 'tier_price', NULL, 'catalog/product_attribute_backend_tierprice', 'decimal', NULL, NULL, 'text', 'Tier Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(83, 4, 'color', NULL, NULL, 'int', NULL, NULL, 'select', 'Color', NULL, NULL, 0, 1, '', 0, NULL),
(84, 4, 'news_from_date', NULL, 'catalog/product_attribute_backend_startdate', 'datetime', NULL, NULL, 'date', 'Set Product as New from Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(85, 4, 'news_to_date', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New to Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(86, 4, 'gallery', NULL, NULL, 'varchar', NULL, NULL, 'gallery', 'Image Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(87, 4, 'status', NULL, NULL, 'int', NULL, NULL, 'select', 'Status', NULL, 'catalog/product_status', 1, 0, NULL, 0, NULL),
(88, 4, 'url_key', NULL, 'catalog/product_attribute_backend_urlkey', 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(89, 4, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(90, 4, 'minimal_price', NULL, NULL, 'decimal', NULL, NULL, 'price', 'Minimal Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(91, 4, 'is_recurring', NULL, NULL, 'int', NULL, NULL, 'select', 'Enable Recurring Profile', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, 'Products with recurring profile participate in catalog as nominal items.'),
(92, 4, 'recurring_profile', NULL, 'catalog/product_attribute_backend_recurring', 'text', NULL, NULL, 'text', 'Recurring Payment Profile', NULL, NULL, 0, 0, NULL, 0, NULL),
(93, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'catalog/product_visibility', 1, 0, '4', 0, NULL),
(94, 4, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'core/design_source_design', 0, 0, NULL, 0, NULL),
(95, 4, 'custom_design_from', NULL, 'catalog/product_attribute_backend_startdate', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(96, 4, 'custom_design_to', NULL, 'eav/entity_attribute_backend_datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(97, 4, 'custom_layout_update', NULL, 'catalog/attribute_backend_customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(98, 4, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'catalog/product_attribute_source_layout', 0, 0, NULL, 0, NULL),
(99, 4, 'category_ids', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(100, 4, 'options_container', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Product Options In', NULL, 'catalog/entity_product_attribute_design_options_container', 0, 0, 'container2', 0, NULL),
(101, 4, 'required_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(102, 4, 'has_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(103, 4, 'image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(104, 4, 'small_image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Small Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(105, 4, 'thumbnail_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Thumbnail Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(106, 4, 'created_at', NULL, 'eav/entity_attribute_backend_time_created', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(107, 4, 'updated_at', NULL, 'eav/entity_attribute_backend_time_updated', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(108, 4, 'country_of_manufacture', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country of Manufacture', NULL, 'catalog/product_attribute_source_countryofmanufacture', 0, 0, NULL, 0, NULL),
(109, 4, 'msrp_enabled', NULL, 'catalog/product_attribute_backend_msrp', 'varchar', NULL, NULL, 'select', 'Apply MAP', NULL, 'catalog/product_attribute_source_msrp_type_enabled', 0, 0, '2', 0, NULL),
(110, 4, 'msrp_display_actual_price_type', NULL, 'catalog/product_attribute_backend_boolean', 'varchar', NULL, NULL, 'select', 'Display Actual Price', NULL, 'catalog/product_attribute_source_msrp_type_price', 0, 0, '4', 0, NULL),
(111, 4, 'msrp', NULL, 'catalog/product_attribute_backend_price', 'decimal', NULL, NULL, 'price', 'Manufacturer\'s Suggested Retail Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(113, 4, 'tax_class_id', NULL, NULL, 'int', NULL, NULL, 'select', 'Tax Class', NULL, 'tax/class_source_product', 1, 0, NULL, 0, NULL),
(114, 4, 'gift_message_available', NULL, 'catalog/product_attribute_backend_boolean', 'varchar', NULL, NULL, 'select', 'Allow Gift Message', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(115, 4, 'price_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(116, 4, 'sku_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(117, 4, 'weight_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(118, 4, 'price_view', NULL, NULL, 'int', NULL, NULL, 'select', 'Price View', NULL, 'bundle/product_attribute_source_price_view', 1, 0, NULL, 0, NULL),
(119, 4, 'shipment_type', NULL, NULL, 'int', NULL, NULL, NULL, 'Shipment', NULL, NULL, 1, 0, NULL, 0, NULL),
(120, 4, 'links_purchased_separately', NULL, NULL, 'int', NULL, NULL, NULL, 'Links can be purchased separately', NULL, NULL, 1, 0, NULL, 0, NULL),
(121, 4, 'samples_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Samples title', NULL, NULL, 1, 0, NULL, 0, NULL),
(122, 4, 'links_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Links title', NULL, NULL, 1, 0, NULL, 0, NULL),
(123, 4, 'links_exist', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 0, NULL),
(124, 3, 'thumbnail', NULL, 'catalog/category_attribute_backend_image', 'varchar', NULL, NULL, 'image', 'Thumbnail Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(125, 4, 'is_imported', NULL, NULL, 'int', NULL, NULL, 'select', 'In feed', NULL, 'eav/entity_attribute_source_boolean', 0, 0, NULL, 0, NULL),
(126, 1, 'rp_token', NULL, NULL, 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(127, 1, 'rp_token_created_at', NULL, NULL, 'datetime', NULL, NULL, 'date', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(128, 1, 'disable_auto_group_change', NULL, 'customer/attribute_backend_data_boolean', 'static', NULL, NULL, 'boolean', 'Disable Automatic Group Change Based on VAT ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(129, 2, 'vat_id', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number', NULL, NULL, 0, 0, NULL, 0, NULL),
(130, 2, 'vat_is_valid', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validity', NULL, NULL, 0, 0, NULL, 0, NULL),
(131, 2, 'vat_request_id', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(132, 2, 'vat_request_date', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request date', NULL, NULL, 0, 0, NULL, 0, NULL),
(133, 2, 'vat_request_success', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validation request success', NULL, NULL, 0, 0, NULL, 0, NULL),
(134, 1, 'password_created_at', NULL, NULL, 'int', NULL, NULL, 'text', 'Password created at', NULL, NULL, 0, 0, NULL, 0, NULL),
(135, 1, 'rp_customer_id', NULL, NULL, 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(136, 4, 'group_price', NULL, 'catalog/product_attribute_backend_groupprice', 'decimal', NULL, NULL, 'text', 'Group Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(137, 4, 'size', NULL, NULL, 'int', NULL, NULL, 'select', 'Size', NULL, 'eav/entity_attribute_source_table', 0, 1, '', 0, NULL),
(138, 4, 'featured', NULL, NULL, 'int', NULL, NULL, 'boolean', 'Is Featured', NULL, 'eav/entity_attribute_source_boolean', 0, 1, NULL, 0, NULL),
(139, 3, 'pu_megamenu_menu_status', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Show in Menu', NULL, 'megamenu/category_attribute_source_block_yesno', 0, 0, '1', 0, 'Display Category in Main Navigation Menu and Mobil Menu.'),
(140, 3, 'pu_megamenu_vmenu_status', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Show in Verticle Menu', NULL, 'megamenu/category_attribute_source_block_yesno', 0, 0, '1', 0, 'Display Category in Verticle Menu.'),
(141, 3, 'pu_megamenu_menu_type', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Menu Type', NULL, 'megamenu/category_attribute_source_menutype', 0, 0, NULL, 0, 'Set Menu Type for Megamenu.'),
(142, 3, 'pu_mg_cus_width', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Dropdown Custom Width', NULL, NULL, 0, 0, NULL, 0, 'Set Menu Width For Megamenu.Ex. 800px, Applicable only Menu Type = Custom.'),
(143, 3, 'pu_mg_cols', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Show Columns', NULL, 'megamenu/category_attribute_source_columns', 0, 0, NULL, 0, 'Set number of columns display in Megamenu. Applicable only Top Level Sub Categories.'),
(144, 3, 'pu_mg_label', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Category Labels', NULL, 'megamenu/category_attribute_source_catlabels', 0, 0, NULL, 0, 'Set Menu Labels.'),
(145, 3, 'pu_mg_icon', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Icon (Font Awesome)', NULL, NULL, 0, 0, NULL, 0, 'Display Category Icon in Verticle Megamenu . Ex:\"fa fa-blind\", This fields applicable only for Top Level Categories.'),
(146, 3, 'pu_mg_lblock_cols', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Left Block Width', NULL, 'megamenu/category_attribute_source_columns', 0, 0, NULL, 0, 'Properties of Left Block. This fields affected only Top Level SubCategories.'),
(147, 3, 'pu_mg_lblock_content', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Left Block', NULL, NULL, 0, 1, NULL, 0, 'This field applicable only for Top Level Categories.'),
(148, 3, 'pu_mg_rblock_cols', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Right Block Width', NULL, 'megamenu/category_attribute_source_columns', 0, 0, NULL, 0, 'Properties of Right Block. This fields applicable only for Top Level SubCategories.'),
(149, 3, 'pu_mg_rblock_content', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Right Block', NULL, NULL, 0, 1, NULL, 0, 'This field applicable only for Top Level Categories.'),
(150, 3, 'pu_mg_tblock_content', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Top Block', NULL, NULL, 0, 1, NULL, 0, 'This field applicable only for Top Level Categories.'),
(151, 3, 'pu_mg_bblock_content', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Bottom Block', NULL, NULL, 0, 1, NULL, 0, 'This field applicable only for Top Level Categories.');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_attribute_group`
--

CREATE TABLE `jeu6_eav_attribute_group` (
  `attribute_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Default Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';

--
-- Dumping data for table `jeu6_eav_attribute_group`
--

INSERT INTO `jeu6_eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`) VALUES
(1, 1, 'General', 1, 1),
(2, 2, 'General', 1, 1),
(3, 3, 'General', 10, 1),
(4, 3, 'General Information', 2, 0),
(5, 3, 'Display Settings', 20, 0),
(6, 3, 'Custom Design', 30, 0),
(7, 4, 'General', 1, 1),
(8, 4, 'Prices', 2, 0),
(9, 4, 'Meta Information', 3, 0),
(10, 4, 'Images', 4, 0),
(11, 4, 'Recurring Profile', 5, 0),
(12, 4, 'Design', 6, 0),
(13, 5, 'General', 1, 1),
(14, 6, 'General', 1, 1),
(15, 7, 'General', 1, 1),
(16, 8, 'General', 1, 1),
(17, 4, 'Gift Options', 7, 0),
(18, 9, 'Gift Options', 8, 0),
(19, 9, 'Design', 7, 0),
(20, 9, 'Recurring Profile', 6, 0),
(21, 9, 'Images', 5, 0),
(22, 9, 'Meta Information', 4, 0),
(23, 9, 'Prices', 3, 0),
(24, 9, 'General', 1, 1),
(25, 9, 'Clothing Attribute', 2, 0),
(26, 3, 'Megamenu', 31, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_attribute_label`
--

CREATE TABLE `jeu6_eav_attribute_label` (
  `attribute_label_id` int(10) UNSIGNED NOT NULL COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_attribute_option`
--

CREATE TABLE `jeu6_eav_attribute_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';

--
-- Dumping data for table `jeu6_eav_attribute_option`
--

INSERT INTO `jeu6_eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 18, 0),
(2, 18, 1),
(3, 83, 0),
(4, 83, 0),
(5, 83, 0),
(6, 83, 0),
(7, 83, 0),
(8, 83, 0),
(9, 83, 0),
(10, 83, 0),
(11, 137, 0),
(12, 137, 0),
(13, 137, 0),
(14, 137, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_attribute_option_value`
--

CREATE TABLE `jeu6_eav_attribute_option_value` (
  `value_id` int(10) UNSIGNED NOT NULL COMMENT 'Value Id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';

--
-- Dumping data for table `jeu6_eav_attribute_option_value`
--

INSERT INTO `jeu6_eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female'),
(3, 3, 0, 'grey'),
(4, 4, 0, 'Red '),
(5, 5, 0, 'Green '),
(6, 6, 0, 'Yellow'),
(7, 7, 0, 'Black'),
(8, 8, 0, 'Orange'),
(9, 9, 0, 'Pink'),
(10, 10, 0, 'Purple'),
(11, 11, 0, 'S'),
(12, 12, 0, 'M'),
(13, 13, 0, 'L'),
(14, 14, 0, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_attribute_set`
--

CREATE TABLE `jeu6_eav_attribute_set` (
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';

--
-- Dumping data for table `jeu6_eav_attribute_set`
--

INSERT INTO `jeu6_eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Default', 1),
(2, 2, 'Default', 1),
(3, 3, 'Default', 1),
(4, 4, 'Default', 1),
(5, 5, 'Default', 1),
(6, 6, 'Default', 1),
(7, 7, 'Default', 1),
(8, 8, 'Default', 1),
(9, 4, 'Clothing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity`
--

CREATE TABLE `jeu6_eav_entity` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'Increment Id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_attribute`
--

CREATE TABLE `jeu6_eav_entity_attribute` (
  `entity_attribute_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';

--
-- Dumping data for table `jeu6_eav_entity_attribute`
--

INSERT INTO `jeu6_eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 0),
(3, 1, 1, 1, 3, 20),
(4, 1, 1, 1, 4, 30),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 50),
(7, 1, 1, 1, 7, 60),
(8, 1, 1, 1, 8, 70),
(9, 1, 1, 1, 9, 80),
(10, 1, 1, 1, 10, 25),
(11, 1, 1, 1, 11, 90),
(12, 1, 1, 1, 12, 0),
(13, 1, 1, 1, 13, 0),
(14, 1, 1, 1, 14, 0),
(15, 1, 1, 1, 15, 100),
(16, 1, 1, 1, 16, 0),
(17, 1, 1, 1, 17, 86),
(18, 1, 1, 1, 18, 110),
(19, 2, 2, 2, 19, 10),
(20, 2, 2, 2, 20, 20),
(21, 2, 2, 2, 21, 30),
(22, 2, 2, 2, 22, 40),
(23, 2, 2, 2, 23, 50),
(24, 2, 2, 2, 24, 60),
(25, 2, 2, 2, 25, 70),
(26, 2, 2, 2, 26, 80),
(27, 2, 2, 2, 27, 90),
(28, 2, 2, 2, 28, 100),
(29, 2, 2, 2, 29, 100),
(30, 2, 2, 2, 30, 110),
(31, 2, 2, 2, 31, 120),
(32, 2, 2, 2, 32, 130),
(33, 3, 3, 4, 33, 1),
(34, 3, 3, 4, 34, 2),
(35, 3, 3, 4, 35, 3),
(36, 3, 3, 4, 36, 4),
(37, 3, 3, 4, 37, 5),
(38, 3, 3, 4, 38, 6),
(39, 3, 3, 4, 39, 7),
(40, 3, 3, 4, 40, 8),
(41, 3, 3, 5, 41, 10),
(42, 3, 3, 5, 42, 20),
(43, 3, 3, 5, 43, 30),
(44, 3, 3, 4, 44, 12),
(45, 3, 3, 4, 45, 13),
(46, 3, 3, 4, 46, 14),
(47, 3, 3, 4, 47, 15),
(48, 3, 3, 4, 48, 16),
(49, 3, 3, 4, 49, 17),
(50, 3, 3, 6, 50, 10),
(51, 3, 3, 6, 51, 30),
(52, 3, 3, 6, 52, 40),
(53, 3, 3, 6, 53, 50),
(54, 3, 3, 6, 54, 60),
(55, 3, 3, 4, 55, 24),
(56, 3, 3, 4, 56, 25),
(57, 3, 3, 5, 57, 40),
(58, 3, 3, 5, 58, 50),
(59, 3, 3, 4, 59, 10),
(60, 3, 3, 6, 60, 5),
(61, 3, 3, 6, 61, 6),
(62, 3, 3, 5, 62, 51),
(63, 4, 4, 7, 63, 1),
(64, 4, 4, 7, 64, 2),
(65, 4, 4, 7, 65, 3),
(66, 4, 4, 7, 66, 4),
(67, 4, 4, 8, 67, 1),
(68, 4, 4, 8, 68, 3),
(69, 4, 4, 8, 69, 4),
(70, 4, 4, 8, 70, 5),
(71, 4, 4, 8, 71, 6),
(72, 4, 4, 7, 72, 5),
(73, 4, 4, 9, 74, 1),
(74, 4, 4, 9, 75, 2),
(75, 4, 4, 9, 76, 3),
(76, 4, 4, 10, 77, 1),
(77, 4, 4, 10, 78, 2),
(78, 4, 4, 10, 79, 3),
(79, 4, 4, 10, 80, 4),
(80, 4, 4, 7, 81, 6),
(81, 4, 4, 8, 82, 7),
(82, 4, 4, 7, 84, 7),
(83, 4, 4, 7, 85, 8),
(84, 4, 4, 10, 86, 5),
(85, 4, 4, 7, 87, 9),
(86, 4, 4, 7, 88, 10),
(87, 4, 4, 7, 89, 11),
(88, 4, 4, 8, 90, 8),
(89, 4, 4, 11, 91, 1),
(90, 4, 4, 11, 92, 2),
(91, 4, 4, 7, 93, 12),
(92, 4, 4, 12, 94, 1),
(93, 4, 4, 12, 95, 2),
(94, 4, 4, 12, 96, 3),
(95, 4, 4, 12, 97, 4),
(96, 4, 4, 12, 98, 5),
(97, 4, 4, 7, 99, 13),
(98, 4, 4, 12, 100, 6),
(99, 4, 4, 7, 101, 14),
(100, 4, 4, 7, 102, 15),
(101, 4, 4, 7, 103, 16),
(102, 4, 4, 7, 104, 17),
(103, 4, 4, 7, 105, 18),
(104, 4, 4, 7, 106, 19),
(105, 4, 4, 7, 107, 20),
(106, 4, 4, 7, 108, 21),
(107, 4, 4, 8, 109, 9),
(108, 4, 4, 8, 110, 10),
(109, 4, 4, 8, 111, 11),
(110, 4, 4, 8, 112, 12),
(111, 4, 4, 8, 113, 13),
(112, 4, 4, 17, 114, 1),
(113, 4, 4, 7, 115, 22),
(114, 4, 4, 7, 116, 23),
(115, 4, 4, 7, 117, 24),
(116, 4, 4, 8, 118, 14),
(117, 4, 4, 7, 119, 25),
(118, 4, 4, 7, 120, 26),
(119, 4, 4, 7, 121, 27),
(120, 4, 4, 7, 122, 28),
(121, 4, 4, 7, 123, 29),
(122, 3, 3, 4, 124, 4),
(123, 4, 4, 7, 125, 30),
(124, 1, 1, 1, 126, 111),
(125, 1, 1, 1, 127, 112),
(126, 1, 1, 1, 128, 28),
(127, 2, 2, 2, 129, 140),
(128, 2, 2, 2, 130, 132),
(129, 2, 2, 2, 131, 133),
(130, 2, 2, 2, 132, 134),
(131, 2, 2, 2, 133, 135),
(132, 1, 1, 1, 134, 113),
(133, 1, 1, 1, 135, 114),
(134, 4, 4, 8, 136, 2),
(184, 4, 9, 23, 90, 8),
(206, 4, 9, 24, 81, 6),
(216, 4, 9, 24, 89, 11),
(220, 4, 9, 24, 99, 13),
(222, 4, 9, 24, 101, 14),
(224, 4, 9, 24, 102, 15),
(226, 4, 9, 24, 103, 16),
(228, 4, 9, 24, 104, 17),
(230, 4, 9, 24, 105, 18),
(232, 4, 9, 24, 106, 19),
(234, 4, 9, 24, 107, 20),
(238, 4, 9, 24, 115, 22),
(240, 4, 9, 24, 116, 23),
(242, 4, 9, 24, 117, 24),
(244, 4, 9, 24, 119, 25),
(246, 4, 9, 24, 120, 26),
(248, 4, 9, 24, 121, 27),
(250, 4, 9, 24, 122, 28),
(252, 4, 9, 24, 123, 29),
(256, 4, 9, 24, 63, 1),
(258, 4, 9, 24, 64, 2),
(260, 4, 9, 24, 65, 3),
(262, 4, 9, 24, 66, 4),
(264, 4, 9, 24, 72, 5),
(266, 4, 9, 24, 84, 6),
(268, 4, 9, 24, 85, 7),
(270, 4, 9, 24, 87, 8),
(272, 4, 9, 24, 88, 9),
(274, 4, 9, 24, 93, 10),
(276, 4, 9, 24, 108, 11),
(278, 4, 9, 24, 125, 12),
(280, 4, 9, 25, 83, 1),
(282, 4, 9, 25, 137, 2),
(284, 4, 9, 23, 67, 1),
(286, 4, 9, 23, 68, 3),
(288, 4, 9, 23, 69, 4),
(290, 4, 9, 23, 70, 5),
(292, 4, 9, 23, 71, 6),
(294, 4, 9, 23, 82, 7),
(296, 4, 9, 23, 109, 8),
(298, 4, 9, 23, 110, 9),
(300, 4, 9, 23, 111, 10),
(302, 4, 9, 23, 113, 11),
(304, 4, 9, 23, 118, 12),
(306, 4, 9, 23, 136, 2),
(308, 4, 9, 22, 74, 1),
(310, 4, 9, 22, 75, 2),
(312, 4, 9, 22, 76, 3),
(314, 4, 9, 21, 77, 1),
(316, 4, 9, 21, 78, 2),
(318, 4, 9, 21, 79, 3),
(320, 4, 9, 21, 80, 4),
(322, 4, 9, 21, 86, 5),
(324, 4, 9, 20, 91, 1),
(326, 4, 9, 20, 92, 2),
(328, 4, 9, 19, 94, 1),
(330, 4, 9, 19, 95, 2),
(332, 4, 9, 19, 96, 3),
(334, 4, 9, 19, 97, 4),
(336, 4, 9, 19, 98, 5),
(338, 4, 9, 19, 100, 6),
(340, 4, 9, 18, 114, 1),
(341, 4, 4, 7, 138, 31),
(342, 3, 3, 26, 139, 9),
(343, 3, 3, 26, 140, 9),
(344, 3, 3, 26, 141, 10),
(345, 3, 3, 26, 142, 20),
(346, 3, 3, 26, 143, 30),
(347, 3, 3, 26, 144, 40),
(348, 3, 3, 26, 145, 40),
(349, 3, 3, 26, 146, 50),
(350, 3, 3, 26, 147, 60),
(351, 3, 3, 26, 148, 70),
(352, 3, 3, 26, 149, 80),
(353, 3, 3, 26, 150, 90),
(354, 3, 3, 26, 151, 100);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_datetime`
--

CREATE TABLE `jeu6_eav_entity_datetime` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_decimal`
--

CREATE TABLE `jeu6_eav_entity_decimal` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_int`
--

CREATE TABLE `jeu6_eav_entity_int` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_store`
--

CREATE TABLE `jeu6_eav_entity_store` (
  `entity_store_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_text`
--

CREATE TABLE `jeu6_eav_entity_text` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_type`
--

CREATE TABLE `jeu6_eav_entity_type` (
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT '' COMMENT 'Increment Model',
  `increment_per_store` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) UNSIGNED NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT '' COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT '' COMMENT 'Entity Attribute Collection'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';

--
-- Dumping data for table `jeu6_eav_entity_type`
--

INSERT INTO `jeu6_eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'customer/customer', 'customer/attribute', 'customer/entity', NULL, NULL, 1, 'default', 1, 'eav/entity_increment_numeric', 0, 8, '0', 'customer/eav_attribute', 'customer/attribute_collection'),
(2, 'customer_address', 'customer/address', 'customer/attribute', 'customer/address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer/eav_attribute', 'customer/address_attribute_collection'),
(3, 'catalog_category', 'catalog/category', 'catalog/resource_eav_attribute', 'catalog/category', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog/eav_attribute', 'catalog/category_attribute_collection'),
(4, 'catalog_product', 'catalog/product', 'catalog/resource_eav_attribute', 'catalog/product', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog/eav_attribute', 'catalog/product_attribute_collection'),
(5, 'order', 'sales/order', NULL, 'sales/order', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL),
(6, 'invoice', 'sales/order_invoice', NULL, 'sales/invoice', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL),
(7, 'creditmemo', 'sales/order_creditmemo', NULL, 'sales/creditmemo', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL),
(8, 'shipment', 'sales/order_shipment', NULL, 'sales/shipment', NULL, NULL, 1, 'default', 0, 'eav/entity_increment_numeric', 1, 8, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_entity_varchar`
--

CREATE TABLE `jeu6_eav_entity_varchar` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'Attribute Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_form_element`
--

CREATE TABLE `jeu6_eav_form_element` (
  `element_id` int(10) UNSIGNED NOT NULL COMMENT 'Element Id',
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';

--
-- Dumping data for table `jeu6_eav_form_element`
--

INSERT INTO `jeu6_eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, NULL, 20, 0),
(2, 1, NULL, 22, 1),
(3, 1, NULL, 24, 2),
(4, 1, NULL, 9, 3),
(5, 1, NULL, 25, 4),
(6, 1, NULL, 26, 5),
(7, 1, NULL, 28, 6),
(8, 1, NULL, 30, 7),
(9, 1, NULL, 27, 8),
(10, 1, NULL, 31, 9),
(11, 1, NULL, 32, 10),
(12, 2, NULL, 20, 0),
(13, 2, NULL, 22, 1),
(14, 2, NULL, 24, 2),
(15, 2, NULL, 9, 3),
(16, 2, NULL, 25, 4),
(17, 2, NULL, 26, 5),
(18, 2, NULL, 28, 6),
(19, 2, NULL, 30, 7),
(20, 2, NULL, 27, 8),
(21, 2, NULL, 31, 9),
(22, 2, NULL, 32, 10),
(23, 3, NULL, 20, 0),
(24, 3, NULL, 22, 1),
(25, 3, NULL, 24, 2),
(26, 3, NULL, 25, 3),
(27, 3, NULL, 26, 4),
(28, 3, NULL, 28, 5),
(29, 3, NULL, 30, 6),
(30, 3, NULL, 27, 7),
(31, 3, NULL, 31, 8),
(32, 3, NULL, 32, 9),
(33, 4, NULL, 20, 0),
(34, 4, NULL, 22, 1),
(35, 4, NULL, 24, 2),
(36, 4, NULL, 25, 3),
(37, 4, NULL, 26, 4),
(38, 4, NULL, 28, 5),
(39, 4, NULL, 30, 6),
(40, 4, NULL, 27, 7),
(41, 4, NULL, 31, 8),
(42, 4, NULL, 32, 9),
(43, 5, 1, 5, 0),
(44, 5, 1, 7, 1),
(45, 5, 1, 9, 2),
(46, 5, 2, 24, 0),
(47, 5, 2, 31, 1),
(48, 5, 2, 25, 2),
(49, 5, 2, 26, 3),
(50, 5, 2, 28, 4),
(51, 5, 2, 30, 5),
(52, 5, 2, 27, 6);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_form_fieldset`
--

CREATE TABLE `jeu6_eav_form_fieldset` (
  `fieldset_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Fieldset Id',
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';

--
-- Dumping data for table `jeu6_eav_form_fieldset`
--

INSERT INTO `jeu6_eav_form_fieldset` (`fieldset_id`, `type_id`, `code`, `sort_order`) VALUES
(1, 5, 'general', 1),
(2, 5, 'address', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_form_fieldset_label`
--

CREATE TABLE `jeu6_eav_form_fieldset_label` (
  `fieldset_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';

--
-- Dumping data for table `jeu6_eav_form_fieldset_label`
--

INSERT INTO `jeu6_eav_form_fieldset_label` (`fieldset_id`, `store_id`, `label`) VALUES
(1, 0, 'Personal Information'),
(2, 0, 'Address Information');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_form_type`
--

CREATE TABLE `jeu6_eav_form_type` (
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';

--
-- Dumping data for table `jeu6_eav_form_type`
--

INSERT INTO `jeu6_eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(2, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(3, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(4, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0),
(5, 'checkout_multishipping_register', 'checkout_multishipping_register', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_eav_form_type_entity`
--

CREATE TABLE `jeu6_eav_form_type_entity` (
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

--
-- Dumping data for table `jeu6_eav_form_type_entity`
--

INSERT INTO `jeu6_eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(2, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_find_feed_import_codes`
--

CREATE TABLE `jeu6_find_feed_import_codes` (
  `code_id` int(10) UNSIGNED NOT NULL COMMENT 'Code id',
  `import_code` varchar(255) NOT NULL COMMENT 'Import type',
  `eav_code` varchar(255) NOT NULL COMMENT 'EAV code',
  `is_imported` int(11) NOT NULL COMMENT 'Is imported'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Find feed import codes';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_gift_message`
--

CREATE TABLE `jeu6_gift_message` (
  `gift_message_id` int(10) UNSIGNED NOT NULL COMMENT 'GiftMessage Id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Recipient',
  `message` text COMMENT 'Message'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_googlebase_attributes`
--

CREATE TABLE `jeu6_googlebase_attributes` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute id',
  `gbase_attribute` varchar(255) DEFAULT NULL COMMENT 'Google base attribute',
  `type_id` int(10) UNSIGNED NOT NULL COMMENT 'Type id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Attributes link Product Attributes';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_googlebase_items`
--

CREATE TABLE `jeu6_googlebase_items` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item id',
  `type_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Type id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product id',
  `gbase_item_id` varchar(255) NOT NULL COMMENT 'Google base item id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `published` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Published',
  `expires` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Expires',
  `impr` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Google impressions',
  `clicks` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Google clicks',
  `views` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Google views',
  `is_hidden` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Hidden flag'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Items Products';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_googlebase_types`
--

CREATE TABLE `jeu6_googlebase_types` (
  `type_id` int(10) UNSIGNED NOT NULL COMMENT 'Type id',
  `attribute_set_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute set id',
  `gbase_itemtype` varchar(255) NOT NULL COMMENT 'Google base item type',
  `target_country` varchar(2) NOT NULL DEFAULT 'US' COMMENT 'Target country'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Base Item Types link Attribute Sets';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_googlecheckout_notification`
--

CREATE TABLE `jeu6_googlecheckout_notification` (
  `serial_number` varchar(64) NOT NULL COMMENT 'Serial Number',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Checkout Notification Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_googleoptimizer_code`
--

CREATE TABLE `jeu6_googleoptimizer_code` (
  `code_id` int(10) UNSIGNED NOT NULL COMMENT 'Google optimizer code id',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store id',
  `control_script` text COMMENT 'Google optimizer control script',
  `tracking_script` text COMMENT 'Google optimizer tracking script',
  `conversion_script` text COMMENT 'Google optimizer conversion script',
  `conversion_page` varchar(255) DEFAULT NULL COMMENT 'Google optimizer conversion page',
  `additional_data` text COMMENT 'Google optimizer additional data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Googleoptimizer code';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_importexport_importdata`
--

CREATE TABLE `jeu6_importexport_importdata` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_index_event`
--

CREATE TABLE `jeu6_index_event` (
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Event Id',
  `type` varchar(64) NOT NULL COMMENT 'Type',
  `entity` varchar(64) NOT NULL COMMENT 'Entity',
  `entity_pk` bigint(20) DEFAULT NULL COMMENT 'Entity Primary Key',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `old_data` mediumtext COMMENT 'Old Data',
  `new_data` mediumtext COMMENT 'New Data'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Event';

--
-- Dumping data for table `jeu6_index_event`
--

INSERT INTO `jeu6_index_event` (`event_id`, `type`, `entity`, `entity_pk`, `created_at`, `old_data`, `new_data`) VALUES
(1, 'save', 'catalog_category', 1, '2011-08-18 22:28:30', 'a:3:{s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}', 'a:8:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}'),
(2, 'save', 'catalog_category', 2, '2011-08-18 22:28:31', 'a:3:{s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}', 'a:8:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:30:\"Mage_Catalog_Model_Indexer_Url\";N;s:37:\"catalog_category_product_match_result\";b:1;s:43:\"Mage_Catalog_Model_Category_Indexer_Product\";N;s:35:\"catalogsearch_fulltext_match_result\";b:1;s:41:\"Mage_CatalogSearch_Model_Indexer_Fulltext\";N;}'),
(3, 'save', 'cataloginventory_stock_item', 1, '2018-10-27 14:24:19', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(4, 'catalog_reindex_price', 'catalog_product', 1, '2018-10-27 14:24:19', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(5, 'save', 'catalog_product', 1, '2018-10-27 14:24:19', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(6, 'save', 'cataloginventory_stock_item', 2, '2018-10-27 14:33:05', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(7, 'catalog_reindex_price', 'catalog_product', 2, '2018-10-27 14:33:05', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(8, 'save', 'catalog_product', 2, '2018-10-27 14:33:05', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(9, 'save', 'cataloginventory_stock_item', 3, '2018-10-27 14:43:08', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(10, 'catalog_reindex_price', 'catalog_product', 3, '2018-10-27 14:43:08', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(11, 'save', 'catalog_product', 3, '2018-10-27 14:43:08', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(12, 'save', 'cataloginventory_stock_item', 4, '2018-10-27 20:46:26', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(13, 'catalog_reindex_price', 'catalog_product', 4, '2018-10-27 20:46:26', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(14, 'save', 'catalog_product', 4, '2018-10-27 20:46:27', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(15, 'save', 'cataloginventory_stock_item', 5, '2018-10-27 21:18:52', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(16, 'catalog_reindex_price', 'catalog_product', 5, '2018-10-27 21:18:52', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(17, 'save', 'catalog_product', 5, '2018-10-27 21:18:52', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(18, 'save', 'cataloginventory_stock_item', 6, '2018-10-27 22:20:41', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(19, 'catalog_reindex_price', 'catalog_product', 6, '2018-10-27 22:20:42', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(20, 'save', 'catalog_product', 6, '2018-10-27 22:20:42', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(21, 'save', 'cataloginventory_stock_item', 7, '2018-10-27 22:34:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(22, 'catalog_reindex_price', 'catalog_product', 7, '2018-10-27 22:34:58', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(23, 'save', 'catalog_product', 7, '2018-10-27 22:34:58', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(24, 'save', 'catalog_category', 3, '2018-10-27 22:35:57', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(25, 'delete', 'catalog_product', 1, '2018-10-27 22:46:27', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(26, 'delete', 'catalog_product', 2, '2018-10-27 22:46:27', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(27, 'delete', 'catalog_product', 3, '2018-10-27 22:46:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(28, 'delete', 'catalog_product', 4, '2018-10-27 22:46:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(29, 'delete', 'catalog_product', 5, '2018-10-27 22:46:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(30, 'delete', 'catalog_product', 6, '2018-10-27 22:46:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(31, 'delete', 'catalog_product', 7, '2018-10-27 22:46:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(32, 'save', 'cataloginventory_stock_item', 8, '2018-10-27 22:47:10', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(33, 'catalog_reindex_price', 'catalog_product', 8, '2018-10-27 22:47:10', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(34, 'save', 'catalog_product', 8, '2018-10-27 22:47:10', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(35, 'save', 'cataloginventory_stock_item', 9, '2018-10-27 22:50:50', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(36, 'catalog_reindex_price', 'catalog_product', 9, '2018-10-27 22:50:50', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(37, 'save', 'catalog_product', 9, '2018-10-27 22:50:51', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(38, 'save', 'catalog_eav_attribute', 83, '2018-11-11 23:39:20', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(39, 'save', 'catalog_eav_attribute', 137, '2018-11-11 23:57:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(40, 'save', 'cataloginventory_stock_item', 10, '2018-11-12 00:05:27', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(41, 'catalog_reindex_price', 'catalog_product', 10, '2018-11-12 00:05:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(42, 'save', 'catalog_product', 10, '2018-11-12 00:05:28', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(43, 'save', 'cataloginventory_stock_item', 11, '2018-11-12 00:05:43', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(44, 'catalog_reindex_price', 'catalog_product', 11, '2018-11-12 00:05:43', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(45, 'save', 'catalog_product', 11, '2018-11-12 00:05:43', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),
(46, 'save', 'cataloginventory_stock_item', 12, '2018-11-12 00:09:23', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(47, 'catalog_reindex_price', 'catalog_product', 12, '2018-11-12 00:09:23', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),
(48, 'save', 'catalog_product', 12, '2018-11-12 00:09:24', NULL, 'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_index_process`
--

CREATE TABLE `jeu6_index_process` (
  `process_id` int(10) UNSIGNED NOT NULL COMMENT 'Process Id',
  `indexer_code` varchar(32) NOT NULL COMMENT 'Indexer Code',
  `status` varchar(15) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `ended_at` timestamp NULL DEFAULT NULL COMMENT 'Ended At',
  `mode` varchar(9) NOT NULL DEFAULT 'real_time' COMMENT 'Mode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Process';

--
-- Dumping data for table `jeu6_index_process`
--

INSERT INTO `jeu6_index_process` (`process_id`, `indexer_code`, `status`, `started_at`, `ended_at`, `mode`) VALUES
(1, 'catalog_product_attribute', 'pending', '2018-11-15 04:05:27', '2018-11-15 04:05:27', 'real_time'),
(2, 'catalog_product_price', 'pending', '2018-11-15 04:05:27', '2018-11-15 04:05:27', 'real_time'),
(3, 'catalog_url', 'pending', '2018-11-15 04:05:27', '2018-11-15 04:05:27', 'real_time'),
(4, 'catalog_product_flat', 'pending', '2018-10-27 12:41:37', '2018-10-27 12:41:37', 'real_time'),
(5, 'catalog_category_flat', 'pending', '2018-10-27 12:41:37', '2018-10-27 12:41:37', 'real_time'),
(6, 'catalog_category_product', 'pending', '2018-11-15 04:05:27', '2018-11-15 04:05:27', 'real_time'),
(7, 'catalogsearch_fulltext', 'pending', '2018-11-15 04:05:27', '2018-11-15 04:05:27', 'real_time'),
(8, 'cataloginventory_stock', 'pending', '2018-11-15 04:05:27', '2018-11-15 04:05:27', 'real_time'),
(9, 'tag_summary', 'pending', '2018-11-15 04:05:27', '2018-11-15 04:05:27', 'real_time');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_index_process_event`
--

CREATE TABLE `jeu6_index_process_event` (
  `process_id` int(10) UNSIGNED NOT NULL COMMENT 'Process Id',
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Event Id',
  `status` varchar(7) NOT NULL DEFAULT 'new' COMMENT 'Status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Process Event';

--
-- Dumping data for table `jeu6_index_process_event`
--

INSERT INTO `jeu6_index_process_event` (`process_id`, `event_id`, `status`) VALUES
(3, 1, 'done'),
(3, 2, 'done'),
(6, 1, 'done'),
(6, 2, 'done'),
(7, 1, 'done'),
(7, 2, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_customer`
--

CREATE TABLE `jeu6_log_customer` (
  `log_id` int(10) UNSIGNED NOT NULL COMMENT 'Log ID',
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `login_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Login Time',
  `logout_at` timestamp NULL DEFAULT NULL COMMENT 'Logout Time',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Customers Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_quote`
--

CREATE TABLE `jeu6_log_quote` (
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Deletion Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Quotes Table';

--
-- Dumping data for table `jeu6_log_quote`
--

INSERT INTO `jeu6_log_quote` (`quote_id`, `visitor_id`, `created_at`, `deleted_at`) VALUES
(1, 33, '2018-11-12 00:20:41', NULL),
(2, 42, '2018-11-15 04:14:47', NULL),
(3, 44, '2018-11-15 10:53:53', NULL),
(4, 45, '2018-11-16 13:32:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_summary`
--

CREATE TABLE `jeu6_log_summary` (
  `summary_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Summary ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID',
  `type_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Type ID',
  `visitor_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Visitor Count',
  `customer_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer Count',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_summary_type`
--

CREATE TABLE `jeu6_log_summary_type` (
  `type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Type ID',
  `type_code` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type Code',
  `period` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Period',
  `period_type` varchar(6) NOT NULL DEFAULT 'MINUTE' COMMENT 'Period Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Types Table';

--
-- Dumping data for table `jeu6_log_summary_type`
--

INSERT INTO `jeu6_log_summary_type` (`type_id`, `type_code`, `period`, `period_type`) VALUES
(1, 'hour', 1, 'HOUR'),
(2, 'day', 1, 'DAY');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_url`
--

CREATE TABLE `jeu6_log_url` (
  `url_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'URL ID',
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Visitor ID',
  `visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Visit Time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_url_info`
--

CREATE TABLE `jeu6_log_url_info` (
  `url_id` bigint(20) UNSIGNED NOT NULL COMMENT 'URL ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'URL',
  `referer` varchar(255) DEFAULT NULL COMMENT 'Referrer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Info Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_visitor`
--

CREATE TABLE `jeu6_log_visitor` (
  `visitor_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Visitor ID',
  `session_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'Session ID',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last Visit Time',
  `last_url_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Last URL ID',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitors Table';

--
-- Dumping data for table `jeu6_log_visitor`
--

INSERT INTO `jeu6_log_visitor` (`visitor_id`, `session_id`, `first_visit_at`, `last_visit_at`, `last_url_id`, `store_id`) VALUES
(1, 'a3a89974e0c295e6af3b43e33c9a0e32', '2018-10-27 12:04:16', '2018-10-27 12:04:18', 0, 1),
(2, '6fef016e5475aef96392e949410ca684', '2018-10-27 12:04:16', '2018-10-27 13:07:28', 0, 1),
(3, '5a3cb842541e9e22959bf2da2bd45428', '2018-10-27 13:25:11', '2018-10-27 14:50:48', 0, 1),
(4, '8bf2385df9874fcd4d89362e7fe779e0', '2018-10-27 16:15:02', '2018-10-27 16:15:04', 0, 1),
(5, '6d26cfccaf324f87db580dd78971b200', '2018-10-27 20:42:40', '2018-10-27 23:17:53', 0, 1),
(6, '6384871688331efc93321557bd20eba2', '2018-10-28 15:01:11', '2018-10-28 15:01:18', 0, 1),
(7, '6382d171871efc654217b3f4a012d7aa', '2018-10-28 15:03:20', '2018-10-28 15:03:20', 0, 1),
(8, 'daffb7cf43009c9e26b9d1a65e2ce82d', '2018-10-28 15:05:41', '2018-10-28 15:05:41', 0, 1),
(9, 'd3bff214d01cc9d5c722d918a634b635', '2018-10-28 15:05:41', '2018-10-28 15:05:41', 0, 1),
(10, '048330aa319313400bde6d6cf44fe526', '2018-10-28 15:05:44', '2018-10-28 15:05:44', 0, 1),
(11, 'f6cea5041e23760171be3f99208f402d', '2018-10-28 15:05:44', '2018-10-28 15:05:44', 0, 1),
(12, 'f162e4e8794d9ec2846ef0472f5135d8', '2018-10-28 15:05:47', '2018-10-28 15:05:47', 0, 1),
(13, '2f0ab3d023b09159375d74293c1c16fb', '2018-10-28 15:05:47', '2018-10-28 15:05:47', 0, 1),
(14, '816fbd86fbd74c6978e6ba82a70fb7d7', '2018-10-28 15:05:47', '2018-10-28 15:05:47', 0, 1),
(15, '8dc4355bb0eecf9d4fc2e5ecfcce4051', '2018-10-28 15:05:51', '2018-10-28 15:05:51', 0, 1),
(16, 'eaeec1f0453b33a11261df66653a3775', '2018-10-28 15:05:57', '2018-10-28 15:05:57', 0, 1),
(17, '24ed2c7f2f537dbe4481d03dbe17b595', '2018-10-28 15:05:58', '2018-10-28 15:05:58', 0, 1),
(18, '5ba9b2f2dd51fadc9e3ea08a488d002b', '2018-10-28 15:06:00', '2018-10-28 15:06:00', 0, 1),
(19, '3c16e0a8dc27d54f11e78c705a614180', '2018-10-28 15:07:37', '2018-10-28 15:07:37', 0, 1),
(20, '66df3e124c9beda922daf0ac29609aa7', '2018-10-28 15:08:58', '2018-10-28 15:08:59', 0, 1),
(21, 'f55fcbcf71421a579517b69a1d1c62c4', '2018-10-28 15:09:05', '2018-10-28 15:09:05', 0, 1),
(22, '09118d27a7609b121ed1bdedde66d43e', '2018-10-28 15:09:42', '2018-10-28 15:09:43', 0, 1),
(23, 'd4d513a4eac8752778de7f3a61ccbecb', '2018-10-28 15:09:51', '2018-10-28 15:09:51', 0, 1),
(24, '03e1e170c6c0683eb229628eb1a71a11', '2018-11-04 16:37:27', '2018-11-04 16:37:29', 0, 1),
(25, 'c4bfeb4a15c26f7e675af684a822e33a', '2018-11-09 22:24:16', '2018-11-09 22:24:19', 0, 1),
(26, 'd68243078f877daae1011574a7b6bd8a', '2018-11-09 22:55:23', '2018-11-09 23:39:14', 0, 1),
(27, 'bac6cbf1bc2ecd0587acfcaffe4646b2', '2018-11-09 23:38:33', '2018-11-09 23:38:33', 0, 1),
(28, '9ac0af02b51b38697a522160dd0eedaf', '2018-11-09 23:40:58', '2018-11-09 23:45:00', 0, 1),
(29, 'b968484c9489d6607f4a1a625f5f5b87', '2018-11-10 14:36:00', '2018-11-10 14:51:21', 0, 1),
(30, '6fa5777305a79eb1bcf6168e5e798031', '2018-11-10 14:48:07', '2018-11-10 14:48:07', 0, 1),
(31, '5b18f5a8d4cda4b880ad5d6476fd154c', '2018-11-10 14:48:07', '2018-11-10 14:48:08', 0, 1),
(32, 'f249b9848ceb24d3c67bcd12c5e74ac8', '2018-11-11 23:32:54', '2018-11-11 23:32:56', 0, 1),
(33, '7798c986719dd70eb8426d0ebfaeb2ac', '2018-11-12 00:14:17', '2018-11-12 00:21:36', 0, 1),
(34, '8d96d29d179211b3e95f6e5b769cfb33', '2018-11-14 13:57:14', '2018-11-14 13:57:35', 0, 1),
(35, 'c34be11300da1e4617b88a14f9e795f3', '2018-11-14 14:02:38', '2018-11-14 14:23:33', 0, 1),
(36, 'a7f699e63f0f119f9dc495070f702c74', '2018-11-14 14:24:59', '2018-11-14 14:41:10', 0, 1),
(37, '329111a362f2fcb0dc36798f59187d1b', '2018-11-14 16:08:19', '2018-11-14 16:09:06', 0, 1),
(38, '63b51d5c52b9c18b32e4812c6d09c38d', '2018-11-14 16:09:57', '2018-11-14 16:09:58', 0, 1),
(39, 'e73d39965330dd067dc7d9c4845a5282', '2018-11-14 16:11:43', '2018-11-14 16:11:43', 0, 1),
(40, '6fbb7240360701d46dcb42906676809e', '2018-11-14 18:34:26', '2018-11-14 18:34:49', 0, 1),
(41, 'e9c161aacb5e6aff95df02348f1c271e', '2018-11-15 04:00:18', '2018-11-15 04:01:05', 0, 1),
(42, 'ec4778ef6ab0d38325c0772ff4ea9a13', '2018-11-15 04:01:43', '2018-11-15 04:37:26', 0, 1),
(43, '765683df54aa81782b1b7a6c7b9d362e', '2018-11-15 05:16:32', '2018-11-15 05:17:12', 0, 1),
(44, 'c84a7f32cb2e9ae57df579389fcc6d8a', '2018-11-15 10:53:18', '2018-11-15 11:36:12', 0, 1),
(45, 'da9021b3ccaa2e851fe7d7eecc8e397b', '2018-11-16 13:32:12', '2018-11-16 13:48:34', 0, 1),
(46, '21cc7dcb3220877b20c5f1ad2edad656', '2018-11-25 15:11:08', '2018-11-25 15:11:11', 0, 1),
(47, '47c0ab23b7d7f96bfdd1948828cd3f8c', '2018-11-25 15:13:17', '2018-11-25 15:13:18', 0, 1),
(48, '6fe1cd8c86063a76bda09957fbd9b726', '2018-11-25 15:15:43', '2018-11-25 15:15:43', 0, 1),
(49, '7dfb1bdc0bee785d84308ae9b8cd0bf3', '2018-11-25 15:15:43', '2018-11-25 15:15:43', 0, 1),
(50, '24a1b79d0eae5893697ce564d4cc4862', '2018-11-25 15:15:44', '2018-11-25 15:15:44', 0, 1),
(51, '0f26982189754080bf8ecfa8c23cd5cb', '2018-11-25 15:15:44', '2018-11-25 15:15:45', 0, 1),
(52, '72ef4594ac3cd649185d39fd76f85591', '2018-11-25 15:15:45', '2018-11-25 15:15:45', 0, 1),
(53, 'f3f7a949af0805bbd44bef4d3c06b14d', '2018-11-25 15:15:45', '2018-11-25 15:15:46', 0, 1),
(54, 'b52a6dc9e186c7dc747c9fa34b6691b7', '2018-11-25 15:15:46', '2018-11-25 15:15:48', 0, 1),
(55, '21a3578308a91ade03e4394e6adaa2a9', '2018-11-25 15:15:47', '2018-11-25 15:15:47', 0, 1),
(56, '6d4ae7dc6d2cf8ecf3f061c83dce61d2', '2018-11-25 15:15:49', '2018-11-25 15:15:49', 0, 1),
(57, '819ee0141784bcef17e96f15035259be', '2018-11-25 15:15:49', '2018-11-25 15:15:49', 0, 1),
(58, 'd0dc840412fe80b2eab664d93638458b', '2018-11-25 15:15:52', '2018-11-25 15:15:53', 0, 1),
(59, 'd21868fe535a3f40be45fbffd0355ddb', '2018-11-25 15:15:55', '2018-11-25 15:15:55', 0, 1),
(60, 'a1fedf8285377bebc0d31714688f1825', '2018-11-25 15:15:55', '2018-11-25 15:15:55', 0, 1),
(61, '0fc7fe6cc60f09db4e4001287ea10f72', '2018-11-25 15:15:56', '2018-11-25 15:15:56', 0, 1),
(62, 'e49fb8ace2687b73587495a4169d650f', '2018-11-25 15:15:57', '2018-11-25 15:15:57', 0, 1),
(63, '4fdd34a0ff662503059afc8526df519e', '2018-11-25 15:16:00', '2018-11-25 15:16:01', 0, 1),
(64, '82885251e8ef51e760d1f47763bbc30f', '2018-11-25 15:19:52', '2018-11-25 15:19:52', 0, 1),
(65, 'bc02732b444913e6753fa3c982be8728', '2018-11-25 15:19:58', '2018-11-25 15:19:58', 0, 1),
(66, '40b2285ba60faaafc6a632116b77773b', '2018-11-25 15:20:15', '2018-11-25 15:20:17', 0, 1),
(67, '577804b00b59a50e83570a3f42ee469c', '2018-11-25 15:20:17', '2018-11-25 15:20:17', 0, 1),
(68, '1b7229706d9baf245fef4bd02b397bb7', '2018-11-25 15:20:18', '2018-11-25 15:20:18', 0, 1),
(69, '6c9b1819bc412bb83c6c3b18c6f83add', '2018-11-25 15:20:20', '2018-11-25 15:20:20', 0, 1),
(70, '34e4d87b15d42785c4b8c518bca7f675', '2018-11-25 15:20:48', '2018-11-25 15:20:48', 0, 1),
(71, '6a51e3a03fdd6ccbe01e09dbd06bf381', '2018-11-25 15:20:51', '2018-11-25 15:20:51', 0, 1),
(72, 'c0d772d2ffa38327d4b65c34c9a0691e', '2018-11-25 15:20:56', '2018-11-25 15:20:56', 0, 1),
(73, 'cd1fdd12487d1d4330058bf99d82a8a5', '2018-11-25 15:20:59', '2018-11-25 15:20:59', 0, 1),
(74, '29fa9f202f1d3c10b4f61d9fe95f1eb5', '2018-11-25 15:21:00', '2018-11-25 15:21:00', 0, 1),
(75, 'a8739e8d15c08292b4a150523a60a90f', '2018-11-25 15:21:03', '2018-11-25 15:21:03', 0, 1),
(76, '785ecd62c30485a9bd902cbc8f8739ed', '2018-11-25 15:21:03', '2018-11-25 15:21:03', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_visitor_info`
--

CREATE TABLE `jeu6_log_visitor_info` (
  `visitor_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `http_referer` varchar(255) DEFAULT NULL COMMENT 'HTTP Referrer',
  `http_user_agent` varchar(255) DEFAULT NULL COMMENT 'HTTP User-Agent',
  `http_accept_charset` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Charset',
  `http_accept_language` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Language',
  `server_addr` varbinary(16) DEFAULT NULL,
  `remote_addr` varbinary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Info Table';

--
-- Dumping data for table `jeu6_log_visitor_info`
--

INSERT INTO `jeu6_log_visitor_info` (`visitor_id`, `http_referer`, `http_user_agent`, `http_accept_charset`, `http_accept_language`, `server_addr`, `remote_addr`) VALUES
(1, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0', NULL, NULL, 0x52a55060, 0x200108d805c004533128000000010002),
(2, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(3, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(4, NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1', NULL, 'en-gb', 0x52a55060, 0xd5cdf190),
(5, 'http://devplugin.aamirsalman.com/', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(6, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d896),
(7, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8ae),
(8, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8ae),
(9, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8de),
(10, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8ee),
(11, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8d6),
(12, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8c6),
(13, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8a6),
(14, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8ee),
(15, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8c6),
(16, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8ae),
(17, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8e6),
(18, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d896),
(19, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d88e),
(20, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8e6),
(21, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d88e),
(22, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d88e),
(23, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0xd4e3d8b6),
(24, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(25, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(26, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(27, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(28, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', NULL, 'en-GB,en-US;q=0.9,en;q=0.8', 0x52a55060, 0x5cef0770),
(29, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(30, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A', NULL, NULL, 0x52a55060, 0xd4e3dd89),
(31, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A', NULL, NULL, 0x52a55060, 0xd4e3dd89),
(32, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(33, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(34, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(35, 'http://devplugin.aamirsalman.com/admin', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(36, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(37, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(38, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b', NULL, NULL, 0x52a55060, 0x9d372751),
(39, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534+ (KHTML, like Gecko) BingPreview/1.0b', NULL, NULL, 0x52a55060, 0x9d372751),
(40, NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1', NULL, 'en-gb', 0x52a55060, 0x5cef0770),
(41, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', NULL, 'en-US,en;q=0.9,gu;q=0.8,hi;q=0.7', 0x52a55060, 0x67f12d49),
(42, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', NULL, 'en-GB,en-US;q=0.9,en;q=0.8', 0x52a55060, 0x67f0a99c),
(43, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', NULL, 'en-US,en;q=0.9,gu;q=0.8,hi;q=0.7', 0x52a55060, 0x67f12d49),
(44, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(45, NULL, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:63.0) Gecko/20100101 Firefox/63.0', NULL, 'en-US,en;q=0.5', 0x52a55060, 0x5cef0770),
(46, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e021),
(47, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e01b),
(48, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e01d),
(49, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00b),
(50, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e01d),
(51, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e011),
(52, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e007),
(53, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e005),
(54, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e015),
(55, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00f),
(56, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e009),
(57, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e013),
(58, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00b),
(59, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e015),
(60, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e01b),
(61, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e007),
(62, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e003),
(63, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e009),
(64, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00f),
(65, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e009),
(66, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00b),
(67, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e021),
(68, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e021),
(69, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e013),
(70, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00b),
(71, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e01f),
(72, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e021),
(73, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00f),
(74, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e01f),
(75, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e00f),
(76, NULL, 'crawler4j (https://github.com/yasserg/crawler4j/)', NULL, NULL, 0x52a55060, 0x52a5e019);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_log_visitor_online`
--

CREATE TABLE `jeu6_log_visitor_online` (
  `visitor_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Visitor ID',
  `visitor_type` varchar(1) NOT NULL COMMENT 'Visitor Type',
  `remote_addr` varbinary(16) DEFAULT NULL,
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NULL DEFAULT NULL COMMENT 'Last Visit Time',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer ID',
  `last_url` varchar(255) DEFAULT NULL COMMENT 'Last URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Online Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_newsletter_problem`
--

CREATE TABLE `jeu6_newsletter_problem` (
  `problem_id` int(10) UNSIGNED NOT NULL COMMENT 'Problem Id',
  `subscriber_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) UNSIGNED DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_newsletter_queue`
--

CREATE TABLE `jeu6_newsletter_queue` (
  `queue_id` int(10) UNSIGNED NOT NULL COMMENT 'Queue Id',
  `template_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Template Id',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_newsletter_queue_link`
--

CREATE TABLE `jeu6_newsletter_queue_link` (
  `queue_link_id` int(10) UNSIGNED NOT NULL COMMENT 'Queue Link Id',
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_newsletter_queue_store_link`
--

CREATE TABLE `jeu6_newsletter_queue_store_link` (
  `queue_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_newsletter_subscriber`
--

CREATE TABLE `jeu6_newsletter_subscriber` (
  `subscriber_id` int(10) UNSIGNED NOT NULL COMMENT 'Subscriber Id',
  `store_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) NOT NULL DEFAULT '' COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_newsletter_template`
--

CREATE TABLE `jeu6_newsletter_template` (
  `template_id` int(10) UNSIGNED NOT NULL COMMENT 'Template Id',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_text_preprocessed` text COMMENT 'Template Text Preprocessed',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) UNSIGNED DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) UNSIGNED DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';

--
-- Dumping data for table `jeu6_newsletter_template`
--

INSERT INTO `jeu6_newsletter_template` (`template_id`, `template_code`, `template_text`, `template_text_preprocessed`, `template_styles`, `template_type`, `template_subject`, `template_sender_name`, `template_sender_email`, `template_actual`, `added_at`, `modified_at`) VALUES
(1, 'Example Newsletter Template', '{{template config_path=\"design/email/header\"}}\n{{inlinecss file=\"email-inline.css\"}}\n\n<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n<tr>\n    <td class=\"full\">\n        <table class=\"columns\">\n            <tr>\n                <td class=\"email-heading\">\n                    <h1>Welcome</h1>\n                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,\n                    sed do eiusmod tempor incididunt ut labore et.</p>\n                </td>\n                <td class=\"store-info\">\n                    <h4>Contact Us</h4>\n                    <p>\n                        {{depend store_phone}}\n                        <b>Call Us:</b>\n                        <a href=\"tel:{{var phone}}\">{{var store_phone}}</a><br>\n                        {{/depend}}\n                        {{depend store_hours}}\n                        <span class=\"no-link\">{{var store_hours}}</span><br>\n                        {{/depend}}\n                        {{depend store_email}}\n                        <b>Email:</b> <a href=\"mailto:{{var store_email}}\">{{var store_email}}</a>\n                        {{/depend}}\n                    </p>\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>\n<tr>\n    <td class=\"full\">\n        <table class=\"columns\">\n            <tr>\n                <td>\n                    <img width=\"600\" src=\"http://placehold.it/600x200\" class=\"main-image\">\n                </td>\n                <td class=\"expander\"></td>\n            </tr>\n        </table>\n        <table class=\"columns\">\n            <tr>\n                <td class=\"panel\">\n                    <p>Phasellus dictum sapien a neque luctus cursus. Pellentesque sem dolor, fringilla et pharetra\n                    vitae. <a href=\"#\">Click it! &raquo;</a></p>\n                </td>\n                <td class=\"expander\"></td>\n            </tr>\n        </table>\n    </td>\n</tr>\n<tr>\n    <td>\n        <table class=\"row\">\n            <tr>\n                <td class=\"half left wrapper\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor\n                                incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit,\n                                sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.</p>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor\n                                incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed\n                                do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.</p>\n                                <table class=\"button\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Click Me!</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n                <td class=\"half right wrapper last\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td class=\"panel sidebar-links\">\n                                <h6>Header Thing</h6>\n                                <p>Sub-head or something</p>\n                                <table>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr><td>&nbsp;</td></tr>\n                                </table>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                    <br>\n                    <table class=\"columns\">\n                        <tr>\n                            <td class=\"panel\">\n                                <h6>Connect With Us:</h6>\n                                <table class=\"social-button facebook\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Facebook</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <hr>\n                                <table class=\"social-button twitter\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Twitter</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <hr>\n                                <table class=\"social-button google-plus\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Google +</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <br>\n                                <h6>Contact Info:</h6>\n                                {{depend store_phone}}\n                                <p>\n                                    <b>Call Us:</b>\n                                    <a href=\"tel:{{var phone}}\">{{var store_phone}}</a>\n                                </p>\n                                {{/depend}}\n                                {{depend store_hours}}\n                                <p><span class=\"no-link\">{{var store_hours}}</span><br></p>\n                                {{/depend}}\n                                {{depend store_email}}\n                                <p><b>Email:</b> <a href=\"mailto:{{var store_email}}\">{{var store_email}}</a></p>\n                                {{/depend}}\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n            </tr>\n        </table>\n        <table class=\"row\">\n            <tr>\n                <td class=\"full wrapper\">\n                    {{block type=\"catalog/product_new\" template=\"email/catalog/product/new.phtml\" products_count=\"4\"\n                    column_count=\"4\" }}\n                </td>\n            </tr>\n        </table>\n        <table class=\"row\">\n            <tr>\n                <td class=\"full wrapper last\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td align=\"center\">\n                                <center>\n                                    <p><a href=\"#\">Terms</a> | <a href=\"#\">Privacy</a> | <a href=\"#\">Unsubscribe</a></p>\n                                </center>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>\n</table>\n\n{{template config_path=\"design/email/footer\"}}', NULL, NULL, 2, 'Example Subject', 'Owner', 'owner@example.com', 1, '2018-10-27 12:04:16', '2018-10-27 12:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_oauth_consumer`
--

CREATE TABLE `jeu6_oauth_consumer` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` varchar(255) DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` varchar(255) NOT NULL COMMENT 'Rejected callback URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_oauth_nonce`
--

CREATE TABLE `jeu6_oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) UNSIGNED NOT NULL COMMENT 'Nonce Timestamp'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='jeu6_oauth_nonce';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_oauth_token`
--

CREATE TABLE `jeu6_oauth_token` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity ID',
  `consumer_id` int(10) UNSIGNED NOT NULL COMMENT 'Consumer ID',
  `admin_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` varchar(255) NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_paypal_cert`
--

CREATE TABLE `jeu6_paypal_cert` (
  `cert_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Cert Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_paypal_payment_transaction`
--

CREATE TABLE `jeu6_paypal_payment_transaction` (
  `transaction_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_paypal_settlement_report`
--

CREATE TABLE `jeu6_paypal_settlement_report` (
  `report_id` int(10) UNSIGNED NOT NULL COMMENT 'Report Id',
  `report_date` timestamp NULL DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_paypal_settlement_report_row`
--

CREATE TABLE `jeu6_paypal_settlement_report_row` (
  `row_id` int(10) UNSIGNED NOT NULL COMMENT 'Row Id',
  `report_id` int(10) UNSIGNED NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT '' COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_perfectus_mainslider`
--

CREATE TABLE `jeu6_perfectus_mainslider` (
  `pslide_id` int(11) UNSIGNED NOT NULL,
  `pslide_name` varchar(255) DEFAULT NULL,
  `pslide_image` varchar(255) DEFAULT NULL,
  `pslide_type` varchar(255) DEFAULT NULL,
  `pslide_cp` varchar(255) DEFAULT NULL,
  `pslide_cptop` int(11) DEFAULT NULL,
  `pslide_cpleft` int(11) DEFAULT NULL,
  `pslide_content` text,
  `pslide_link` text,
  `pslide_order` int(11) DEFAULT NULL,
  `pslide_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pslide_store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jeu6_perfectus_mainslider`
--

INSERT INTO `jeu6_perfectus_mainslider` (`pslide_id`, `pslide_name`, `pslide_image`, `pslide_type`, `pslide_cp`, `pslide_cptop`, `pslide_cpleft`, `pslide_content`, `pslide_link`, `pslide_order`, `pslide_status`, `created_at`, `updated_at`, `pslide_store_id`) VALUES
(1, 'Home1-Slide1', 'hm1-sld1.jpg', '2', 'cp-center', 0, 0, '<div class=\"caption vertical-center text-center con-s1\">\n	<h3 class=\"text-white\">new collection </h3>\n	<h2 class=\"animate text-white\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">exhale style</h2>\n	<p class=\"animate text-white\" data-animation=\"fadeInRight\">branded & accessories up to 40% off</p>\n	<a data-scroll class=\"btn button button2 get-start animated\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Start shoping now</a>\n</div>', '#', 1, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(2, 'Home1-Slide2', 'hm1-sld2.jpg', '2', 'cp-center', 0, 0, '<div class=\"caption vertical-center text-center con-s1\">\n	<h3 class=\"text-white\">new collection </h3>\n	<h2 class=\"animate text-white\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">exhale style</h2>\n	<p class=\"animate text-white\" data-animation=\"fadeInRight\">branded & accessories up to 40% off</p>\n	<a data-scroll class=\"btn button button2 get-start animated\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Start shoping now</a>\n</div>', '#', 2, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(3, 'Home2-Slide1', 'hm2-sld1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-right con-s2\">\n	<h3>new arrivals </h3>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">spring summer <span class=\"theme-color\">2018</span></h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\">It is a long established fact that a reader will be distracted by the<br> readable content of a page when looking at its layout</p>\n	<a data-scroll class=\"btn button get-start\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n	<a data-scroll class=\"btn button get-start\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Discover</a>\n</div>', '#', 1, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(4, 'Home2-Slide2', 'hm2-sld1_1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-right con-s2\">\n	<h3>new arrivals </h3>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">spring summer <span class=\"theme-color\">2018</span></h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\">It is a long established fact that a reader will be distracted by the<br> readable content of a page when looking at its layout</p>\n	<a data-scroll class=\"btn button get-start\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n	<a data-scroll class=\"btn button get-start\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Discover</a>\n</div>', '#', 2, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(5, 'Home3-Slide1', 'hm3-sld1.jpg', '2', 'cp-center', 0, 0, '<div class=\"caption vertical-center text-center con-s3\">\n	<h3>new arrivals </h3>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">Exhale style</h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\">huge sale up to 30% off</p>\n	<a data-scroll class=\"btn button button2 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n</div>', '#', 1, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(6, 'Home3-Slide2', 'hm3-sld1_1.jpg', '2', 'cp-center', 0, 0, '<div class=\"caption vertical-center text-center con-s3\">\n	<h3>new arrivals </h3>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">Exhale style</h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\">huge sale up to 30% off</p>\n	<a data-scroll class=\"btn button button2 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n</div>', '#', 2, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(7, 'Home4-Slide1', 'hm4-sld1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-right con-s4\">\n	<h3 class=\"theme-color\">2018</h3>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">have a nice sale</h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\">sunt In Anim Uis Aute Irure Dolor In Reprehenderit In Voluptate Velit<br> Esse Cillum Dolore Eu Fugiat Nulla Pariatur</p>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Discover</a>\n</div>', '#', 1, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(8, 'Home4-Slide2', 'hm4-sld1_1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-right con-s4\">\n	<h3 class=\"theme-color\">2018</h3>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">have a nice sale</h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\">sunt In Anim Uis Aute Irure Dolor In Reprehenderit In Voluptate Velit<br> Esse Cillum Dolore Eu Fugiat Nulla Pariatur</p>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Discover</a>\n</div>', '#', 2, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(9, 'Home5-Slide1', 'hm5-sld1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-center con-s5\">\n	<h3>Spring Collection 2016</h3>\n	<h4 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">Furniture</h4>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">SALE OFF TO <span class=\"theme-color\">70%</span></h2>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Browse our products</a>\n</div>', '#', 1, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(10, 'Home5-Slide2', 'hm5-sld1_1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-center con-s5\">\n	<h3>Spring Collection 2016</h3>\n	<h4 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">Furniture</h4>\n	<h2 class=\"animate\" data-animation=\"slideInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">SALE OFF TO <span class=\"theme-color\">70%</span></h2>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Browse our products</a>\n</div>', '#', 2, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(11, 'Home6-Slide1', 'hm6-sld1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-left con-s6\">\n	<h3>New</h3>\n	<h2 class=\"animate\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">collection</h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\" data-delay=\"0ms\" data-duration=\"1500ms\">There are many variations of passages of Lorem Ipsum available, but the<br>majority have suffered alteration</p>\n	<div class=\"header-price\"><span>Starting</span> <strong class=\"theme-color\">$150.00</strong></div>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Discover</a>\n</div>', '#', 1, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1),
(12, 'Home6-Slide2', 'hm6-sld1_1.jpg', '2', 'cp-right', 0, 0, '<div class=\"caption vertical-center text-left con-s6\">\n	<h3>New</h3>\n	<h2 class=\"animate\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\">collection</h2>\n	<p class=\"animate\" data-animation=\"fadeInRight\" data-delay=\"0ms\" data-duration=\"1500ms\">There are many variations of passages of Lorem Ipsum available, but the<br>majority have suffered alteration</p>\n	<div class=\"header-price\"><span>Starting</span> <strong class=\"theme-color\">$150.00</strong></div>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Shop now</a>\n	<a data-scroll class=\"btn button button3 btn-flat\" data-animation=\"fadeInUp\" data-delay=\"0ms\" data-duration=\"1500ms\" href=\"#\">Discover</a>\n</div>', '#', 2, 1, '2017-12-05 09:48:55', '2017-12-05 09:48:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_perfectus_mainslider_store`
--

CREATE TABLE `jeu6_perfectus_mainslider_store` (
  `pslide_id` int(11) NOT NULL,
  `pslide_store_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jeu6_perfectus_mainslider_store`
--

INSERT INTO `jeu6_perfectus_mainslider_store` (`pslide_id`, `pslide_store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_permission_block`
--

CREATE TABLE `jeu6_permission_block` (
  `block_id` int(10) UNSIGNED NOT NULL COMMENT 'Block ID',
  `block_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Block Name',
  `is_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Mark that block can be processed by filters'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='System blocks that can be processed via content filter';

--
-- Dumping data for table `jeu6_permission_block`
--

INSERT INTO `jeu6_permission_block` (`block_id`, `block_name`, `is_allowed`) VALUES
(1, 'core/template', 1),
(2, 'catalog/product_new', 1),
(3, 'fltproducts/newproductcattabs_list', 1),
(4, 'fltproducts/newproduct_home_list', 1),
(5, 'fltproducts/featured_home_list', 1),
(6, 'fltproducts/bestsellers_home_list', 1),
(7, 'fltproducts/specials_home_list', 1),
(8, 'fltproducts/allproducts_home_list', 1),
(9, 'fltproducts/mostviewed_home_list', 1),
(10, 'fltproducts/promotional_home_list', 1),
(11, 'fltproducts/lastordered_home_list', 1),
(12, 'newsletter/subscribe', 1),
(13, 'twitterfeeds/tweets', 1),
(14, 'cms/block', 1),
(15, 'productslider/productslider', 1),
(16, 'megamenu/sidebarnav', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_permission_variable`
--

CREATE TABLE `jeu6_permission_variable` (
  `variable_id` int(10) UNSIGNED NOT NULL COMMENT 'Variable ID',
  `variable_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Config Path',
  `is_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Mark that config can be processed by filters'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='System variables that can be processed via content filter';

--
-- Dumping data for table `jeu6_permission_variable`
--

INSERT INTO `jeu6_permission_variable` (`variable_id`, `variable_name`, `is_allowed`) VALUES
(1, 'trans_email/ident_support/name', 1),
(2, 'trans_email/ident_support/email', 1),
(3, 'web/unsecure/base_url', 1),
(4, 'web/secure/base_url', 1),
(5, 'trans_email/ident_general/name', 1),
(6, 'trans_email/ident_general/email', 1),
(7, 'trans_email/ident_sales/name', 1),
(8, 'trans_email/ident_sales/email', 1),
(9, 'trans_email/ident_custom1/name', 1),
(10, 'trans_email/ident_custom1/email', 1),
(11, 'trans_email/ident_custom2/name', 1),
(12, 'trans_email/ident_custom2/email', 1),
(13, 'general/store_information/name', 1),
(14, 'general/store_information/phone', 1),
(15, 'general/store_information/address', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_persistent_session`
--

CREATE TABLE `jeu6_persistent_session` (
  `persistent_id` int(10) UNSIGNED NOT NULL COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_poll`
--

CREATE TABLE `jeu6_poll` (
  `poll_id` int(10) UNSIGNED NOT NULL COMMENT 'Poll Id',
  `poll_title` varchar(255) DEFAULT NULL COMMENT 'Poll title',
  `votes_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id',
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date posted',
  `date_closed` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  `active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `closed` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is closed',
  `answers_display` smallint(6) DEFAULT NULL COMMENT 'Answers display'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll';

--
-- Dumping data for table `jeu6_poll`
--

INSERT INTO `jeu6_poll` (`poll_id`, `poll_title`, `votes_count`, `store_id`, `date_posted`, `date_closed`, `active`, `closed`, `answers_display`) VALUES
(1, 'What is your favorite color', 7, 0, '2011-08-18 18:28:31', NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_poll_answer`
--

CREATE TABLE `jeu6_poll_answer` (
  `answer_id` int(10) UNSIGNED NOT NULL COMMENT 'Answer Id',
  `poll_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `answer_title` varchar(255) DEFAULT NULL COMMENT 'Answer title',
  `votes_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `answer_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Answers display'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Answers';

--
-- Dumping data for table `jeu6_poll_answer`
--

INSERT INTO `jeu6_poll_answer` (`answer_id`, `poll_id`, `answer_title`, `votes_count`, `answer_order`) VALUES
(1, 1, 'Green', 4, 0),
(2, 1, 'Red', 1, 0),
(3, 1, 'Black', 0, 0),
(4, 1, 'Magenta', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_poll_store`
--

CREATE TABLE `jeu6_poll_store` (
  `poll_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Store';

--
-- Dumping data for table `jeu6_poll_store`
--

INSERT INTO `jeu6_poll_store` (`poll_id`, `store_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_poll_vote`
--

CREATE TABLE `jeu6_poll_vote` (
  `vote_id` int(10) UNSIGNED NOT NULL COMMENT 'Vote Id',
  `poll_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `poll_answer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Poll answer id',
  `ip_address` varbinary(16) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer id',
  `vote_time` timestamp NULL DEFAULT NULL COMMENT 'Date closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Vote';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_product_alert_price`
--

CREATE TABLE `jeu6_product_alert_price` (
  `alert_price_id` int(10) UNSIGNED NOT NULL COMMENT 'Product alert price id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_product_alert_stock`
--

CREATE TABLE `jeu6_product_alert_stock` (
  `alert_stock_id` int(10) UNSIGNED NOT NULL COMMENT 'Product alert stock id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product alert status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_rating`
--

CREATE TABLE `jeu6_rating` (
  `rating_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Rating Id',
  `entity_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Position On Frontend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ratings';

--
-- Dumping data for table `jeu6_rating`
--

INSERT INTO `jeu6_rating` (`rating_id`, `entity_id`, `rating_code`, `position`) VALUES
(1, 1, 'Quality', 0),
(2, 1, 'Value', 0),
(3, 1, 'Price', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_rating_entity`
--

CREATE TABLE `jeu6_rating_entity` (
  `entity_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating entities';

--
-- Dumping data for table `jeu6_rating_entity`
--

INSERT INTO `jeu6_rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_rating_option`
--

CREATE TABLE `jeu6_rating_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Rating Option Id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Ration option position on frontend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating options';

--
-- Dumping data for table `jeu6_rating_option`
--

INSERT INTO `jeu6_rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_rating_option_vote`
--

CREATE TABLE `jeu6_rating_option_vote` (
  `vote_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Vote id',
  `option_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(50) DEFAULT NULL,
  `remote_ip_long` varbinary(16) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_rating_option_vote_aggregated`
--

CREATE TABLE `jeu6_rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_rating_store`
--

CREATE TABLE `jeu6_rating_store` (
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_rating_title`
--

CREATE TABLE `jeu6_rating_title` (
  `rating_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_report_compared_product_index`
--

CREATE TABLE `jeu6_report_compared_product_index` (
  `index_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Index Id',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Added At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_report_event`
--

CREATE TABLE `jeu6_report_event` (
  `event_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';

--
-- Dumping data for table `jeu6_report_event`
--

INSERT INTO `jeu6_report_event` (`event_id`, `logged_at`, `event_type_id`, `object_id`, `subject_id`, `subtype`, `store_id`) VALUES
(1, '2018-10-27 22:38:26', 1, 7, 5, 1, 1),
(2, '2018-10-28 15:09:42', 1, 9, 22, 1, 1),
(3, '2018-10-28 15:09:51', 1, 8, 23, 1, 1),
(4, '2018-11-12 00:14:31', 1, 12, 33, 1, 1),
(5, '2018-11-12 00:19:54', 1, 12, 33, 1, 1),
(6, '2018-11-12 00:20:41', 4, 12, 33, 1, 1),
(7, '2018-11-12 00:21:36', 1, 12, 33, 1, 1),
(8, '2018-11-14 13:57:33', 1, 12, 34, 1, 1),
(9, '2018-11-14 14:22:37', 1, 12, 35, 1, 1),
(10, '2018-11-14 14:22:49', 1, 12, 35, 1, 1),
(11, '2018-11-14 14:23:14', 1, 12, 35, 1, 1),
(12, '2018-11-14 14:23:31', 1, 12, 35, 1, 1),
(13, '2018-11-14 14:25:09', 1, 12, 36, 1, 1),
(14, '2018-11-14 14:25:20', 1, 12, 36, 1, 1),
(15, '2018-11-14 14:40:54', 1, 12, 36, 1, 1),
(16, '2018-11-14 14:41:00', 1, 12, 36, 1, 1),
(17, '2018-11-14 16:08:52', 1, 12, 37, 1, 1),
(18, '2018-11-14 16:08:58', 1, 12, 37, 1, 1),
(19, '2018-11-14 16:09:57', 1, 12, 38, 1, 1),
(20, '2018-11-14 16:11:43', 1, 12, 39, 1, 1),
(21, '2018-11-14 18:34:44', 1, 12, 40, 1, 1),
(22, '2018-11-15 04:00:19', 1, 12, 41, 1, 1),
(23, '2018-11-15 04:01:43', 1, 12, 42, 1, 1),
(24, '2018-11-15 04:02:02', 1, 12, 42, 1, 1),
(25, '2018-11-15 04:03:47', 1, 12, 42, 1, 1),
(26, '2018-11-15 04:05:37', 1, 12, 42, 1, 1),
(27, '2018-11-15 04:06:31', 1, 12, 42, 1, 1),
(28, '2018-11-15 04:07:51', 1, 12, 42, 1, 1),
(29, '2018-11-15 04:10:03', 1, 12, 42, 1, 1),
(30, '2018-11-15 04:10:32', 1, 12, 42, 1, 1),
(31, '2018-11-15 04:12:02', 1, 12, 42, 1, 1),
(32, '2018-11-15 04:14:33', 1, 12, 42, 1, 1),
(33, '2018-11-15 04:14:47', 4, 12, 42, 1, 1),
(34, '2018-11-15 04:14:54', 1, 12, 42, 1, 1),
(35, '2018-11-15 04:15:14', 1, 12, 42, 1, 1),
(36, '2018-11-15 04:16:27', 1, 12, 42, 1, 1),
(37, '2018-11-15 04:16:53', 1, 12, 42, 1, 1),
(38, '2018-11-15 04:17:18', 1, 12, 42, 1, 1),
(39, '2018-11-15 04:18:10', 1, 12, 42, 1, 1),
(40, '2018-11-15 04:18:38', 1, 12, 42, 1, 1),
(41, '2018-11-15 04:20:40', 1, 12, 42, 1, 1),
(42, '2018-11-15 04:26:20', 1, 12, 42, 1, 1),
(43, '2018-11-15 04:26:59', 1, 12, 42, 1, 1),
(44, '2018-11-15 04:27:15', 1, 12, 42, 1, 1),
(45, '2018-11-15 04:27:52', 1, 12, 42, 1, 1),
(46, '2018-11-15 04:28:14', 1, 12, 42, 1, 1),
(47, '2018-11-15 04:29:10', 1, 12, 42, 1, 1),
(48, '2018-11-15 04:29:26', 4, 12, 42, 1, 1),
(49, '2018-11-15 04:30:31', 1, 12, 42, 1, 1),
(50, '2018-11-15 04:37:18', 1, 12, 42, 1, 1),
(51, '2018-11-15 05:16:45', 1, 12, 43, 1, 1),
(52, '2018-11-15 10:53:37', 1, 12, 44, 1, 1),
(53, '2018-11-15 10:53:52', 4, 12, 44, 1, 1),
(54, '2018-11-15 11:36:11', 1, 12, 44, 1, 1),
(55, '2018-11-16 13:32:32', 1, 12, 45, 1, 1),
(56, '2018-11-16 13:32:46', 4, 12, 45, 1, 1),
(57, '2018-11-16 13:37:10', 1, 12, 45, 1, 1),
(58, '2018-11-16 13:39:07', 1, 12, 45, 1, 1),
(59, '2018-11-25 15:20:16', 1, 12, 66, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_report_event_types`
--

CREATE TABLE `jeu6_report_event_types` (
  `event_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';

--
-- Dumping data for table `jeu6_report_event_types`
--

INSERT INTO `jeu6_report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 0),
(2, 'sendfriend_product', 0),
(3, 'catalog_product_compare_add_product', 0),
(4, 'checkout_cart_add_product', 0),
(5, 'wishlist_add_product', 0),
(6, 'wishlist_share', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_report_viewed_product_aggregated_daily`
--

CREATE TABLE `jeu6_report_viewed_product_aggregated_daily` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_report_viewed_product_aggregated_monthly`
--

CREATE TABLE `jeu6_report_viewed_product_aggregated_monthly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_report_viewed_product_aggregated_yearly`
--

CREATE TABLE `jeu6_report_viewed_product_aggregated_yearly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_report_viewed_product_index`
--

CREATE TABLE `jeu6_report_viewed_product_index` (
  `index_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Index Id',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Added At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';

--
-- Dumping data for table `jeu6_report_viewed_product_index`
--

INSERT INTO `jeu6_report_viewed_product_index` (`index_id`, `visitor_id`, `customer_id`, `product_id`, `store_id`, `added_at`) VALUES
(2, 22, NULL, 9, 1, '2018-10-28 15:09:42'),
(3, 23, NULL, 8, 1, '2018-10-28 15:09:51'),
(4, 33, NULL, 12, 1, '2018-11-12 00:21:36'),
(7, 34, NULL, 12, 1, '2018-11-14 13:57:33'),
(8, 35, NULL, 12, 1, '2018-11-14 14:23:31'),
(12, 36, NULL, 12, 1, '2018-11-14 14:41:00'),
(16, 37, NULL, 12, 1, '2018-11-14 16:08:58'),
(18, 38, NULL, 12, 1, '2018-11-14 16:09:57'),
(19, 39, NULL, 12, 1, '2018-11-14 16:11:43'),
(20, 40, NULL, 12, 1, '2018-11-14 18:34:43'),
(21, 41, NULL, 12, 1, '2018-11-15 04:00:19'),
(22, 42, NULL, 12, 1, '2018-11-15 04:37:18'),
(48, 43, NULL, 12, 1, '2018-11-15 05:16:44'),
(49, 44, NULL, 12, 1, '2018-11-15 11:36:11'),
(51, 45, NULL, 12, 1, '2018-11-16 13:39:07'),
(54, 66, NULL, 12, 1, '2018-11-25 15:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_review`
--

CREATE TABLE `jeu6_review` (
  `review_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_review_detail`
--

CREATE TABLE `jeu6_review_detail` (
  `detail_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Review detail id',
  `review_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_review_entity`
--

CREATE TABLE `jeu6_review_entity` (
  `entity_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review entities';

--
-- Dumping data for table `jeu6_review_entity`
--

INSERT INTO `jeu6_review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_review_entity_summary`
--

CREATE TABLE `jeu6_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_review_status`
--

CREATE TABLE `jeu6_review_status` (
  `status_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review statuses';

--
-- Dumping data for table `jeu6_review_status`
--

INSERT INTO `jeu6_review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_review_store`
--

CREATE TABLE `jeu6_review_store` (
  `review_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule`
--

CREATE TABLE `jeu6_salesrule` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) UNSIGNED NOT NULL COMMENT 'Discount Step',
  `simple_free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  `apply_to_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Coupon'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule_coupon`
--

CREATE TABLE `jeu6_salesrule_coupon` (
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT 'Coupon Id',
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) UNSIGNED DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) UNSIGNED DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule_coupon_usage`
--

CREATE TABLE `jeu6_salesrule_coupon_usage` (
  `coupon_id` int(10) UNSIGNED NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule_customer`
--

CREATE TABLE `jeu6_salesrule_customer` (
  `rule_customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Customer Id',
  `rule_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Times Used'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule_customer_group`
--

CREATE TABLE `jeu6_salesrule_customer_group` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule_label`
--

CREATE TABLE `jeu6_salesrule_label` (
  `label_id` int(10) UNSIGNED NOT NULL COMMENT 'Label Id',
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule_product_attribute`
--

CREATE TABLE `jeu6_salesrule_product_attribute` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_salesrule_website`
--

CREATE TABLE `jeu6_salesrule_website` (
  `rule_id` int(10) UNSIGNED NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Website Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_bestsellers_aggregated_daily`
--

CREATE TABLE `jeu6_sales_bestsellers_aggregated_daily` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_bestsellers_aggregated_monthly`
--

CREATE TABLE `jeu6_sales_bestsellers_aggregated_monthly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_bestsellers_aggregated_yearly`
--

CREATE TABLE `jeu6_sales_bestsellers_aggregated_yearly` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rating Pos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_billing_agreement`
--

CREATE TABLE `jeu6_sales_billing_agreement` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `customer_id` int(10) UNSIGNED NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_billing_agreement_order`
--

CREATE TABLE `jeu6_sales_billing_agreement_order` (
  `agreement_id` int(10) UNSIGNED NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_creditmemo`
--

CREATE TABLE `jeu6_sales_flat_creditmemo` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_creditmemo_comment`
--

CREATE TABLE `jeu6_sales_flat_creditmemo_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_creditmemo_grid`
--

CREATE TABLE `jeu6_sales_flat_creditmemo_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_creditmemo_item`
--

CREATE TABLE `jeu6_sales_flat_creditmemo_item` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_invoice`
--

CREATE TABLE `jeu6_sales_flat_invoice` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `can_void_flag` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_invoice_comment`
--

CREATE TABLE `jeu6_sales_flat_invoice_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_invoice_grid`
--

CREATE TABLE `jeu6_sales_flat_invoice_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_invoice_item`
--

CREATE TABLE `jeu6_sales_flat_invoice_item` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_order`
--

CREATE TABLE `jeu6_sales_flat_order` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `forced_shipment_with_invoice` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(255) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(255) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(255) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(255) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(255) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(255) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `total_item_count` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_order_address`
--

CREATE TABLE `jeu6_sales_flat_order_address` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_order_grid`
--

CREATE TABLE `jeu6_sales_flat_order_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_order_item`
--

CREATE TABLE `jeu6_sales_flat_order_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `is_nominal` int(11) NOT NULL DEFAULT '0' COMMENT 'Is Nominal',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_order_payment`
--

CREATE TABLE `jeu6_sales_flat_order_payment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(255) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(255) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(255) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_status_description` varchar(255) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(255) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(255) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(255) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(255) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(255) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(255) DEFAULT NULL COMMENT 'Cc Trans Id',
  `paybox_request_number` varchar(255) DEFAULT NULL COMMENT 'Paybox Request Number',
  `address_status` varchar(255) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_order_status_history`
--

CREATE TABLE `jeu6_sales_flat_order_status_history` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_quote`
--

CREATE TABLE `jeu6_sales_flat_quote` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) UNSIGNED DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) UNSIGNED DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) UNSIGNED DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) UNSIGNED DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) UNSIGNED DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Is Quote Persistent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';

--
-- Dumping data for table `jeu6_sales_flat_quote`
--

INSERT INTO `jeu6_sales_flat_quote` (`entity_id`, `store_id`, `created_at`, `updated_at`, `converted_at`, `is_active`, `is_virtual`, `is_multi_shipping`, `items_count`, `items_qty`, `orig_order_id`, `store_to_base_rate`, `store_to_quote_rate`, `base_currency_code`, `store_currency_code`, `quote_currency_code`, `grand_total`, `base_grand_total`, `checkout_method`, `customer_id`, `customer_tax_class_id`, `customer_group_id`, `customer_email`, `customer_prefix`, `customer_firstname`, `customer_middlename`, `customer_lastname`, `customer_suffix`, `customer_dob`, `customer_note`, `customer_note_notify`, `customer_is_guest`, `remote_ip`, `applied_rule_ids`, `reserved_order_id`, `password_hash`, `coupon_code`, `global_currency_code`, `base_to_global_rate`, `base_to_quote_rate`, `customer_taxvat`, `customer_gender`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `is_changed`, `trigger_recollect`, `ext_shipping_info`, `gift_message_id`, `is_persistent`) VALUES
(1, 1, '2018-11-12 00:20:40', '2018-11-12 00:20:52', NULL, 1, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'USD', 'USD', 'USD', '0.0000', '0.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '92.239.7.112', NULL, NULL, NULL, NULL, 'USD', '1.0000', '1.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0, NULL, NULL, 0),
(2, 1, '2018-11-15 04:14:47', '2018-11-15 04:37:26', NULL, 1, 0, 0, 2, '5.0000', 0, '1.0000', '1.0000', 'USD', 'USD', 'USD', '5000.0000', '5000.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '103.240.169.156', NULL, NULL, NULL, NULL, 'USD', '1.0000', '1.0000', NULL, NULL, '5000.0000', '5000.0000', '5000.0000', '5000.0000', 1, 0, NULL, NULL, 0),
(3, 1, '2018-11-15 10:53:51', '2018-11-15 11:09:22', NULL, 1, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'USD', 'USD', 'USD', '0.0000', '0.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '92.239.7.112', NULL, NULL, NULL, NULL, 'USD', '1.0000', '1.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0, NULL, NULL, 0),
(4, 1, '2018-11-16 13:32:46', '2018-11-16 13:48:33', NULL, 1, 0, 0, 0, '0.0000', 0, '1.0000', '1.0000', 'PKR', 'PKR', 'PKR', '0.0000', '0.0000', 'guest', NULL, 3, 0, 'sswarsi@hotmail.com', NULL, 's', NULL, 'w', NULL, NULL, NULL, 1, 0, '92.239.7.112', NULL, NULL, NULL, NULL, 'PKR', '1.0000', '1.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 1, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_quote_address`
--

CREATE TABLE `jeu6_sales_flat_quote_address` (
  `address_id` int(10) UNSIGNED NOT NULL COMMENT 'Address Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(40) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(255) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `collect_shipping_rates` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';

--
-- Dumping data for table `jeu6_sales_flat_quote_address`
--

INSERT INTO `jeu6_sales_flat_quote_address` (`address_id`, `quote_id`, `created_at`, `updated_at`, `customer_id`, `save_in_address_book`, `customer_address_id`, `address_type`, `email`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `company`, `street`, `city`, `region`, `region_id`, `postcode`, `country_id`, `telephone`, `fax`, `same_as_billing`, `free_shipping`, `collect_shipping_rates`, `shipping_method`, `shipping_description`, `weight`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `tax_amount`, `base_tax_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `discount_amount`, `base_discount_amount`, `grand_total`, `base_grand_total`, `customer_notes`, `applied_taxes`, `discount_description`, `shipping_discount_amount`, `base_shipping_discount_amount`, `subtotal_incl_tax`, `base_subtotal_total_incl_tax`, `hidden_tax_amount`, `base_hidden_tax_amount`, `shipping_hidden_tax_amount`, `base_shipping_hidden_tax_amnt`, `shipping_incl_tax`, `base_shipping_incl_tax`, `gift_message_id`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`) VALUES
(1, 1, '2018-11-12 01:20:42', '2018-11-12 00:20:52', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '2018-11-12 01:20:42', '2018-11-12 00:20:52', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, '2018-11-15 05:14:48', '2018-11-15 04:37:26', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, '2018-11-15 05:14:48', '2018-11-15 04:37:26', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, '0.0000', '5000.0000', '5000.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '5000.0000', '5000.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '5000.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, '2018-11-15 10:53:52', '2018-11-15 11:09:22', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 3, '2018-11-15 10:53:52', '2018-11-15 11:09:22', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 4, '2018-11-16 14:40:25', '2018-11-16 13:48:34', NULL, 1, NULL, 'billing', 'sswarsi@hotmail.com', NULL, 's', NULL, 'w', NULL, NULL, 'kbkkbk', 'ibbibikkkn', 'hvuuvu', NULL, '677', 'PK', '6666', NULL, 0, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 4, '2018-11-16 14:40:25', '2018-11-16 13:48:34', NULL, 0, NULL, 'shipping', 'sswarsi@hotmail.com', NULL, 's', NULL, 'w', NULL, NULL, 'kbkkbk', 'ibbibikkkn', 'hvuuvu', NULL, '677', 'PK', '6666', NULL, 1, 0, 1, 'flatrate_flatrate', 'Flat Rate - Fixed', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_quote_address_item`
--

CREATE TABLE `jeu6_sales_flat_quote_address_item` (
  `address_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Address Item Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `free_shipping` int(10) UNSIGNED DEFAULT NULL COMMENT 'Free Shipping',
  `is_qty_decimal` int(10) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) UNSIGNED DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_quote_item`
--

CREATE TABLE `jeu6_sales_flat_quote_item` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';

--
-- Dumping data for table `jeu6_sales_flat_quote_item`
--

INSERT INTO `jeu6_sales_flat_quote_item` (`item_id`, `quote_id`, `created_at`, `updated_at`, `product_id`, `store_id`, `parent_item_id`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `free_shipping`, `is_qty_decimal`, `no_discount`, `weight`, `qty`, `price`, `base_price`, `custom_price`, `discount_percent`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `row_total`, `base_row_total`, `row_total_with_discount`, `row_weight`, `product_type`, `base_tax_before_discount`, `tax_before_discount`, `original_custom_price`, `redirect_url`, `base_cost`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `hidden_tax_amount`, `base_hidden_tax_amount`, `gift_message_id`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`, `weee_tax_applied`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`) VALUES
(3, 2, '2018-11-15 04:14:47', '2018-11-15 04:37:26', 12, 1, NULL, 0, 'PRE0000012', 'color switcher', NULL, NULL, NULL, 0, 0, 0, '0.0000', '3.0000', '1000.0000', '1000.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '3000.0000', '3000.0000', '0.0000', '0.0000', 'configurable', NULL, NULL, NULL, NULL, NULL, '1000.0000', '1000.0000', '3000.0000', '3000.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL),
(4, 2, '2018-11-15 04:14:47', '2018-11-15 04:14:48', 11, 1, 3, 0, 'PRE0000012', 'color switcher-green', NULL, NULL, NULL, 0, 0, 0, '0.0000', '1.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL),
(5, 2, '2018-11-15 04:29:26', '2018-11-15 04:30:42', 12, 1, NULL, 0, 'PRE0000010', 'color switcher', NULL, NULL, NULL, 0, 0, 0, '0.0000', '2.0000', '1000.0000', '1000.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2000.0000', '2000.0000', '0.0000', '0.0000', 'configurable', NULL, NULL, NULL, NULL, NULL, '1000.0000', '1000.0000', '2000.0000', '2000.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL),
(6, 2, '2018-11-15 04:29:26', '2018-11-15 04:30:42', 10, 1, 5, 0, 'PRE0000010', 'color switcher-red', NULL, NULL, NULL, 0, 0, 0, '0.0000', '1.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'a:0:{}', '0.0000', '0.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_quote_item_option`
--

CREATE TABLE `jeu6_sales_flat_quote_item_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';

--
-- Dumping data for table `jeu6_sales_flat_quote_item_option`
--

INSERT INTO `jeu6_sales_flat_quote_item_option` (`option_id`, `item_id`, `product_id`, `code`, `value`) VALUES
(7, 3, 12, 'info_buyRequest', 'a:7:{s:4:\"uenc\";s:92:\"aHR0cDovL2RldnBsdWdpbi5hYW1pcnNhbG1hbi5jb20vYWpheHBrdC9pbmRleC9vcHRpb25zL3Byb2R1Y3RfaWQvMTIv\";s:7:\"product\";s:2:\"12\";s:8:\"form_key\";s:16:\"76xcVgJDImqKnTtu\";s:15:\"related_product\";s:0:\"\";s:15:\"super_attribute\";a:2:{i:83;s:1:\"5\";i:137;s:2:\"11\";}s:3:\"qty\";s:1:\"1\";s:6:\"isAjax\";s:1:\"1\";}'),
(8, 3, 12, 'attributes', 'a:2:{i:83;s:1:\"5\";i:137;s:2:\"11\";}'),
(9, 3, 11, 'product_qty_11', '1'),
(10, 3, 11, 'simple_product', '11'),
(11, 4, 11, 'info_buyRequest', 'a:6:{s:4:\"uenc\";s:76:\"aHR0cDovL2RldnBsdWdpbi5hYW1pcnNhbG1hbi5jb20vaG9tZS9jb2xvci1zd2l0Y2hlci5odG1s\";s:7:\"product\";s:2:\"12\";s:8:\"form_key\";s:16:\"76xcVgJDImqKnTtu\";s:15:\"related_product\";s:0:\"\";s:15:\"super_attribute\";a:2:{i:83;s:1:\"5\";i:137;s:2:\"11\";}s:3:\"qty\";s:1:\"1\";}'),
(12, 4, 11, 'parent_product_id', '12'),
(13, 5, 12, 'info_buyRequest', 'a:7:{s:4:\"uenc\";s:72:\"aHR0cDovL2RldnBsdWdpbi5hYW1pcnNhbG1hbi5jb20vY29sb3Itc3dpdGNoZXIuaHRtbA,,\";s:7:\"product\";s:2:\"12\";s:8:\"form_key\";s:16:\"76xcVgJDImqKnTtu\";s:15:\"related_product\";s:0:\"\";s:15:\"super_attribute\";a:2:{i:83;s:1:\"4\";i:137;s:2:\"11\";}s:3:\"qty\";s:1:\"1\";s:6:\"isAjax\";s:1:\"1\";}'),
(14, 5, 12, 'attributes', 'a:2:{i:83;s:1:\"4\";i:137;s:2:\"11\";}'),
(15, 5, 10, 'product_qty_10', '1'),
(16, 5, 10, 'simple_product', '10'),
(17, 6, 10, 'info_buyRequest', 'a:7:{s:4:\"uenc\";s:72:\"aHR0cDovL2RldnBsdWdpbi5hYW1pcnNhbG1hbi5jb20vY29sb3Itc3dpdGNoZXIuaHRtbA,,\";s:7:\"product\";s:2:\"12\";s:8:\"form_key\";s:16:\"76xcVgJDImqKnTtu\";s:15:\"related_product\";s:0:\"\";s:15:\"super_attribute\";a:2:{i:83;s:1:\"4\";i:137;s:2:\"11\";}s:3:\"qty\";s:1:\"1\";s:6:\"isAjax\";s:1:\"1\";}'),
(18, 6, 10, 'parent_product_id', '12');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_quote_payment`
--

CREATE TABLE `jeu6_sales_flat_quote_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL COMMENT 'Payment Id',
  `quote_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';

--
-- Dumping data for table `jeu6_sales_flat_quote_payment`
--

INSERT INTO `jeu6_sales_flat_quote_payment` (`payment_id`, `quote_id`, `created_at`, `updated_at`, `method`, `cc_type`, `cc_number_enc`, `cc_last4`, `cc_cid_enc`, `cc_owner`, `cc_exp_month`, `cc_exp_year`, `cc_ss_owner`, `cc_ss_start_month`, `cc_ss_start_year`, `po_number`, `additional_data`, `cc_ss_issue`, `additional_information`, `paypal_payer_id`, `paypal_payer_status`, `paypal_correlation_id`) VALUES
(2, 4, '2018-11-16 13:40:46', '2018-11-16 13:45:52', 'cashondelivery', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_quote_shipping_rate`
--

CREATE TABLE `jeu6_sales_flat_quote_shipping_rate` (
  `rate_id` int(10) UNSIGNED NOT NULL COMMENT 'Rate Id',
  `address_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';

--
-- Dumping data for table `jeu6_sales_flat_quote_shipping_rate`
--

INSERT INTO `jeu6_sales_flat_quote_shipping_rate` (`rate_id`, `address_id`, `created_at`, `updated_at`, `carrier`, `carrier_title`, `code`, `method`, `method_description`, `price`, `error_message`, `method_title`) VALUES
(3, 8, '2018-11-16 13:45:52', '2018-11-16 13:45:52', 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'flatrate', NULL, '5.0000', NULL, 'Fixed');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_shipment`
--

CREATE TABLE `jeu6_sales_flat_shipment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Email Sent',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_shipment_comment`
--

CREATE TABLE `jeu6_sales_flat_shipment_comment` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_shipment_grid`
--

CREATE TABLE `jeu6_sales_flat_shipment_grid` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_shipment_item`
--

CREATE TABLE `jeu6_sales_flat_shipment_item` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_flat_shipment_track`
--

CREATE TABLE `jeu6_sales_flat_shipment_track` (
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'Entity Id',
  `parent_id` int(10) UNSIGNED NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_invoiced_aggregated`
--

CREATE TABLE `jeu6_sales_invoiced_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_invoiced_aggregated_order`
--

CREATE TABLE `jeu6_sales_invoiced_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_order_aggregated_created`
--

CREATE TABLE `jeu6_sales_order_aggregated_created` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_order_aggregated_updated`
--

CREATE TABLE `jeu6_sales_order_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Jeu6 Sales Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_order_status`
--

CREATE TABLE `jeu6_sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `jeu6_sales_order_status`
--

INSERT INTO `jeu6_sales_order_status` (`status`, `label`) VALUES
('canceled', 'Canceled'),
('closed', 'Closed'),
('complete', 'Complete'),
('fraud', 'Suspected Fraud'),
('holded', 'On Hold'),
('payment_review', 'Payment Review'),
('paypal_canceled_reversal', 'PayPal Canceled Reversal'),
('paypal_reversed', 'PayPal Reversed'),
('pending', 'Pending'),
('pending_payment', 'Pending Payment'),
('pending_paypal', 'Pending PayPal'),
('processing', 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_order_status_label`
--

CREATE TABLE `jeu6_sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_order_status_state`
--

CREATE TABLE `jeu6_sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Is Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `jeu6_sales_order_status_state`
--

INSERT INTO `jeu6_sales_order_status_state` (`status`, `state`, `is_default`) VALUES
('canceled', 'canceled', 1),
('closed', 'closed', 1),
('complete', 'complete', 1),
('fraud', 'payment_review', 0),
('holded', 'holded', 1),
('payment_review', 'payment_review', 1),
('pending', 'new', 1),
('pending_payment', 'pending_payment', 1),
('processing', 'processing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_order_tax`
--

CREATE TABLE `jeu6_sales_order_tax` (
  `tax_id` int(10) UNSIGNED NOT NULL COMMENT 'Tax Id',
  `order_id` int(10) UNSIGNED NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  `hidden` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_order_tax_item`
--

CREATE TABLE `jeu6_sales_order_tax_item` (
  `tax_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Tax Item Id',
  `tax_id` int(10) UNSIGNED NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_payment_transaction`
--

CREATE TABLE `jeu6_sales_payment_transaction` (
  `transaction_id` int(10) UNSIGNED NOT NULL COMMENT 'Transaction Id',
  `parent_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_recurring_profile`
--

CREATE TABLE `jeu6_sales_recurring_profile` (
  `profile_id` int(10) UNSIGNED NOT NULL COMMENT 'Profile Id',
  `state` varchar(20) NOT NULL COMMENT 'State',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `reference_id` varchar(32) DEFAULT NULL COMMENT 'Reference Id',
  `subscriber_name` varchar(150) DEFAULT NULL COMMENT 'Subscriber Name',
  `start_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Start Datetime',
  `internal_reference_id` varchar(42) NOT NULL COMMENT 'Internal Reference Id',
  `schedule_description` varchar(255) NOT NULL COMMENT 'Schedule Description',
  `suspension_threshold` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Suspension Threshold',
  `bill_failed_later` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Bill Failed Later',
  `period_unit` varchar(20) NOT NULL COMMENT 'Period Unit',
  `period_frequency` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Period Frequency',
  `period_max_cycles` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Period Max Cycles',
  `billing_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Billing Amount',
  `trial_period_unit` varchar(20) DEFAULT NULL COMMENT 'Trial Period Unit',
  `trial_period_frequency` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Trial Period Frequency',
  `trial_period_max_cycles` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Trial Period Max Cycles',
  `trial_billing_amount` text COMMENT 'Trial Billing Amount',
  `currency_code` varchar(3) NOT NULL COMMENT 'Currency Code',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `init_amount` decimal(12,4) DEFAULT NULL COMMENT 'Init Amount',
  `init_may_fail` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Init May Fail',
  `order_info` text NOT NULL COMMENT 'Order Info',
  `order_item_info` text NOT NULL COMMENT 'Order Item Info',
  `billing_address_info` text NOT NULL COMMENT 'Billing Address Info',
  `shipping_address_info` text COMMENT 'Shipping Address Info',
  `profile_vendor_info` text COMMENT 'Profile Vendor Info',
  `additional_info` text COMMENT 'Additional Info'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_recurring_profile_order`
--

CREATE TABLE `jeu6_sales_recurring_profile_order` (
  `link_id` int(10) UNSIGNED NOT NULL COMMENT 'Link Id',
  `profile_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `order_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Order Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile Order';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_refunded_aggregated`
--

CREATE TABLE `jeu6_sales_refunded_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_refunded_aggregated_order`
--

CREATE TABLE `jeu6_sales_refunded_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_shipping_aggregated`
--

CREATE TABLE `jeu6_sales_shipping_aggregated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sales_shipping_aggregated_order`
--

CREATE TABLE `jeu6_sales_shipping_aggregated_order` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sendfriend_log`
--

CREATE TABLE `jeu6_sendfriend_log` (
  `log_id` int(10) UNSIGNED NOT NULL COMMENT 'Log ID',
  `ip` varbinary(16) DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_shipping_tablerate`
--

CREATE TABLE `jeu6_shipping_tablerate` (
  `pk` int(10) UNSIGNED NOT NULL COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_sitemap`
--

CREATE TABLE `jeu6_sitemap` (
  `sitemap_id` int(10) UNSIGNED NOT NULL COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Sitemap';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_skuautogenerate`
--

CREATE TABLE `jeu6_skuautogenerate` (
  `skuautogenerate_id` int(11) UNSIGNED NOT NULL,
  `appendstring` varchar(5) NOT NULL DEFAULT '',
  `prependstring` varchar(5) NOT NULL DEFAULT '',
  `stringfunction` varchar(50) NOT NULL DEFAULT '',
  `min_length` varchar(5) NOT NULL DEFAULT '',
  `product_type` varchar(50) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jeu6_skuautogenerate`
--

INSERT INTO `jeu6_skuautogenerate` (`skuautogenerate_id`, `appendstring`, `prependstring`, `stringfunction`, `min_length`, `product_type`, `status`, `created_time`, `update_time`) VALUES
(1, '', 'PRE', 'prepend', '10', 'unique', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tag`
--

CREATE TABLE `jeu6_tag` (
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'Tag Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `first_customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'First Customer Id',
  `first_store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'First Store Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tag_properties`
--

CREATE TABLE `jeu6_tag_properties` (
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `base_popularity` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Base Popularity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Properties';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tag_relation`
--

CREATE TABLE `jeu6_tag_relation` (
  `tag_relation_id` int(10) UNSIGNED NOT NULL COMMENT 'Tag Relation Id',
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Store Id',
  `active` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Active',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Relation';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tag_summary`
--

CREATE TABLE `jeu6_tag_summary` (
  `tag_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `customers` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customers',
  `products` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Products',
  `uses` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Uses',
  `historical_uses` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Historical Uses',
  `popularity` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `base_popularity` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Base Popularity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Summary';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tax_calculation`
--

CREATE TABLE `jeu6_tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';

--
-- Dumping data for table `jeu6_tax_calculation`
--

INSERT INTO `jeu6_tax_calculation` (`tax_calculation_id`, `tax_calculation_rate_id`, `tax_calculation_rule_id`, `customer_tax_class_id`, `product_tax_class_id`) VALUES
(1, 1, 1, 3, 2),
(2, 2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tax_calculation_rate`
--

CREATE TABLE `jeu6_tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) UNSIGNED DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) UNSIGNED DEFAULT NULL COMMENT 'Zip To'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';

--
-- Dumping data for table `jeu6_tax_calculation_rate`
--

INSERT INTO `jeu6_tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', '8.2500', NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', '8.3750', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tax_calculation_rate_title`
--

CREATE TABLE `jeu6_tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tax_calculation_rule`
--

CREATE TABLE `jeu6_tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';

--
-- Dumping data for table `jeu6_tax_calculation_rule`
--

INSERT INTO `jeu6_tax_calculation_rule` (`tax_calculation_rule_id`, `code`, `priority`, `position`, `calculate_subtotal`) VALUES
(1, 'Retail Customer-Taxable Goods-Rate 1', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tax_class`
--

CREATE TABLE `jeu6_tax_class` (
  `class_id` smallint(6) NOT NULL COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Class';

--
-- Dumping data for table `jeu6_tax_class`
--

INSERT INTO `jeu6_tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER'),
(4, 'Shipping', 'PRODUCT');

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tax_order_aggregated_created`
--

CREATE TABLE `jeu6_tax_order_aggregated_created` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_tax_order_aggregated_updated`
--

CREATE TABLE `jeu6_tax_order_aggregated_updated` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Jeu6 Tax Order Aggregated Updated';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_weee_discount`
--

CREATE TABLE `jeu6_weee_discount` (
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `customer_group_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Customer Group Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Discount';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_weee_tax`
--

CREATE TABLE `jeu6_weee_tax` (
  `value_id` int(11) NOT NULL COMMENT 'Value Id',
  `website_id` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` varchar(255) NOT NULL DEFAULT '*' COMMENT 'State',
  `attribute_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Entity Type Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_widget`
--

CREATE TABLE `jeu6_widget` (
  `widget_id` int(10) UNSIGNED NOT NULL COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_widget_instance`
--

CREATE TABLE `jeu6_widget_instance` (
  `instance_id` int(10) UNSIGNED NOT NULL COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `package_theme` varchar(255) DEFAULT NULL COMMENT 'Package Theme',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sort order'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_widget_instance_page`
--

CREATE TABLE `jeu6_widget_instance_page` (
  `page_id` int(10) UNSIGNED NOT NULL COMMENT 'Page Id',
  `instance_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Block Reference',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_widget_instance_page_layout`
--

CREATE TABLE `jeu6_widget_instance_page_layout` (
  `page_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Layout Update Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_wishlist`
--

CREATE TABLE `jeu6_wishlist` (
  `wishlist_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist ID',
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_wishlist_item`
--

CREATE TABLE `jeu6_wishlist_item` (
  `wishlist_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_wishlist_item_option`
--

CREATE TABLE `jeu6_wishlist_item_option` (
  `option_id` int(10) UNSIGNED NOT NULL COMMENT 'Option Id',
  `wishlist_item_id` int(10) UNSIGNED NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_xmlconnect_application`
--

CREATE TABLE `jeu6_xmlconnect_application` (
  `application_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Application Id',
  `name` varchar(255) NOT NULL COMMENT 'Application Name',
  `code` varchar(32) NOT NULL COMMENT 'Application Code',
  `type` varchar(32) NOT NULL COMMENT 'Device Type',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `active_from` date DEFAULT NULL COMMENT 'Active From',
  `active_to` date DEFAULT NULL COMMENT 'Active To',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status',
  `browsing_mode` smallint(5) UNSIGNED DEFAULT '0' COMMENT 'Browsing Mode'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Application';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_xmlconnect_config_data`
--

CREATE TABLE `jeu6_xmlconnect_config_data` (
  `application_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Application Id',
  `category` varchar(60) NOT NULL DEFAULT 'default' COMMENT 'Category',
  `path` varchar(250) NOT NULL COMMENT 'Path',
  `value` text NOT NULL COMMENT 'Value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Configuration Data';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_xmlconnect_history`
--

CREATE TABLE `jeu6_xmlconnect_history` (
  `history_id` int(10) UNSIGNED NOT NULL COMMENT 'History Id',
  `application_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Application Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `store_id` smallint(5) UNSIGNED DEFAULT NULL COMMENT 'Store Id',
  `params` blob COMMENT 'Params',
  `title` varchar(200) NOT NULL COMMENT 'Title',
  `activation_key` varchar(255) NOT NULL COMMENT 'Activation Key',
  `name` varchar(255) NOT NULL COMMENT 'Application Name',
  `code` varchar(32) NOT NULL COMMENT 'Application Code'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect History';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_xmlconnect_notification_template`
--

CREATE TABLE `jeu6_xmlconnect_notification_template` (
  `template_id` int(10) UNSIGNED NOT NULL COMMENT 'Template Id',
  `name` varchar(255) NOT NULL COMMENT 'Template Name',
  `push_title` varchar(140) NOT NULL COMMENT 'Push Notification Title',
  `message_title` varchar(255) NOT NULL COMMENT 'Message Title',
  `content` text NOT NULL COMMENT 'Message Content',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  `application_id` smallint(5) UNSIGNED NOT NULL COMMENT 'Application Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Notification Template';

-- --------------------------------------------------------

--
-- Table structure for table `jeu6_xmlconnect_queue`
--

CREATE TABLE `jeu6_xmlconnect_queue` (
  `queue_id` int(10) UNSIGNED NOT NULL COMMENT 'Queue Id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `exec_time` timestamp NULL DEFAULT NULL COMMENT 'Scheduled Execution Time',
  `template_id` int(10) UNSIGNED NOT NULL COMMENT 'Template Id',
  `push_title` varchar(140) NOT NULL COMMENT 'Push Notification Title',
  `message_title` varchar(255) DEFAULT '' COMMENT 'Message Title',
  `content` text COMMENT 'Message Content',
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Status',
  `type` varchar(12) NOT NULL COMMENT 'Type of Notification'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Xmlconnect Notification Queue';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jeu6_adminnotification_inbox`
--
ALTER TABLE `jeu6_adminnotification_inbox`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `IDX_OZSS_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  ADD KEY `IDX_OZSS_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  ADD KEY `IDX_OZSS_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`);

--
-- Indexes for table `jeu6_admin_assert`
--
ALTER TABLE `jeu6_admin_assert`
  ADD PRIMARY KEY (`assert_id`);

--
-- Indexes for table `jeu6_admin_role`
--
ALTER TABLE `jeu6_admin_role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `IDX_OZSS_ADMIN_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  ADD KEY `IDX_OZSS_ADMIN_ROLE_TREE_LEVEL` (`tree_level`);

--
-- Indexes for table `jeu6_admin_rule`
--
ALTER TABLE `jeu6_admin_rule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_OZSS_ADMIN_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  ADD KEY `IDX_OZSS_ADMIN_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`);

--
-- Indexes for table `jeu6_admin_user`
--
ALTER TABLE `jeu6_admin_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UNQ_OZSS_ADMIN_USER_USERNAME` (`username`);

--
-- Indexes for table `jeu6_api2_acl_attribute`
--
ALTER TABLE `jeu6_api2_acl_attribute`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_JEU6_JEU6_API2_ACL_ATTRIBUTE_USER_TYPE_RESOURCE_ID_OPERATION` (`user_type`,`resource_id`,`operation`),
  ADD KEY `IDX_JEU6_API2_ACL_ATTRIBUTE_USER_TYPE` (`user_type`);

--
-- Indexes for table `jeu6_api2_acl_role`
--
ALTER TABLE `jeu6_api2_acl_role`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_JEU6_API2_ACL_ROLE_CREATED_AT` (`created_at`),
  ADD KEY `IDX_JEU6_API2_ACL_ROLE_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `jeu6_api2_acl_rule`
--
ALTER TABLE `jeu6_api2_acl_rule`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_JEU6_JEU6_API2_ACL_RULE_ROLE_ID_RESOURCE_ID_PRIVILEGE` (`role_id`,`resource_id`,`privilege`);

--
-- Indexes for table `jeu6_api2_acl_user`
--
ALTER TABLE `jeu6_api2_acl_user`
  ADD UNIQUE KEY `UNQ_JEU6_JEU6_API2_ACL_USER_ADMIN_ID` (`admin_id`),
  ADD KEY `FK_JEU6_API2_ACL_USER_ROLE_ID_JEU6_API2_ACL_ROLE_ENTITY_ID` (`role_id`);

--
-- Indexes for table `jeu6_api_assert`
--
ALTER TABLE `jeu6_api_assert`
  ADD PRIMARY KEY (`assert_id`);

--
-- Indexes for table `jeu6_api_role`
--
ALTER TABLE `jeu6_api_role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `IDX_OZSS_API_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  ADD KEY `IDX_OZSS_API_ROLE_TREE_LEVEL` (`tree_level`);

--
-- Indexes for table `jeu6_api_rule`
--
ALTER TABLE `jeu6_api_rule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_OZSS_API_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  ADD KEY `IDX_OZSS_API_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`);

--
-- Indexes for table `jeu6_api_session`
--
ALTER TABLE `jeu6_api_session`
  ADD KEY `IDX_OZSS_API_SESSION_USER_ID` (`user_id`),
  ADD KEY `IDX_OZSS_API_SESSION_SESSID` (`sessid`);

--
-- Indexes for table `jeu6_api_user`
--
ALTER TABLE `jeu6_api_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `jeu6_aw_blog`
--
ALTER TABLE `jeu6_aw_blog`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Indexes for table `jeu6_aw_blog_cat`
--
ALTER TABLE `jeu6_aw_blog_cat`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `jeu6_aw_blog_comment`
--
ALTER TABLE `jeu6_aw_blog_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `jeu6_aw_blog_tags`
--
ALTER TABLE `jeu6_aw_blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag` (`tag`,`tag_count`,`store_id`);

--
-- Indexes for table `jeu6_captcha_log`
--
ALTER TABLE `jeu6_captcha_log`
  ADD PRIMARY KEY (`type`,`value`);

--
-- Indexes for table `jeu6_cataloginventory_stock`
--
ALTER TABLE `jeu6_cataloginventory_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `jeu6_cataloginventory_stock_item`
--
ALTER TABLE `jeu6_cataloginventory_stock_item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`);

--
-- Indexes for table `jeu6_cataloginventory_stock_status`
--
ALTER TABLE `jeu6_cataloginventory_stock_status`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_cataloginventory_stock_status_idx`
--
ALTER TABLE `jeu6_cataloginventory_stock_status_idx`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_cataloginventory_stock_status_tmp`
--
ALTER TABLE `jeu6_cataloginventory_stock_status_tmp`
  ADD PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  ADD KEY `IDX_OZSS_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalogrule`
--
ALTER TABLE `jeu6_catalogrule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`);

--
-- Indexes for table `jeu6_catalogrule_affected_product`
--
ALTER TABLE `jeu6_catalogrule_affected_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `jeu6_catalogrule_customer_group`
--
ALTER TABLE `jeu6_catalogrule_customer_group`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`),
  ADD KEY `IDX_JEU6_CATALOGRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  ADD KEY `IDX_JEU6_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `jeu6_catalogrule_group_website`
--
ALTER TABLE `jeu6_catalogrule_group_website`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_GROUP_WEBSITE_RULE_ID` (`rule_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalogrule_product`
--
ALTER TABLE `jeu6_catalogrule_product`
  ADD PRIMARY KEY (`rule_product_id`),
  ADD UNIQUE KEY `4EF1A09B7972968AC381B86C6B948A5E` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_RULE_ID` (`rule_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalogrule_product_price`
--
ALTER TABLE `jeu6_catalogrule_product_price`
  ADD PRIMARY KEY (`rule_product_price_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalogrule_website`
--
ALTER TABLE `jeu6_catalogrule_website`
  ADD PRIMARY KEY (`rule_id`,`website_id`),
  ADD KEY `IDX_JEU6_CATALOGRULE_WEBSITE_RULE_ID` (`rule_id`),
  ADD KEY `IDX_JEU6_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalogsearch_fulltext`
--
ALTER TABLE `jeu6_catalogsearch_fulltext`
  ADD PRIMARY KEY (`fulltext_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATALOGSEARCH_FULLTEXT_PRODUCT_ID_STORE_ID` (`product_id`,`store_id`);
ALTER TABLE `jeu6_catalogsearch_fulltext` ADD FULLTEXT KEY `FTI_OZSS_CATALOGSEARCH_FULLTEXT_DATA_INDEX` (`data_index`);

--
-- Indexes for table `jeu6_catalogsearch_query`
--
ALTER TABLE `jeu6_catalogsearch_query`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `IDX_OZSS_CATALOGSEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  ADD KEY `IDX_OZSS_CATALOGSEARCH_QUERY_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_JEU6_CATALOGSEARCH_QUERY_SYNONYM_FOR` (`synonym_for`);

--
-- Indexes for table `jeu6_catalogsearch_result`
--
ALTER TABLE `jeu6_catalogsearch_result`
  ADD PRIMARY KEY (`query_id`,`product_id`),
  ADD KEY `IDX_OZSS_CATALOGSEARCH_RESULT_QUERY_ID` (`query_id`),
  ADD KEY `IDX_OZSS_CATALOGSEARCH_RESULT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalog_category_anc_categs_index_idx`
--
ALTER TABLE `jeu6_catalog_category_anc_categs_index_idx`
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_CATEGORY_ID` (`category_id`),
  ADD KEY `IDX_JEU6_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_PATH_CATEGORY_ID` (`path`,`category_id`);

--
-- Indexes for table `jeu6_catalog_category_anc_categs_index_tmp`
--
ALTER TABLE `jeu6_catalog_category_anc_categs_index_tmp`
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_CATEGORY_ID` (`category_id`),
  ADD KEY `IDX_JEU6_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_PATH_CATEGORY_ID` (`path`,`category_id`);

--
-- Indexes for table `jeu6_catalog_category_anc_products_index_idx`
--
ALTER TABLE `jeu6_catalog_category_anc_products_index_idx`
  ADD KEY `IDX_JEU6_CAT_CTGR_ANC_PRDS_IDX_IDX_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`);

--
-- Indexes for table `jeu6_catalog_category_anc_products_index_tmp`
--
ALTER TABLE `jeu6_catalog_category_anc_products_index_tmp`
  ADD KEY `IDX_JEU6_CAT_CTGR_ANC_PRDS_IDX_TMP_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`);

--
-- Indexes for table `jeu6_catalog_category_entity`
--
ALTER TABLE `jeu6_catalog_category_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  ADD KEY `IDX_JEU6_CATALOG_CATEGORY_ENTITY_PATH_ENTITY_ID` (`path`,`entity_id`);

--
-- Indexes for table `jeu6_catalog_category_entity_datetime`
--
ALTER TABLE `jeu6_catalog_category_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `33B21B6EA3DCDEA663A57E365CC48381` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_category_entity_decimal`
--
ALTER TABLE `jeu6_catalog_category_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_CTGR_ENTT_DEC_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_category_entity_int`
--
ALTER TABLE `jeu6_catalog_category_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_CTGR_ENTT_INT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_category_entity_text`
--
ALTER TABLE `jeu6_catalog_category_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `6497846DD10C8242FAC0D2FBA83BF38F` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_category_entity_varchar`
--
ALTER TABLE `jeu6_catalog_category_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `74E7E5A7FCE421E23A31DC248C5F1C28` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_category_flat_store_1`
--
ALTER TABLE `jeu6_catalog_category_flat_store_1`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_JEU6_CATALOG_CATEGORY_FLAT_STORE_1_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_CATALOG_CATEGORY_FLAT_STORE_1_PATH` (`path`),
  ADD KEY `IDX_JEU6_CATALOG_CATEGORY_FLAT_STORE_1_LEVEL` (`level`);

--
-- Indexes for table `jeu6_catalog_category_product`
--
ALTER TABLE `jeu6_catalog_category_product`
  ADD PRIMARY KEY (`category_id`,`product_id`),
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalog_category_product_index`
--
ALTER TABLE `jeu6_catalog_category_product_index`
  ADD PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  ADD KEY `IDX_OZSS_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  ADD KEY `D190B2685F2F204761D7A9FE7CCCABEC` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`);

--
-- Indexes for table `jeu6_catalog_category_product_index_enbl_idx`
--
ALTER TABLE `jeu6_catalog_category_product_index_enbl_idx`
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_PRODUCT_INDEX_ENBL_IDX_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_JEU6_CAT_CTGR_PRD_IDX_ENBL_IDX_PRD_ID_VISIBILITY` (`product_id`,`visibility`);

--
-- Indexes for table `jeu6_catalog_category_product_index_enbl_tmp`
--
ALTER TABLE `jeu6_catalog_category_product_index_enbl_tmp`
  ADD KEY `IDX_OZSS_CATALOG_CATEGORY_PRODUCT_INDEX_ENBL_TMP_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_JEU6_CAT_CTGR_PRD_IDX_ENBL_TMP_PRD_ID_VISIBILITY` (`product_id`,`visibility`);

--
-- Indexes for table `jeu6_catalog_category_product_index_idx`
--
ALTER TABLE `jeu6_catalog_category_product_index_idx`
  ADD KEY `IDX_OZSS_CAT_CTGR_PRD_IDX_IDX_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`);

--
-- Indexes for table `jeu6_catalog_category_product_index_tmp`
--
ALTER TABLE `jeu6_catalog_category_product_index_tmp`
  ADD KEY `IDX_JEU6_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`);

--
-- Indexes for table `jeu6_catalog_compare_item`
--
ALTER TABLE `jeu6_catalog_compare_item`
  ADD PRIMARY KEY (`catalog_compare_item_id`),
  ADD KEY `IDX_OZSS_CATALOG_COMPARE_ITEM_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD KEY `IDX_OZSS_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `IDX_OZSS_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_eav_attribute`
--
ALTER TABLE `jeu6_catalog_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  ADD KEY `IDX_OZSS_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`);

--
-- Indexes for table `jeu6_catalog_product_bundle_option`
--
ALTER TABLE `jeu6_catalog_product_bundle_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_catalog_product_bundle_option_value`
--
ALTER TABLE `jeu6_catalog_product_bundle_option_value`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION_ID_STORE_ID` (`option_id`,`store_id`);

--
-- Indexes for table `jeu6_catalog_product_bundle_price_index`
--
ALTER TABLE `jeu6_catalog_product_bundle_price_index`
  ADD PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `jeu6_catalog_product_bundle_selection`
--
ALTER TABLE `jeu6_catalog_product_bundle_selection`
  ADD PRIMARY KEY (`selection_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalog_product_bundle_selection_price`
--
ALTER TABLE `jeu6_catalog_product_bundle_selection_price`
  ADD PRIMARY KEY (`selection_id`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalog_product_bundle_stock_index`
--
ALTER TABLE `jeu6_catalog_product_bundle_stock_index`
  ADD PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`);

--
-- Indexes for table `jeu6_catalog_product_enabled_index`
--
ALTER TABLE `jeu6_catalog_product_enabled_index`
  ADD PRIMARY KEY (`product_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_entity`
--
ALTER TABLE `jeu6_catalog_product_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_SKU` (`sku`);

--
-- Indexes for table `jeu6_catalog_product_entity_datetime`
--
ALTER TABLE `jeu6_catalog_product_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_decimal`
--
ALTER TABLE `jeu6_catalog_product_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_gallery`
--
ALTER TABLE `jeu6_catalog_product_entity_gallery`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_ENTT_GLR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_group_price`
--
ALTER TABLE `jeu6_catalog_product_entity_group_price`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `C3F9242AC4C7E7B3903201D524F59065` (`entity_id`,`all_groups`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_int`
--
ALTER TABLE `jeu6_catalog_product_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_ENTT_INT_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_media_gallery`
--
ALTER TABLE `jeu6_catalog_product_entity_media_gallery`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_media_gallery_value`
--
ALTER TABLE `jeu6_catalog_product_entity_media_gallery_value`
  ADD PRIMARY KEY (`value_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_text`
--
ALTER TABLE `jeu6_catalog_product_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_ENTT_TEXT_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_tier_price`
--
ALTER TABLE `jeu6_catalog_product_entity_tier_price`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `E0F350FAEF768C6D8048054FEC4EB5B5` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_TIER_PRICE_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalog_product_entity_varchar`
--
ALTER TABLE `jeu6_catalog_product_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_catalog_product_flat_1`
--
ALTER TABLE `jeu6_catalog_product_flat_1`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_FLAT_1_TYPE_ID` (`type_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_FLAT_1_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_FLAT_1_NAME` (`name`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_FLAT_1_PRICE` (`price`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_FLAT_1_STATUS` (`status`);

--
-- Indexes for table `jeu6_catalog_product_index_eav`
--
ALTER TABLE `jeu6_catalog_product_index_eav`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`);

--
-- Indexes for table `jeu6_catalog_product_index_eav_decimal`
--
ALTER TABLE `jeu6_catalog_product_index_eav_decimal`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`);

--
-- Indexes for table `jeu6_catalog_product_index_eav_decimal_idx`
--
ALTER TABLE `jeu6_catalog_product_index_eav_decimal_idx`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`);

--
-- Indexes for table `jeu6_catalog_product_index_eav_decimal_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_eav_decimal_tmp`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`);

--
-- Indexes for table `jeu6_catalog_product_index_eav_idx`
--
ALTER TABLE `jeu6_catalog_product_index_eav_idx`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_IDX_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`);

--
-- Indexes for table `jeu6_catalog_product_index_eav_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_eav_tmp`
  ADD PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_TMP_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`);

--
-- Indexes for table `jeu6_catalog_product_index_group_price`
--
ALTER TABLE `jeu6_catalog_product_index_group_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_INDEX_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_JEU6_CATALOG_PRODUCT_INDEX_GROUP_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price`
--
ALTER TABLE `jeu6_catalog_product_index_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  ADD KEY `IDX_JEU6_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`);

--
-- Indexes for table `jeu6_catalog_product_index_price_bundle_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_bundle_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_bundle_opt_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_bundle_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_bundle_opt_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_bundle_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_bundle_sel_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_bundle_sel_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_bundle_sel_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_bundle_sel_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_bundle_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_bundle_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_cfg_opt_agr_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_cfg_opt_agr_idx`
  ADD PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_cfg_opt_agr_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_cfg_opt_agr_tmp`
  ADD PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_cfg_opt_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_cfg_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_cfg_opt_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_cfg_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_downlod_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_downlod_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_downlod_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_downlod_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_final_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_final_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_final_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_final_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`);

--
-- Indexes for table `jeu6_catalog_product_index_price_opt_agr_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_opt_agr_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_opt_agr_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_opt_agr_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_opt_idx`
--
ALTER TABLE `jeu6_catalog_product_index_price_opt_idx`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_opt_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_opt_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_price_tmp`
--
ALTER TABLE `jeu6_catalog_product_index_price_tmp`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`);

--
-- Indexes for table `jeu6_catalog_product_index_tier_price`
--
ALTER TABLE `jeu6_catalog_product_index_tier_price`
  ADD PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalog_product_index_website`
--
ALTER TABLE `jeu6_catalog_product_index_website`
  ADD PRIMARY KEY (`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`);

--
-- Indexes for table `jeu6_catalog_product_link`
--
ALTER TABLE `jeu6_catalog_product_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_LINK_LINK_TYPE_ID` (`link_type_id`);

--
-- Indexes for table `jeu6_catalog_product_link_attribute`
--
ALTER TABLE `jeu6_catalog_product_link_attribute`
  ADD PRIMARY KEY (`product_link_attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`);

--
-- Indexes for table `jeu6_catalog_product_link_attribute_decimal`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `IDX_OZSS_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`);

--
-- Indexes for table `jeu6_catalog_product_link_attribute_int`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `IDX_OZSS_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`);

--
-- Indexes for table `jeu6_catalog_product_link_attribute_varchar`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  ADD KEY `IDX_OZSS_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`);

--
-- Indexes for table `jeu6_catalog_product_link_type`
--
ALTER TABLE `jeu6_catalog_product_link_type`
  ADD PRIMARY KEY (`link_type_id`);

--
-- Indexes for table `jeu6_catalog_product_option`
--
ALTER TABLE `jeu6_catalog_product_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalog_product_option_price`
--
ALTER TABLE `jeu6_catalog_product_option_price`
  ADD PRIMARY KEY (`option_price_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID` (`option_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_option_title`
--
ALTER TABLE `jeu6_catalog_product_option_title`
  ADD PRIMARY KEY (`option_title_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID` (`option_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_option_type_price`
--
ALTER TABLE `jeu6_catalog_product_option_type_price`
  ADD PRIMARY KEY (`option_type_price_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_OPT_TYPE_PRICE_OPT_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID` (`option_type_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_option_type_title`
--
ALTER TABLE `jeu6_catalog_product_option_type_title`
  ADD PRIMARY KEY (`option_type_title_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_OPT_TYPE_TTL_OPT_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID` (`option_type_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_option_type_value`
--
ALTER TABLE `jeu6_catalog_product_option_type_value`
  ADD PRIMARY KEY (`option_type_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`);

--
-- Indexes for table `jeu6_catalog_product_relation`
--
ALTER TABLE `jeu6_catalog_product_relation`
  ADD PRIMARY KEY (`parent_id`,`child_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`);

--
-- Indexes for table `jeu6_catalog_product_super_attribute`
--
ALTER TABLE `jeu6_catalog_product_super_attribute`
  ADD PRIMARY KEY (`product_super_attribute_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalog_product_super_attribute_label`
--
ALTER TABLE `jeu6_catalog_product_super_attribute_label`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_catalog_product_super_attribute_pricing`
--
ALTER TABLE `jeu6_catalog_product_super_attribute_pricing`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID_VAL_IDX_WS_ID` (`product_super_attribute_id`,`value_index`,`website_id`),
  ADD KEY `IDX_OZSS_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRICING_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_catalog_product_super_link`
--
ALTER TABLE `jeu6_catalog_product_super_link`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_catalog_product_website`
--
ALTER TABLE `jeu6_catalog_product_website`
  ADD PRIMARY KEY (`product_id`,`website_id`),
  ADD KEY `IDX_OZSS_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_checkout_agreement`
--
ALTER TABLE `jeu6_checkout_agreement`
  ADD PRIMARY KEY (`agreement_id`);

--
-- Indexes for table `jeu6_checkout_agreement_store`
--
ALTER TABLE `jeu6_checkout_agreement_store`
  ADD PRIMARY KEY (`agreement_id`,`store_id`),
  ADD KEY `FK_OZSS_CHKT_AGRT_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_cms_block`
--
ALTER TABLE `jeu6_cms_block`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `jeu6_cms_block_store`
--
ALTER TABLE `jeu6_cms_block_store`
  ADD PRIMARY KEY (`block_id`,`store_id`),
  ADD KEY `IDX_OZSS_CMS_BLOCK_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_cms_page`
--
ALTER TABLE `jeu6_cms_page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `IDX_OZSS_CMS_PAGE_IDENTIFIER` (`identifier`);

--
-- Indexes for table `jeu6_cms_page_store`
--
ALTER TABLE `jeu6_cms_page_store`
  ADD PRIMARY KEY (`page_id`,`store_id`),
  ADD KEY `IDX_OZSS_CMS_PAGE_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_core_cache`
--
ALTER TABLE `jeu6_core_cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_OZSS_CORE_CACHE_EXPIRE_TIME` (`expire_time`);

--
-- Indexes for table `jeu6_core_cache_option`
--
ALTER TABLE `jeu6_core_cache_option`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `jeu6_core_cache_tag`
--
ALTER TABLE `jeu6_core_cache_tag`
  ADD PRIMARY KEY (`tag`,`cache_id`),
  ADD KEY `IDX_OZSS_CORE_CACHE_TAG_CACHE_ID` (`cache_id`);

--
-- Indexes for table `jeu6_core_config_data`
--
ALTER TABLE `jeu6_core_config_data`
  ADD PRIMARY KEY (`config_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`);

--
-- Indexes for table `jeu6_core_email_queue`
--
ALTER TABLE `jeu6_core_email_queue`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `0CEF92290D37FD1A897902ED75029160` (`entity_id`,`entity_type`,`event_type`,`message_body_hash`);

--
-- Indexes for table `jeu6_core_email_queue_recipients`
--
ALTER TABLE `jeu6_core_email_queue_recipients`
  ADD PRIMARY KEY (`recipient_id`),
  ADD UNIQUE KEY `F6D636552863B5C755A1BF06A8D1A2C3` (`message_id`,`recipient_email`,`email_type`),
  ADD KEY `IDX_JEU6_CORE_EMAIL_QUEUE_RECIPIENTS_RECIPIENT_EMAIL` (`recipient_email`),
  ADD KEY `IDX_JEU6_CORE_EMAIL_QUEUE_RECIPIENTS_EMAIL_TYPE` (`email_type`);

--
-- Indexes for table `jeu6_core_email_template`
--
ALTER TABLE `jeu6_core_email_template`
  ADD PRIMARY KEY (`template_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  ADD KEY `IDX_OZSS_CORE_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  ADD KEY `IDX_OZSS_CORE_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `jeu6_core_flag`
--
ALTER TABLE `jeu6_core_flag`
  ADD PRIMARY KEY (`flag_id`),
  ADD KEY `IDX_OZSS_CORE_FLAG_LAST_UPDATE` (`last_update`);

--
-- Indexes for table `jeu6_core_layout_link`
--
ALTER TABLE `jeu6_core_layout_link`
  ADD PRIMARY KEY (`layout_link_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_LYT_LNK_STORE_ID_PACKAGE_THEME_LYT_UPDATE_ID` (`store_id`,`package`,`theme`,`layout_update_id`),
  ADD KEY `IDX_OZSS_CORE_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`);

--
-- Indexes for table `jeu6_core_layout_update`
--
ALTER TABLE `jeu6_core_layout_update`
  ADD PRIMARY KEY (`layout_update_id`),
  ADD KEY `IDX_OZSS_CORE_LAYOUT_UPDATE_HANDLE` (`handle`);

--
-- Indexes for table `jeu6_core_resource`
--
ALTER TABLE `jeu6_core_resource`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `jeu6_core_session`
--
ALTER TABLE `jeu6_core_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `jeu6_core_store`
--
ALTER TABLE `jeu6_core_store`
  ADD PRIMARY KEY (`store_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_STORE_CODE` (`code`),
  ADD KEY `IDX_OZSS_CORE_STORE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CORE_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  ADD KEY `IDX_OZSS_CORE_STORE_GROUP_ID` (`group_id`);

--
-- Indexes for table `jeu6_core_store_group`
--
ALTER TABLE `jeu6_core_store_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `IDX_OZSS_CORE_STORE_GROUP_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_CORE_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`);

--
-- Indexes for table `jeu6_core_translate`
--
ALTER TABLE `jeu6_core_translate`
  ADD PRIMARY KEY (`key_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_TRANSLATE_STORE_ID_LOCALE_STRING` (`store_id`,`locale`,`string`),
  ADD UNIQUE KEY `UNQ_JEU6_CORE_TRANSLATE_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  ADD KEY `IDX_OZSS_CORE_TRANSLATE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_core_url_rewrite`
--
ALTER TABLE `jeu6_core_url_rewrite`
  ADD PRIMARY KEY (`url_rewrite_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_URL_REWRITE_ID_PATH_IS_SYSTEM_STORE_ID` (`id_path`,`is_system`,`store_id`),
  ADD KEY `IDX_OZSS_CORE_URL_REWRITE_TARGET_PATH_STORE_ID` (`target_path`,`store_id`),
  ADD KEY `IDX_OZSS_CORE_URL_REWRITE_ID_PATH` (`id_path`),
  ADD KEY `IDX_OZSS_CORE_URL_REWRITE_STORE_ID` (`store_id`),
  ADD KEY `FK_OZSS_CORE_URL_REWRITE_CTGR_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` (`category_id`),
  ADD KEY `FK_OZSS_CORE_URL_REWRITE_PRD_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` (`product_id`);

--
-- Indexes for table `jeu6_core_variable`
--
ALTER TABLE `jeu6_core_variable`
  ADD PRIMARY KEY (`variable_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_VARIABLE_CODE` (`code`);

--
-- Indexes for table `jeu6_core_variable_value`
--
ALTER TABLE `jeu6_core_variable_value`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  ADD KEY `IDX_OZSS_CORE_VARIABLE_VALUE_VARIABLE_ID` (`variable_id`),
  ADD KEY `IDX_OZSS_CORE_VARIABLE_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_core_website`
--
ALTER TABLE `jeu6_core_website`
  ADD PRIMARY KEY (`website_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CORE_WEBSITE_CODE` (`code`),
  ADD KEY `IDX_OZSS_CORE_WEBSITE_SORT_ORDER` (`sort_order`),
  ADD KEY `IDX_OZSS_CORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`);

--
-- Indexes for table `jeu6_coupon_aggregated`
--
ALTER TABLE `jeu6_coupon_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `IDX_OZSS_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_COUPON_AGGREGATED_RULE_NAME` (`rule_name`);

--
-- Indexes for table `jeu6_coupon_aggregated_order`
--
ALTER TABLE `jeu6_coupon_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `2AC4FA2426FDB2C6BFFFAACCD695E64D` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `IDX_OZSS_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`);

--
-- Indexes for table `jeu6_coupon_aggregated_updated`
--
ALTER TABLE `jeu6_coupon_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `02BBBEB23E77D664201DD2CAD53DA415` (`period`,`store_id`,`order_status`,`coupon_code`),
  ADD KEY `IDX_JEU6_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`);

--
-- Indexes for table `jeu6_cron_schedule`
--
ALTER TABLE `jeu6_cron_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `IDX_OZSS_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  ADD KEY `IDX_OZSS_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`);

--
-- Indexes for table `jeu6_customer_address_entity`
--
ALTER TABLE `jeu6_customer_address_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_customer_address_entity_datetime`
--
ALTER TABLE `jeu6_customer_address_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_address_entity_decimal`
--
ALTER TABLE `jeu6_customer_address_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CSTR_ADDR_ENTT_DEC_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_address_entity_int`
--
ALTER TABLE `jeu6_customer_address_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CSTR_ADDR_ENTT_INT_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_address_entity_text`
--
ALTER TABLE `jeu6_customer_address_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_customer_address_entity_varchar`
--
ALTER TABLE `jeu6_customer_address_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CSTR_ADDR_ENTT_VCHR_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_eav_attribute`
--
ALTER TABLE `jeu6_customer_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `jeu6_customer_eav_attribute_website`
--
ALTER TABLE `jeu6_customer_eav_attribute_website`
  ADD PRIMARY KEY (`attribute_id`,`website_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_customer_entity`
--
ALTER TABLE `jeu6_customer_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_JEU6_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_customer_entity_datetime`
--
ALTER TABLE `jeu6_customer_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_entity_decimal`
--
ALTER TABLE `jeu6_customer_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_entity_int`
--
ALTER TABLE `jeu6_customer_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_entity_text`
--
ALTER TABLE `jeu6_customer_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_customer_entity_varchar`
--
ALTER TABLE `jeu6_customer_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`);

--
-- Indexes for table `jeu6_customer_flowpassword`
--
ALTER TABLE `jeu6_customer_flowpassword`
  ADD PRIMARY KEY (`flowpassword_id`),
  ADD KEY `IDX_JEU6_CUSTOMER_FLOWPASSWORD_EMAIL` (`email`),
  ADD KEY `IDX_JEU6_CUSTOMER_FLOWPASSWORD_IP` (`ip`),
  ADD KEY `IDX_JEU6_CUSTOMER_FLOWPASSWORD_REQUESTED_DATE` (`requested_date`);

--
-- Indexes for table `jeu6_customer_form_attribute`
--
ALTER TABLE `jeu6_customer_form_attribute`
  ADD PRIMARY KEY (`form_code`,`attribute_id`),
  ADD KEY `IDX_OZSS_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `jeu6_customer_group`
--
ALTER TABLE `jeu6_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `jeu6_dataflow_batch`
--
ALTER TABLE `jeu6_dataflow_batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `IDX_OZSS_DATAFLOW_BATCH_PROFILE_ID` (`profile_id`),
  ADD KEY `IDX_OZSS_DATAFLOW_BATCH_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_DATAFLOW_BATCH_CREATED_AT` (`created_at`);

--
-- Indexes for table `jeu6_dataflow_batch_export`
--
ALTER TABLE `jeu6_dataflow_batch_export`
  ADD PRIMARY KEY (`batch_export_id`),
  ADD KEY `IDX_OZSS_DATAFLOW_BATCH_EXPORT_BATCH_ID` (`batch_id`);

--
-- Indexes for table `jeu6_dataflow_batch_import`
--
ALTER TABLE `jeu6_dataflow_batch_import`
  ADD PRIMARY KEY (`batch_import_id`),
  ADD KEY `IDX_OZSS_DATAFLOW_BATCH_IMPORT_BATCH_ID` (`batch_id`);

--
-- Indexes for table `jeu6_dataflow_import_data`
--
ALTER TABLE `jeu6_dataflow_import_data`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `IDX_OZSS_DATAFLOW_IMPORT_DATA_SESSION_ID` (`session_id`);

--
-- Indexes for table `jeu6_dataflow_profile`
--
ALTER TABLE `jeu6_dataflow_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `jeu6_dataflow_profile_history`
--
ALTER TABLE `jeu6_dataflow_profile_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `IDX_OZSS_DATAFLOW_PROFILE_HISTORY_PROFILE_ID` (`profile_id`);

--
-- Indexes for table `jeu6_dataflow_session`
--
ALTER TABLE `jeu6_dataflow_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `jeu6_design_change`
--
ALTER TABLE `jeu6_design_change`
  ADD PRIMARY KEY (`design_change_id`),
  ADD KEY `IDX_OZSS_DESIGN_CHANGE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_directory_country`
--
ALTER TABLE `jeu6_directory_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `jeu6_directory_country_format`
--
ALTER TABLE `jeu6_directory_country_format`
  ADD PRIMARY KEY (`country_format_id`),
  ADD UNIQUE KEY `UNQ_OZSS_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`);

--
-- Indexes for table `jeu6_directory_country_region`
--
ALTER TABLE `jeu6_directory_country_region`
  ADD PRIMARY KEY (`region_id`),
  ADD KEY `IDX_OZSS_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`);

--
-- Indexes for table `jeu6_directory_country_region_name`
--
ALTER TABLE `jeu6_directory_country_region_name`
  ADD PRIMARY KEY (`locale`,`region_id`),
  ADD KEY `IDX_OZSS_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`);

--
-- Indexes for table `jeu6_directory_currency_rate`
--
ALTER TABLE `jeu6_directory_currency_rate`
  ADD PRIMARY KEY (`currency_from`,`currency_to`),
  ADD KEY `IDX_OZSS_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`);

--
-- Indexes for table `jeu6_downloadable_link`
--
ALTER TABLE `jeu6_downloadable_link`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`);

--
-- Indexes for table `jeu6_downloadable_link_price`
--
ALTER TABLE `jeu6_downloadable_link_price`
  ADD PRIMARY KEY (`price_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_downloadable_link_purchased`
--
ALTER TABLE `jeu6_downloadable_link_purchased`
  ADD PRIMARY KEY (`purchased_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `jeu6_downloadable_link_purchased_item`
--
ALTER TABLE `jeu6_downloadable_link_purchased_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`);

--
-- Indexes for table `jeu6_downloadable_link_title`
--
ALTER TABLE `jeu6_downloadable_link_title`
  ADD PRIMARY KEY (`title_id`),
  ADD UNIQUE KEY `UNQ_OZSS_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_TITLE_LINK_ID` (`link_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_downloadable_sample`
--
ALTER TABLE `jeu6_downloadable_sample`
  ADD PRIMARY KEY (`sample_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_downloadable_sample_title`
--
ALTER TABLE `jeu6_downloadable_sample_title`
  ADD PRIMARY KEY (`title_id`),
  ADD UNIQUE KEY `UNQ_OZSS_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID` (`sample_id`),
  ADD KEY `IDX_OZSS_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_eav_attribute`
--
ALTER TABLE `jeu6_eav_attribute`
  ADD PRIMARY KEY (`attribute_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_ENTITY_TYPE_ID` (`entity_type_id`);

--
-- Indexes for table `jeu6_eav_attribute_group`
--
ALTER TABLE `jeu6_eav_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ATTR_GROUP_ATTR_SET_ID_ATTR_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`);

--
-- Indexes for table `jeu6_eav_attribute_label`
--
ALTER TABLE `jeu6_eav_attribute_label`
  ADD PRIMARY KEY (`attribute_label_id`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`);

--
-- Indexes for table `jeu6_eav_attribute_option`
--
ALTER TABLE `jeu6_eav_attribute_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `jeu6_eav_attribute_option_value`
--
ALTER TABLE `jeu6_eav_attribute_option_value`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_eav_attribute_set`
--
ALTER TABLE `jeu6_eav_attribute_set`
  ADD PRIMARY KEY (`attribute_set_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  ADD KEY `IDX_OZSS_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`);

--
-- Indexes for table `jeu6_eav_entity`
--
ALTER TABLE `jeu6_eav_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_eav_entity_attribute`
--
ALTER TABLE `jeu6_eav_entity_attribute`
  ADD PRIMARY KEY (`entity_attribute_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `jeu6_eav_entity_datetime`
--
ALTER TABLE `jeu6_eav_entity_datetime`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `jeu6_eav_entity_decimal`
--
ALTER TABLE `jeu6_eav_entity_decimal`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `jeu6_eav_entity_int`
--
ALTER TABLE `jeu6_eav_entity_int`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_INT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `jeu6_eav_entity_store`
--
ALTER TABLE `jeu6_eav_entity_store`
  ADD PRIMARY KEY (`entity_store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_eav_entity_text`
--
ALTER TABLE `jeu6_eav_entity_text`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_TEXT_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_eav_entity_type`
--
ALTER TABLE `jeu6_eav_entity_type`
  ADD PRIMARY KEY (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`);

--
-- Indexes for table `jeu6_eav_entity_varchar`
--
ALTER TABLE `jeu6_eav_entity_varchar`
  ADD PRIMARY KEY (`value_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  ADD KEY `IDX_OZSS_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`);

--
-- Indexes for table `jeu6_eav_form_element`
--
ALTER TABLE `jeu6_eav_form_element`
  ADD PRIMARY KEY (`element_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_EAV_FORM_ELEMENT_TYPE_ID` (`type_id`),
  ADD KEY `IDX_OZSS_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  ADD KEY `IDX_OZSS_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `jeu6_eav_form_fieldset`
--
ALTER TABLE `jeu6_eav_form_fieldset`
  ADD PRIMARY KEY (`fieldset_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  ADD KEY `IDX_OZSS_EAV_FORM_FIELDSET_TYPE_ID` (`type_id`);

--
-- Indexes for table `jeu6_eav_form_fieldset_label`
--
ALTER TABLE `jeu6_eav_form_fieldset_label`
  ADD PRIMARY KEY (`fieldset_id`,`store_id`),
  ADD KEY `IDX_OZSS_EAV_FORM_FIELDSET_LABEL_FIELDSET_ID` (`fieldset_id`),
  ADD KEY `IDX_OZSS_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_eav_form_type`
--
ALTER TABLE `jeu6_eav_form_type`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `UNQ_OZSS_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  ADD KEY `IDX_OZSS_EAV_FORM_TYPE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_eav_form_type_entity`
--
ALTER TABLE `jeu6_eav_form_type_entity`
  ADD PRIMARY KEY (`type_id`,`entity_type_id`),
  ADD KEY `IDX_OZSS_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`);

--
-- Indexes for table `jeu6_find_feed_import_codes`
--
ALTER TABLE `jeu6_find_feed_import_codes`
  ADD PRIMARY KEY (`code_id`);

--
-- Indexes for table `jeu6_gift_message`
--
ALTER TABLE `jeu6_gift_message`
  ADD PRIMARY KEY (`gift_message_id`);

--
-- Indexes for table `jeu6_googlebase_attributes`
--
ALTER TABLE `jeu6_googlebase_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_OZSS_GOOGLEBASE_ATTRIBUTES_ATTRIBUTE_ID` (`attribute_id`),
  ADD KEY `IDX_OZSS_GOOGLEBASE_ATTRIBUTES_TYPE_ID` (`type_id`);

--
-- Indexes for table `jeu6_googlebase_items`
--
ALTER TABLE `jeu6_googlebase_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IDX_OZSS_GOOGLEBASE_ITEMS_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_GOOGLEBASE_ITEMS_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_googlebase_types`
--
ALTER TABLE `jeu6_googlebase_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `IDX_OZSS_GOOGLEBASE_TYPES_ATTRIBUTE_SET_ID` (`attribute_set_id`);

--
-- Indexes for table `jeu6_googlecheckout_notification`
--
ALTER TABLE `jeu6_googlecheckout_notification`
  ADD PRIMARY KEY (`serial_number`);

--
-- Indexes for table `jeu6_googleoptimizer_code`
--
ALTER TABLE `jeu6_googleoptimizer_code`
  ADD PRIMARY KEY (`code_id`),
  ADD KEY `IDX_OZSS_GOOGLEOPTIMIZER_CODE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_importexport_importdata`
--
ALTER TABLE `jeu6_importexport_importdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jeu6_index_event`
--
ALTER TABLE `jeu6_index_event`
  ADD PRIMARY KEY (`event_id`),
  ADD UNIQUE KEY `UNQ_OZSS_INDEX_EVENT_TYPE_ENTITY_ENTITY_PK` (`type`,`entity`,`entity_pk`);

--
-- Indexes for table `jeu6_index_process`
--
ALTER TABLE `jeu6_index_process`
  ADD PRIMARY KEY (`process_id`),
  ADD UNIQUE KEY `UNQ_OZSS_INDEX_PROCESS_INDEXER_CODE` (`indexer_code`);

--
-- Indexes for table `jeu6_index_process_event`
--
ALTER TABLE `jeu6_index_process_event`
  ADD PRIMARY KEY (`process_id`,`event_id`),
  ADD KEY `IDX_OZSS_INDEX_PROCESS_EVENT_EVENT_ID` (`event_id`);

--
-- Indexes for table `jeu6_log_customer`
--
ALTER TABLE `jeu6_log_customer`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `IDX_OZSS_LOG_CUSTOMER_VISITOR_ID` (`visitor_id`);

--
-- Indexes for table `jeu6_log_quote`
--
ALTER TABLE `jeu6_log_quote`
  ADD PRIMARY KEY (`quote_id`);

--
-- Indexes for table `jeu6_log_summary`
--
ALTER TABLE `jeu6_log_summary`
  ADD PRIMARY KEY (`summary_id`);

--
-- Indexes for table `jeu6_log_summary_type`
--
ALTER TABLE `jeu6_log_summary_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `jeu6_log_url`
--
ALTER TABLE `jeu6_log_url`
  ADD KEY `IDX_OZSS_LOG_URL_VISITOR_ID` (`visitor_id`),
  ADD KEY `url_id` (`url_id`);

--
-- Indexes for table `jeu6_log_url_info`
--
ALTER TABLE `jeu6_log_url_info`
  ADD PRIMARY KEY (`url_id`);

--
-- Indexes for table `jeu6_log_visitor`
--
ALTER TABLE `jeu6_log_visitor`
  ADD PRIMARY KEY (`visitor_id`);

--
-- Indexes for table `jeu6_log_visitor_info`
--
ALTER TABLE `jeu6_log_visitor_info`
  ADD PRIMARY KEY (`visitor_id`);

--
-- Indexes for table `jeu6_log_visitor_online`
--
ALTER TABLE `jeu6_log_visitor_online`
  ADD PRIMARY KEY (`visitor_id`),
  ADD KEY `IDX_OZSS_LOG_VISITOR_ONLINE_VISITOR_TYPE` (`visitor_type`),
  ADD KEY `IDX_OZSS_LOG_VISITOR_ONLINE_FIRST_VISIT_AT_LAST_VISIT_AT` (`first_visit_at`,`last_visit_at`),
  ADD KEY `IDX_OZSS_LOG_VISITOR_ONLINE_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `jeu6_newsletter_problem`
--
ALTER TABLE `jeu6_newsletter_problem`
  ADD PRIMARY KEY (`problem_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`);

--
-- Indexes for table `jeu6_newsletter_queue`
--
ALTER TABLE `jeu6_newsletter_queue`
  ADD PRIMARY KEY (`queue_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`);

--
-- Indexes for table `jeu6_newsletter_queue_link`
--
ALTER TABLE `jeu6_newsletter_queue_link`
  ADD PRIMARY KEY (`queue_link_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_QUEUE_LINK_QUEUE_ID` (`queue_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`);

--
-- Indexes for table `jeu6_newsletter_queue_store_link`
--
ALTER TABLE `jeu6_newsletter_queue_store_link`
  ADD PRIMARY KEY (`queue_id`,`store_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_newsletter_subscriber`
--
ALTER TABLE `jeu6_newsletter_subscriber`
  ADD PRIMARY KEY (`subscriber_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_newsletter_template`
--
ALTER TABLE `jeu6_newsletter_template`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `IDX_OZSS_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  ADD KEY `IDX_OZSS_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  ADD KEY `IDX_OZSS_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`);

--
-- Indexes for table `jeu6_oauth_consumer`
--
ALTER TABLE `jeu6_oauth_consumer`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_JEU6_JEU6_OAUTH_CONSUMER_KEY` (`key`),
  ADD UNIQUE KEY `UNQ_JEU6_JEU6_OAUTH_CONSUMER_SECRET` (`secret`),
  ADD KEY `IDX_JEU6_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  ADD KEY `IDX_JEU6_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `jeu6_oauth_nonce`
--
ALTER TABLE `jeu6_oauth_nonce`
  ADD UNIQUE KEY `UNQ_JEU6_JEU6_OAUTH_NONCE_NONCE` (`nonce`);

--
-- Indexes for table `jeu6_oauth_token`
--
ALTER TABLE `jeu6_oauth_token`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_JEU6_JEU6_OAUTH_TOKEN_TOKEN` (`token`),
  ADD KEY `IDX_JEU6_JEU6_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  ADD KEY `FK_JEU6_OAUTH_TOKEN_ADMIN_ID_JEU6_JEU6_ADMIN_USER_USER_ID` (`admin_id`),
  ADD KEY `FK_JEU6_OAUTH_TOKEN_CSTR_ID_JEU6_JEU6_CSTR_ENTT_ENTT_ID` (`customer_id`);

--
-- Indexes for table `jeu6_paypal_cert`
--
ALTER TABLE `jeu6_paypal_cert`
  ADD PRIMARY KEY (`cert_id`),
  ADD KEY `IDX_OZSS_PAYPAL_CERT_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_paypal_payment_transaction`
--
ALTER TABLE `jeu6_paypal_payment_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `UNQ_JEU6_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`);

--
-- Indexes for table `jeu6_paypal_settlement_report`
--
ALTER TABLE `jeu6_paypal_settlement_report`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `UNQ_OZSS_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`);

--
-- Indexes for table `jeu6_paypal_settlement_report_row`
--
ALTER TABLE `jeu6_paypal_settlement_report_row`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `IDX_OZSS_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`);

--
-- Indexes for table `jeu6_perfectus_mainslider`
--
ALTER TABLE `jeu6_perfectus_mainslider`
  ADD PRIMARY KEY (`pslide_id`);

--
-- Indexes for table `jeu6_perfectus_mainslider_store`
--
ALTER TABLE `jeu6_perfectus_mainslider_store`
  ADD PRIMARY KEY (`pslide_id`,`pslide_store_id`),
  ADD KEY `FK_BANNERS_STORE_STORE` (`pslide_store_id`);

--
-- Indexes for table `jeu6_permission_block`
--
ALTER TABLE `jeu6_permission_block`
  ADD PRIMARY KEY (`block_id`),
  ADD UNIQUE KEY `UNQ_JEU6_PERMISSION_BLOCK_BLOCK_NAME` (`block_name`);

--
-- Indexes for table `jeu6_permission_variable`
--
ALTER TABLE `jeu6_permission_variable`
  ADD PRIMARY KEY (`variable_id`,`variable_name`),
  ADD UNIQUE KEY `UNQ_JEU6_PERMISSION_VARIABLE_VARIABLE_NAME` (`variable_name`);

--
-- Indexes for table `jeu6_persistent_session`
--
ALTER TABLE `jeu6_persistent_session`
  ADD PRIMARY KEY (`persistent_id`),
  ADD UNIQUE KEY `IDX_OZSS_PERSISTENT_SESSION_KEY` (`key`),
  ADD UNIQUE KEY `IDX_OZSS_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  ADD KEY `FK_OZSS_PERSISTENT_SESS_WS_ID_OZSS_CORE_WS_WS_ID` (`website_id`);

--
-- Indexes for table `jeu6_poll`
--
ALTER TABLE `jeu6_poll`
  ADD PRIMARY KEY (`poll_id`),
  ADD KEY `IDX_OZSS_POLL_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_poll_answer`
--
ALTER TABLE `jeu6_poll_answer`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `IDX_OZSS_POLL_ANSWER_POLL_ID` (`poll_id`);

--
-- Indexes for table `jeu6_poll_store`
--
ALTER TABLE `jeu6_poll_store`
  ADD PRIMARY KEY (`poll_id`,`store_id`),
  ADD KEY `IDX_OZSS_POLL_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_poll_vote`
--
ALTER TABLE `jeu6_poll_vote`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `IDX_OZSS_POLL_VOTE_POLL_ANSWER_ID` (`poll_answer_id`);

--
-- Indexes for table `jeu6_product_alert_price`
--
ALTER TABLE `jeu6_product_alert_price`
  ADD PRIMARY KEY (`alert_price_id`),
  ADD KEY `IDX_OZSS_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_product_alert_stock`
--
ALTER TABLE `jeu6_product_alert_stock`
  ADD PRIMARY KEY (`alert_stock_id`),
  ADD KEY `IDX_OZSS_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_rating`
--
ALTER TABLE `jeu6_rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `UNQ_OZSS_RATING_RATING_CODE` (`rating_code`),
  ADD KEY `IDX_OZSS_RATING_ENTITY_ID` (`entity_id`);

--
-- Indexes for table `jeu6_rating_entity`
--
ALTER TABLE `jeu6_rating_entity`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_RATING_ENTITY_ENTITY_CODE` (`entity_code`);

--
-- Indexes for table `jeu6_rating_option`
--
ALTER TABLE `jeu6_rating_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_OZSS_RATING_OPTION_RATING_ID` (`rating_id`);

--
-- Indexes for table `jeu6_rating_option_vote`
--
ALTER TABLE `jeu6_rating_option_vote`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `IDX_OZSS_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  ADD KEY `FK_OZSS_RATING_OPTION_VOTE_REVIEW_ID_OZSS_REVIEW_REVIEW_ID` (`review_id`);

--
-- Indexes for table `jeu6_rating_option_vote_aggregated`
--
ALTER TABLE `jeu6_rating_option_vote_aggregated`
  ADD PRIMARY KEY (`primary_id`),
  ADD KEY `IDX_OZSS_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  ADD KEY `IDX_OZSS_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_rating_store`
--
ALTER TABLE `jeu6_rating_store`
  ADD PRIMARY KEY (`rating_id`,`store_id`),
  ADD KEY `IDX_OZSS_RATING_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_rating_title`
--
ALTER TABLE `jeu6_rating_title`
  ADD PRIMARY KEY (`rating_id`,`store_id`),
  ADD KEY `IDX_OZSS_RATING_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_report_compared_product_index`
--
ALTER TABLE `jeu6_report_compared_product_index`
  ADD PRIMARY KEY (`index_id`),
  ADD UNIQUE KEY `UNQ_OZSS_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD UNIQUE KEY `UNQ_OZSS_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `IDX_OZSS_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  ADD KEY `IDX_OZSS_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_report_event`
--
ALTER TABLE `jeu6_report_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `IDX_OZSS_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  ADD KEY `IDX_OZSS_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  ADD KEY `IDX_OZSS_REPORT_EVENT_OBJECT_ID` (`object_id`),
  ADD KEY `IDX_OZSS_REPORT_EVENT_SUBTYPE` (`subtype`),
  ADD KEY `IDX_OZSS_REPORT_EVENT_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_report_event_types`
--
ALTER TABLE `jeu6_report_event_types`
  ADD PRIMARY KEY (`event_type_id`);

--
-- Indexes for table `jeu6_report_viewed_product_aggregated_daily`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_JEU6_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_JEU6_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_report_viewed_product_aggregated_monthly`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_JEU6_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_JEU6_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_report_viewed_product_aggregated_yearly`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_yearly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_JEU6_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_JEU6_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_JEU6_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_report_viewed_product_index`
--
ALTER TABLE `jeu6_report_viewed_product_index`
  ADD PRIMARY KEY (`index_id`),
  ADD UNIQUE KEY `UNQ_OZSS_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  ADD UNIQUE KEY `UNQ_OZSS_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  ADD KEY `IDX_OZSS_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  ADD KEY `IDX_OZSS_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_review`
--
ALTER TABLE `jeu6_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `IDX_OZSS_REVIEW_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_REVIEW_STATUS_ID` (`status_id`),
  ADD KEY `IDX_OZSS_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`);

--
-- Indexes for table `jeu6_review_detail`
--
ALTER TABLE `jeu6_review_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `IDX_OZSS_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  ADD KEY `IDX_OZSS_REVIEW_DETAIL_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `jeu6_review_entity`
--
ALTER TABLE `jeu6_review_entity`
  ADD PRIMARY KEY (`entity_id`);

--
-- Indexes for table `jeu6_review_entity_summary`
--
ALTER TABLE `jeu6_review_entity_summary`
  ADD PRIMARY KEY (`primary_id`),
  ADD KEY `IDX_OZSS_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_review_status`
--
ALTER TABLE `jeu6_review_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `jeu6_review_store`
--
ALTER TABLE `jeu6_review_store`
  ADD PRIMARY KEY (`review_id`,`store_id`),
  ADD KEY `IDX_OZSS_REVIEW_STORE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_salesrule`
--
ALTER TABLE `jeu6_salesrule`
  ADD PRIMARY KEY (`rule_id`),
  ADD KEY `IDX_OZSS_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`);

--
-- Indexes for table `jeu6_salesrule_coupon`
--
ALTER TABLE `jeu6_salesrule_coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALESRULE_COUPON_CODE` (`code`),
  ADD UNIQUE KEY `UNQ_OZSS_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  ADD KEY `IDX_OZSS_SALESRULE_COUPON_RULE_ID` (`rule_id`);

--
-- Indexes for table `jeu6_salesrule_coupon_usage`
--
ALTER TABLE `jeu6_salesrule_coupon_usage`
  ADD PRIMARY KEY (`coupon_id`,`customer_id`),
  ADD KEY `IDX_OZSS_SALESRULE_COUPON_USAGE_COUPON_ID` (`coupon_id`),
  ADD KEY `IDX_OZSS_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`);

--
-- Indexes for table `jeu6_salesrule_customer`
--
ALTER TABLE `jeu6_salesrule_customer`
  ADD PRIMARY KEY (`rule_customer_id`),
  ADD KEY `IDX_OZSS_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  ADD KEY `IDX_OZSS_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`);

--
-- Indexes for table `jeu6_salesrule_customer_group`
--
ALTER TABLE `jeu6_salesrule_customer_group`
  ADD PRIMARY KEY (`rule_id`,`customer_group_id`),
  ADD KEY `IDX_JEU6_SALESRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  ADD KEY `IDX_JEU6_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `jeu6_salesrule_label`
--
ALTER TABLE `jeu6_salesrule_label`
  ADD PRIMARY KEY (`label_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  ADD KEY `IDX_OZSS_SALESRULE_LABEL_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALESRULE_LABEL_RULE_ID` (`rule_id`);

--
-- Indexes for table `jeu6_salesrule_product_attribute`
--
ALTER TABLE `jeu6_salesrule_product_attribute`
  ADD PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  ADD KEY `IDX_OZSS_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  ADD KEY `IDX_OZSS_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `jeu6_salesrule_website`
--
ALTER TABLE `jeu6_salesrule_website`
  ADD PRIMARY KEY (`rule_id`,`website_id`),
  ADD KEY `IDX_JEU6_SALESRULE_WEBSITE_RULE_ID` (`rule_id`),
  ADD KEY `IDX_JEU6_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`);

--
-- Indexes for table `jeu6_sales_bestsellers_aggregated_daily`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_daily`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_OZSS_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_OZSS_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_yearly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  ADD KEY `IDX_OZSS_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`);

--
-- Indexes for table `jeu6_sales_billing_agreement`
--
ALTER TABLE `jeu6_sales_billing_agreement`
  ADD PRIMARY KEY (`agreement_id`),
  ADD KEY `IDX_OZSS_SALES_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_SALES_BILLING_AGREEMENT_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_billing_agreement_order`
--
ALTER TABLE `jeu6_sales_billing_agreement_order`
  ADD PRIMARY KEY (`agreement_id`,`order_id`),
  ADD KEY `IDX_OZSS_SALES_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`);

--
-- Indexes for table `jeu6_sales_flat_creditmemo`
--
ALTER TABLE `jeu6_sales_flat_creditmemo`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_CREDITMEMO_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_STATE` (`state`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_CREATED_AT` (`created_at`);

--
-- Indexes for table `jeu6_sales_flat_creditmemo_comment`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_creditmemo_grid`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_CREDITMEMO_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_CREDITMEMO_STATUS` (`creditmemo_status`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_STATE` (`state`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`);

--
-- Indexes for table `jeu6_sales_flat_creditmemo_item`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_invoice`
--
ALTER TABLE `jeu6_sales_flat_invoice`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_INVOICE_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_STATE` (`state`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_CREATED_AT` (`created_at`);

--
-- Indexes for table `jeu6_sales_flat_invoice_comment`
--
ALTER TABLE `jeu6_sales_flat_invoice_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_invoice_grid`
--
ALTER TABLE `jeu6_sales_flat_invoice_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_INVOICE_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_STATE` (`state`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_GRID_BILLING_NAME` (`billing_name`);

--
-- Indexes for table `jeu6_sales_flat_invoice_item`
--
ALTER TABLE `jeu6_sales_flat_invoice_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_INVOICE_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_order`
--
ALTER TABLE `jeu6_sales_flat_order`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_ORDER_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_STATUS` (`status`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_STATE` (`state`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_QUOTE_ID` (`quote_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `jeu6_sales_flat_order_address`
--
ALTER TABLE `jeu6_sales_flat_order_address`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_ADDRESS_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_order_grid`
--
ALTER TABLE `jeu6_sales_flat_order_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_ORDER_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_STATUS` (`status`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_BILLING_NAME` (`billing_name`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_GRID_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `jeu6_sales_flat_order_item`
--
ALTER TABLE `jeu6_sales_flat_order_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_ITEM_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_flat_order_payment`
--
ALTER TABLE `jeu6_sales_flat_order_payment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_PAYMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_order_status_history`
--
ALTER TABLE `jeu6_sales_flat_order_status_history`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`);

--
-- Indexes for table `jeu6_sales_flat_quote`
--
ALTER TABLE `jeu6_sales_flat_quote`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_flat_quote_address`
--
ALTER TABLE `jeu6_sales_flat_quote_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`);

--
-- Indexes for table `jeu6_sales_flat_quote_address_item`
--
ALTER TABLE `jeu6_sales_flat_quote_address_item`
  ADD PRIMARY KEY (`address_item_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`);

--
-- Indexes for table `jeu6_sales_flat_quote_item`
--
ALTER TABLE `jeu6_sales_flat_quote_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_flat_quote_item_option`
--
ALTER TABLE `jeu6_sales_flat_quote_item_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`);

--
-- Indexes for table `jeu6_sales_flat_quote_payment`
--
ALTER TABLE `jeu6_sales_flat_quote_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`);

--
-- Indexes for table `jeu6_sales_flat_quote_shipping_rate`
--
ALTER TABLE `jeu6_sales_flat_quote_shipping_rate`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`);

--
-- Indexes for table `jeu6_sales_flat_shipment`
--
ALTER TABLE `jeu6_sales_flat_shipment`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_SHIPMENT_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_TOTAL_QTY` (`total_qty`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_UPDATED_AT` (`updated_at`);

--
-- Indexes for table `jeu6_sales_flat_shipment_comment`
--
ALTER TABLE `jeu6_sales_flat_shipment_comment`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_shipment_grid`
--
ALTER TABLE `jeu6_sales_flat_shipment_grid`
  ADD PRIMARY KEY (`entity_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_FLAT_SHIPMENT_GRID_INCREMENT_ID` (`increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`);

--
-- Indexes for table `jeu6_sales_flat_shipment_item`
--
ALTER TABLE `jeu6_sales_flat_shipment_item`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_ITEM_PARENT_ID` (`parent_id`);

--
-- Indexes for table `jeu6_sales_flat_shipment_track`
--
ALTER TABLE `jeu6_sales_flat_shipment_track`
  ADD PRIMARY KEY (`entity_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_FLAT_SHIPMENT_TRACK_CREATED_AT` (`created_at`);

--
-- Indexes for table `jeu6_sales_invoiced_aggregated`
--
ALTER TABLE `jeu6_sales_invoiced_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_OZSS_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_invoiced_aggregated_order`
--
ALTER TABLE `jeu6_sales_invoiced_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_INVOICED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_OZSS_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_order_aggregated_created`
--
ALTER TABLE `jeu6_sales_order_aggregated_created`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_OZSS_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_order_aggregated_updated`
--
ALTER TABLE `jeu6_sales_order_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_JEU6_SALES_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_JEU6_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_order_status`
--
ALTER TABLE `jeu6_sales_order_status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `jeu6_sales_order_status_label`
--
ALTER TABLE `jeu6_sales_order_status_label`
  ADD PRIMARY KEY (`status`,`store_id`),
  ADD KEY `IDX_OZSS_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_order_status_state`
--
ALTER TABLE `jeu6_sales_order_status_state`
  ADD PRIMARY KEY (`status`,`state`);

--
-- Indexes for table `jeu6_sales_order_tax`
--
ALTER TABLE `jeu6_sales_order_tax`
  ADD PRIMARY KEY (`tax_id`),
  ADD KEY `IDX_OZSS_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`);

--
-- Indexes for table `jeu6_sales_order_tax_item`
--
ALTER TABLE `jeu6_sales_order_tax_item`
  ADD PRIMARY KEY (`tax_item_id`),
  ADD UNIQUE KEY `UNQ_JEU6_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  ADD KEY `IDX_JEU6_SALES_ORDER_TAX_ITEM_TAX_ID` (`tax_id`),
  ADD KEY `IDX_JEU6_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`);

--
-- Indexes for table `jeu6_sales_payment_transaction`
--
ALTER TABLE `jeu6_sales_payment_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  ADD KEY `IDX_OZSS_SALES_PAYMENT_TRANSACTION_ORDER_ID` (`order_id`),
  ADD KEY `IDX_OZSS_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  ADD KEY `IDX_OZSS_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`);

--
-- Indexes for table `jeu6_sales_recurring_profile`
--
ALTER TABLE `jeu6_sales_recurring_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_RECURRING_PROFILE_INTERNAL_REFERENCE_ID` (`internal_reference_id`),
  ADD KEY `IDX_OZSS_SALES_RECURRING_PROFILE_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_SALES_RECURRING_PROFILE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_recurring_profile_order`
--
ALTER TABLE `jeu6_sales_recurring_profile_order`
  ADD PRIMARY KEY (`link_id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_RECURRING_PROFILE_ORDER_PROFILE_ID_ORDER_ID` (`profile_id`,`order_id`),
  ADD KEY `IDX_OZSS_SALES_RECURRING_PROFILE_ORDER_ORDER_ID` (`order_id`);

--
-- Indexes for table `jeu6_sales_refunded_aggregated`
--
ALTER TABLE `jeu6_sales_refunded_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_OZSS_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_refunded_aggregated_order`
--
ALTER TABLE `jeu6_sales_refunded_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNQ_OZSS_SALES_REFUNDED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  ADD KEY `IDX_OZSS_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_shipping_aggregated`
--
ALTER TABLE `jeu6_sales_shipping_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `D1894DF8364954D15795A9B7C78DE8A3` (`period`,`store_id`,`order_status`,`shipping_description`),
  ADD KEY `IDX_OZSS_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sales_shipping_aggregated_order`
--
ALTER TABLE `jeu6_sales_shipping_aggregated_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `24FFA1F3DFC47DF18E63D61A08830316` (`period`,`store_id`,`order_status`,`shipping_description`),
  ADD KEY `IDX_OZSS_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_sendfriend_log`
--
ALTER TABLE `jeu6_sendfriend_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `IDX_OZSS_SENDFRIEND_LOG_IP` (`ip`),
  ADD KEY `IDX_OZSS_SENDFRIEND_LOG_TIME` (`time`);

--
-- Indexes for table `jeu6_shipping_tablerate`
--
ALTER TABLE `jeu6_shipping_tablerate`
  ADD PRIMARY KEY (`pk`),
  ADD UNIQUE KEY `F798330B832468094157E480362A2314` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`);

--
-- Indexes for table `jeu6_sitemap`
--
ALTER TABLE `jeu6_sitemap`
  ADD PRIMARY KEY (`sitemap_id`),
  ADD KEY `IDX_OZSS_SITEMAP_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_skuautogenerate`
--
ALTER TABLE `jeu6_skuautogenerate`
  ADD PRIMARY KEY (`skuautogenerate_id`);

--
-- Indexes for table `jeu6_tag`
--
ALTER TABLE `jeu6_tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `FK_OZSS_TAG_FIRST_CUSTOMER_ID_OZSS_CUSTOMER_ENTITY_ENTITY_ID` (`first_customer_id`),
  ADD KEY `FK_OZSS_TAG_FIRST_STORE_ID_OZSS_CORE_STORE_STORE_ID` (`first_store_id`);

--
-- Indexes for table `jeu6_tag_properties`
--
ALTER TABLE `jeu6_tag_properties`
  ADD PRIMARY KEY (`tag_id`,`store_id`),
  ADD KEY `IDX_OZSS_TAG_PROPERTIES_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_tag_relation`
--
ALTER TABLE `jeu6_tag_relation`
  ADD PRIMARY KEY (`tag_relation_id`),
  ADD UNIQUE KEY `UNQ_OZSS_TAG_RELATION_TAG_ID_CUSTOMER_ID_PRODUCT_ID_STORE_ID` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  ADD KEY `IDX_OZSS_TAG_RELATION_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_TAG_RELATION_TAG_ID` (`tag_id`),
  ADD KEY `IDX_OZSS_TAG_RELATION_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_TAG_RELATION_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_tag_summary`
--
ALTER TABLE `jeu6_tag_summary`
  ADD PRIMARY KEY (`tag_id`,`store_id`),
  ADD KEY `IDX_OZSS_TAG_SUMMARY_STORE_ID` (`store_id`),
  ADD KEY `IDX_OZSS_TAG_SUMMARY_TAG_ID` (`tag_id`);

--
-- Indexes for table `jeu6_tax_calculation`
--
ALTER TABLE `jeu6_tax_calculation`
  ADD PRIMARY KEY (`tax_calculation_id`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  ADD KEY `C6CA1E5B653F98E93CA410019FC6DF98` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`);

--
-- Indexes for table `jeu6_tax_calculation_rate`
--
ALTER TABLE `jeu6_tax_calculation_rate`
  ADD PRIMARY KEY (`tax_calculation_rate_id`),
  ADD KEY `IDX_OZSS_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_RATE_CODE` (`code`),
  ADD KEY `A664B432FB6D5918266CCDEFB659BD14` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`);

--
-- Indexes for table `jeu6_tax_calculation_rate_title`
--
ALTER TABLE `jeu6_tax_calculation_rate_title`
  ADD PRIMARY KEY (`tax_calculation_rate_title_id`),
  ADD KEY `IDX_OZSS_TAX_CALC_RATE_TTL_TAX_CALC_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_tax_calculation_rule`
--
ALTER TABLE `jeu6_tax_calculation_rule`
  ADD PRIMARY KEY (`tax_calculation_rule_id`),
  ADD KEY `IDX_OZSS_TAX_CALC_RULE_PRIORITY_POSITION_TAX_CALC_RULE_ID` (`priority`,`position`,`tax_calculation_rule_id`),
  ADD KEY `IDX_OZSS_TAX_CALCULATION_RULE_CODE` (`code`);

--
-- Indexes for table `jeu6_tax_class`
--
ALTER TABLE `jeu6_tax_class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `jeu6_tax_order_aggregated_created`
--
ALTER TABLE `jeu6_tax_order_aggregated_created`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `C9BD4DD687A8126025480A60BAEBC0C6` (`period`,`store_id`,`code`,`percent`,`order_status`),
  ADD KEY `IDX_OZSS_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_tax_order_aggregated_updated`
--
ALTER TABLE `jeu6_tax_order_aggregated_updated`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `E5D0F0BFE145B78AF4171BE55608F50D` (`period`,`store_id`,`code`,`percent`,`order_status`),
  ADD KEY `IDX_JEU6_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_weee_discount`
--
ALTER TABLE `jeu6_weee_discount`
  ADD KEY `IDX_OZSS_WEEE_DISCOUNT_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_WEEE_DISCOUNT_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_WEEE_DISCOUNT_CUSTOMER_GROUP_ID` (`customer_group_id`);

--
-- Indexes for table `jeu6_weee_tax`
--
ALTER TABLE `jeu6_weee_tax`
  ADD PRIMARY KEY (`value_id`),
  ADD KEY `IDX_OZSS_WEEE_TAX_WEBSITE_ID` (`website_id`),
  ADD KEY `IDX_OZSS_WEEE_TAX_ENTITY_ID` (`entity_id`),
  ADD KEY `IDX_OZSS_WEEE_TAX_COUNTRY` (`country`),
  ADD KEY `IDX_OZSS_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`);

--
-- Indexes for table `jeu6_widget`
--
ALTER TABLE `jeu6_widget`
  ADD PRIMARY KEY (`widget_id`),
  ADD KEY `IDX_OZSS_WIDGET_WIDGET_CODE` (`widget_code`);

--
-- Indexes for table `jeu6_widget_instance`
--
ALTER TABLE `jeu6_widget_instance`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `jeu6_widget_instance_page`
--
ALTER TABLE `jeu6_widget_instance_page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `IDX_OZSS_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`);

--
-- Indexes for table `jeu6_widget_instance_page_layout`
--
ALTER TABLE `jeu6_widget_instance_page_layout`
  ADD UNIQUE KEY `UNQ_OZSS_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  ADD KEY `IDX_OZSS_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  ADD KEY `IDX_OZSS_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID` (`layout_update_id`);

--
-- Indexes for table `jeu6_wishlist`
--
ALTER TABLE `jeu6_wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD UNIQUE KEY `UNQ_OZSS_WISHLIST_CUSTOMER_ID` (`customer_id`),
  ADD KEY `IDX_OZSS_WISHLIST_SHARED` (`shared`);

--
-- Indexes for table `jeu6_wishlist_item`
--
ALTER TABLE `jeu6_wishlist_item`
  ADD PRIMARY KEY (`wishlist_item_id`),
  ADD KEY `IDX_OZSS_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  ADD KEY `IDX_OZSS_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  ADD KEY `IDX_OZSS_WISHLIST_ITEM_STORE_ID` (`store_id`);

--
-- Indexes for table `jeu6_wishlist_item_option`
--
ALTER TABLE `jeu6_wishlist_item_option`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `FK_0B3BF126B399685CF1833465AB4B3159` (`wishlist_item_id`);

--
-- Indexes for table `jeu6_xmlconnect_application`
--
ALTER TABLE `jeu6_xmlconnect_application`
  ADD PRIMARY KEY (`application_id`),
  ADD UNIQUE KEY `UNQ_OZSS_OZSS_XMLCONNECT_APPLICATION_CODE` (`code`),
  ADD KEY `FK_DA4356AE96546660CBA9E4617FB0CBD1` (`store_id`);

--
-- Indexes for table `jeu6_xmlconnect_config_data`
--
ALTER TABLE `jeu6_xmlconnect_config_data`
  ADD UNIQUE KEY `UNQ_OZSS_OZSS_XMLCONNECT_CONFIG_DATA_APPLICATION_ID_CTGR_PATH` (`application_id`,`category`,`path`);

--
-- Indexes for table `jeu6_xmlconnect_history`
--
ALTER TABLE `jeu6_xmlconnect_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `FK_30B63A00D9CCB1AC03A101010A3891C2` (`application_id`);

--
-- Indexes for table `jeu6_xmlconnect_notification_template`
--
ALTER TABLE `jeu6_xmlconnect_notification_template`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `FK_2941C80FA29758E33352FED4A2C086BF` (`application_id`);

--
-- Indexes for table `jeu6_xmlconnect_queue`
--
ALTER TABLE `jeu6_xmlconnect_queue`
  ADD PRIMARY KEY (`queue_id`),
  ADD KEY `FK_2279F62912BC86A23704DF9B558AD03A` (`template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jeu6_adminnotification_inbox`
--
ALTER TABLE `jeu6_adminnotification_inbox`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Notification id', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jeu6_admin_assert`
--
ALTER TABLE `jeu6_admin_assert`
  MODIFY `assert_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Assert ID';
--
-- AUTO_INCREMENT for table `jeu6_admin_role`
--
ALTER TABLE `jeu6_admin_role`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_admin_rule`
--
ALTER TABLE `jeu6_admin_rule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_admin_user`
--
ALTER TABLE `jeu6_admin_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_api2_acl_attribute`
--
ALTER TABLE `jeu6_api2_acl_attribute`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';
--
-- AUTO_INCREMENT for table `jeu6_api2_acl_role`
--
ALTER TABLE `jeu6_api2_acl_role`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_api2_acl_rule`
--
ALTER TABLE `jeu6_api2_acl_rule`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';
--
-- AUTO_INCREMENT for table `jeu6_api_assert`
--
ALTER TABLE `jeu6_api_assert`
  MODIFY `assert_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Assert id';
--
-- AUTO_INCREMENT for table `jeu6_api_role`
--
ALTER TABLE `jeu6_api_role`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role id';
--
-- AUTO_INCREMENT for table `jeu6_api_rule`
--
ALTER TABLE `jeu6_api_rule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Api rule Id';
--
-- AUTO_INCREMENT for table `jeu6_api_user`
--
ALTER TABLE `jeu6_api_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User id';
--
-- AUTO_INCREMENT for table `jeu6_aw_blog`
--
ALTER TABLE `jeu6_aw_blog`
  MODIFY `post_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jeu6_aw_blog_cat`
--
ALTER TABLE `jeu6_aw_blog_cat`
  MODIFY `cat_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_aw_blog_comment`
--
ALTER TABLE `jeu6_aw_blog_comment`
  MODIFY `comment_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jeu6_aw_blog_tags`
--
ALTER TABLE `jeu6_aw_blog_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jeu6_cataloginventory_stock`
--
ALTER TABLE `jeu6_cataloginventory_stock`
  MODIFY `stock_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Stock Id', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_cataloginventory_stock_item`
--
ALTER TABLE `jeu6_cataloginventory_stock_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id', AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `jeu6_catalogrule`
--
ALTER TABLE `jeu6_catalogrule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Id';
--
-- AUTO_INCREMENT for table `jeu6_catalogrule_product`
--
ALTER TABLE `jeu6_catalogrule_product`
  MODIFY `rule_product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id';
--
-- AUTO_INCREMENT for table `jeu6_catalogrule_product_price`
--
ALTER TABLE `jeu6_catalogrule_product_price`
  MODIFY `rule_product_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId';
--
-- AUTO_INCREMENT for table `jeu6_catalogsearch_fulltext`
--
ALTER TABLE `jeu6_catalogsearch_fulltext`
  MODIFY `fulltext_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `jeu6_catalogsearch_query`
--
ALTER TABLE `jeu6_catalogsearch_query`
  MODIFY `query_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Query ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_category_entity`
--
ALTER TABLE `jeu6_catalog_category_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jeu6_catalog_category_entity_datetime`
--
ALTER TABLE `jeu6_catalog_category_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_catalog_category_entity_decimal`
--
ALTER TABLE `jeu6_catalog_category_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_catalog_category_entity_int`
--
ALTER TABLE `jeu6_catalog_category_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `jeu6_catalog_category_entity_text`
--
ALTER TABLE `jeu6_catalog_category_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `jeu6_catalog_category_entity_varchar`
--
ALTER TABLE `jeu6_catalog_category_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `jeu6_catalog_compare_item`
--
ALTER TABLE `jeu6_catalog_compare_item`
  MODIFY `catalog_compare_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_bundle_option`
--
ALTER TABLE `jeu6_catalog_product_bundle_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_bundle_option_value`
--
ALTER TABLE `jeu6_catalog_product_bundle_option_value`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_bundle_selection`
--
ALTER TABLE `jeu6_catalog_product_bundle_selection`
  MODIFY `selection_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Selection Id';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity`
--
ALTER TABLE `jeu6_catalog_product_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID', AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_datetime`
--
ALTER TABLE `jeu6_catalog_product_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_decimal`
--
ALTER TABLE `jeu6_catalog_product_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_gallery`
--
ALTER TABLE `jeu6_catalog_product_entity_gallery`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_group_price`
--
ALTER TABLE `jeu6_catalog_product_entity_group_price`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_int`
--
ALTER TABLE `jeu6_catalog_product_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_media_gallery`
--
ALTER TABLE `jeu6_catalog_product_entity_media_gallery`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_text`
--
ALTER TABLE `jeu6_catalog_product_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_tier_price`
--
ALTER TABLE `jeu6_catalog_product_entity_tier_price`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_entity_varchar`
--
ALTER TABLE `jeu6_catalog_product_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=267;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_link`
--
ALTER TABLE `jeu6_catalog_product_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_link_attribute`
--
ALTER TABLE `jeu6_catalog_product_link_attribute`
  MODIFY `product_link_attribute_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_link_attribute_decimal`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_decimal`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_link_attribute_int`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_int`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_link_attribute_varchar`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_varchar`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_link_type`
--
ALTER TABLE `jeu6_catalog_product_link_type`
  MODIFY `link_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_option`
--
ALTER TABLE `jeu6_catalog_product_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_option_price`
--
ALTER TABLE `jeu6_catalog_product_option_price`
  MODIFY `option_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_option_title`
--
ALTER TABLE `jeu6_catalog_product_option_title`
  MODIFY `option_title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_option_type_price`
--
ALTER TABLE `jeu6_catalog_product_option_type_price`
  MODIFY `option_type_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_option_type_title`
--
ALTER TABLE `jeu6_catalog_product_option_type_title`
  MODIFY `option_type_title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_option_type_value`
--
ALTER TABLE `jeu6_catalog_product_option_type_value`
  MODIFY `option_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_super_attribute`
--
ALTER TABLE `jeu6_catalog_product_super_attribute`
  MODIFY `product_super_attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_super_attribute_label`
--
ALTER TABLE `jeu6_catalog_product_super_attribute_label`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_super_attribute_pricing`
--
ALTER TABLE `jeu6_catalog_product_super_attribute_pricing`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value ID';
--
-- AUTO_INCREMENT for table `jeu6_catalog_product_super_link`
--
ALTER TABLE `jeu6_catalog_product_super_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_checkout_agreement`
--
ALTER TABLE `jeu6_checkout_agreement`
  MODIFY `agreement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id';
--
-- AUTO_INCREMENT for table `jeu6_cms_block`
--
ALTER TABLE `jeu6_cms_block`
  MODIFY `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID', AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `jeu6_cms_page`
--
ALTER TABLE `jeu6_cms_page`
  MODIFY `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID', AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `jeu6_core_config_data`
--
ALTER TABLE `jeu6_core_config_data`
  MODIFY `config_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Config Id', AUTO_INCREMENT=963;
--
-- AUTO_INCREMENT for table `jeu6_core_email_queue`
--
ALTER TABLE `jeu6_core_email_queue`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Message Id';
--
-- AUTO_INCREMENT for table `jeu6_core_email_queue_recipients`
--
ALTER TABLE `jeu6_core_email_queue_recipients`
  MODIFY `recipient_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Recipient Id';
--
-- AUTO_INCREMENT for table `jeu6_core_email_template`
--
ALTER TABLE `jeu6_core_email_template`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template Id';
--
-- AUTO_INCREMENT for table `jeu6_core_flag`
--
ALTER TABLE `jeu6_core_flag`
  MODIFY `flag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Flag Id', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_core_layout_link`
--
ALTER TABLE `jeu6_core_layout_link`
  MODIFY `layout_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Id';
--
-- AUTO_INCREMENT for table `jeu6_core_layout_update`
--
ALTER TABLE `jeu6_core_layout_update`
  MODIFY `layout_update_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id';
--
-- AUTO_INCREMENT for table `jeu6_core_store`
--
ALTER TABLE `jeu6_core_store`
  MODIFY `store_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Store Id', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_core_store_group`
--
ALTER TABLE `jeu6_core_store_group`
  MODIFY `group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Group Id', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_core_translate`
--
ALTER TABLE `jeu6_core_translate`
  MODIFY `key_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation';
--
-- AUTO_INCREMENT for table `jeu6_core_url_rewrite`
--
ALTER TABLE `jeu6_core_url_rewrite`
  MODIFY `url_rewrite_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id', AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `jeu6_core_variable`
--
ALTER TABLE `jeu6_core_variable`
  MODIFY `variable_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable Id';
--
-- AUTO_INCREMENT for table `jeu6_core_variable_value`
--
ALTER TABLE `jeu6_core_variable_value`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id';
--
-- AUTO_INCREMENT for table `jeu6_core_website`
--
ALTER TABLE `jeu6_core_website`
  MODIFY `website_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Website Id', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_coupon_aggregated`
--
ALTER TABLE `jeu6_coupon_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_coupon_aggregated_order`
--
ALTER TABLE `jeu6_coupon_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_coupon_aggregated_updated`
--
ALTER TABLE `jeu6_coupon_aggregated_updated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_cron_schedule`
--
ALTER TABLE `jeu6_cron_schedule`
  MODIFY `schedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_address_entity`
--
ALTER TABLE `jeu6_customer_address_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_address_entity_datetime`
--
ALTER TABLE `jeu6_customer_address_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_address_entity_decimal`
--
ALTER TABLE `jeu6_customer_address_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_address_entity_int`
--
ALTER TABLE `jeu6_customer_address_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_address_entity_text`
--
ALTER TABLE `jeu6_customer_address_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_address_entity_varchar`
--
ALTER TABLE `jeu6_customer_address_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_entity`
--
ALTER TABLE `jeu6_customer_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_entity_datetime`
--
ALTER TABLE `jeu6_customer_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_entity_decimal`
--
ALTER TABLE `jeu6_customer_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_entity_int`
--
ALTER TABLE `jeu6_customer_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_entity_text`
--
ALTER TABLE `jeu6_customer_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_entity_varchar`
--
ALTER TABLE `jeu6_customer_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_flowpassword`
--
ALTER TABLE `jeu6_customer_flowpassword`
  MODIFY `flowpassword_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Flow password Id';
--
-- AUTO_INCREMENT for table `jeu6_customer_group`
--
ALTER TABLE `jeu6_customer_group`
  MODIFY `customer_group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jeu6_dataflow_batch`
--
ALTER TABLE `jeu6_dataflow_batch`
  MODIFY `batch_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Batch Id';
--
-- AUTO_INCREMENT for table `jeu6_dataflow_batch_export`
--
ALTER TABLE `jeu6_dataflow_batch_export`
  MODIFY `batch_export_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Batch Export Id';
--
-- AUTO_INCREMENT for table `jeu6_dataflow_batch_import`
--
ALTER TABLE `jeu6_dataflow_batch_import`
  MODIFY `batch_import_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Batch Import Id';
--
-- AUTO_INCREMENT for table `jeu6_dataflow_import_data`
--
ALTER TABLE `jeu6_dataflow_import_data`
  MODIFY `import_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Import Id';
--
-- AUTO_INCREMENT for table `jeu6_dataflow_profile`
--
ALTER TABLE `jeu6_dataflow_profile`
  MODIFY `profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Profile Id', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `jeu6_dataflow_profile_history`
--
ALTER TABLE `jeu6_dataflow_profile_history`
  MODIFY `history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'History Id', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `jeu6_dataflow_session`
--
ALTER TABLE `jeu6_dataflow_session`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Session Id';
--
-- AUTO_INCREMENT for table `jeu6_design_change`
--
ALTER TABLE `jeu6_design_change`
  MODIFY `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id';
--
-- AUTO_INCREMENT for table `jeu6_directory_country_format`
--
ALTER TABLE `jeu6_directory_country_format`
  MODIFY `country_format_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id';
--
-- AUTO_INCREMENT for table `jeu6_directory_country_region`
--
ALTER TABLE `jeu6_directory_country_region`
  MODIFY `region_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Region Id', AUTO_INCREMENT=485;
--
-- AUTO_INCREMENT for table `jeu6_downloadable_link`
--
ALTER TABLE `jeu6_downloadable_link`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link ID';
--
-- AUTO_INCREMENT for table `jeu6_downloadable_link_price`
--
ALTER TABLE `jeu6_downloadable_link_price`
  MODIFY `price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Price ID';
--
-- AUTO_INCREMENT for table `jeu6_downloadable_link_purchased`
--
ALTER TABLE `jeu6_downloadable_link_purchased`
  MODIFY `purchased_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID';
--
-- AUTO_INCREMENT for table `jeu6_downloadable_link_purchased_item`
--
ALTER TABLE `jeu6_downloadable_link_purchased_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item ID';
--
-- AUTO_INCREMENT for table `jeu6_downloadable_link_title`
--
ALTER TABLE `jeu6_downloadable_link_title`
  MODIFY `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID';
--
-- AUTO_INCREMENT for table `jeu6_downloadable_sample`
--
ALTER TABLE `jeu6_downloadable_sample`
  MODIFY `sample_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sample ID';
--
-- AUTO_INCREMENT for table `jeu6_downloadable_sample_title`
--
ALTER TABLE `jeu6_downloadable_sample_title`
  MODIFY `title_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Title ID';
--
-- AUTO_INCREMENT for table `jeu6_eav_attribute`
--
ALTER TABLE `jeu6_eav_attribute`
  MODIFY `attribute_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id', AUTO_INCREMENT=152;
--
-- AUTO_INCREMENT for table `jeu6_eav_attribute_group`
--
ALTER TABLE `jeu6_eav_attribute_group`
  MODIFY `attribute_group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id', AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `jeu6_eav_attribute_label`
--
ALTER TABLE `jeu6_eav_attribute_label`
  MODIFY `attribute_label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_attribute_option`
--
ALTER TABLE `jeu6_eav_attribute_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id', AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `jeu6_eav_attribute_option_value`
--
ALTER TABLE `jeu6_eav_attribute_option_value`
  MODIFY `value_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Value Id', AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `jeu6_eav_attribute_set`
--
ALTER TABLE `jeu6_eav_attribute_set`
  MODIFY `attribute_set_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `jeu6_eav_entity`
--
ALTER TABLE `jeu6_eav_entity`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_attribute`
--
ALTER TABLE `jeu6_eav_entity_attribute`
  MODIFY `entity_attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id', AUTO_INCREMENT=355;
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_datetime`
--
ALTER TABLE `jeu6_eav_entity_datetime`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_decimal`
--
ALTER TABLE `jeu6_eav_entity_decimal`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_int`
--
ALTER TABLE `jeu6_eav_entity_int`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_store`
--
ALTER TABLE `jeu6_eav_entity_store`
  MODIFY `entity_store_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_text`
--
ALTER TABLE `jeu6_eav_entity_text`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_type`
--
ALTER TABLE `jeu6_eav_entity_type`
  MODIFY `entity_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `jeu6_eav_entity_varchar`
--
ALTER TABLE `jeu6_eav_entity_varchar`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_eav_form_element`
--
ALTER TABLE `jeu6_eav_form_element`
  MODIFY `element_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Element Id', AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `jeu6_eav_form_fieldset`
--
ALTER TABLE `jeu6_eav_form_fieldset`
  MODIFY `fieldset_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_eav_form_type`
--
ALTER TABLE `jeu6_eav_form_type`
  MODIFY `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Type Id', AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `jeu6_find_feed_import_codes`
--
ALTER TABLE `jeu6_find_feed_import_codes`
  MODIFY `code_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Code id';
--
-- AUTO_INCREMENT for table `jeu6_gift_message`
--
ALTER TABLE `jeu6_gift_message`
  MODIFY `gift_message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id';
--
-- AUTO_INCREMENT for table `jeu6_googlebase_attributes`
--
ALTER TABLE `jeu6_googlebase_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_googlebase_items`
--
ALTER TABLE `jeu6_googlebase_items`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item id';
--
-- AUTO_INCREMENT for table `jeu6_googlebase_types`
--
ALTER TABLE `jeu6_googlebase_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Type id';
--
-- AUTO_INCREMENT for table `jeu6_googleoptimizer_code`
--
ALTER TABLE `jeu6_googleoptimizer_code`
  MODIFY `code_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Google optimizer code id';
--
-- AUTO_INCREMENT for table `jeu6_importexport_importdata`
--
ALTER TABLE `jeu6_importexport_importdata`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_index_event`
--
ALTER TABLE `jeu6_index_event`
  MODIFY `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Id', AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `jeu6_index_process`
--
ALTER TABLE `jeu6_index_process`
  MODIFY `process_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Process Id', AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `jeu6_log_customer`
--
ALTER TABLE `jeu6_log_customer`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID';
--
-- AUTO_INCREMENT for table `jeu6_log_summary`
--
ALTER TABLE `jeu6_log_summary`
  MODIFY `summary_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Summary ID';
--
-- AUTO_INCREMENT for table `jeu6_log_summary_type`
--
ALTER TABLE `jeu6_log_summary_type`
  MODIFY `type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Type ID', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_log_url_info`
--
ALTER TABLE `jeu6_log_url_info`
  MODIFY `url_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'URL ID';
--
-- AUTO_INCREMENT for table `jeu6_log_visitor`
--
ALTER TABLE `jeu6_log_visitor`
  MODIFY `visitor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID', AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `jeu6_log_visitor_online`
--
ALTER TABLE `jeu6_log_visitor_online`
  MODIFY `visitor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID';
--
-- AUTO_INCREMENT for table `jeu6_newsletter_problem`
--
ALTER TABLE `jeu6_newsletter_problem`
  MODIFY `problem_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Problem Id';
--
-- AUTO_INCREMENT for table `jeu6_newsletter_queue`
--
ALTER TABLE `jeu6_newsletter_queue`
  MODIFY `queue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Id';
--
-- AUTO_INCREMENT for table `jeu6_newsletter_queue_link`
--
ALTER TABLE `jeu6_newsletter_queue_link`
  MODIFY `queue_link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id';
--
-- AUTO_INCREMENT for table `jeu6_newsletter_subscriber`
--
ALTER TABLE `jeu6_newsletter_subscriber`
  MODIFY `subscriber_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id';
--
-- AUTO_INCREMENT for table `jeu6_newsletter_template`
--
ALTER TABLE `jeu6_newsletter_template`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template Id', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_oauth_consumer`
--
ALTER TABLE `jeu6_oauth_consumer`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_oauth_token`
--
ALTER TABLE `jeu6_oauth_token`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity ID';
--
-- AUTO_INCREMENT for table `jeu6_paypal_cert`
--
ALTER TABLE `jeu6_paypal_cert`
  MODIFY `cert_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Cert Id';
--
-- AUTO_INCREMENT for table `jeu6_paypal_payment_transaction`
--
ALTER TABLE `jeu6_paypal_payment_transaction`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_paypal_settlement_report`
--
ALTER TABLE `jeu6_paypal_settlement_report`
  MODIFY `report_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Report Id';
--
-- AUTO_INCREMENT for table `jeu6_paypal_settlement_report_row`
--
ALTER TABLE `jeu6_paypal_settlement_report_row`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Row Id';
--
-- AUTO_INCREMENT for table `jeu6_perfectus_mainslider`
--
ALTER TABLE `jeu6_perfectus_mainslider`
  MODIFY `pslide_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `jeu6_permission_block`
--
ALTER TABLE `jeu6_permission_block`
  MODIFY `block_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Block ID', AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `jeu6_permission_variable`
--
ALTER TABLE `jeu6_permission_variable`
  MODIFY `variable_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Variable ID', AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `jeu6_persistent_session`
--
ALTER TABLE `jeu6_persistent_session`
  MODIFY `persistent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Session id';
--
-- AUTO_INCREMENT for table `jeu6_poll`
--
ALTER TABLE `jeu6_poll`
  MODIFY `poll_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Poll Id', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_poll_answer`
--
ALTER TABLE `jeu6_poll_answer`
  MODIFY `answer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Answer Id', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jeu6_poll_vote`
--
ALTER TABLE `jeu6_poll_vote`
  MODIFY `vote_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Vote Id';
--
-- AUTO_INCREMENT for table `jeu6_product_alert_price`
--
ALTER TABLE `jeu6_product_alert_price`
  MODIFY `alert_price_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id';
--
-- AUTO_INCREMENT for table `jeu6_product_alert_stock`
--
ALTER TABLE `jeu6_product_alert_stock`
  MODIFY `alert_stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id';
--
-- AUTO_INCREMENT for table `jeu6_rating`
--
ALTER TABLE `jeu6_rating`
  MODIFY `rating_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating Id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jeu6_rating_entity`
--
ALTER TABLE `jeu6_rating_entity`
  MODIFY `entity_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jeu6_rating_option`
--
ALTER TABLE `jeu6_rating_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id', AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `jeu6_rating_option_vote`
--
ALTER TABLE `jeu6_rating_option_vote`
  MODIFY `vote_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Vote id';
--
-- AUTO_INCREMENT for table `jeu6_rating_option_vote_aggregated`
--
ALTER TABLE `jeu6_rating_option_vote_aggregated`
  MODIFY `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id';
--
-- AUTO_INCREMENT for table `jeu6_report_compared_product_index`
--
ALTER TABLE `jeu6_report_compared_product_index`
  MODIFY `index_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index Id';
--
-- AUTO_INCREMENT for table `jeu6_report_event`
--
ALTER TABLE `jeu6_report_event`
  MODIFY `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Id', AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `jeu6_report_event_types`
--
ALTER TABLE `jeu6_report_event_types`
  MODIFY `event_type_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `jeu6_report_viewed_product_aggregated_daily`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_daily`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_report_viewed_product_aggregated_monthly`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_monthly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_report_viewed_product_aggregated_yearly`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_yearly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_report_viewed_product_index`
--
ALTER TABLE `jeu6_report_viewed_product_index`
  MODIFY `index_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Index Id', AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `jeu6_review`
--
ALTER TABLE `jeu6_review`
  MODIFY `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review id';
--
-- AUTO_INCREMENT for table `jeu6_review_detail`
--
ALTER TABLE `jeu6_review_detail`
  MODIFY `detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review detail id';
--
-- AUTO_INCREMENT for table `jeu6_review_entity`
--
ALTER TABLE `jeu6_review_entity`
  MODIFY `entity_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Review entity id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jeu6_review_entity_summary`
--
ALTER TABLE `jeu6_review_entity_summary`
  MODIFY `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id';
--
-- AUTO_INCREMENT for table `jeu6_review_status`
--
ALTER TABLE `jeu6_review_status`
  MODIFY `status_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Status id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jeu6_salesrule`
--
ALTER TABLE `jeu6_salesrule`
  MODIFY `rule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Id';
--
-- AUTO_INCREMENT for table `jeu6_salesrule_coupon`
--
ALTER TABLE `jeu6_salesrule_coupon`
  MODIFY `coupon_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id';
--
-- AUTO_INCREMENT for table `jeu6_salesrule_customer`
--
ALTER TABLE `jeu6_salesrule_customer`
  MODIFY `rule_customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id';
--
-- AUTO_INCREMENT for table `jeu6_salesrule_label`
--
ALTER TABLE `jeu6_salesrule_label`
  MODIFY `label_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Label Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_bestsellers_aggregated_daily`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_daily`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_monthly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_yearly`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_billing_agreement`
--
ALTER TABLE `jeu6_sales_billing_agreement`
  MODIFY `agreement_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_creditmemo`
--
ALTER TABLE `jeu6_sales_flat_creditmemo`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_creditmemo_comment`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_comment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_creditmemo_item`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_item`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_invoice`
--
ALTER TABLE `jeu6_sales_flat_invoice`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_invoice_comment`
--
ALTER TABLE `jeu6_sales_flat_invoice_comment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_invoice_item`
--
ALTER TABLE `jeu6_sales_flat_invoice_item`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_order`
--
ALTER TABLE `jeu6_sales_flat_order`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_order_address`
--
ALTER TABLE `jeu6_sales_flat_order_address`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_order_item`
--
ALTER TABLE `jeu6_sales_flat_order_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_order_payment`
--
ALTER TABLE `jeu6_sales_flat_order_payment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_order_status_history`
--
ALTER TABLE `jeu6_sales_flat_order_status_history`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_quote`
--
ALTER TABLE `jeu6_sales_flat_quote`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_quote_address`
--
ALTER TABLE `jeu6_sales_flat_quote_address`
  MODIFY `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address Id', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_quote_address_item`
--
ALTER TABLE `jeu6_sales_flat_quote_address_item`
  MODIFY `address_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_quote_item`
--
ALTER TABLE `jeu6_sales_flat_quote_item`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Item Id', AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_quote_item_option`
--
ALTER TABLE `jeu6_sales_flat_quote_item_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id', AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_quote_payment`
--
ALTER TABLE `jeu6_sales_flat_quote_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Payment Id', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_quote_shipping_rate`
--
ALTER TABLE `jeu6_sales_flat_quote_shipping_rate`
  MODIFY `rate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Rate Id', AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_shipment`
--
ALTER TABLE `jeu6_sales_flat_shipment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_shipment_comment`
--
ALTER TABLE `jeu6_sales_flat_shipment_comment`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_shipment_item`
--
ALTER TABLE `jeu6_sales_flat_shipment_item`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_flat_shipment_track`
--
ALTER TABLE `jeu6_sales_flat_shipment_track`
  MODIFY `entity_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Entity Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_invoiced_aggregated`
--
ALTER TABLE `jeu6_sales_invoiced_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_invoiced_aggregated_order`
--
ALTER TABLE `jeu6_sales_invoiced_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_order_aggregated_created`
--
ALTER TABLE `jeu6_sales_order_aggregated_created`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_order_aggregated_updated`
--
ALTER TABLE `jeu6_sales_order_aggregated_updated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_order_tax`
--
ALTER TABLE `jeu6_sales_order_tax`
  MODIFY `tax_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_order_tax_item`
--
ALTER TABLE `jeu6_sales_order_tax_item`
  MODIFY `tax_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_payment_transaction`
--
ALTER TABLE `jeu6_sales_payment_transaction`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_recurring_profile`
--
ALTER TABLE `jeu6_sales_recurring_profile`
  MODIFY `profile_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Profile Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_recurring_profile_order`
--
ALTER TABLE `jeu6_sales_recurring_profile_order`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Link Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_refunded_aggregated`
--
ALTER TABLE `jeu6_sales_refunded_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_refunded_aggregated_order`
--
ALTER TABLE `jeu6_sales_refunded_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_shipping_aggregated`
--
ALTER TABLE `jeu6_sales_shipping_aggregated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sales_shipping_aggregated_order`
--
ALTER TABLE `jeu6_sales_shipping_aggregated_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_sendfriend_log`
--
ALTER TABLE `jeu6_sendfriend_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID';
--
-- AUTO_INCREMENT for table `jeu6_shipping_tablerate`
--
ALTER TABLE `jeu6_shipping_tablerate`
  MODIFY `pk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary key';
--
-- AUTO_INCREMENT for table `jeu6_sitemap`
--
ALTER TABLE `jeu6_sitemap`
  MODIFY `sitemap_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id';
--
-- AUTO_INCREMENT for table `jeu6_skuautogenerate`
--
ALTER TABLE `jeu6_skuautogenerate`
  MODIFY `skuautogenerate_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_tag`
--
ALTER TABLE `jeu6_tag`
  MODIFY `tag_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tag Id';
--
-- AUTO_INCREMENT for table `jeu6_tag_relation`
--
ALTER TABLE `jeu6_tag_relation`
  MODIFY `tag_relation_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tag Relation Id';
--
-- AUTO_INCREMENT for table `jeu6_tax_calculation`
--
ALTER TABLE `jeu6_tax_calculation`
  MODIFY `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_tax_calculation_rate`
--
ALTER TABLE `jeu6_tax_calculation_rate`
  MODIFY `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id', AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jeu6_tax_calculation_rate_title`
--
ALTER TABLE `jeu6_tax_calculation_rate_title`
  MODIFY `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id';
--
-- AUTO_INCREMENT for table `jeu6_tax_calculation_rule`
--
ALTER TABLE `jeu6_tax_calculation_rule`
  MODIFY `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jeu6_tax_class`
--
ALTER TABLE `jeu6_tax_class`
  MODIFY `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id', AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jeu6_tax_order_aggregated_created`
--
ALTER TABLE `jeu6_tax_order_aggregated_created`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_tax_order_aggregated_updated`
--
ALTER TABLE `jeu6_tax_order_aggregated_updated`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Id';
--
-- AUTO_INCREMENT for table `jeu6_weee_tax`
--
ALTER TABLE `jeu6_weee_tax`
  MODIFY `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id';
--
-- AUTO_INCREMENT for table `jeu6_widget`
--
ALTER TABLE `jeu6_widget`
  MODIFY `widget_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Widget Id';
--
-- AUTO_INCREMENT for table `jeu6_widget_instance`
--
ALTER TABLE `jeu6_widget_instance`
  MODIFY `instance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Instance Id';
--
-- AUTO_INCREMENT for table `jeu6_widget_instance_page`
--
ALTER TABLE `jeu6_widget_instance_page`
  MODIFY `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Page Id';
--
-- AUTO_INCREMENT for table `jeu6_wishlist`
--
ALTER TABLE `jeu6_wishlist`
  MODIFY `wishlist_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID';
--
-- AUTO_INCREMENT for table `jeu6_wishlist_item`
--
ALTER TABLE `jeu6_wishlist_item`
  MODIFY `wishlist_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID';
--
-- AUTO_INCREMENT for table `jeu6_wishlist_item_option`
--
ALTER TABLE `jeu6_wishlist_item_option`
  MODIFY `option_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Option Id';
--
-- AUTO_INCREMENT for table `jeu6_xmlconnect_application`
--
ALTER TABLE `jeu6_xmlconnect_application`
  MODIFY `application_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Application Id';
--
-- AUTO_INCREMENT for table `jeu6_xmlconnect_history`
--
ALTER TABLE `jeu6_xmlconnect_history`
  MODIFY `history_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'History Id';
--
-- AUTO_INCREMENT for table `jeu6_xmlconnect_notification_template`
--
ALTER TABLE `jeu6_xmlconnect_notification_template`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Template Id';
--
-- AUTO_INCREMENT for table `jeu6_xmlconnect_queue`
--
ALTER TABLE `jeu6_xmlconnect_queue`
  MODIFY `queue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Queue Id';
--
-- Constraints for dumped tables
--

--
-- Constraints for table `jeu6_admin_rule`
--
ALTER TABLE `jeu6_admin_rule`
  ADD CONSTRAINT `FK_OZSS_ADMIN_RULE_ROLE_ID_OZSS_ADMIN_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `jeu6_admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_api2_acl_rule`
--
ALTER TABLE `jeu6_api2_acl_rule`
  ADD CONSTRAINT `FK_JEU6_API2_ACL_RULE_ROLE_ID_JEU6_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `jeu6_api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_api2_acl_user`
--
ALTER TABLE `jeu6_api2_acl_user`
  ADD CONSTRAINT `FK_JEU6_API2_ACL_USER_ADMIN_ID_JEU6_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `jeu6_admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_API2_ACL_USER_ROLE_ID_JEU6_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `jeu6_api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_api_rule`
--
ALTER TABLE `jeu6_api_rule`
  ADD CONSTRAINT `FK_OZSS_API_RULE_ROLE_ID_OZSS_API_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `jeu6_api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_api_session`
--
ALTER TABLE `jeu6_api_session`
  ADD CONSTRAINT `FK_OZSS_API_SESSION_USER_ID_OZSS_API_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `jeu6_api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_cataloginventory_stock_item`
--
ALTER TABLE `jeu6_cataloginventory_stock_item`
  ADD CONSTRAINT `FK_OZSS_CATINV_STOCK_ITEM_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATINV_STOCK_ITEM_STOCK_ID_OZSS_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `jeu6_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_cataloginventory_stock_status`
--
ALTER TABLE `jeu6_cataloginventory_stock_status`
  ADD CONSTRAINT `FK_OZSS_CATINV_STOCK_STS_STOCK_ID_OZSS_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `jeu6_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATINV_STOCK_STS_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATINV_STOCK_STS_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalogrule_customer_group`
--
ALTER TABLE `jeu6_catalogrule_customer_group`
  ADD CONSTRAINT `FK_JEU6_CATRULE_CSTR_GROUP_RULE_ID_JEU6_CATRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_375BE3E2ADB970AD00060673C9BFE270` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalogrule_group_website`
--
ALTER TABLE `jeu6_catalogrule_group_website`
  ADD CONSTRAINT `FK_682CC0AD07C13B9C17CA44B04E0A0902` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATRULE_GROUP_WS_RULE_ID_OZSS_CATRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATRULE_GROUP_WS_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalogrule_product`
--
ALTER TABLE `jeu6_catalogrule_product`
  ADD CONSTRAINT `FK_OZSS_CATALOGRULE_PRODUCT_RULE_ID_OZSS_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATRULE_PRD_CSTR_GROUP_ID_OZSS_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATRULE_PRD_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATRULE_PRD_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalogrule_product_price`
--
ALTER TABLE `jeu6_catalogrule_product_price`
  ADD CONSTRAINT `FK_OZSS_CATRULE_PRD_PRICE_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_E0E306D7422AF007C8180A54B7BDC75D` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATRULE_PRD_PRICE_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalogrule_website`
--
ALTER TABLE `jeu6_catalogrule_website`
  ADD CONSTRAINT `FK_JEU6_CATALOGRULE_WEBSITE_RULE_ID_JEU6_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_CATRULE_WS_WS_ID_JEU6_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalogsearch_query`
--
ALTER TABLE `jeu6_catalogsearch_query`
  ADD CONSTRAINT `FK_OZSS_CATALOGSEARCH_QUERY_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalogsearch_result`
--
ALTER TABLE `jeu6_catalogsearch_result`
  ADD CONSTRAINT `FK_OZSS_CATSRCH_RESULT_QR_ID_OZSS_CATSRCH_QR_QR_ID` FOREIGN KEY (`query_id`) REFERENCES `jeu6_catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATSRCH_RESULT_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_entity_datetime`
--
ALTER TABLE `jeu6_catalog_category_entity_datetime`
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_DTIME_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_DTIME_ENTT_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_DTIME_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_entity_decimal`
--
ALTER TABLE `jeu6_catalog_category_entity_decimal`
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_DEC_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_DEC_ENTT_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_DEC_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_entity_int`
--
ALTER TABLE `jeu6_catalog_category_entity_int`
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_INT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_INT_ENTT_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_INT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_entity_text`
--
ALTER TABLE `jeu6_catalog_category_entity_text`
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_TEXT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_TEXT_ENTT_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_TEXT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_entity_varchar`
--
ALTER TABLE `jeu6_catalog_category_entity_varchar`
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_VCHR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_VCHR_ENTT_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_ENTT_VCHR_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_flat_store_1`
--
ALTER TABLE `jeu6_catalog_category_flat_store_1`
  ADD CONSTRAINT `FK_JEU6_CAT_CTGR_FLAT_STORE_1_ENTT_ID_JEU6_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_CAT_CTGR_FLAT_STORE_1_STORE_ID_JEU6_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_product`
--
ALTER TABLE `jeu6_catalog_category_product`
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_PRD_CTGR_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_PRD_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_category_product_index`
--
ALTER TABLE `jeu6_catalog_category_product_index`
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_PRD_IDX_CTGR_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_PRD_IDX_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CTGR_PRD_IDX_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_compare_item`
--
ALTER TABLE `jeu6_catalog_compare_item`
  ADD CONSTRAINT `FK_OZSS_CAT_CMP_ITEM_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_CMP_ITEM_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CATALOG_COMPARE_ITEM_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_eav_attribute`
--
ALTER TABLE `jeu6_catalog_eav_attribute`
  ADD CONSTRAINT `FK_OZSS_CAT_EAV_ATTR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_bundle_option`
--
ALTER TABLE `jeu6_catalog_product_bundle_option`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_BNDL_OPT_PARENT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_bundle_option_value`
--
ALTER TABLE `jeu6_catalog_product_bundle_option_value`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_BNDL_OPT_VAL_OPT_ID_OZSS_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `jeu6_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_bundle_price_index`
--
ALTER TABLE `jeu6_catalog_product_bundle_price_index`
  ADD CONSTRAINT `FK_29C32533CC0E23D0227E05B7EB33CE61` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_BNDL_PRICE_IDX_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_bundle_selection`
--
ALTER TABLE `jeu6_catalog_product_bundle_selection`
  ADD CONSTRAINT `FK_F2950E3208607C12E1E60C564D60F7D7` FOREIGN KEY (`option_id`) REFERENCES `jeu6_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_BNDL_SELECTION_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_bundle_selection_price`
--
ALTER TABLE `jeu6_catalog_product_bundle_selection_price`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_A9A952741B6EB200CFF28B136C465DDA` FOREIGN KEY (`selection_id`) REFERENCES `jeu6_catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_enabled_index`
--
ALTER TABLE `jeu6_catalog_product_enabled_index`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENABLED_IDX_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENABLED_IDX_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity`
--
ALTER TABLE `jeu6_catalog_product_entity`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_ATTR_SET_ID_OZSS_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `jeu6_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_0ACAE0F05D5771D70878FF76DF0BC838` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_datetime`
--
ALTER TABLE `jeu6_catalog_product_entity_datetime`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_DTIME_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_DTIME_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_DTIME_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_decimal`
--
ALTER TABLE `jeu6_catalog_product_entity_decimal`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_DEC_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_DEC_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_DEC_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_gallery`
--
ALTER TABLE `jeu6_catalog_product_entity_gallery`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_GLR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_GLR_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_GLR_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_group_price`
--
ALTER TABLE `jeu6_catalog_product_entity_group_price`
  ADD CONSTRAINT `FK_1AE8F612BC8588421D961601C4B53567` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_F1FF9AC23A7FF6140B1D0F485760C28B` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_CAT_PRD_ENTT_GROUP_PRICE_WS_ID_JEU6_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_int`
--
ALTER TABLE `jeu6_catalog_product_entity_int`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_INT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_INT_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_INT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_media_gallery`
--
ALTER TABLE `jeu6_catalog_product_entity_media_gallery`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_MDA_GLR_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_media_gallery_value`
--
ALTER TABLE `jeu6_catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `FK_92D951CD633AC8EBF04F9FED785F9DC1` FOREIGN KEY (`value_id`) REFERENCES `jeu6_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_15DCB66296786104003E32E231FA806D` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_text`
--
ALTER TABLE `jeu6_catalog_product_entity_text`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_TEXT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_TEXT_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_TEXT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_tier_price`
--
ALTER TABLE `jeu6_catalog_product_entity_tier_price`
  ADD CONSTRAINT `FK_F9B7BD67942122A030A9459A9949CD28` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B5C882754247C763DDEA453F60459BA9` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_TIER_PRICE_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_entity_varchar`
--
ALTER TABLE `jeu6_catalog_product_entity_varchar`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_VCHR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_VCHR_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_ENTT_VCHR_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_flat_1`
--
ALTER TABLE `jeu6_catalog_product_flat_1`
  ADD CONSTRAINT `FK_JEU6_JEU6_CAT_PRD_FLAT_1_ENTT_ID_JEU6_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_index_eav`
--
ALTER TABLE `jeu6_catalog_product_index_eav`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_EAV_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_EAV_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_EAV_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_index_eav_decimal`
--
ALTER TABLE `jeu6_catalog_product_index_eav_decimal`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_EAV_DEC_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_EAV_DEC_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_EAV_DEC_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_index_group_price`
--
ALTER TABLE `jeu6_catalog_product_index_group_price`
  ADD CONSTRAINT `FK_7EE266775EAC53E40EF922ABA769EA1E` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EC70E0D326F433079866B92AC062AEA5` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_CAT_PRD_IDX_GROUP_PRICE_WS_ID_JEU6_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_index_price`
--
ALTER TABLE `jeu6_catalog_product_index_price`
  ADD CONSTRAINT `FK_20E182CE82A2FEEB0F25B91462591FDF` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_PRICE_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_PRICE_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_index_tier_price`
--
ALTER TABLE `jeu6_catalog_product_index_tier_price`
  ADD CONSTRAINT `FK_A73046E4CA74AB005B932873723F0BCC` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_TIER_PRICE_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_index_website`
--
ALTER TABLE `jeu6_catalog_product_index_website`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_IDX_WS_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_link`
--
ALTER TABLE `jeu6_catalog_product_link`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_LNK_LNKED_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_LNK_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_208B58C3362E5F2FCF58AE37826AB010` FOREIGN KEY (`link_type_id`) REFERENCES `jeu6_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_link_attribute`
--
ALTER TABLE `jeu6_catalog_product_link_attribute`
  ADD CONSTRAINT `FK_43EA4ACE5AB94077B4F57F24893DFF22` FOREIGN KEY (`link_type_id`) REFERENCES `jeu6_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_link_attribute_decimal`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_LNK_ATTR_DEC_LNK_ID_OZSS_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `jeu6_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_55FFBE1AEE8FCAD7AF5B8FCEFD120684` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `jeu6_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_link_attribute_int`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_int`
  ADD CONSTRAINT `FK_A0D0EB164966136C0D5E350636DCE4BF` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `jeu6_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_LNK_ATTR_INT_LNK_ID_OZSS_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `jeu6_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_link_attribute_varchar`
--
ALTER TABLE `jeu6_catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_OZSS_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `jeu6_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_2A12C8F69D074BB1B20BF074F7E3BDDF` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `jeu6_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_option`
--
ALTER TABLE `jeu6_catalog_product_option`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_option_price`
--
ALTER TABLE `jeu6_catalog_product_option_price`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_PRICE_OPT_ID_OZSS_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `jeu6_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_PRICE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_option_title`
--
ALTER TABLE `jeu6_catalog_product_option_title`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_TTL_OPT_ID_OZSS_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `jeu6_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_TTL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_option_type_price`
--
ALTER TABLE `jeu6_catalog_product_option_type_price`
  ADD CONSTRAINT `FK_5309CD5C9AD3C75F9D458F5FD79131BC` FOREIGN KEY (`option_type_id`) REFERENCES `jeu6_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_TYPE_PRICE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_option_type_title`
--
ALTER TABLE `jeu6_catalog_product_option_type_title`
  ADD CONSTRAINT `FK_4E085D30C36DE2F316ED64A6C93E0AA3` FOREIGN KEY (`option_type_id`) REFERENCES `jeu6_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_TYPE_TTL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_option_type_value`
--
ALTER TABLE `jeu6_catalog_product_option_type_value`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_OPT_TYPE_VAL_OPT_ID_OZSS_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `jeu6_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_relation`
--
ALTER TABLE `jeu6_catalog_product_relation`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_RELATION_CHILD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_RELATION_PARENT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_super_attribute`
--
ALTER TABLE `jeu6_catalog_product_super_attribute`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_SPR_ATTR_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_catalog_product_super_attribute_label`
--
ALTER TABLE `jeu6_catalog_product_super_attribute_label`
  ADD CONSTRAINT `FK_06E733733D0026B942DB2B51EB2BE01D` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `jeu6_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_SPR_ATTR_LBL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_super_attribute_pricing`
--
ALTER TABLE `jeu6_catalog_product_super_attribute_pricing`
  ADD CONSTRAINT `FK_78819193FCBA02FB05E7AC560B5A2CB4` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `jeu6_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_SPR_ATTR_PRICING_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_super_link`
--
ALTER TABLE `jeu6_catalog_product_super_link`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_SPR_LNK_PARENT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_SPR_LNK_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_catalog_product_website`
--
ALTER TABLE `jeu6_catalog_product_website`
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_WS_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CAT_PRD_WS_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_checkout_agreement_store`
--
ALTER TABLE `jeu6_checkout_agreement_store`
  ADD CONSTRAINT `FK_OZSS_CHKT_AGRT_STORE_AGRT_ID_OZSS_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `jeu6_checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CHKT_AGRT_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_cms_block_store`
--
ALTER TABLE `jeu6_cms_block_store`
  ADD CONSTRAINT `FK_OZSS_CMS_BLOCK_STORE_BLOCK_ID_OZSS_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `jeu6_cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CMS_BLOCK_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_cms_page_store`
--
ALTER TABLE `jeu6_cms_page_store`
  ADD CONSTRAINT `FK_OZSS_CMS_PAGE_STORE_PAGE_ID_OZSS_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `jeu6_cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CMS_PAGE_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_cache_tag`
--
ALTER TABLE `jeu6_core_cache_tag`
  ADD CONSTRAINT `FK_OZSS_CORE_CACHE_TAG_CACHE_ID_OZSS_CORE_CACHE_ID` FOREIGN KEY (`cache_id`) REFERENCES `jeu6_core_cache` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_email_queue_recipients`
--
ALTER TABLE `jeu6_core_email_queue_recipients`
  ADD CONSTRAINT `FK_CD46C19F76270D0F86118970FF665975` FOREIGN KEY (`message_id`) REFERENCES `jeu6_core_email_queue` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_layout_link`
--
ALTER TABLE `jeu6_core_layout_link`
  ADD CONSTRAINT `FK_OZSS_CORE_LAYOUT_LINK_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_37F81906A69CDA8B993BD8DCC4E9BC0E` FOREIGN KEY (`layout_update_id`) REFERENCES `jeu6_core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_store`
--
ALTER TABLE `jeu6_core_store`
  ADD CONSTRAINT `FK_OZSS_CORE_STORE_GROUP_ID_OZSS_CORE_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `jeu6_core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CORE_STORE_WEBSITE_ID_OZSS_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_store_group`
--
ALTER TABLE `jeu6_core_store_group`
  ADD CONSTRAINT `FK_OZSS_CORE_STORE_GROUP_WEBSITE_ID_OZSS_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_translate`
--
ALTER TABLE `jeu6_core_translate`
  ADD CONSTRAINT `FK_OZSS_CORE_TRANSLATE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_url_rewrite`
--
ALTER TABLE `jeu6_core_url_rewrite`
  ADD CONSTRAINT `FK_OZSS_CORE_URL_REWRITE_PRD_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CORE_URL_REWRITE_CTGR_ID_OZSS_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `jeu6_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CORE_URL_REWRITE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_core_variable_value`
--
ALTER TABLE `jeu6_core_variable_value`
  ADD CONSTRAINT `FK_OZSS_CORE_VARIABLE_VALUE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_208FE0F51802FDBA8F98B865B59D7EA8` FOREIGN KEY (`variable_id`) REFERENCES `jeu6_core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_coupon_aggregated`
--
ALTER TABLE `jeu6_coupon_aggregated`
  ADD CONSTRAINT `FK_OZSS_COUPON_AGGREGATED_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_coupon_aggregated_order`
--
ALTER TABLE `jeu6_coupon_aggregated_order`
  ADD CONSTRAINT `FK_OZSS_COUPON_AGGRED_ORDER_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_coupon_aggregated_updated`
--
ALTER TABLE `jeu6_coupon_aggregated_updated`
  ADD CONSTRAINT `FK_JEU6_COUPON_AGGRED_UPDATED_STORE_ID_JEU6_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_address_entity`
--
ALTER TABLE `jeu6_customer_address_entity`
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_PARENT_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_address_entity_datetime`
--
ALTER TABLE `jeu6_customer_address_entity_datetime`
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_DTIME_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_DTIME_ENTT_ID_OZSS_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_FF5D1ABFFE1A5E525588DF0A4B3ED819` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_address_entity_decimal`
--
ALTER TABLE `jeu6_customer_address_entity_decimal`
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_DEC_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_DEC_ENTT_ID_OZSS_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_3C3B36D54673C3960ACBB9A848AF8357` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_address_entity_int`
--
ALTER TABLE `jeu6_customer_address_entity_int`
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_INT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_INT_ENTT_ID_OZSS_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EB455EAC1806FE6C04CC10D2F170970F` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_address_entity_text`
--
ALTER TABLE `jeu6_customer_address_entity_text`
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_TEXT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_TEXT_ENTT_ID_OZSS_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DF328305D8B928CF9C281097CFB3A950` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_address_entity_varchar`
--
ALTER TABLE `jeu6_customer_address_entity_varchar`
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_VCHR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ADDR_ENTT_VCHR_ENTT_ID_OZSS_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_4C3941881BA91B14824F5DDD44243D93` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_eav_attribute`
--
ALTER TABLE `jeu6_customer_eav_attribute`
  ADD CONSTRAINT `FK_OZSS_CSTR_EAV_ATTR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_eav_attribute_website`
--
ALTER TABLE `jeu6_customer_eav_attribute_website`
  ADD CONSTRAINT `FK_OZSS_CSTR_EAV_ATTR_WS_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_EAV_ATTR_WS_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_entity`
--
ALTER TABLE `jeu6_customer_entity`
  ADD CONSTRAINT `FK_OZSS_CUSTOMER_ENTITY_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CUSTOMER_ENTITY_WEBSITE_ID_OZSS_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_entity_datetime`
--
ALTER TABLE `jeu6_customer_entity_datetime`
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_DTIME_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_DTIME_ENTT_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_2E8C8324E64B450CAD307B4DFE9E65C5` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_entity_decimal`
--
ALTER TABLE `jeu6_customer_entity_decimal`
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_DEC_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_DEC_ENTT_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_1DCCEFC2F4DBC2CADC69E721FDCDDBD7` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_entity_int`
--
ALTER TABLE `jeu6_customer_entity_int`
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_INT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_INT_ENTT_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_E832F441F20C5907605E4F067AC8D525` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_entity_text`
--
ALTER TABLE `jeu6_customer_entity_text`
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_TEXT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_TEXT_ENTT_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_F60C948E12B387BA6A2C7A9856FB0DAD` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_entity_varchar`
--
ALTER TABLE `jeu6_customer_entity_varchar`
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_VCHR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_CSTR_ENTT_VCHR_ENTT_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_14810782BE5F405DA589CE053D7CD1F3` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_customer_form_attribute`
--
ALTER TABLE `jeu6_customer_form_attribute`
  ADD CONSTRAINT `FK_OZSS_CSTR_FORM_ATTR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_dataflow_batch`
--
ALTER TABLE `jeu6_dataflow_batch`
  ADD CONSTRAINT `FK_E31B8AAE6AF25698F158EEA8F3CC518D` FOREIGN KEY (`profile_id`) REFERENCES `jeu6_dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OZSS_DATAFLOW_BATCH_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_dataflow_batch_export`
--
ALTER TABLE `jeu6_dataflow_batch_export`
  ADD CONSTRAINT `FK_A4F63D58DB4759A2B84798D79BFBD2DF` FOREIGN KEY (`batch_id`) REFERENCES `jeu6_dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_dataflow_batch_import`
--
ALTER TABLE `jeu6_dataflow_batch_import`
  ADD CONSTRAINT `FK_A094F0890E0318435F74784B7AF92E5B` FOREIGN KEY (`batch_id`) REFERENCES `jeu6_dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_dataflow_import_data`
--
ALTER TABLE `jeu6_dataflow_import_data`
  ADD CONSTRAINT `FK_OZSS_DATAFLOW_IMPORT_DATA_SESS_ID_OZSS_DATAFLOW_SESS_SESS_ID` FOREIGN KEY (`session_id`) REFERENCES `jeu6_dataflow_session` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_dataflow_profile_history`
--
ALTER TABLE `jeu6_dataflow_profile_history`
  ADD CONSTRAINT `FK_E1858092EF1A3372FBF26EE0444EBA69` FOREIGN KEY (`profile_id`) REFERENCES `jeu6_dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_design_change`
--
ALTER TABLE `jeu6_design_change`
  ADD CONSTRAINT `FK_OZSS_DESIGN_CHANGE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_directory_country_region_name`
--
ALTER TABLE `jeu6_directory_country_region_name`
  ADD CONSTRAINT `FK_13CFBA3B20ED01835918BB2F5CB8D28A` FOREIGN KEY (`region_id`) REFERENCES `jeu6_directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_downloadable_link`
--
ALTER TABLE `jeu6_downloadable_link`
  ADD CONSTRAINT `FK_OZSS_DL_LNK_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_downloadable_link_price`
--
ALTER TABLE `jeu6_downloadable_link_price`
  ADD CONSTRAINT `FK_OZSS_DL_LNK_PRICE_LNK_ID_OZSS_DL_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `jeu6_downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_DL_LNK_PRICE_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_downloadable_link_purchased`
--
ALTER TABLE `jeu6_downloadable_link_purchased`
  ADD CONSTRAINT `FK_OZSS_DL_LNK_PURCHASED_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_DL_LNK_PURCHASED_ORDER_ID_OZSS_SALES_FLAT_ORDER_ENTT_ID` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_downloadable_link_purchased_item`
--
ALTER TABLE `jeu6_downloadable_link_purchased_item`
  ADD CONSTRAINT `FK_C256DB7AB16CE356E45FF03144FDEDAF` FOREIGN KEY (`purchased_id`) REFERENCES `jeu6_downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_D25F96813BBF6811EA3E6B4F115B5649` FOREIGN KEY (`order_item_id`) REFERENCES `jeu6_sales_flat_order_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_downloadable_link_title`
--
ALTER TABLE `jeu6_downloadable_link_title`
  ADD CONSTRAINT `FK_OZSS_DL_LNK_TTL_LNK_ID_OZSS_DL_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `jeu6_downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_DL_LNK_TTL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_downloadable_sample`
--
ALTER TABLE `jeu6_downloadable_sample`
  ADD CONSTRAINT `FK_OZSS_DL_SAMPLE_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_downloadable_sample_title`
--
ALTER TABLE `jeu6_downloadable_sample_title`
  ADD CONSTRAINT `FK_OZSS_DL_SAMPLE_TTL_SAMPLE_ID_OZSS_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `jeu6_downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_DL_SAMPLE_TTL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_attribute`
--
ALTER TABLE `jeu6_eav_attribute`
  ADD CONSTRAINT `FK_OZSS_EAV_ATTR_ENTT_TYPE_ID_OZSS_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_attribute_group`
--
ALTER TABLE `jeu6_eav_attribute_group`
  ADD CONSTRAINT `FK_OZSS_EAV_ATTR_GROUP_ATTR_SET_ID_OZSS_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `jeu6_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_attribute_label`
--
ALTER TABLE `jeu6_eav_attribute_label`
  ADD CONSTRAINT `FK_OZSS_EAV_ATTR_LBL_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ATTRIBUTE_LABEL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_attribute_option`
--
ALTER TABLE `jeu6_eav_attribute_option`
  ADD CONSTRAINT `FK_OZSS_EAV_ATTR_OPT_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_attribute_option_value`
--
ALTER TABLE `jeu6_eav_attribute_option_value`
  ADD CONSTRAINT `FK_OZSS_EAV_ATTR_OPT_VAL_OPT_ID_OZSS_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `jeu6_eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ATTR_OPT_VAL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_attribute_set`
--
ALTER TABLE `jeu6_eav_attribute_set`
  ADD CONSTRAINT `FK_19DBD0F439E10A3219FB06F280056E8F` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity`
--
ALTER TABLE `jeu6_eav_entity`
  ADD CONSTRAINT `FK_OZSS_EAV_ENTT_ENTT_TYPE_ID_OZSS_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity_attribute`
--
ALTER TABLE `jeu6_eav_entity_attribute`
  ADD CONSTRAINT `FK_OZSS_EAV_ENTT_ATTR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_47D3BF6A9AD19236183251C1C3A173E9` FOREIGN KEY (`attribute_group_id`) REFERENCES `jeu6_eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity_datetime`
--
ALTER TABLE `jeu6_eav_entity_datetime`
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_DATETIME_ENTITY_ID_OZSS_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_323B9D1032EA52EB1B75D573B70A1FC1` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_DATETIME_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity_decimal`
--
ALTER TABLE `jeu6_eav_entity_decimal`
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_DECIMAL_ENTITY_ID_OZSS_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_41A540B2A6CEF2A06E600CF9A1FFFF51` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_DECIMAL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity_int`
--
ALTER TABLE `jeu6_eav_entity_int`
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_INT_ENTITY_ID_OZSS_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_4B2997A2A504389AA0211F57AA74C6AE` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_INT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity_store`
--
ALTER TABLE `jeu6_eav_entity_store`
  ADD CONSTRAINT `FK_4EFFF97A49419FA15CC17B06E08CC254` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity_text`
--
ALTER TABLE `jeu6_eav_entity_text`
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_TEXT_ENTITY_ID_OZSS_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_0444046562D23B7C0BF1B835C64F3C3F` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_TEXT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_entity_varchar`
--
ALTER TABLE `jeu6_eav_entity_varchar`
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_VARCHAR_ENTITY_ID_OZSS_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_720B6EC52080290653FCC0E131D96FC8` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_ENTITY_VARCHAR_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_form_element`
--
ALTER TABLE `jeu6_eav_form_element`
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_ELM_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_ELM_FSET_ID_OZSS_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `jeu6_eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_ELEMENT_TYPE_ID_OZSS_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `jeu6_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_form_fieldset`
--
ALTER TABLE `jeu6_eav_form_fieldset`
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_FIELDSET_TYPE_ID_OZSS_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `jeu6_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_form_fieldset_label`
--
ALTER TABLE `jeu6_eav_form_fieldset_label`
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_FSET_LBL_FSET_ID_OZSS_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `jeu6_eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_FSET_LBL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_form_type`
--
ALTER TABLE `jeu6_eav_form_type`
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_TYPE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_eav_form_type_entity`
--
ALTER TABLE `jeu6_eav_form_type_entity`
  ADD CONSTRAINT `FK_6A16018AA47C9B0D8FDD851EEA83D667` FOREIGN KEY (`entity_type_id`) REFERENCES `jeu6_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_EAV_FORM_TYPE_ENTITY_TYPE_ID_OZSS_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `jeu6_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_googlebase_attributes`
--
ALTER TABLE `jeu6_googlebase_attributes`
  ADD CONSTRAINT `FK_OZSS_GOOGLEBASE_ATTRS_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OZSS_GOOGLEBASE_ATTRS_TYPE_ID_OZSS_GOOGLEBASE_TYPES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `jeu6_googlebase_types` (`type_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_googlebase_items`
--
ALTER TABLE `jeu6_googlebase_items`
  ADD CONSTRAINT `FK_OZSS_GOOGLEBASE_ITEMS_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OZSS_GOOGLEBASE_ITEMS_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_googlebase_types`
--
ALTER TABLE `jeu6_googlebase_types`
  ADD CONSTRAINT `FK_D92E8CA2763BB9BBDDF11EA72871C17C` FOREIGN KEY (`attribute_set_id`) REFERENCES `jeu6_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_googleoptimizer_code`
--
ALTER TABLE `jeu6_googleoptimizer_code`
  ADD CONSTRAINT `FK_OZSS_GOOGLEOPTIMIZER_CODE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_index_process_event`
--
ALTER TABLE `jeu6_index_process_event`
  ADD CONSTRAINT `FK_OZSS_INDEX_PROCESS_EVENT_EVENT_ID_OZSS_INDEX_EVENT_EVENT_ID` FOREIGN KEY (`event_id`) REFERENCES `jeu6_index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_IDX_PROCESS_EVENT_PROCESS_ID_OZSS_IDX_PROCESS_PROCESS_ID` FOREIGN KEY (`process_id`) REFERENCES `jeu6_index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_newsletter_problem`
--
ALTER TABLE `jeu6_newsletter_problem`
  ADD CONSTRAINT `FK_OZSS_NLTTR_PROBLEM_QUEUE_ID_OZSS_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `jeu6_newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_1263F98843EACD4E71A6C0015D5D25DA` FOREIGN KEY (`subscriber_id`) REFERENCES `jeu6_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_newsletter_queue`
--
ALTER TABLE `jeu6_newsletter_queue`
  ADD CONSTRAINT `FK_OZSS_NLTTR_QUEUE_TEMPLATE_ID_OZSS_NLTTR_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `jeu6_newsletter_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_newsletter_queue_link`
--
ALTER TABLE `jeu6_newsletter_queue_link`
  ADD CONSTRAINT `FK_OZSS_NLTTR_QUEUE_LNK_QUEUE_ID_OZSS_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `jeu6_newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_07ACD0A6155100E610F57084888D6974` FOREIGN KEY (`subscriber_id`) REFERENCES `jeu6_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_newsletter_queue_store_link`
--
ALTER TABLE `jeu6_newsletter_queue_store_link`
  ADD CONSTRAINT `FK_OZSS_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_OZSS_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `jeu6_newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_NLTTR_QUEUE_STORE_LNK_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_newsletter_subscriber`
--
ALTER TABLE `jeu6_newsletter_subscriber`
  ADD CONSTRAINT `FK_OZSS_NEWSLETTER_SUBSCRIBER_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_oauth_token`
--
ALTER TABLE `jeu6_oauth_token`
  ADD CONSTRAINT `FK_JEU6_OAUTH_TOKEN_ADMIN_ID_JEU6_JEU6_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `jeu6_admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_OAUTH_TOKEN_CONSUMER_ID_JEU6_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `jeu6_oauth_consumer` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_OAUTH_TOKEN_CSTR_ID_JEU6_JEU6_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_paypal_cert`
--
ALTER TABLE `jeu6_paypal_cert`
  ADD CONSTRAINT `FK_OZSS_PAYPAL_CERT_WEBSITE_ID_OZSS_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_paypal_settlement_report_row`
--
ALTER TABLE `jeu6_paypal_settlement_report_row`
  ADD CONSTRAINT `FK_4AE4856CFE3D30FDBA9B51F9A2B199B7` FOREIGN KEY (`report_id`) REFERENCES `jeu6_paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_persistent_session`
--
ALTER TABLE `jeu6_persistent_session`
  ADD CONSTRAINT `FK_OZSS_PERSISTENT_SESS_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OZSS_PERSISTENT_SESS_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_poll`
--
ALTER TABLE `jeu6_poll`
  ADD CONSTRAINT `FK_OZSS_POLL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_poll_answer`
--
ALTER TABLE `jeu6_poll_answer`
  ADD CONSTRAINT `FK_OZSS_POLL_ANSWER_POLL_ID_OZSS_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `jeu6_poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_poll_store`
--
ALTER TABLE `jeu6_poll_store`
  ADD CONSTRAINT `FK_OZSS_POLL_STORE_POLL_ID_OZSS_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `jeu6_poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_POLL_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_poll_vote`
--
ALTER TABLE `jeu6_poll_vote`
  ADD CONSTRAINT `FK_OZSS_POLL_VOTE_POLL_ANSWER_ID_OZSS_POLL_ANSWER_ANSWER_ID` FOREIGN KEY (`poll_answer_id`) REFERENCES `jeu6_poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_product_alert_price`
--
ALTER TABLE `jeu6_product_alert_price`
  ADD CONSTRAINT `FK_OZSS_PRD_ALERT_PRICE_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_PRD_ALERT_PRICE_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_PRD_ALERT_PRICE_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_product_alert_stock`
--
ALTER TABLE `jeu6_product_alert_stock`
  ADD CONSTRAINT `FK_OZSS_PRD_ALERT_STOCK_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_PRD_ALERT_STOCK_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_PRD_ALERT_STOCK_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_rating`
--
ALTER TABLE `jeu6_rating`
  ADD CONSTRAINT `FK_OZSS_RATING_ENTITY_ID_OZSS_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_rating_option`
--
ALTER TABLE `jeu6_rating_option`
  ADD CONSTRAINT `FK_OZSS_RATING_OPTION_RATING_ID_OZSS_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `jeu6_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_rating_option_vote`
--
ALTER TABLE `jeu6_rating_option_vote`
  ADD CONSTRAINT `FK_OZSS_RATING_OPTION_VOTE_REVIEW_ID_OZSS_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `jeu6_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_RATING_OPT_VOTE_OPT_ID_OZSS_RATING_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `jeu6_rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_rating_option_vote_aggregated`
--
ALTER TABLE `jeu6_rating_option_vote_aggregated`
  ADD CONSTRAINT `FK_OZSS_RATING_OPT_VOTE_AGGRED_RATING_ID_OZSS_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `jeu6_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_RATING_OPT_VOTE_AGGRED_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_rating_store`
--
ALTER TABLE `jeu6_rating_store`
  ADD CONSTRAINT `FK_OZSS_RATING_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_RATING_STORE_RATING_ID_OZSS_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `jeu6_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_rating_title`
--
ALTER TABLE `jeu6_rating_title`
  ADD CONSTRAINT `FK_OZSS_RATING_TITLE_RATING_ID_OZSS_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `jeu6_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_RATING_TITLE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_report_compared_product_index`
--
ALTER TABLE `jeu6_report_compared_product_index`
  ADD CONSTRAINT `FK_OZSS_REPORT_CMPD_PRD_IDX_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REPORT_CMPD_PRD_IDX_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REPORT_CMPD_PRD_IDX_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_report_event`
--
ALTER TABLE `jeu6_report_event`
  ADD CONSTRAINT `FK_OZSS_REPORT_EVENT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_80F962D8076F18C58BF20D574784E50B` FOREIGN KEY (`event_type_id`) REFERENCES `jeu6_report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_report_viewed_product_aggregated_daily`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_daily`
  ADD CONSTRAINT `FK_89B023FF31A25204E1B414027B0F191F` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_C05837C8763E380C139DC2AFF9193437` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_report_viewed_product_aggregated_monthly`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_monthly`
  ADD CONSTRAINT `FK_83F11A748A7AE263F9373297CC86A13D` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_478016A0418C8EA530B167CB9C8151E9` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_report_viewed_product_aggregated_yearly`
--
ALTER TABLE `jeu6_report_viewed_product_aggregated_yearly`
  ADD CONSTRAINT `FK_EFE05C035D8E7FB18106452C2E7C3112` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_4797531B78DDA0FC46333A834DA57D68` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_report_viewed_product_index`
--
ALTER TABLE `jeu6_report_viewed_product_index`
  ADD CONSTRAINT `FK_OZSS_REPORT_VIEWED_PRD_IDX_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REPORT_VIEWED_PRD_IDX_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REPORT_VIEWED_PRD_IDX_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_review`
--
ALTER TABLE `jeu6_review`
  ADD CONSTRAINT `FK_OZSS_REVIEW_ENTITY_ID_OZSS_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REVIEW_STATUS_ID_OZSS_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `jeu6_review_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_review_detail`
--
ALTER TABLE `jeu6_review_detail`
  ADD CONSTRAINT `FK_OZSS_REVIEW_DETAIL_CUSTOMER_ID_OZSS_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REVIEW_DETAIL_REVIEW_ID_OZSS_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `jeu6_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REVIEW_DETAIL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_review_entity_summary`
--
ALTER TABLE `jeu6_review_entity_summary`
  ADD CONSTRAINT `FK_OZSS_REVIEW_ENTITY_SUMMARY_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_review_store`
--
ALTER TABLE `jeu6_review_store`
  ADD CONSTRAINT `FK_OZSS_REVIEW_STORE_REVIEW_ID_OZSS_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `jeu6_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_REVIEW_STORE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_salesrule_coupon`
--
ALTER TABLE `jeu6_salesrule_coupon`
  ADD CONSTRAINT `FK_OZSS_SALESRULE_COUPON_RULE_ID_OZSS_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_salesrule_coupon_usage`
--
ALTER TABLE `jeu6_salesrule_coupon_usage`
  ADD CONSTRAINT `FK_B6479951508BCA200E986A01232D8ED7` FOREIGN KEY (`coupon_id`) REFERENCES `jeu6_salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALESRULE_COUPON_USAGE_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_salesrule_customer`
--
ALTER TABLE `jeu6_salesrule_customer`
  ADD CONSTRAINT `FK_OZSS_SALESRULE_CSTR_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALESRULE_CUSTOMER_RULE_ID_OZSS_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_salesrule_customer_group`
--
ALTER TABLE `jeu6_salesrule_customer_group`
  ADD CONSTRAINT `FK_JEU6_SALESRULE_CUSTOMER_GROUP_RULE_ID_JEU6_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_BBF436014444166DE5A428EEA4393C98` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_salesrule_label`
--
ALTER TABLE `jeu6_salesrule_label`
  ADD CONSTRAINT `FK_OZSS_SALESRULE_LABEL_RULE_ID_OZSS_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALESRULE_LABEL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_salesrule_product_attribute`
--
ALTER TABLE `jeu6_salesrule_product_attribute`
  ADD CONSTRAINT `FK_OZSS_SALESRULE_PRD_ATTR_ATTR_ID_OZSS_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_0E507CE7D37F7C0F2342CDA3CB44F840` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OZSS_SALESRULE_PRD_ATTR_RULE_ID_OZSS_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OZSS_SALESRULE_PRD_ATTR_WS_ID_OZSS_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_salesrule_website`
--
ALTER TABLE `jeu6_salesrule_website`
  ADD CONSTRAINT `FK_JEU6_SALESRULE_WEBSITE_RULE_ID_JEU6_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `jeu6_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_SALESRULE_WS_WS_ID_JEU6_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_bestsellers_aggregated_daily`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_daily`
  ADD CONSTRAINT `FK_74593F56AB6C6C5252CAC4289D126763` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DEA0F05F75BC3311BBDA40876CBBB642` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_monthly`
  ADD CONSTRAINT `FK_582E6007AA4A33F8D4F37222CBD1F7FC` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_BB08F45651BAB335BE41EE26D92AEBDB` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `jeu6_sales_bestsellers_aggregated_yearly`
  ADD CONSTRAINT `FK_45BDEA01C15B9712CA9CCDD7CC2F12A1` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_F310F29F400CF92287B63E90E7C67015` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_billing_agreement`
--
ALTER TABLE `jeu6_sales_billing_agreement`
  ADD CONSTRAINT `FK_OZSS_SALES_BILLING_AGRT_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_BILLING_AGRT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_billing_agreement_order`
--
ALTER TABLE `jeu6_sales_billing_agreement_order`
  ADD CONSTRAINT `FK_BC4B2527979FE30D12D90E641E3B14E2` FOREIGN KEY (`agreement_id`) REFERENCES `jeu6_sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_F72AE9E52FD43F0A768CD0B15369D1A8` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_creditmemo`
--
ALTER TABLE `jeu6_sales_flat_creditmemo`
  ADD CONSTRAINT `FK_4AA8914D8E8D7DDE968BFCA867CCE504` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_CREDITMEMO_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_creditmemo_comment`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_comment`
  ADD CONSTRAINT `FK_5AC64C79BED8CF7B466D6E70CB3B0916` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_creditmemo_grid`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_grid`
  ADD CONSTRAINT `FK_30FE42B7E7904E50455331F3FE6E8966` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_C921B0B196A218A7D53CBEB5421112B3` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_creditmemo_item`
--
ALTER TABLE `jeu6_sales_flat_creditmemo_item`
  ADD CONSTRAINT `FK_1106F28420598D041EA09CF7357EB380` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_invoice`
--
ALTER TABLE `jeu6_sales_flat_invoice`
  ADD CONSTRAINT `FK_6FD363BAB9DFEFC7EBD96219E7CB5021` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_INVOICE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_invoice_comment`
--
ALTER TABLE `jeu6_sales_flat_invoice_comment`
  ADD CONSTRAINT `FK_8FC84691C4A02117D5FA89CD1C34E8D0` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_invoice_grid`
--
ALTER TABLE `jeu6_sales_flat_invoice_grid`
  ADD CONSTRAINT `FK_CCD4E934F824771333E55DE7BFE6CFBC` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_B14B5FF6E421CA4596183D82F669A9B1` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_invoice_item`
--
ALTER TABLE `jeu6_sales_flat_invoice_item`
  ADD CONSTRAINT `FK_BC55011F62D711B2308D0866C5B0E528` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_order`
--
ALTER TABLE `jeu6_sales_flat_order`
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_ORDER_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_ORDER_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_order_address`
--
ALTER TABLE `jeu6_sales_flat_order_address`
  ADD CONSTRAINT `FK_0A32ACC6445CDE4DE3E727278215695F` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_order_grid`
--
ALTER TABLE `jeu6_sales_flat_order_grid`
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_ORDER_GRID_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_7CAF414358C86D2E4FE0295B49395FDE` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_ORDER_GRID_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_order_item`
--
ALTER TABLE `jeu6_sales_flat_order_item`
  ADD CONSTRAINT `FK_2B6903F5BE66901E9A4779008B31BB38` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_ORDER_ITEM_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_order_payment`
--
ALTER TABLE `jeu6_sales_flat_order_payment`
  ADD CONSTRAINT `FK_6B25A1E1118D1A2F7EDABC7CE4A91CCD` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_order_status_history`
--
ALTER TABLE `jeu6_sales_flat_order_status_history`
  ADD CONSTRAINT `FK_1A2D9C21C8263C7651EB6F05033030AF` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_quote`
--
ALTER TABLE `jeu6_sales_flat_quote`
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_QUOTE_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_quote_address`
--
ALTER TABLE `jeu6_sales_flat_quote_address`
  ADD CONSTRAINT `FK_46703692EAEE21FC1FA3ACE31F8FF776` FOREIGN KEY (`quote_id`) REFERENCES `jeu6_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_quote_address_item`
--
ALTER TABLE `jeu6_sales_flat_quote_address_item`
  ADD CONSTRAINT `FK_704D42CB8362D10E8E28335BF3A1B430` FOREIGN KEY (`quote_item_id`) REFERENCES `jeu6_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DD8DEAD5F42C9DDED33F87DD8924EBDF` FOREIGN KEY (`parent_item_id`) REFERENCES `jeu6_sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_F8893FA56562C34F1B691975047D87BD` FOREIGN KEY (`quote_address_id`) REFERENCES `jeu6_sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_quote_item`
--
ALTER TABLE `jeu6_sales_flat_quote_item`
  ADD CONSTRAINT `FK_99B36C2C6BFD1FFC934CE6FEBD33830E` FOREIGN KEY (`parent_item_id`) REFERENCES `jeu6_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AAD73E9D1224D1C1BB239C672FBEB897` FOREIGN KEY (`quote_id`) REFERENCES `jeu6_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_QUOTE_ITEM_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_QUOTE_ITEM_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_quote_item_option`
--
ALTER TABLE `jeu6_sales_flat_quote_item_option`
  ADD CONSTRAINT `FK_6FECBB9FE174113DF88A0457025C96EE` FOREIGN KEY (`item_id`) REFERENCES `jeu6_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_quote_payment`
--
ALTER TABLE `jeu6_sales_flat_quote_payment`
  ADD CONSTRAINT `FK_2768B3DF8FB051323DBE72D6ED8C4547` FOREIGN KEY (`quote_id`) REFERENCES `jeu6_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_quote_shipping_rate`
--
ALTER TABLE `jeu6_sales_flat_quote_shipping_rate`
  ADD CONSTRAINT `FK_277E7386D0A609D6E0E73A84E6AF49F5` FOREIGN KEY (`address_id`) REFERENCES `jeu6_sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_shipment`
--
ALTER TABLE `jeu6_sales_flat_shipment`
  ADD CONSTRAINT `FK_17A3EA955DA97AD48DC370E0AE87547B` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_FLAT_SHIPMENT_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_shipment_comment`
--
ALTER TABLE `jeu6_sales_flat_shipment_comment`
  ADD CONSTRAINT `FK_8500A8E38B7B8CF250F9847571DE535C` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_shipment_grid`
--
ALTER TABLE `jeu6_sales_flat_shipment_grid`
  ADD CONSTRAINT `FK_1ADFA0C2F77BD8BD431EA1A9C1FB4E43` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_630A16F336A8AED19583C343453AA97B` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_shipment_item`
--
ALTER TABLE `jeu6_sales_flat_shipment_item`
  ADD CONSTRAINT `FK_72F4DD2E7766459ED82D923D5CFCC6B8` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_flat_shipment_track`
--
ALTER TABLE `jeu6_sales_flat_shipment_track`
  ADD CONSTRAINT `FK_0F18F0F7C30311CC06592CC5D64D1171` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_invoiced_aggregated`
--
ALTER TABLE `jeu6_sales_invoiced_aggregated`
  ADD CONSTRAINT `FK_OZSS_SALES_INVOICED_AGGRED_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_invoiced_aggregated_order`
--
ALTER TABLE `jeu6_sales_invoiced_aggregated_order`
  ADD CONSTRAINT `FK_F773C459B2B7C93D8DE1BB98E6C51198` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_order_aggregated_created`
--
ALTER TABLE `jeu6_sales_order_aggregated_created`
  ADD CONSTRAINT `FK_F20EFD778657B46A5E0FB09ACB47035B` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_order_aggregated_updated`
--
ALTER TABLE `jeu6_sales_order_aggregated_updated`
  ADD CONSTRAINT `FK_8927DD33B8854CFBC5B85034B9B299CD` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_order_status_label`
--
ALTER TABLE `jeu6_sales_order_status_label`
  ADD CONSTRAINT `FK_OZSS_SALES_ORDER_STS_LBL_STS_OZSS_SALES_ORDER_STS_STS` FOREIGN KEY (`status`) REFERENCES `jeu6_sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_SALES_ORDER_STS_LBL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_order_status_state`
--
ALTER TABLE `jeu6_sales_order_status_state`
  ADD CONSTRAINT `FK_OZSS_SALES_ORDER_STS_STATE_STS_OZSS_SALES_ORDER_STS_STS` FOREIGN KEY (`status`) REFERENCES `jeu6_sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_order_tax_item`
--
ALTER TABLE `jeu6_sales_order_tax_item`
  ADD CONSTRAINT `FK_D9BAEBD52F0D12657E49F78D799B27C5` FOREIGN KEY (`item_id`) REFERENCES `jeu6_sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_JEU6_SALES_ORDER_TAX_ITEM_TAX_ID_JEU6_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `jeu6_sales_order_tax` (`tax_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_payment_transaction`
--
ALTER TABLE `jeu6_sales_payment_transaction`
  ADD CONSTRAINT `FK_3252D494887CF30E4BF0419796BD487E` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_D6879957ABCECEF7DF3BDE97CE6F7536` FOREIGN KEY (`parent_id`) REFERENCES `jeu6_sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_2B9C57D99E32D434A97167C2E20BE890` FOREIGN KEY (`payment_id`) REFERENCES `jeu6_sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_recurring_profile`
--
ALTER TABLE `jeu6_sales_recurring_profile`
  ADD CONSTRAINT `FK_OZSS_SALES_RECURRING_PROFILE_CSTR_ID_OZSS_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_33F5CD3067E22B3BE4D8CE11F28CE9FE` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_recurring_profile_order`
--
ALTER TABLE `jeu6_sales_recurring_profile_order`
  ADD CONSTRAINT `FK_E0CD426EC7E033F6615CB57D6E3D1BA0` FOREIGN KEY (`order_id`) REFERENCES `jeu6_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_53540E6D33AE0A75AB78FF62202C81FD` FOREIGN KEY (`profile_id`) REFERENCES `jeu6_sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_refunded_aggregated`
--
ALTER TABLE `jeu6_sales_refunded_aggregated`
  ADD CONSTRAINT `FK_OZSS_SALES_REFUNDED_AGGRED_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_refunded_aggregated_order`
--
ALTER TABLE `jeu6_sales_refunded_aggregated_order`
  ADD CONSTRAINT `FK_365FC6F021DAF14BA80B2F4E44156B38` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_shipping_aggregated`
--
ALTER TABLE `jeu6_sales_shipping_aggregated`
  ADD CONSTRAINT `FK_OZSS_SALES_SHPP_AGGRED_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sales_shipping_aggregated_order`
--
ALTER TABLE `jeu6_sales_shipping_aggregated_order`
  ADD CONSTRAINT `FK_D29C9161A6C17EE252182DB95242EC64` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_sitemap`
--
ALTER TABLE `jeu6_sitemap`
  ADD CONSTRAINT `FK_OZSS_SITEMAP_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_tag`
--
ALTER TABLE `jeu6_tag`
  ADD CONSTRAINT `FK_OZSS_TAG_FIRST_CUSTOMER_ID_OZSS_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`first_customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_OZSS_TAG_FIRST_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`first_store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `jeu6_tag_properties`
--
ALTER TABLE `jeu6_tag_properties`
  ADD CONSTRAINT `FK_OZSS_TAG_PROPERTIES_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_TAG_PROPERTIES_TAG_ID_OZSS_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `jeu6_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_tag_relation`
--
ALTER TABLE `jeu6_tag_relation`
  ADD CONSTRAINT `FK_OZSS_TAG_RELATION_CUSTOMER_ID_OZSS_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_TAG_RELATION_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_TAG_RELATION_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_TAG_RELATION_TAG_ID_OZSS_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `jeu6_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_tag_summary`
--
ALTER TABLE `jeu6_tag_summary`
  ADD CONSTRAINT `FK_OZSS_TAG_SUMMARY_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_TAG_SUMMARY_TAG_ID_OZSS_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `jeu6_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_tax_calculation`
--
ALTER TABLE `jeu6_tax_calculation`
  ADD CONSTRAINT `FK_OZSS_TAX_CALC_PRD_TAX_CLASS_ID_OZSS_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `jeu6_tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_TAX_CALC_CSTR_TAX_CLASS_ID_OZSS_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `jeu6_tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_62DB4512AB0C0A8595A3858FFBECEC0D` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `jeu6_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_8D090897D460B37FE6B9B6D189E0231D` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `jeu6_tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_tax_calculation_rate_title`
--
ALTER TABLE `jeu6_tax_calculation_rate_title`
  ADD CONSTRAINT `FK_OZSS_TAX_CALC_RATE_TTL_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_84A1575863CBF1437DE9EF55A593209A` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `jeu6_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_tax_order_aggregated_created`
--
ALTER TABLE `jeu6_tax_order_aggregated_created`
  ADD CONSTRAINT `FK_6CF8E3F59FBA6559E9D9472EFD55EFA9` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_tax_order_aggregated_updated`
--
ALTER TABLE `jeu6_tax_order_aggregated_updated`
  ADD CONSTRAINT `FK_031A04497B970D9A35BDA1287744615B` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_weee_discount`
--
ALTER TABLE `jeu6_weee_discount`
  ADD CONSTRAINT `FK_257A0BD36434C562044B3C9E250856C3` FOREIGN KEY (`customer_group_id`) REFERENCES `jeu6_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_WEEE_DISCOUNT_ENTT_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_WEEE_DISCOUNT_WEBSITE_ID_OZSS_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_weee_tax`
--
ALTER TABLE `jeu6_weee_tax`
  ADD CONSTRAINT `FK_OZSS_WEEE_TAX_COUNTRY_OZSS_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `jeu6_directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_WEEE_TAX_ENTITY_ID_OZSS_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_WEEE_TAX_WEBSITE_ID_OZSS_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `jeu6_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_WEEE_TAX_ATTRIBUTE_ID_OZSS_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `jeu6_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_widget_instance_page`
--
ALTER TABLE `jeu6_widget_instance_page`
  ADD CONSTRAINT `FK_87C4659BC5B765F62118CAE506116CF3` FOREIGN KEY (`instance_id`) REFERENCES `jeu6_widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_widget_instance_page_layout`
--
ALTER TABLE `jeu6_widget_instance_page_layout`
  ADD CONSTRAINT `FK_E41EA10D21034AE5FAC165A1FEB33828` FOREIGN KEY (`page_id`) REFERENCES `jeu6_widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_25C0BE6799B71EECD84DDA66B6AB05DD` FOREIGN KEY (`layout_update_id`) REFERENCES `jeu6_core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_wishlist`
--
ALTER TABLE `jeu6_wishlist`
  ADD CONSTRAINT `FK_OZSS_WISHLIST_CUSTOMER_ID_OZSS_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `jeu6_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_wishlist_item`
--
ALTER TABLE `jeu6_wishlist_item`
  ADD CONSTRAINT `FK_OZSS_WISHLIST_ITEM_WISHLIST_ID_OZSS_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `jeu6_wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_WISHLIST_ITEM_PRD_ID_OZSS_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `jeu6_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OZSS_WISHLIST_ITEM_STORE_ID_OZSS_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_wishlist_item_option`
--
ALTER TABLE `jeu6_wishlist_item_option`
  ADD CONSTRAINT `FK_0B3BF126B399685CF1833465AB4B3159` FOREIGN KEY (`wishlist_item_id`) REFERENCES `jeu6_wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_xmlconnect_application`
--
ALTER TABLE `jeu6_xmlconnect_application`
  ADD CONSTRAINT `FK_DA4356AE96546660CBA9E4617FB0CBD1` FOREIGN KEY (`store_id`) REFERENCES `jeu6_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `jeu6_xmlconnect_config_data`
--
ALTER TABLE `jeu6_xmlconnect_config_data`
  ADD CONSTRAINT `FK_8E081C441110265D2C1EFA6901B65DAB` FOREIGN KEY (`application_id`) REFERENCES `jeu6_xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_xmlconnect_history`
--
ALTER TABLE `jeu6_xmlconnect_history`
  ADD CONSTRAINT `FK_30B63A00D9CCB1AC03A101010A3891C2` FOREIGN KEY (`application_id`) REFERENCES `jeu6_xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_xmlconnect_notification_template`
--
ALTER TABLE `jeu6_xmlconnect_notification_template`
  ADD CONSTRAINT `FK_2941C80FA29758E33352FED4A2C086BF` FOREIGN KEY (`application_id`) REFERENCES `jeu6_xmlconnect_application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jeu6_xmlconnect_queue`
--
ALTER TABLE `jeu6_xmlconnect_queue`
  ADD CONSTRAINT `FK_2279F62912BC86A23704DF9B558AD03A` FOREIGN KEY (`template_id`) REFERENCES `jeu6_xmlconnect_notification_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
