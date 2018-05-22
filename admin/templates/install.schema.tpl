-- phpMyAdmin SQL Dump
-- version 2.6.3-pl1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 27, 2007 at 04:00 PM
-- Server version: 5.0.32
-- PHP Version: 4.4.4-8+etch4
--
-- Database: `storesuite`
--

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%accountingref`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%accountingref` (
  `accountingrefid` int(10) unsigned NOT NULL auto_increment,
  `accountingrefmoduleid` varchar(100) NOT NULL default '',
  `accountingrefexternalid` varchar(100) NOT NULL DEFAULT '',
  `accountingrefnodeid` int(10) unsigned NOT NULL DEFAULT 0,
  `accountingreftype` varchar(20) NOT NULL DEFAULT '',
  `accountingrefvalue` TEXT,
  PRIMARY KEY  (`accountingrefid`),
  KEY `i_accountingref_accountingrefmoduleid` (`accountingrefmoduleid`),
  KEY `i_accountingref_accountingrefexternalid` (`accountingrefexternalid`),
  KEY `i_accountingref_accountingrefnodeid` (`accountingrefnodeid`),
  KEY `i_accountingref_accountingreftype` (`accountingreftype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%administrator_log`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%administrator_log` (
  `logid` int(11) NOT NULL auto_increment,
  `loguserid` int(11) NOT NULL default '0',
  `logip` varchar(30) NOT NULL default '',
  `logdate` int(11) NOT NULL default '0',
  `logtodo` varchar(100) NOT NULL default '',
  `logdata` text,
  PRIMARY KEY  (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%banners`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%banners` (
  `bannerid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `content` longtext,
  `page` enum('home_page','category_page','brand_page','search_page') NOT NULL default 'home_page',
  `catorbrandid` int(11) NOT NULL default '0',
  `location` enum('top','bottom') NOT NULL default 'top',
  `datecreated` int(11) NOT NULL default '0',
  `datetype` enum('always','custom') NOT NULL default 'always',
  `datefrom` int(11) NOT NULL default '0',
  `dateto` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`bannerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%brands`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%brands` (
  `brandid` int(11) NOT NULL auto_increment,
  `brandname` varchar(255) NOT NULL default '',
  `brandpagetitle` varchar(250) NOT NULL default '',
  `brandmetakeywords` text,
  `brandmetadesc` text,
  `brandimagefile` varchar(255) NOT NULL default '',
  `brandsearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`brandid`),
  UNIQUE KEY `u_brands_brandname` (`brandname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%brand_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%brand_search` (
  `brandsearchid` int(11) NOT NULL auto_increment,
  `brandid` int(11) NOT NULL default '0',
  `brandname` varchar(250) NOT NULL default '',
  `brandpagetitle` varchar(250) NOT NULL default '',
  `brandsearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`brandsearchid`),
  KEY `i_brand_search_brandid` (`brandid`),
  FULLTEXT KEY `brandname` (`brandname`,`brandpagetitle`,`brandsearchkeywords`),
  FULLTEXT KEY `brandname2` (`brandname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%brand_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%brand_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `brandid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%categories`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%categories` (
  `categoryid` int(11) NOT NULL auto_increment,
  `catparentid` int(11) default '0',
  `catname` varchar(50) NOT NULL default '',
  `catdesc` text NOT NULL,
  `catviews` int(11) NOT NULL default	 '0',
  `catsort` int(11) NOT NULL default '0',
  `catpagetitle` varchar(250) NOT NULL default '',
  `catmetakeywords` text,
  `catmetadesc` text,
  `catlayoutfile` varchar(50) NOT NULL default '',
  `catparentlist` text,
  `catimagefile` varchar(255) NOT NULL default '',
  `catvisible` TINYINT NOT NULL DEFAULT 1,
  `catsearchkeywords` varchar(255) NOT NULL default '',
  `cat_enable_optimizer` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `catnsetleft` int(11) unsigned NOT NULL default '0',
  `catnsetright` int(11) unsigned NOT NULL default '0',
  `cataltcategoriescache` text,
  `google_ps_enabled` TINYINT(1) NOT NULL default '0' ,
  PRIMARY KEY  (`categoryid`),
  KEY `i_categoryid_catnsetleft_catnsetright` (`categoryid`,`catnsetleft`,`catnsetright`),
  KEY `i_catnsetleft` (`catnsetleft`),
  KEY `i_catparentid_catsort_catname` (`catparentid`,`catsort`,`catname`),
  KEY `i_catvisible_catsort_catname` (`catvisible`,`catsort`,`catname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%category_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%category_search` (
  `categorysearchid` int(11) NOT NULL auto_increment,
  `categoryid` int(11) NOT NULL default '0',
  `catname` varchar(250) NOT NULL default '',
  `catdesc` text NOT NULL,
  `catsearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`categorysearchid`),
  KEY `i_category_search_categoryid` (`categoryid`),
  FULLTEXT KEY `catname` (`catname`,`catdesc`,`catsearchkeywords`),
  FULLTEXT KEY `catname2` (`catname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%category_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%category_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `categoryid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%categoryassociations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%categoryassociations` (
  `associationid` int(11) NOT NULL auto_increment,
  `productid` int(11) default '0',
  `categoryid` int(11) default '0',
  PRIMARY KEY  (`associationid`),
  KEY `i_categoryassociations_prodcat` (`productid`, `categoryid`),
  KEY `i_categoryassociations_catprod` (`categoryid`, `productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%config`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%config` (
  `database_version` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%country_regions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%country_regions` (
  `couregid` int(11) NOT NULL auto_increment,
  `couregname` varchar(255) NOT NULL default '',
  `couregiso2` char(2) NOT NULL default '',
  `couregiso3` char(3) NOT NULL default '',
  PRIMARY KEY  (`couregid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Data for table `%%PREFIX%%countries`
--

TRUNCATE `%%PREFIX%%country_regions`;

INSERT INTO `%%PREFIX%%country_regions` (`couregid`, `couregname`, `couregiso2`, `couregiso3`) VALUES (1, 'European Union', 'EU', 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%countries`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%countries` (
  `countryid` int(11) NOT NULL auto_increment,
  `countrycouregid` int(11),
  `countryname` varchar(255) NOT NULL default '',
  `countryiso2` char(2) NOT NULL default '',
  `countryiso3` char(3) NOT NULL default '',
  PRIMARY KEY  (`countryid`),
  KEY `i_regions_countrycouregid` (`countrycouregid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Data for table `%%PREFIX%%countries`
--

TRUNCATE `%%PREFIX%%countries`;

INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (1, NULL, 'Afghanistan', 'AF', 'AFG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (2, NULL, 'Albania', 'AL', 'ALB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (3, NULL, 'Algeria', 'DZ', 'DZA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (4, NULL, 'American Samoa', 'AS', 'ASM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (5, NULL, 'Andorra', 'AD', 'AND');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (6, NULL, 'Angola', 'AO', 'AGO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (7, NULL, 'Anguilla', 'AI', 'AIA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (8, NULL, 'Antarctica', 'AQ', '\r');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (9, NULL, 'Antigua and Barbuda', 'AG', 'ATG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (10, NULL, 'Argentina', 'AR', 'ARG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (11, NULL, 'Armenia', 'AM', 'ARM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (12, NULL, 'Aruba', 'AW', 'ABW');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (13, NULL, 'Australia', 'AU', 'AUS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (14, 1, 'Austria', 'AT', 'AUT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (15, NULL, 'Azerbaijan', 'AZ', 'AZE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (16, NULL, 'Bahamas', 'BS', 'BHS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (17, NULL, 'Bahrain', 'BH', 'BHR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (18, NULL, 'Bangladesh', 'BD', 'BGD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (19, NULL, 'Barbados', 'BB', 'BRB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (20, NULL, 'Belarus', 'BY', 'BLR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (21, 1, 'Belgium', 'BE', 'BEL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (22, NULL, 'Belize', 'BZ', 'BLZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (23, NULL, 'Benin', 'BJ', 'BEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (24, NULL, 'Bermuda', 'BM', 'BMU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (25, NULL, 'Bhutan', 'BT', 'BTN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (26, NULL, 'Bolivia', 'BO', 'BOL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (27, NULL, 'Bosnia and Herzegovina', 'BA', 'BIH');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (28, NULL, 'Botswana', 'BW', 'BWA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (29, NULL, 'Bouvet Island', 'BV', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (30, NULL, 'Brazil', 'BR', 'BRA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (31, NULL, 'British Indian Ocean Territory', 'IO', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (32, NULL, 'Brunei Darussalam', 'BN', 'BRN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (33, 1, 'Bulgaria', 'BG', 'BGR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (34, NULL, 'Burkina Faso', 'BF', 'BFA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (35, NULL, 'Burundi', 'BI', 'BDI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (36, NULL, 'Cambodia', 'KH', 'KHM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (37, NULL, 'Cameroon', 'CM', 'CMR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (38, NULL, 'Canada', 'CA', 'CAN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (39, NULL, 'Cape Verde', 'CV', 'CPV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (40, NULL, 'Cayman Islands', 'KY', 'CYM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (41, NULL, 'Central African Republic', 'CF', 'CAF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (42, NULL, 'Chad', 'TD', 'TCD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (43, NULL, 'Chile', 'CL', 'CHL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (44, NULL, 'China', 'CN', 'CHN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (45, NULL, 'Christmas Island', 'CX', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (46, NULL, 'Cocos (Keeling) Islands', 'CC', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (47, NULL, 'Colombia', 'CO', 'COL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (48, NULL, 'Comoros', 'KM', 'COM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (49, NULL, 'Congo', 'CG', 'COG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (50, NULL, 'Congo, the Democratic Republic of the', 'CD', 'COD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (51, NULL, 'Cook Islands', 'CK', 'COK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (52, NULL, 'Costa Rica', 'CR', 'CRI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (54, NULL, 'Croatia', 'HR', 'HRV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (55, NULL, 'Cuba', 'CU', 'CUB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (56, NULL, 'Cyprus', 'CY', 'CYP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (57, NULL, 'Czech Republic', 'CZ', 'CZE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (58, NULL, 'Denmark', 'DK', 'DNK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (59, NULL, 'Djibouti', 'DJ', 'DJI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (60, NULL, 'Dominica', 'DM', 'DMA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (61, NULL, 'Dominican Republic', 'DO', 'DOM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (62, NULL, 'Ecuador', 'EC', 'ECU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (63, NULL, 'Egypt', 'EG', 'EGY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (64, NULL, 'El Salvador', 'SV', 'SLV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (65, NULL, 'Equatorial Guinea', 'GQ', 'GNQ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (66, NULL, 'Eritrea', 'ER', 'ERI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (67, NULL, 'Estonia', 'EE', 'EST');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (68, NULL, 'Ethiopia', 'ET', 'ETH');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (69, NULL, 'Falkland Islands (Malvinas)', 'FK', 'FLK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (70, NULL, 'Faroe Islands', 'FO', 'FRO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (71, NULL, 'Fiji', 'FJ', 'FJI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (72, 1, 'Finland', 'FI', 'FIN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (73, 1, 'France', 'FR', 'FRA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (74, NULL, 'French Guiana', 'GF', 'GUF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (75, NULL, 'French Polynesia', 'PF', 'PYF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (76, NULL, 'French Southern Territories', 'TF', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (77, NULL, 'Gabon', 'GA', 'GAB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (78, NULL, 'Gambia', 'GM', 'GMB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (79, NULL, 'Georgia', 'GE', 'GEO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (80, 1, 'Germany', 'DE', 'DEU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (81, NULL, 'Ghana', 'GH', 'GHA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (82, NULL, 'Gibraltar', 'GI', 'GIB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (83, 1, 'Greece', 'GR', 'GRC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (84, NULL, 'Greenland', 'GL', 'GRL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (85, NULL, 'Grenada', 'GD', 'GRD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (86, NULL, 'Guadeloupe', 'GP', 'GLP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (87, NULL, 'Guam', 'GU', 'GUM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (88, NULL, 'Guatemala', 'GT', 'GTM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (89, NULL, 'Guinea', 'GN', 'GIN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (90, NULL, 'Guinea-Bissau', 'GW', 'GNB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (91, NULL, 'Guyana', 'GY', 'GUY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (92, NULL, 'Haiti', 'HT', 'HTI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (93, NULL, 'Heard Island and Mcdonald Islands', 'HM', '\r');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (94, NULL, 'Holy See (Vatican City State)', 'VA', 'VAT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (95, NULL, 'Honduras', 'HN', 'HND');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (96, NULL, 'Hong Kong', 'HK', 'HKG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (97, NULL, 'Hungary', 'HU', 'HUN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (98, NULL, 'Iceland', 'IS', 'ISL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (99, NULL, 'India', 'IN', 'IND');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (100, NULL, 'Indonesia', 'ID', 'IDN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (101, NULL, 'Iran, Islamic Republic of', 'IR', 'IRN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (102, NULL, 'Iraq', 'IQ', 'IRQ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (103, 1, 'Ireland', 'IE', 'IRL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (104, NULL, 'Israel', 'IL', 'ISR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (105, 1, 'Italy', 'IT', 'ITA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (106, NULL, 'Jamaica', 'JM', 'JAM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (107, NULL, 'Japan', 'JP', 'JPN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (108, NULL, 'Jordan', 'JO', 'JOR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (109, NULL, 'Kazakhstan', 'KZ', 'KAZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (110, NULL, 'Kenya', 'KE', 'KEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (111, NULL, 'Kiribati', 'KI', 'KIR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (113, NULL, 'Korea, Republic of', 'KR', 'KOR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (114, NULL, 'Kuwait', 'KW', 'KWT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (115, NULL, 'Kyrgyzstan', 'KG', 'KGZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (117, NULL, 'Latvia', 'LV', 'LVA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (118, NULL, 'Lebanon', 'LB', 'LBN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (119, NULL, 'Lesotho', 'LS', 'LSO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (120, NULL, 'Liberia', 'LR', 'LBR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (121, NULL, 'Libyan Arab Jamahiriya', 'LY', 'LBY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (122, NULL, 'Liechtenstein', 'LI', 'LIE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (123, NULL, 'Lithuania', 'LT', 'LTU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (124, 1, 'Luxembourg', 'LU', 'LUX');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (125, NULL, 'Macao', 'MO', 'MAC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (126, NULL, 'Macedonia, the Former Yugoslav Republic of', 'MK', 'MKD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (127, NULL, 'Madagascar', 'MG', 'MDG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (128, NULL, 'Malawi', 'MW', 'MWI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (129, NULL, 'Malaysia', 'MY', 'MYS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (130, NULL, 'Maldives', 'MV', 'MDV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (131, NULL, 'Mali', 'ML', 'MLI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (132, NULL, 'Malta', 'MT', 'MLT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (133, NULL, 'Marshall Islands', 'MH', 'MHL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (134, NULL, 'Martinique', 'MQ', 'MTQ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (135, NULL, 'Mauritania', 'MR', 'MRT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (136, NULL, 'Mauritius', 'MU', 'MUS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (137, NULL, 'Mayotte', 'YT', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (138, NULL, 'Mexico', 'MX', 'MEX');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (139, NULL, 'Micronesia, Federated States of', 'FM', 'FSM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (140, NULL, 'Moldova, Republic of', 'MD', 'MDA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (141, NULL, 'Monaco', 'MC', 'MCO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (142, NULL, 'Mongolia', 'MN', 'MNG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (143, NULL, 'Montserrat', 'MS', 'MSR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (144, NULL, 'Morocco', 'MA', 'MAR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (145, NULL, 'Mozambique', 'MZ', 'MOZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (146, NULL, 'Myanmar', 'MM', 'MMR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (147, NULL, 'Namibia', 'NA', 'NAM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (148, NULL, 'Nauru', 'NR', 'NRU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (149, NULL, 'Nepal', 'NP', 'NPL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (150, 1, 'Netherlands', 'NL', 'NLD');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (151, NULL, 'Netherlands Antilles', 'AN', 'ANT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (152, NULL, 'New Caledonia', 'NC', 'NCL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (153, NULL, 'New Zealand', 'NZ', 'NZL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (154, NULL, 'Nicaragua', 'NI', 'NIC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (155, NULL, 'Niger', 'NE', 'NER');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (156, NULL, 'Nigeria', 'NG', 'NGA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (157, NULL, 'Niue', 'NU', 'NIU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (158, NULL, 'Norfolk Island', 'NF', 'NFK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (159, NULL, 'Northern Mariana Islands', 'MP', 'MNP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (160, NULL, 'Norway', 'NO', 'NOR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (161, NULL, 'Oman', 'OM', 'OMN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (162, NULL, 'Pakistan', 'PK', 'PAK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (163, NULL, 'Palau', 'PW', 'PLW');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (164, NULL, 'Palestinian Territory, Occupied', 'PS', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (165, NULL, 'Panama', 'PA', 'PAN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (166, NULL, 'Papua New Guinea', 'PG', 'PNG');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (167, NULL, 'Paraguay', 'PY', 'PRY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (168, NULL, 'Peru', 'PE', 'PER');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (169, NULL, 'Philippines', 'PH', 'PHL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (170, NULL, 'Pitcairn', 'PN', 'PCN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (171, NULL, 'Poland', 'PL', 'POL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (172, 1, 'Portugal', 'PT', 'PRT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (173, NULL, 'Puerto Rico', 'PR', 'PRI');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (174, NULL, 'Qatar', 'QA', 'QAT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (175, NULL, 'Reunion', 'RE', 'REU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (176, NULL, 'Romania', 'RO', 'ROM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (177, NULL, 'Russian Federation', 'RU', 'RUS');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (178, NULL, 'Rwanda', 'RW', 'RWA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (179, NULL, 'Saint Helena', 'SH', 'SHN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (180, NULL, 'Saint Kitts and Nevis', 'KN', 'KNA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (181, NULL, 'Saint Lucia', 'LC', 'LCA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (182, NULL, 'Saint Pierre and Miquelon', 'PM', 'SPM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (183, NULL, 'Saint Vincent and the Grenadines', 'VC', 'VCT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (184, NULL, 'Samoa', 'WS', 'WSM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (185, NULL, 'San Marino', 'SM', 'SMR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (186, NULL, 'Sao Tome and Principe', 'ST', 'STP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (187, NULL, 'Saudi Arabia', 'SA', 'SAU');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (188, NULL, 'Senegal', 'SN', 'SEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (189, NULL, 'Serbia', 'RS', 'SRB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (190, NULL, 'Seychelles', 'SC', 'SYC');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (191, NULL, 'Sierra Leone', 'SL', 'SLE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (192, NULL, 'Singapore', 'SG', 'SGP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (193, NULL, 'Slovakia', 'SK', 'SVK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (194, NULL, 'Slovenia', 'SI', 'SVN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (195, NULL, 'Solomon Islands', 'SB', 'SLB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (196, NULL, 'Somalia', 'SO', 'SOM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (197, NULL, 'South Africa', 'ZA', 'ZAF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (198, NULL, 'South Georgia and the South Sandwich Islands', 'GS', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (199, 1, 'Spain', 'ES', 'ESP');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (200, NULL, 'Sri Lanka', 'LK', 'LKA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (201, NULL, 'Sudan', 'SD', 'SDN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (202, NULL, 'Suriname', 'SR', 'SUR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (203, NULL, 'Svalbard and Jan Mayen', 'SJ', 'SJM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (204, NULL, 'Swaziland', 'SZ', 'SWZ');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (205, NULL, 'Sweden', 'SE', 'SWE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (206, NULL, 'Switzerland', 'CH', 'CHE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (207, NULL, 'Syrian Arab Republic', 'SY', 'SYR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (208, NULL, 'Taiwan', 'TW', 'TWN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (209, NULL, 'Tajikistan', 'TJ', 'TJK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (210, NULL, 'Tanzania, United Republic of', 'TZ', 'TZA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (211, NULL, 'Thailand', 'TH', 'THA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (212, NULL, 'Timor-Leste', 'TL', 'NUL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (213, NULL, 'Togo', 'TG', 'TGO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (214, NULL, 'Tokelau', 'TK', 'TKL');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (215, NULL, 'Tonga', 'TO', 'TON');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (216, NULL, 'Trinidad and Tobago', 'TT', 'TTO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (217, NULL, 'Tunisia', 'TN', 'TUN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (218, NULL, 'Turkey', 'TR', 'TUR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (219, NULL, 'Turkmenistan', 'TM', 'TKM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (220, NULL, 'Turks and Caicos Islands', 'TC', 'TCA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (221, NULL, 'Tuvalu', 'TV', 'TUV');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (222, NULL, 'Uganda', 'UG', 'UGA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (223, NULL, 'Ukraine', 'UA', 'UKR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (224, NULL, 'United Arab Emirates', 'AE', 'ARE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (225, NULL, 'United Kingdom', 'GB', 'GBR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (226, NULL, 'United States', 'US', 'USA');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (227, NULL, 'United States Minor Outlying Islands', 'UM', '\r');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (228, NULL, 'Uruguay', 'UY', 'URY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (229, NULL, 'Uzbekistan', 'UZ', 'UZB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (230, NULL, 'Vanuatu', 'VU', 'VUT');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (231, NULL, 'Venezuela', 'VE', 'VEN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (232, NULL, 'Viet Nam', 'VN', 'VNM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (233, NULL, 'Virgin Islands, British', 'VG', 'VGB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (234, NULL, 'Virgin Islands, U.S.', 'VI', 'VIR');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (235, NULL, 'Wallis and Futuna', 'WF', 'WLF');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (236, NULL, 'Western Sahara', 'EH', 'ESH');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (237, NULL, 'Yemen', 'YE', 'YEM');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (238, NULL, 'Zambia', 'ZM', 'ZMB');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (239, NULL, 'Zimbabwe', 'ZW', 'ZWE');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (240, NULL, 'Isle of Man', 'IM', 'IMN');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (241, NULL, 'Jersey', 'JE', 'JEY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (242, NULL, 'Guernsey', 'GG', 'GGY');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (243, NULL, 'Lao People\'s Democratic Republic', 'LA', 'LAO');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (244, NULL, 'Korea, Democratic People\'s Republic of', 'KP', 'PRK');
INSERT INTO `%%PREFIX%%countries` (`countryid`, `countrycouregid`, `countryname`, `countryiso2`, `countryiso3`) VALUES (245, NULL, 'Montenegro', 'ME', 'MNE');

--
-- Table structure for table `%%PREFIX%%country_states`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%country_states` (
  `stateid` int(11) NOT NULL auto_increment,
  `statename` varchar(255) NOT NULL default '',
  `statecountry` int(11) NOT NULL default '0',
  `stateabbrv` varchar(5) NOT NULL default '',
  PRIMARY KEY  (`stateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Data for table `%%PREFIX%%country_states`
--

TRUNCATE `%%PREFIX%%country_states`;

INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Alabama', 226, 'AL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Alaska', 226, 'AK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('American Samoa', 226, 'AS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Arizona', 226, 'AZ');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Arkansas', 226, 'AR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Armed Forces Africa', 226, 'AF');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Armed Forces Americas', 226, 'AA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Armed Forces Canada', 226, 'AC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Armed Forces Europe', 226, 'AE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Armed Forces Middle East', 226, 'AM');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Armed Forces Pacific', 226, 'AP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('California', 226, 'CA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Colorado', 226, 'CO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Connecticut', 226, 'CT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Delaware', 226, 'DE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('District of Columbia', 226, 'DC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Federated States Of Micronesia', 226, 'FM');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Florida', 226, 'FL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Georgia', 226, 'GA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Guam', 226, 'GU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Hawaii', 226, 'HI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Idaho', 226, 'ID');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Illinois', 226, 'IL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Indiana', 226, 'IN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Iowa', 226, 'IA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kansas', 226, 'KS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kentucky', 226, 'KY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Louisiana', 226, 'LA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Maine', 226, 'ME');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Marshall Islands', 226, 'MH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Maryland', 226, 'MD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Massachusetts', 226, 'MA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Michigan', 226, 'MI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Minnesota', 226, 'MN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Mississippi', 226, 'MS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Missouri', 226, 'MO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Montana', 226, 'MT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nebraska', 226, 'NE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nevada', 226, 'NV');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('New Hampshire', 226, 'NH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('New Jersey', 226, 'NJ');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('New Mexico', 226, 'NM');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('New York', 226, 'NY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('North Carolina', 226, 'NC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('North Dakota', 226, 'ND');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Northern Mariana Islands', 226, 'MP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ohio', 226, 'OH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Oklahoma', 226, 'OK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Oregon', 226, 'OR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Palau', 226, 'PW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Pennsylvania', 226, 'PA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Puerto Rico', 226, 'PR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Rhode Island', 226, 'RI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('South Carolina', 226, 'SC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('South Dakota', 226, 'SD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tennessee', 226, 'TN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Texas', 226, 'TX');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Utah', 226, 'UT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Vermont', 226, 'VT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Virgin Islands', 226, 'VI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Virginia', 226, 'VA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Washington', 226, 'WA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('West Virginia', 226, 'WV');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wisconsin', 226, 'WI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wyoming', 226, 'WY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Alberta', 38, 'AB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('British Columbia', 38, 'BC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Manitoba', 38, 'MB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Newfoundland', 38, 'NF');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('New Brunswick', 38, 'NB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nova Scotia', 38, 'NS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Northwest Territories', 38, 'NT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nunavut', 38, 'NU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ontario', 38, 'ON');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Prince Edward Island', 38, 'PE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Quebec', 38, 'QC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Saskatchewan', 38, 'SK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Yukon Territory', 38, 'YT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Niedersachsen', 80, 'NDS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Baden-Württemberg', 80, 'BAW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bayern', 80, 'BAY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Berlin', 80, 'BER');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Brandenburg', 80, 'BRG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bremen', 80, 'BRE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Hamburg', 80, 'HAM');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Hessen', 80, 'HES');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Mecklenburg-Vorpommern', 80, 'MEC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nordrhein-Westfalen', 80, 'NRW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Rheinland-Pfalz', 80, 'RHE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Saarland', 80, 'SAR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sachsen', 80, 'SAS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sachsen-Anhalt', 80, 'SAC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Schleswig-Holstein', 80, 'SCN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Thüringen', 80, 'THE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wien', 14, 'WIE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Niederösterreich', 14, 'NO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Oberösterreich', 14, 'OO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Salzburg', 14, 'SB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kärnten', 14, 'KN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Steiermark', 14, 'ST');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tirol', 14, 'TI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Burgenland', 14, 'BL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Voralberg', 14, 'VB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Aargau', 206, 'AG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Appenzell Innerrhoden', 206, 'AI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Appenzell Ausserrhoden', 206, 'APP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bern', 206, 'BE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Basel-Landschaft', 206, 'BLA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Basel-Stadt', 206, 'BS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Freiburg', 206, 'FR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Genf', 206, 'GE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Glarus', 206, 'GL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Graubünden', 206, 'JUB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Jura', 206, 'JU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Luzern', 206, 'LU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Neuenburg', 206, 'NEU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nidwalden', 206, 'NW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Obwalden', 206, 'OW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('St. Gallen', 206, 'SG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Schaffhausen', 206, 'SH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Solothurn', 206, 'SO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Schwyz', 206, 'SZ');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Thurgau', 206, 'TG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tessin', 206, 'TE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Uri', 206, 'UR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Waadt', 206, 'VD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wallis', 206, 'VS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Zug', 206, 'ZG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Zürich', 206, 'ZH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('A Coruña', 199, 'ACOR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Alava', 199, 'ALAV');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Albacete', 199, 'ALBA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Alicante', 199, 'ALIC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Almeria', 199, 'ALME');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Asturias', 199, 'ASTU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Avila', 199, 'AVIL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Badajoz', 199, 'BADA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Baleares', 199, 'BALE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Barcelona', 199, 'BARC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Burgos', 199, 'BURG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Caceres', 199, 'CACE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cadiz', 199, 'CADI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cantabria', 199, 'CANT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Castellon', 199, 'CAST');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ceuta', 199, 'CEUT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ciudad Real', 199, 'CIUD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cordoba', 199, 'CORD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cuenca', 199, 'CUEN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Girona', 199, 'GIRO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Granada', 199, 'GRAN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Guadalajara', 199, 'GUAD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Guipuzcoa', 199, 'GUIP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Huelva', 199, 'HUEL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Huesca', 199, 'HUES');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Jaen', 199, 'JAEN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('La Rioja', 199, 'LAR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Las Palmas', 199, 'LAS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Leon', 199, 'LEON');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Lleida', 199, 'LLEI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Lugo', 199, 'LUGO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Madrid', 199, 'MADR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Malaga', 199, 'MALA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Melilla', 199, 'MELI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Murcia', 199, 'MURC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Navarra', 199, 'NAVA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ourense', 199, 'OURE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Palencia', 199, 'PALE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Pontevedra', 199, 'PONT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Salamanca', 199, 'SALA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Santa Cruz de Tenerife', 199, 'SANT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Segovia', 199, 'SEGO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sevilla', 199, 'SEVI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Soria', 199, 'SORI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tarragona', 199, 'TARR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Teruel', 199, 'TERU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Toledo', 199, 'TOLE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Valencia', 199, 'VALE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Valladolid', 199, 'VALL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Vizcaya', 199, 'VIZC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Zamora', 199, 'ZAMO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Zaragoza', 199, 'ZARA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Carlow', 103, 'CW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cavan', 103, 'CN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Clare', 103, 'CE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cork', 103, 'C');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Donegal', 103, 'DL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Dublin', 103, 'D');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Galway', 103, 'G');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kerry', 103, 'KY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kildare', 103, 'KE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kilkenny', 103, 'KK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Laois', 103, 'LS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Leitrim', 103, 'LM');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Limerick', 103, 'LK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Longford', 103, 'LD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Louth', 103, 'LH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Mayo', 103, 'MO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Meath', 103, 'MH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Monaghan', 103, 'MN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Offaly', 103, 'OY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Roscommon', 103, 'RN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sligo', 103, 'SO');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tipperary', 103, 'TA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Waterford', 103, 'WD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Westmeath', 103, 'WH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wexford', 103, 'WX');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wicklow', 103, 'WW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Australian Capital Territory', 13, 'ACT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('New South Wales', 13, 'NSW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Northern Territory', 13, 'NT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Queensland', 13, 'QLD');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('South Australia', 13, 'SA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tasmania', 13, 'TAS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Victoria', 13, 'VIC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Western Australia', 13, 'WA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Johor', 129, 'JHR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kedah', 129, 'KDH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kelantan', 129, 'KTN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Melaka', 129, 'MLK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Negeri Sembilan', 129, 'NSN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Pahang', 129, 'PHG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Pulau Pinang', 129, 'PNG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Perak', 129, 'PRK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Perlis', 129, 'PLS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Selangor', 129, 'SGR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Terengganu', 129, 'TRG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sabah', 129, 'SBH');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sarawak', 129, 'SRW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kuala Lumpur', 129, 'KUL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Labuan', 129, 'LBN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Putrajaya', 129, 'PJY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Labuan', 129, 'JHR');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Eastern Cape', 197, 'EC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Free State', 197, 'FS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Gauteng', 197, 'GT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('KwaZulu-Natal', 197, 'NL');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Limpopo', 197, 'LP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Mpumalanga', 197, 'MP');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Northern Cape', 197, 'NC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('North-West', 197, 'NW');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Western Cape', 197, 'WC');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bali', 100, 'BA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bangka Belitung', 100, 'BB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Banten', 100, 'BT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bengkulu', 100, 'BE');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Daista Aceh', 100, 'DA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Jakarta', 100, 'JK');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sumatera Utara', 100, 'SU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sumatera Barat', 100, 'SB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Riau', 100, 'SI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Jambi', 100, 'JA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sumatera Selatan', 100, 'SS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Lampung', 100, 'LA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Jawa Barat', 100, 'JB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Jawa Tengah', 100, 'JT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Daista Yogyakarta', 100, 'DY');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Jawa Timur', 100, 'JT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kalimantan Barat', 100, 'KB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kalimantan Tengah', 100, 'KT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kalimantan Timur', 100, 'KI');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kalimantan Selatan', 100, 'KS');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nusa Tenggara Barat', 100, 'NB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nusa Tenggara Timur', 100, 'NT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sulawesi Selatan', 100, 'SN');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sulawesi Tengah', 100, 'ST');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sulawesi Utara', 100, 'SA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sulawesi Tenggara', 100, 'SG');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Maluku', 100, 'MA');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Maluku Utara', 100, 'MU');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Irian Jaya Timur', 100, 'IJ');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Irian Jaya Tengah', 100, 'IT');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Irian Jawa Barat', 100, 'IB');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Gorontalo', 100, 'GO');

INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bedfordshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Berkshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Buckinghamshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cambridgeshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cheshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cornwall', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cumberland', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cumbria', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Derbyshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Devon', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Dorset', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Durham', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('East Suffolk', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('East Sussex', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Essex', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Gloucestershire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Greater London', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Greater Manchester', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Hampshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Herefordshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Hertfordshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Isle of Wight', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kent', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Lancashire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Leicestershire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Lincolnshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('London', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Merseyside', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Middlesex', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Norfolk', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Northamptonshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Northumberland', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('North Humberside', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('North Yorkshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nottinghamshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Oxfordshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Rutland', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Shropshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Somerset', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('South Humberside', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('South Yorkshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Staffordshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Suffolk', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Surrey', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sussex', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tyne and Wear', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Warwickshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('West Midlands', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Westmorland', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('West Suffolk', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('West Sussex', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('West Yorkshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wiltshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Worcestershire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Yorkshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Yorkshire, East Riding', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Yorkshire, North Riding', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Yorkshire, West Riding', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Antrim', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Armagh', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('City of Belfast', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Down', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Fermanagh', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Londonderry', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('City of Londonderry', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Tyrone', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('City of Aberdeen', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Aberdeenshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Angus', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Argyll', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ayrshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Banffshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Berwickshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Bute', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Caithness', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Clackmannanshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cromartyshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Dumfriesshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Dunbartonshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('City of Dundee', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('East Lothian', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('City of Edinburgh', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Fife', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('City of Glasgow', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Inverness-shire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kincardineshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kinross-shire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Kirkcudbrightshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Lanarkshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Midlothian', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Moray', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Nairnshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Orkney', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Peeblesshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Perthshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Renfrewshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ross and Cromarty', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Ross-shire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Roxburghshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Selkirkshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Shetland', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Stirlingshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Sutherland', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('West Lothian', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Wigtownshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Anglesey', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Brecknockshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Caernarfonshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Cardiganshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Carmarthenshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Clwyd', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Denbighshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Dyfed', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Flintshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Glamorgan', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Gwent', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Gwynedd', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Merionethshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Mid Glamorgan', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Monmouthshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Montgomeryshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Pembrokeshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Powys', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('Radnorshire', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('South Glamorgan', 225, '');
INSERT INTO `%%PREFIX%%country_states` (`statename`, `statecountry`, `stateabbrv`) VALUES ('West Glamorgan', 225, '');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%coupons`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%coupons` (
  `couponid` int(11) NOT NULL auto_increment,
  `couponname` varchar(100) NOT NULL default '',
  `coupontype` tinyint(4) NOT NULL default '0',
  `couponamount` decimal(20,4) NOT NULL default '0',
  `couponminpurchase` decimal(20,4) NOT NULL default '0',
  `couponexpires` int(11) NOT NULL default '0',
  `couponenabled` tinyint(4) NOT NULL default '0',
  `couponcode` varchar(50) NOT NULL default '',
  `couponappliesto` enum('categories','products') NOT NULL default 'products',
  `couponnumuses` int(11) NOT NULL default '0',
  `couponmaxuses` int(11) NOT NULL default '0',
  `couponmaxusespercus` int(11) NOT NULL default '0',
  `location_restricted` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  `shipping_method_restricted` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY  (`couponid`),
  UNIQUE KEY `u_coupons_couponcode` (`couponcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%coupon_values`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%coupon_values` (
  `couponid` int(11) NOT NULL,
  `valueid` int(11) NOT NULL,
  PRIMARY KEY  (`couponid`,`valueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%currencies`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%currencies` (
 `currencyid` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 `currencycountryid` INT(11) UNSIGNED DEFAULT NULL,
 `currencycouregid` INT(11) UNSIGNED DEFAULT NULL,
 `currencycode` CHAR(3) NOT NULL DEFAULT '',
 `currencyconvertercode` VARCHAR(255) DEFAULT NULL,
 `currencyname` varchar(255) NOT NULL DEFAULT '',
 `currencyexchangerate` DECIMAL(20,10) NOT NULL DEFAULT 0,
 `currencystring` VARCHAR(20) NOT NULL DEFAULT '',
 `currencystringposition` CHAR(5) NOT NULL DEFAULT '',
 `currencydecimalstring` CHAR(1) NOT NULL DEFAULT '',
 `currencythousandstring` CHAR(1) NOT NULL DEFAULT '',
 `currencydecimalplace` SMALLINT UNSIGNED NOT NULL DEFAULT 2,
 `currencylastupdated` INT(11) NOT NULL DEFAULT 0,
 `currencyisdefault` SMALLINT(1) NOT NULL DEFAULT 0,
 `currencystatus` SMALLINT(1) NOT NULL DEFAULT 0,
 PRIMARY KEY (`currencyid`),
 UNIQUE KEY `u_currencies_currencycode_currencycountryid_currencycouregid` (`currencycode`,`currencycountryid`, `currencycouregid`),
 KEY `i_countries_currencycountryid`(`currencycountryid`),
 KEY `i_countries_currencycouregid`(`currencycouregid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%custom_searches`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%custom_searches` (
  `searchid` int(11) NOT NULL auto_increment,
  `searchtype` enum('orders','products','customers', 'returns', 'giftcertificates', 'shipments') NOT NULL default 'orders',
  `searchname` varchar(255) NOT NULL default '',
  `searchvars` longtext,
  `searchlabel` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`searchid`),
 KEY `i_custom_searches_label` (`searchlabel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `%%PREFIX%%custom_searches` (`searchtype`, `searchname`, `searchvars`, `searchlabel`) VALUES
('orders', 'Incomplete Orders', 'viewName=Incomplete+Orders&orderStatus=0', 'incompleteorders'),
('orders', 'Orders from eBay', 'viewName=Orders from eBay&ebayOrderId=-1', 'ebayorders'),
('orders', 'Pre-Orders', 'viewName=Pre-Orders&preorders[]=1', 'preorders'), ('products', 'Last Import', 'viewName=Last+Import&lastImport=1', 'lastimportproducts'),
('orders', 'Deleted Orders', 'viewName=Deleted+Orders&searchDeletedOrders=only', 'deletedorders');


-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%customer_credits`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_credits` (
  `custcreditid` int(10) NOT NULL auto_increment,
  `customerid` int(10) NOT NULL default '0',
  `creditamount` decimal(20,4) NOT NULL default '0',
  `credittype` enum('return','gift','adjustment') NOT NULL,
  `creditdate` int(10) NOT NULL default '0',
  `creditrefid` int(10) NOT NULL default '0',
  `credituserid` int(10) NOT NULL default '0',
  `creditreason` varchar(200) NOT NULL default '0',
  PRIMARY KEY  (`custcreditid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%customers`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customers` (
  `customerid` int(11) NOT NULL auto_increment,
  `salt` varchar(16) NOT NULL default '',
  `custpassword` varchar(50) NOT NULL default '',
  `custconcompany` varchar(255) NOT NULL default '',
  `custconfirstname` varchar(100) NOT NULL default '',
  `custconlastname` varchar(100) NOT NULL default '',
  `custconemail` varchar(250) NOT NULL default '',
  `custconphone` varchar(50) NOT NULL default '',
  `customertoken` varchar(250) NOT NULL default '',
  `customerpasswordresettoken` varchar(32) NOT NULL default '',
  `customerpasswordresetemail` varchar(255) NOT NULL default '',
  `custdatejoined` int(11) NOT NULL default '0',
  `custlastmodified` int(11) NOT NULL default '0',
  `custimportpassword` varchar(100) NOT NULL default '',
  `custstorecredit` decimal(20,4) NOT NULL default '0',
  `custregipaddress` varchar(30) NOT NULL default '',
  `custgroupid` int(11) NOT NULL default '0',
  `custnotes` TEXT,
  `custformsessionid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`customerid`),
  INDEX ( custconemail ),
  KEY `i_customers_customertoken` (`customertoken`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%forms`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%forms` (
  `formid` int(10) unsigned NOT NULL auto_increment,
  `formname` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`formid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


INSERT INTO `%%PREFIX%%forms` VALUES (1,'Account Details');
INSERT INTO `%%PREFIX%%forms` VALUES (2,'Billing Details');
INSERT INTO `%%PREFIX%%forms` VALUES (3,'Shipping Details');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%formfields`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%formfields` (
  `formfieldid` int(10) unsigned NOT NULL auto_increment,
  `formfieldformid` int(10) unsigned NOT NULL default '0',
  `formfieldtype` varchar(50) NOT NULL default '',
  `formfieldlabel` varchar(255) NOT NULL default '',
  `formfielddefaultval` varchar(255) NOT NULL default '',
  `formfieldextrainfo` text,
  `formfieldisrequired` tinyint(1) NOT NULL default '0',
  `formfieldisimmutable` tinyint(1) default '0',
  `formfieldprivateid` varchar(255) NOT NULL default '',
  `formfieldlastmodified` int (10) unsigned NOT NULL default '0',
  `formfieldsort` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`formfieldid`),
  KEY `i_formfields_formfieldformid` (`formfieldformid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,1,'singleline','Email Address','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'EmailAddress',UNIX_TIMESTAMP(),1);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,1,'password','Password','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'Password',UNIX_TIMESTAMP(),2);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,1,'password','Confirm Password','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'ConfirmPassword',UNIX_TIMESTAMP(),3);

INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','First Name','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'FirstName',UNIX_TIMESTAMP(),1);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Last Name','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'LastName',UNIX_TIMESTAMP(),2);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Company Name','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',0,2,'CompanyName',UNIX_TIMESTAMP(),3);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Phone Number','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'Phone',UNIX_TIMESTAMP(),4);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Address Line 1','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'AddressLine1',UNIX_TIMESTAMP(),5);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Address Line 2','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',0,2,'AddressLine2',UNIX_TIMESTAMP(),6);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Suburb/City','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'City',UNIX_TIMESTAMP(),7);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleselect','Country','','a:4:{s:5:\"class\";s:8:\"Field200\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:16:\"Choose a Country\";s:7:\"options\";a:0:{}}',1,1,'Country',UNIX_TIMESTAMP(),8);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'selectortext','State/Province','','a:6:{s:5:\"class\";s:8:\"Field200\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:14:\"Choose a State\";s:7:\"options\";a:0:{}s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}',1,1,'State',UNIX_TIMESTAMP(),9);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,2,'singleline','Zip/Postcode','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:15:\"Textbox Field45\";s:5:\"style\";s:11:\"width:40px;\";}',1,1,'Zip',UNIX_TIMESTAMP(),10);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','First Name','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'FirstName',UNIX_TIMESTAMP(),1);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Last Name','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'LastName',UNIX_TIMESTAMP(),2);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Company Name','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',0,2,'CompanyName',UNIX_TIMESTAMP(),3);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Phone Number','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'Phone',UNIX_TIMESTAMP(),4);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Address Line 1','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'AddressLine1',UNIX_TIMESTAMP(),5);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Address Line 2','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',0,2,'AddressLine2',UNIX_TIMESTAMP(),6);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Suburb/City','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:16:\"Textbox Field200\";s:5:\"style\";s:0:\"\";}',1,1,'City',UNIX_TIMESTAMP(),7);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleselect','Country','','a:4:{s:5:\"class\";s:8:\"Field200\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:16:\"Choose a Country\";s:7:\"options\";a:0:{}}',1,1,'Country',UNIX_TIMESTAMP(),8);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'selectortext','State/Province','','a:6:{s:5:\"class\";s:8:\"Field200\";s:5:\"style\";s:0:\"\";s:12:\"chooseprefix\";s:14:\"Choose a State\";s:7:\"options\";a:0:{}s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}',1,1,'State',UNIX_TIMESTAMP(),9);
INSERT INTO `%%PREFIX%%formfields` VALUES (NULL,3,'singleline','Zip/Postcode','','a:5:{s:12:\"defaultvalue\";s:0:\"\";s:4:\"size\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:5:\"class\";s:15:\"Textbox Field45\";s:5:\"style\";s:11:\"width:40px;\";}',1,1,'Zip',UNIX_TIMESTAMP(),10);

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%formsessions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%formsessions` (
  `formsessionid` int(10) unsigned NOT NULL auto_increment,
  `formsessiondate` int (10) unsigned NOT NULL default '0',
  `formsessionformidx` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`formsessionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%formfieldsessions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%formfieldsessions` (
  `formfieldsessioniformsessionid` int(10) unsigned NOT NULL default '0',
  `formfieldfieldid` int(10) unsigned NOT NULL default '0',
  `formfieldformid` int(10) unsigned NOT NULL default '0',
  `formfieldfieldtype` varchar(50) NOT NULL default '',
  `formfieldfieldlabel` varchar(255) NOT NULL default '',
  `formfieldfieldvalue` TEXT,
  PRIMARY KEY  (`formfieldsessioniformsessionid`, `formfieldfieldid`),
  KEY `i_formfieldsessions_formfieldsessioniformsessionid` (`formfieldsessioniformsessionid`),
  KEY `i_formfieldsessions_formfieldfieldid` (`formfieldfieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%gift_certificate_history`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%gift_certificate_history` (
  `historyid` int(10) NOT NULL auto_increment,
  `histgiftcertid` int(10) NOT NULL default '0',
  `historderid` int(10) NOT NULL default '0',
  `histcustomerid` int(10) NOT NULL default '0',
  `histbalanceused` decimal(20,4) NOT NULL default '0.0000',
  `histbalanceremaining` decimal(20,4) NOT NULL default '0.0000',
  `historddate` int(10) NOT NULL default '0',
  PRIMARY KEY  (`historyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%gift_certificates`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%gift_certificates` (
  `giftcertid` int(10) NOT NULL auto_increment,
  `giftcertcode` varchar(20) NOT NULL default '',
  `giftcertto` varchar(100) NOT NULL default '',
  `giftcerttoemail` varchar(100) NOT NULL default '',
  `giftcertfrom` varchar(100) NOT NULL default '',
  `giftcertfromemail` varchar(100) NOT NULL default '',
  `giftcertcustid` int(10) NOT NULL default '0',
  `giftcertamount` decimal(20,4) NOT NULL default '0',
  `giftcertbalance` decimal(20,4) NOT NULL default '0',
  `giftcertstatus` int(1) NOT NULL default '0',
  `giftcerttemplate` varchar(50) NOT NULL default '',
  `giftcertmessage` varchar(250) NOT NULL default '',
  `giftcertpurchasedate` int(10) NOT NULL default '0',
  `giftcertexpirydate` int(10) NOT NULL default '0',
  `giftcertorderid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`giftcertid`),
  UNIQUE KEY `u_gift_certificates` (`giftcertcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%module_vars`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%module_vars` (
  `variableid` int(11) NOT NULL auto_increment,
  `modulename` varchar(100) NOT NULL default '',
  `variablename` varchar(100) NOT NULL default '',
  `variableval` text,
  PRIMARY KEY  (`variableid`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


-- Default settings for comment system

INSERT INTO `%%PREFIX%%module_vars` (`modulename`, `variablename`, `variableval`) VALUES ('comments_builtincomments', 'is_setup', '1');
INSERT INTO `%%PREFIX%%module_vars` (`modulename`, `variablename`, `variableval`) VALUES ('comments_builtincomments', 'commenttypes', '1');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%news`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%news` (
  `newsid` int(11) NOT NULL auto_increment,
  `newstitle` varchar(250) NOT NULL default '',
  `newscontent` longtext,
  `newsdate` int(11) NOT NULL default '0',
  `newsvisible` tinyint(4) NOT NULL default '0',
  `newssearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`newsid`),
  KEY `i_news_date_vis` (`newsdate`, `newsvisible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%news_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%news_search` (
  `newssearchid` int(11) NOT NULL auto_increment,
  `newsid` int(11) NOT NULL default '0',
  `newstitle` varchar(255) NOT NULL default '',
  `newscontent` longtext NOT NULL,
  `newssearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`newssearchid`),
  KEY `i_news_search_newsid` (`newsid`),
  FULLTEXT KEY `newstitle` (`newstitle`,`newscontent`,`newssearchkeywords`),
  FULLTEXT KEY `newstitle2` (`newstitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%news_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%news_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `newsid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_coupons`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_coupons` (
  `ordcoupid` int(11) NOT NULL auto_increment,
  `ordcouporderid` int(11) NOT NULL default '0',
  `ordcoupprodid` int(11) NOT NULL default '0',
  `ordcouponid` int(11) NOT NULL default '0',
  `ordcouponcode` varchar(50) NOT NULL default '',
  `ordcouponamount` varchar(50) NOT NULL default '',
  `ordcoupontype` tinyint(4) NOT NULL default '0',
  `applied_discount` decimal(20, 4) NOT NULL default '0',
  PRIMARY KEY  (`ordcoupid`),
  KEY (`ordcouporderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_downloads`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_downloads` (
  `orddownid` int(11) NOT NULL auto_increment,
  `orderid` int(11) NOT NULL default '0',
  `downloadid` int(11) NOT NULL default '0',
  `numdownloads` int(11) NOT NULL default '0',
  `downloadexpires` int unsigned NOT NULL default '0',
  `maxdownloads` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`orddownid`),
  KEY (`orderid`, `downloadid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_messages`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_messages` (
  `messageid` int(11) NOT NULL auto_increment,
  `messagefrom` enum('customer','admin') NOT NULL default 'customer',
  `subject` varchar(255) NOT NULL default '',
  `message` longtext,
  `datestamp` int(11) NOT NULL default '0',
  `messageorderid` int(11) NOT NULL default '0',
  `messagestatus` enum('read','unread') NOT NULL default 'read',
  `staffuserid` int(11) NOT NULL default '0',
  `isflagged` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`messageid`),
  KEY `i_order_mesages_messageorderid` (`messageorderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_products`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_products` (
  `orderprodid` int(11) NOT NULL auto_increment,
  `ordprodsku` varchar(250) NOT NULL default '',
  `ordprodname` varchar(250) NOT NULL default '',
  `ordprodtype` enum('physical','digital','giftcertificate') NOT NULL default 'physical',
  `base_price` decimal(20, 4) NOT NULL default '0',
  `price_ex_tax` decimal(20,4) NOT NULL default '0',
  `price_inc_tax` decimal(20,4) NOT NULL default '0',
  `price_tax` decimal(20,4) NOT NULL default '0',
  `base_total` decimal(20, 4) NOT NULL default '0',
  `total_ex_tax` decimal(20,4) NOT NULL default '0',
  `total_inc_tax` decimal(20,4) NOT NULL default '0',
  `total_tax` decimal(20,4) NOT NULL default '0',
  `ordprodweight` double NOT NULL default '0',
  `ordprodqty` smallint(6) NOT NULL default '0',
  `orderorderid` int(11) NOT NULL default '0',
  `ordprodid` int(11) NOT NULL default '0',
  `base_cost_price` decimal(20, 4) NOT NULL default '0',
  `cost_price_inc_tax` decimal(20,4) NOT NULL default '0',
  `cost_price_ex_tax` decimal(20,4) NOT NULL default '0',
  `cost_price_tax` decimal(20,4) NOT NULL default '0',
  `ordprodrefunded` int(10) NOT NULL default '0',
  `ordprodrefundamount` decimal(20,4) NOT NULL default '0',
  `ordprodreturnid` int(10) NOT NULL default '0',
  `ordprodoptions` text,
  `ordprodvariationid` int(11) NOT NULL default '0',
  `ordprodwrapid` int unsigned NOT NULL default '0',
  `ordprodwrapname` varchar(100) NOT NULL default '',
  `base_wrapping_cost` decimal(20, 4) NOT NULL default '0.00',
  `wrapping_cost_ex_tax` decimal(20, 4) NOT NULL default '0.00',
  `wrapping_cost_inc_tax` decimal(20, 4) NOT NULL default '0.00',
  `wrapping_cost_tax` decimal(20, 4) NOT NULL default '0.00',
  `ordprodwrapmessage` text NULL,
  `ordprodqtyshipped` int unsigned NOT NULL default '0',
  `ordprodeventname` VARCHAR(255),
  `ordprodeventdate` INT(9),
  `ordprodfixedshippingcost` decimal(20,4) NOT NULL default '0',
  `order_address_id` int unsigned NOT NULL default '0',
  `ebay_item_id` varchar(19) NOT NULL default '',
  `applied_discounts` text,
  `ebay_transaction_id` varchar(19) NOT NULL default '',
  PRIMARY KEY  (`orderprodid`),
  KEY `i_order_products_orderid_prodid` (`orderorderid`, `ordprodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%order_status`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_status` (
  `statusid` int(11) NOT NULL auto_increment,
  `statusdesc` varchar(100) NOT NULL default '',
  `statusorder` int(11) NOT NULL default 0,
  PRIMARY KEY  (`statusid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


--
-- Data for table `%%PREFIX%%order_status`
--

TRUNCATE `%%PREFIX%%order_status`;
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (1, 'Pending', 1);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (2, 'Shipped', 8);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (3, 'Partially Shipped', 6);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (4, 'Refunded', 11);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (5, 'Cancelled', 9);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (6, 'Declined', 10);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (7, 'Awaiting Payment', 2);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (8, 'Awaiting Pickup', 5);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (9, 'Awaiting Shipment', 4);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (10, 'Completed', 7);
INSERT INTO `%%PREFIX%%order_status` (`statusid`, `statusdesc`, `statusorder`) VALUES (11, 'Awaiting Fulfillment', 3);

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%orders`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%orders` (
  `orderid` int(11) NOT NULL auto_increment,
  `ordtoken` varchar(32) NOT NULL default '0',
  `ordcustid` int(11) NOT NULL default '0',
  `orddate` int(11) NOT NULL default '0',
  `ordlastmodified` int(11) NOT NULL default '0',
  `ebay_order_id` varchar(19) NOT NULL default '0',
  `subtotal_ex_tax` decimal(20,4) NOT NULL default '0',
  `subtotal_inc_tax` decimal(20,4) NOT NULL default '0',
  `subtotal_tax` decimal(20,4) NOT NULL default '0',
  `total_tax` decimal(20,4) NOT NULL default '0',
  `base_shipping_cost` decimal(20,4) NOT NULL default '0',
  `shipping_cost_ex_tax` decimal(20,4) NOT NULL default '0',
  `shipping_cost_inc_tax` decimal(20,4) NOT NULL default '0',
  `shipping_cost_tax` decimal(20,4) NOT NULL default '0',
  `shipping_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
  `base_handling_cost` decimal(20,4) NOT NULL default '0',
  `handling_cost_ex_tax` decimal(20,4) NOT NULL default '0',
  `handling_cost_inc_tax` decimal(20,4) NOT NULL default '0',
  `handling_cost_tax` decimal(20,4) NOT NULL default '0',
  `handling_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
  `base_wrapping_cost` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_inc_tax` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_ex_tax` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_tax` decimal(20,4) NOT NULL default '0',
  `wrapping_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
  `total_ex_tax` decimal(20,4) NOT NULL default '0',
  `total_inc_tax` decimal(20,4) NOT NULL default '0',
  `ordstatus` smallint(6) NOT NULL default '0',
  `ordtotalqty` int unsigned NOT NULL default '0',
  `ordtotalshipped` int unsigned NOT NULL default '0',
  `orderpaymentmethod` varchar(100) NOT NULL default '',
  `orderpaymentmodule` varchar(100) NOT NULL default '',
  `ordpayproviderid` varchar(255) DEFAULT NULL,
  `ordpaymentstatus` varchar(100) NOT NULL DEFAULT '',
  `ordrefundedamount` decimal(20, 4) NOT NULL DEFAULT 0,
  `ordbillfirstname` varchar(255) NOT NULL default '',
  `ordbilllastname` varchar(255) NOT NULL default '',
  `ordbillcompany` varchar(100) NOT NULL default '',
  `ordbillstreet1` varchar(255) NOT NULL default '',
  `ordbillstreet2` varchar(255) NOT NULL default '',
  `ordbillsuburb` varchar(100) NOT NULL default '',
  `ordbillstate` varchar(50) NOT NULL default '',
  `ordbillzip` varchar(20) NOT NULL default '',
  `ordbillcountry` varchar(50) NOT NULL default '',
  `ordbillcountrycode` varchar(2) NOT NULL default '',
  `ordbillcountryid` int(11) NOT NULL default '0',
  `ordbillstateid` int(11) NOT NULL default '0',
  `ordbillphone` varchar(50) NOT NULL default '',
  `ordbillemail` varchar(250) NOT NULL default '',
  `ordisdigital` tinyint(4) NOT NULL default '0',
  `orddateshipped` int(11) NOT NULL default '0',
  `ordstorecreditamount` decimal(20,4) NOT NULL default '0',
  `ordgiftcertificateamount` decimal(20,4) NOT NULL default '0',
  `ordinventoryupdated` int(1) NOT NULL default '0',
  `ordonlygiftcerts` tinyint(4) NOT NULL default '0',
  `extrainfo` text,
  `ordipaddress` varchar(30) NOT NULL default '',
  `ordgeoipcountry` varchar(50) NOT NULL default '',
  `ordgeoipcountrycode` varchar(2) NOT NULL default '',
  `ordcurrencyid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `orddefaultcurrencyid` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `ordcurrencyexchangerate` DECIMAL(20,10) NOT NULL DEFAULT '0',
  `ordnotes` TEXT,
  `ordcustmessage` TEXT,
  `ordvendorid` int unsigned NOT NULL default '0',
  `ordformsessionid` int(11) NOT NULL default '0',
  `orddiscountamount` decimal(20, 4) NOT NULL default '0',
  `shipping_address_count` int unsigned NOT NULL default '0',
  `coupon_discount` decimal(20, 4) NOT NULL default '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (`orderid`),
  KEY `i_orders_ordcustid` (`ordcustid`),
  KEY `ordstatus_deleted` (`ordstatus`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%pages`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%pages` (
  `pageid` int(11) NOT NULL auto_increment,
  `pagetitle` varchar(250) NOT NULL default '',
  `pagemetatitle` varchar(250) NOT NULL default '',
  `pagelink` varchar(250) NOT NULL default '',
  `pagefeed` varchar(250) NOT NULL default '',
  `pageemail` varchar(250) NOT NULL default '',
  `pagecontent` longtext,
  `pagestatus` tinyint(4) NOT NULL default '0',
  `pageparentid` int(11) NOT NULL default '0',
  `pagesort` int(11) NOT NULL default '0',
  `pagekeywords` text,
  `pagedesc` text,
  `pagetype` tinyint(4) NOT NULL default '0',
  `pagecontactfields` varchar(100) NOT NULL,
  `pagemetakeywords` varchar(250) NOT NULL default '',
  `pagemetadesc` varchar(250) NOT NULL default '',
  `pageishomepage` tinyint(4) NOT NULL default '0',
  `pagelayoutfile` varchar(50) NOT NULL default '',
  `pageparentlist` text,
  `pagecustomersonly` tinyint(1) NOT NULL default '0',
  `pagevendorid` int unsigned NOT NULL default '0',
  `page_enable_optimizer` TINYINT( 1 ) NOT NULL DEFAULT '0',
  `pagensetleft` int(11) unsigned NOT NULL default '0',
  `pagensetright` int(11) unsigned NOT NULL default '0',
  `pagesearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`pageid`),
  KEY `i_pageid_pagensetleft_pagensetright` (`pageid`,`pagensetleft`,`pagensetright`),
  KEY `i_pagensetleft` (`pagensetleft`),
  KEY `i_pageparentid_pagesort_pagetitle` (`pageparentid`,`pagesort`,`pagetitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%page_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%page_search` (
  `pagesearchid` int(11) NOT NULL auto_increment,
  `pageid` int(11) NOT NULL default '0',
  `pagetitle` varchar(255) NOT NULL default '',
  `pagecontent` longtext NOT NULL,
  `pagedesc` text NOT NULL,
  `pagesearchkeywords` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`pagesearchid`),
  KEY `i_page_search_pageid` (`pageid`),
  FULLTEXT KEY `pagetitle` (`pagetitle`,`pagecontent`,`pagedesc`,`pagesearchkeywords`),
  FULLTEXT KEY `pagetitle2` (`pagetitle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%page_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%page_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `pageid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%permissions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%permissions` (
  `pk_permid` int(11) NOT NULL auto_increment,
  `permuserid` int(11) NOT NULL default '0',
  `permpermissionid` mediumint(6) NOT NULL default '0',
  PRIMARY KEY  (`pk_permid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_customfields`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_customfields` (
  `fieldid` int(11) NOT NULL auto_increment,
  `fieldprodid` int(11) NOT NULL default '0',
  `fieldname` varchar(250) NOT NULL default '',
  `fieldvalue` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_downloads`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_downloads` (
  `downloadid` int(11) NOT NULL auto_increment,
  `prodhash` varchar(32) NOT NULL default '',
  `productid` int(11) NOT NULL default '0',
  `downfile` varchar(200) NOT NULL default '',
  `downdateadded` int(11) NOT NULL default '0',
  `downmaxdownloads` int(11) NOT NULL default '0',
  `downexpiresafter` int(11) NOT NULL default '0',
  `downfilesize` int(11) NOT NULL default '0',
  `downname` varchar(200) NOT NULL default '',
  `downdescription` text,
  PRIMARY KEY  (`downloadid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_images`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_images` (
  `imageid` int(11) NOT NULL auto_increment,
  `imageprodid` int(11) NOT NULL default '0',
  `imageprodhash` varchar(32) NOT NULL default '',
  `imagefile` varchar(255) NOT NULL default '',
  `imageisthumb` tinyint(4) NOT NULL default '0',
  `imagesort` int(11) NOT NULL default '0',
  `imagefiletiny` varchar(255) default '',
  `imagefilethumb` varchar(255) default '',
  `imagefilestd` varchar(255) default '',
  `imagefilezoom` varchar(255) default '',
  `imagedesc` longtext,
  `imagedateadded` int(11) default '0',
  `imagefiletinysize` varchar(11) default '',
  `imagefilethumbsize` varchar(11) default '',
  `imagefilestdsize` varchar(11) default '',
  `imagefilezoomsize` varchar(11) default '',
  PRIMARY KEY  (`imageid`),
  KEY `i_product_images_imageprodid` (`imageprodid`, `imageisthumb`),
  KEY `i_product_images_imageprodid_imagesort_imageprodhash` (`imageprodid`,`imagesort`,`imageprodhash`),
  KEY `i_product_images_imageid_imageprodid_imageprodhash` (`imageid`,`imageprodid`,`imageprodhash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_related_byviews`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_related_byviews` (
  `prodida` int(10) unsigned NOT NULL,
  `prodidb` int(10) unsigned NOT NULL,
  `relevance` int(10) unsigned NOT NULL,
  `lastview` int(10) unsigned NOT NULL,
  PRIMARY KEY (`prodida`,`prodidb`),
  KEY `i_prodida_relevance` (`prodida`,`relevance`),
  KEY `i_prodidb` (`prodidb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_search`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_search` (
  `productsearchid` int(11) NOT NULL auto_increment,
  `productid` int(11) NOT NULL default '0',
  `prodname` varchar(250) NOT NULL default '',
  `prodcode` varchar(250) NOT NULL default '',
  `proddesc` longtext,
  `prodsearchkeywords` text,
  PRIMARY KEY  (`productsearchid`),
  KEY `i_product_search_productid` (`productid`),
  KEY `i_product_search_prodcode` (`prodcode`),
  FULLTEXT KEY `prodname` (`prodname`,`prodcode`,`proddesc`,`prodsearchkeywords`),
  FULLTEXT KEY `prodname2` (`prodname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_variation_combinations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_variation_combinations` (
  `combinationid` int(11) NOT NULL auto_increment,
  `vcproductid` int(11) NOT NULL default '0',
  `vcproducthash` varchar(32) NOT NULL default '',
  `vcvariationid` int(11) NOT NULL default '0',
  `vcenabled` tinyint(4) NOT NULL default '1',
  `vcoptionids` varchar(100) NOT NULL default '',
  `vcsku` varchar(50) NOT NULL default '',
  `vcpricediff` enum('','add','subtract','fixed') NOT NULL default '',
  `vcprice` decimal(20,4) NOT NULL default '0',
  `vcweightdiff` enum('','add','subtract','fixed') NOT NULL default '',
  `vcweight` decimal(20,4) NOT NULL default '0',
  `vcimage` varchar(100) NOT NULL default '',
  `vcimagezoom` varchar(100) NOT NULL default '',
  `vcimagestd` varchar(100) NOT NULL default '',
  `vcimagethumb` varchar(100) NOT NULL default '',
  `vcstock` int(11) NOT NULL default '0',
  `vclowstock` int(11) NOT NULL default '0',
  `vclastmodified` int(10) NOT NULL default '0',
  PRIMARY KEY  (`combinationid`),
  KEY `i_product_variation_combinations_vcvariationid` (`vcvariationid`),
  KEY `i_product_variation_combinations_vcproductid` (`vcproductid`),
  KEY `i_product_variation_combinations_vcproducthash` (`vcproducthash`),
  KEY `i_product_variation_combinations_vclowstock` (`vclowstock`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_variation_options`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_variation_options` (
  `voptionid` int(11) NOT NULL auto_increment,
  `vovariationid` int(11) NOT NULL default '0',
  `voname` varchar(255) NOT NULL default '',
  `vovalue` text,
  `vooptionsort` int(11) NOT NULL default '0',
  `vovaluesort` int(11) NOT NULL default '0',
  PRIMARY KEY  (`voptionid`),
  KEY `i_product_variation_options_vovariationid` (`vovariationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_variations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_variations` (
  `variationid` int(11) NOT NULL auto_increment,
  `vname` varchar(100) NOT NULL default '',
  `vnumoptions` int(11) NOT NULL default '0',
  `vvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`variationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_views`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_views` (
  `session` char(32) NOT NULL,
  `product` int(10) unsigned NOT NULL,
  `lastview` int(10) unsigned NOT NULL,
  PRIMARY KEY (`session`,`product`),
  KEY `i_session_lastview` (`session`,`lastview`),
  KEY `i_product` (`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_words`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_words` (
  `wordid` int(11) NOT NULL auto_increment,
  `word` varchar(255) NOT NULL default '',
  `productid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wordid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%picniktokens`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%picniktokens` (
  `picniktokenid` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) NOT NULL,
  `imagetype` tinyint(3) unsigned NOT NULL,
  `imageid` varchar(255) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `sessionid` char(26) NOT NULL,
  PRIMARY KEY (`picniktokenid`),
  KEY `i_sessionid_imagetype_imageid` (`sessionid`,`imagetype`,`imageid`),
  KEY `i_picniktokenid_hash` (`picniktokenid`,`hash`),
  KEY `i_created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%products`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%products` (
  `productid` int(11) NOT NULL auto_increment,
  `prodname` varchar(250) NOT NULL default '',
  `prodtype` smallint(6) NOT NULL default '0',
  `prodcode` varchar(250) NOT NULL default '',
  `prodfile` varchar(250) NOT NULL default '',
  `proddesc` longtext,
  `prodsearchkeywords` text,
  `prodavailability` varchar(250) NOT NULL default '',
  `prodprice` decimal(20,4) NOT NULL default '0',
  `prodcostprice` decimal(20,4) NOT NULL default '0',
  `prodretailprice` decimal(20,4) NOT NULL default '0',
  `prodsaleprice` decimal(20,4) NOT NULL default '0',
  `prodcalculatedprice` decimal(20,4) NOT NULL default '0',
  `prodsortorder` int(11) NOT NULL default '0',
  `prodvisible` tinyint(4) NOT NULL default '0',
  `prodfeatured` tinyint(4) NOT NULL default '0',
  `prodvendorfeatured` tinyint(1) NOT NULL default '0',
  `prodrelatedproducts` varchar(250) NOT NULL default '',
  `prodcurrentinv` int(11) NOT NULL default '0',
  `prodlowinv` int(11) NOT NULL default '0',
  `prodoptionsrequired` tinyint(4) NOT NULL default '0',
  `prodwarranty` text,
  `prodweight` decimal(20,4) NOT NULL default '0',
  `prodwidth` decimal(20,4) NOT NULL default '0',
  `prodheight` decimal(20,4) NOT NULL default '0',
  `proddepth` decimal(20,4) NOT NULL default '0',
  `prodfixedshippingcost` decimal(20,4) NOT NULL default '0',
  `prodfreeshipping` tinyint(4) NOT NULL default '0',
  `prodinvtrack` tinyint(4) NOT NULL default '0',
  `prodratingtotal` int(11) NOT NULL default '0',
  `prodnumratings` int(11) NOT NULL default '0',
  `prodnumsold` int(11) NOT NULL default '0',
  `proddateadded` int(11) NOT NULL default '0',
  `prodbrandid` int(11) NOT NULL default '0',
  `prodnumviews` int(11) NOT NULL default '0',
  `prodpagetitle` varchar(250) NOT NULL default '',
  `prodmetakeywords` text,
  `prodmetadesc` text,
  `prodlayoutfile` varchar(50) NOT NULL default '',
  `prodvariationid` int(11) NOT NULL default '0',
  `prodallowpurchases` int(1) NOT NULL default '1',
  `prodhideprice` int(1) NOT NULL default '0',
  `prodcallforpricinglabel` varchar(200) NOT NULL default '',
  `prodcatids` text NOT NULL,
  `prodlastmodified` int unsigned NOT NULL default '0',
  `prodvendorid` int unsigned NOT NULL default '0',
  `prodhastags` int(1) NOT NULL default '0',
  `prodwrapoptions` text NULL,
  `prodconfigfields` varchar(255) NOT NULL default '',
  `prodeventdaterequired` tinyint(4),
  `prodeventdatefieldname` varchar(255),
  `prodeventdatelimited` tinyint(4),
  `prodeventdatelimitedtype` tinyint(4),
  `prodeventdatelimitedstartdate` int(9),
  `prodeventdatelimitedenddate` int(9),
  `prodmyobasset` VARCHAR(20) NOT NULL default '',
  `prodmyobincome` VARCHAR(20) NOT NULL default '',
  `prodmyobexpense` VARCHAR(20) NOT NULL default '',
  `prodpeachtreegl` VARCHAR(20) NOT NULL default '',
  `prodcondition` enum('New','Used','Refurbished') NOT NULL default 'New',
  `prodshowcondition` tinyint(1) unsigned NOT NULL default '0',
  `product_enable_optimizer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prodpreorder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prodreleasedate` int(11) NOT NULL DEFAULT '0',
  `prodreleasedateremove` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prodpreordermessage` varchar(250) NOT NULL default '',
  `prodminqty` int(10) UNSIGNED NOT NULL default '0',
  `prodmaxqty` int(10) UNSIGNED NOT NULL default '0',
  `tax_class_id` int unsigned NOT NULL default '0',
  `opengraph_type` varchar(15) NOT NULL default 'product',
  `opengraph_title` varchar(250) NOT NULL default '',
  `opengraph_use_product_name` tinyint(1) unsigned NOT NULL default '1',
  `opengraph_description` text,
  `opengraph_use_meta_description` tinyint(1) unsigned NOT NULL default '1',
  `opengraph_use_image` tinyint(1) unsigned NOT NULL default '1',
  `upc` VARCHAR(32) default '',
  `disable_google_checkout` int(1) NOT NULL default '0',
  `last_import` int(11) NOT NULL default '0',
  `google_ps_enabled` TINYINT(1) NOT NULL default '0' ,
  PRIMARY KEY  (`productid`),
  KEY `i_products_brand_vis` (`prodbrandid`, `prodvisible`),
  UNIQUE KEY `u_products_prodname` (`prodname`),
  KEY `i_products_prodnumsold` (`prodnumsold`),
  KEY `i_products_feature_vis` (`prodfeatured`, `prodvisible`),
  KEY `i_products_rating_vis` (`prodvisible`, `prodratingtotal`),
  KEY `i_products_added_vis` (`prodvisible`, `proddateadded`),
  KEY `i_products_hideprice_vis` (`prodhideprice`, `prodvisible`),
  KEY `i_products_sortorder_vis` (`prodvisible`, `prodsortorder`, `prodname`),
  KEY `i_products_last_import` (`last_import`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%returns`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%returns` (
  `returnid` int(10) NOT NULL auto_increment,
  `retorderid` int(10) NOT NULL default '0',
  `retcustomerid` int(10) NOT NULL default '0',
  `retprodid` int(10) NOT NULL default '0',
  `retprodvariationid` INT( 11 ) NOT NULL default '0',
  `retprodoptions` text,
  `retprodname` varchar(200) NOT NULL default '',
  `retprodcost` decimal(20,4) NOT NULL default '0',
  `retprodqty` int(1) NOT NULL default '1',
  `retstatus` int(1) NOT NULL default '0',
  `retreason` varchar(200) NOT NULL default '',
  `retaction` varchar(200) NOT NULL default '',
  `retdaterequested` int(10) NOT NULL default '0',
  `retcomment` text,
  `retuserid` int(10) NOT NULL default '0',
  `retreceivedcredit` int(1) NOT NULL default '0',
  `retordprodid` int(10) NOT NULL default '0',
  `retstaffnotes` text,
  `retvendorid` int unsigned NOT NULL default '0',
  `inventory_returned` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`returnid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%reviews`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%reviews` (
  `reviewid` int(11) NOT NULL auto_increment,
  `revproductid` int(11) NOT NULL default '0',
  `revfromname` varchar(100) NOT NULL default '',
  `revdate` int(11) NOT NULL default '0',
  `revrating` smallint(6) NOT NULL default '0',
  `revtext` text,
  `revtitle` varchar(250) NOT NULL default '',
  `revstatus` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`reviewid`),
  KEY `i_reviews_revproductid` (`revproductid`),
  FULLTEXT KEY `ft_reviews_text_title_from` (`revtext`,`revtitle`,`revfromname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%search_corrections`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%search_corrections` (
  `correctionid` int(11) NOT NULL auto_increment,
  `correctiontype` enum('correction','recommendation') NOT NULL default 'correction',
  `correction` varchar(250) NOT NULL default '',
  `numresults` int(11) NOT NULL default '0',
  `oldsearchtext` varchar(250) NOT NULL default '',
  `oldnumresults` int(11) NOT NULL default '0',
  `correctdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`correctionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%searches`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%searches` (
  `searchid` int(11) NOT NULL auto_increment,
  `searchtext` text,
  `numsearches` int(11) NOT NULL default '0',
  PRIMARY KEY  (`searchid`),
  FULLTEXT KEY `searchtext` (`searchtext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%searches_extended`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%searches_extended` (
  `searchid` int(11) NOT NULL auto_increment,
  `searchtext` text,
  `numresults` int(11) NOT NULL default '0',
  `searchdate` int(11) NOT NULL default '0',
  `clickthru` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`searchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%sessions`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%sessions` (
  `sessionhash` varchar(32) NOT NULL default '',
  `sessdata` longtext,
  `sesslastupdated` int(10) NOT NULL default '0',
  UNIQUE KEY  (`sessionhash`),
  INDEX (`sesslastupdated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%shipping_addresses`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_addresses` (
  `shipid` int(11) NOT NULL auto_increment,
  `shipcustomerid` int(11) NOT NULL default '0',
  `shipfirstname` varchar(255) NOT NULL default '',
  `shiplastname` varchar(255) NOT NULL default '',
  `shipcompany` varchar(255) NOT NULL default '',
  `shipaddress1` text,
  `shipaddress2` text,
  `shipcity` varchar(100) NOT NULL default '',
  `shipstate` varchar(100) NOT NULL default '',
  `shipzip` varchar(30) NOT NULL default '',
  `shipcountry` varchar(100) NOT NULL default '',
  `shipphone` varchar(50) NOT NULL default '',
  `shipstateid` int(11) NOT NULL default '0',
  `shipcountryid` int(11) NOT NULL default '0',
  `shipdestination` enum('residential','commercial') NOT NULL default 'residential',
  `shiplastused` int(11) NOT NULL default '0',
  `shipformsessionid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`shipid`),
  KEY `i_shipping_addresses_shipcustomerid` (`shipcustomerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%subscribers`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%subscribers` (
  `subscriberid` int(11) NOT NULL auto_increment,
  `subemail` varchar(250) NOT NULL default '',
  `subfirstname` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`subscriberid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%system_log`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%system_log` (
  `logid` int(11) NOT NULL auto_increment,
  `logtype` enum('general','php','sql','shipping','payment','notification','emailintegration','ebay', 'shoppingcomparison') default NULL,
  `logmodule` varchar(100) NOT NULL default '',
  `logseverity` int(1) NOT NULL default '4',
  `logsummary` varchar(250) NOT NULL  default '',
  `logmsg` longtext,
  `logdate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%tasks`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%tasks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `queue` varchar(128) NOT NULL,
  `class` varchar(255) NOT NULL default '',
  `data` text,
  `time` int(10) unsigned NOT NULL default '0',
  `reservation` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `queue_reservation_time` (`queue`,`reservation`,`time`),
  KEY `reservation_time` (`reservation`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%task_status`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%task_status` (
  `id` int(10) unsigned NOT NULL,
  `queue` varchar(128) NOT NULL,
  `class` varchar(255) NOT NULL default '',
  `data` text,
  `begin` int(10) unsigned NOT NULL default '0',
  `success` tinyint(1) NOT NULL default '0',
  `message` text,
  `end` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `time` (`begin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%unique_visitors`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%unique_visitors` (
  `uniqueid` int(11) NOT NULL auto_increment,
  `datestamp` int(11) NOT NULL default '0',
  `numuniques` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uniqueid`),
  UNIQUE KEY `unique_datestamp` (`datestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%users`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%users` (
  `pk_userid` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL default '',
  `userpass` varchar(50) NOT NULL default '',
  `userfirstname` varchar(50) NOT NULL default '',
  `userlastname` varchar(50) NOT NULL default '',
  `userstatus` tinyint(1) NOT NULL default '0',
  `useremail` varchar(250) NOT NULL default '',
  `token` varchar(50) NOT NULL default '',
  `usertoken` varchar(50) NOT NULL default '',
  `userapi` tinyint(4) NOT NULL default '0',
  `uservendorid` int unsigned NOT NULL default '0',
  `userrole` varchar(20) NOT NULL default 'custom',
  `salt` varchar(16) NOT NULL default '',
  `updated` int(11) NOT NULL default '0',
  `last_login` int(11) NOT NULL default '0',
  `attempt_counter` smallint(2) NOT NULL default '0',
  `attempt_lockout` int(11) NOT NULL default '0',
  `announcement` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY  (`pk_userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%user_password_histories`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%user_password_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `salt` varchar(16) NOT NULL default '',
  `password` varchar(50) NOT NULL default '',
  `updated` int(11) NOT NULL default '0',
  PRIMARY KEY (`id`),
  INDEX (`user_id`, `updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%user_password_reset_tokens`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%user_password_reset_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL default '',
  `expiry` int(11) NOT NULL default '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY  (`token`),
  INDEX (`user_id`, `expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%wishlists`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%wishlists` (
 `wishlistid` int(11) NOT NULL auto_increment,
  `customerid` int(11) NOT NULL,
  `wishlistname` varchar(255) NOT NULL,
  `ispublic` tinyint(4) NOT NULL,
  `wishlisttoken` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`wishlistid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


--
-- Table structure for table `%%PREFIX%%wishlist_items`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%wishlist_items` (
  `wishlistitemid` int(11) NOT NULL auto_increment,
  `wishlistid` int(11) NOT NULL,
  `productid` int(11) NOT NULL default '0',
  `variationid` int(11) NULL,
  PRIMARY KEY  (`wishlistitemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


DELETE FROM `%%PREFIX%%users` WHERE username='admin';
INSERT INTO `%%PREFIX%%users`(pk_userid, username, userpass, userstatus, token, usertoken, userapi, useremail,userrole) values(0, 'admin', '', '1', '%%TOKEN%%', '', '0', '%%EMAIL%%','admin');

--
-- Create the default returns & shipping page
--

INSERT INTO `%%PREFIX%%pages` (`pagetitle`, `pagelink`, `pagefeed`, `pageemail`, `pagecontent`, `pagestatus`, `pageparentid`, `pagesort`, `pagekeywords`, `pagedesc`, `pagetype`, `pagecontactfields`, `pagemetakeywords`, `pagemetadesc`, `pageishomepage`, `pagelayoutfile`, `pageparentlist`) VALUES ('RSS Syndication','', '', '', '%%Syndicate%%',1, 0, 3, '', '', 0, '', '', '', 0, '', 0);

INSERT INTO `%%PREFIX%%pages` (`pageid`, `pagetitle`, `pagelink`, `pagefeed`, `pageemail`, `pagecontent`, `pagestatus`, `pageparentid`, `pagesort`, `pagekeywords`, `pagedesc`, `pagetype`, `pagecontactfields`, `pagemetakeywords`, `pagemetadesc`, `pageishomepage`, `pagelayoutfile`, `pageparentlist`) VALUES (0, 'Shipping & Returns', 'http://', 'http://', '', '<em>To edit this page simply login to the control panel, click the <strong style="font-weight: 400">Website Content</strong> tab and choose the </em> <strong style="font-weight: 400"><em>View Web Pages option. Click Edit next to the Shipping & Returns page and you can change this text. A sample returns policy is shown below which you can edit as needed.</em><em style="font-style: normal"><br/><br/></em></strong><em style="font-style: normal"><strong>Returns Policy</strong></em><strong style="font-weight: 400"></em></em><em style="font-style: normal"><br/><br/></em>You may return most new, unopened items within 30 days of delivery for a full refund. We''ll also pay the return shipping costs if the return is a result of our error (you received an incorrect or defective item, etc.).<br/><br/>You should expect to receive your refund within four weeks of giving your package to the return shipper, however, in many cases you will receive a refund more quickly. This time period includes the transit time for us to receive your return from the shipper (5 to 10 business days), the time it takes us to process your return once we receive it (3 to 5 business days), and the time it takes your bank to process our refund request (5 to 10 business days).<br/><br/>If you need to return an item, simply login to your account, view the order using the "Complete Orders" link under the My Account menu and click the Return Item(s) button. We''ll notify you via e-mail of your refund once we''ve received and processed the returned item.<br/><br/></strong><strong>Shipping</em></em></em></strong><strong style="font-weight: 400"><em style="font-style: normal"><br/><br/></em>We can ship to virtually any address in the world. Note that there are restrictions on some products, and some products cannot be shipped to international destinations.<br/><br/>When you place an order, we will estimate shipping and delivery dates for you based on the availability of your items and the shipping options you choose. Depending on the shipping provider you choose, shipping date estimates may appear on the shipping quotes page.<br/><br/>Please also note that the shipping rates for many items we sell are weight-based. The weight of any such item can be found on its detail page. To reflect the policies of the shipping companies we use, all weights will be rounded up to the next full pound.<br/>', 1, 0, 2, '', '', 0, '', '', '', 0, 'page.html', '0');



INSERT INTO `%%PREFIX%%page_search` (`pagesearchid`, `pageid`, `pagetitle`, `pagecontent`, `pagedesc`, `pagesearchkeywords`) VALUES (1,1,'RSS Syndication','%%Syndicate%%','','');

INSERT INTO `%%PREFIX%%page_search` (`pagesearchid`, `pageid`, `pagetitle`, `pagecontent`, `pagedesc`, `pagesearchkeywords`) VALUES (2,2,'Shipping & Returns','<em>To edit this page simply login to the control panel, click the <strong style=\"font-weight: 400\">Website Content</strong> tab and choose the </em> <strong style=\"font-weight: 400\"><em>View Web Pages option. Click Edit next to the Shipping & Returns page and you can change this text. A sample returns policy is shown below which you can edit as needed.</em><em style=\"font-style: normal\"><br/><br/></em></strong><em style=\"font-style: normal\"><strong>Returns Policy</strong></em><strong style=\"font-weight: 400\"></em></em><em style=\"font-style: normal\"><br/><br/></em>You may return most new, unopened items within 30 days of delivery for a full refund. We\'ll also pay the return shipping costs if the return is a result of our error (you received an incorrect or defective item, etc.).<br/><br/>You should expect to receive your refund within four weeks of giving your package to the return shipper, however, in many cases you will receive a refund more quickly. This time period includes the transit time for us to receive your return from the shipper (5 to 10 business days), the time it takes us to process your return once we receive it (3 to 5 business days), and the time it takes your bank to process our refund request (5 to 10 business days).<br/><br/>If you need to return an item, simply login to your account, view the order using the \"Complete Orders\" link under the My Account menu and click the Return Item(s) button. We\'ll notify you via e-mail of your refund once we\'ve received and processed the returned item.<br/><br/></strong><strong>Shipping</em></em></em></strong><strong style=\"font-weight: 400\"><em style=\"font-style: normal\"><br/><br/></em>We can ship to virtually any address in the world. Note that there are restrictions on some products, and some products cannot be shipped to international destinations.<br/><br/>When you place an order, we will estimate shipping and delivery dates for you based on the availability of your items and the shipping options you choose. Depending on the shipping provider you choose, shipping date estimates may appear on the shipping quotes page.<br/><br/>Please also note that the shipping rates for many items we sell are weight-based. The weight of any such item can be found on its detail page. To reflect the policies of the shipping companies we use, all weights will be rounded up to the next full pound.<br/>','','');

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%customer_groups`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_groups` (
  `customergroupid` int(11) NOT NULL auto_increment,
  `groupname` varchar(255) NOT NULL,
  `discount` decimal(10,4) NOT NULL,
  `discountmethod` VARCHAR( 100 ) NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  `categoryaccesstype` enum('none','all','specific') NOT NULL,
  PRIMARY KEY  (`customergroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_group_categories` (
	`customergroupid` int(11) NOT NULL,
	`categoryid` int(11) NOT NULL,
	PRIMARY KEY  (`customergroupid`,`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS %%PREFIX%%transactions (
	id int unsigned not null auto_increment PRIMARY KEY,
	orderid int unsigned default NULL,
	transactionid varchar(160) default NULL,
	providerid varchar(160),
	amount DECIMAL(20, 4) NOT NULL,
	message text not null,
	status int unsigned default 0,
	transactiondate int not null,
	extrainfo text,
	KEY `i_order_transation` (orderid, transactionid),
	KEY `i_transaction_provider` (transactionid, providerid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


--
-- Table structure for table `%%PREFIX%%customer_group_discounts`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%customer_group_discounts` (
  `groupdiscountid` INT NOT NULL AUTO_INCREMENT ,
  `customergroupid` INT NOT NULL ,
  `discounttype` ENUM( 'CATEGORY', 'PRODUCT' ) NOT NULL ,
  `catorprodid` INT NOT NULL ,
  `discountpercent` DECIMAL( 10, 4 ) NOT NULL ,
  `appliesto` ENUM( 'CATEGORY_ONLY', 'CATEGORY_AND_SUBCATS', 'NOT_APPLICABLE' ) NOT NULL ,
  `discountmethod` VARCHAR(100) NOT NULL ,
PRIMARY KEY ( `groupdiscountid` ) ,
KEY `discounttype` (`discounttype`,`catorprodid`,`customergroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_methods` (
  `methodid` int(10) unsigned NOT NULL auto_increment,
  `zoneid` int(10) unsigned NOT NULL default '0',
  `methodname` varchar(150) NOT NULL default '',
  `methodmodule` varchar(100) NOT NULL default '',
  `methodhandlingfee` decimal(20,4) NOT NULL default '0.0000',
  `methodenabled` int(1) NOT NULL default '1',
  `methodvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`methodid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_vars` (
  `variableid` int(11) NOT NULL auto_increment,
  `methodid` int(10) unsigned NOT NULL default '0',
  `zoneid` int(10) unsigned NOT NULL default '0',
  `modulename` varchar(100) NOT NULL default '',
  `variablename` varchar(100) NOT NULL default '',
  `variableval` text,
  `varvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`variableid`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_zones` (
  `zoneid` int(10) unsigned NOT NULL auto_increment,
  `zonename` varchar(100) NOT NULL default '',
  `zonetype` enum('country','state','zip') default 'country',
  `zonefreeshipping` int(1) NOT NULL default '0',
  `zonefreeshippingtotal` decimal(20,4) NOT NULL default '0.0000',
  `zonehandlingtype` enum('none','global','module') default 'none',
  `zonehandlingfee` decimal(20,4) NOT NULL default '0.0000',
  `zonehandlingseparate` int(1) NOT NULL default '1',
  `zoneenabled` int(1) NOT NULL default '1',
  `zonevendorid` int unsigned NOT NULL default '0',
  `zonedefault` int(1) NOT NULL default '0',
  PRIMARY KEY  (`zoneid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shipping_zone_locations` (
  `locationid` int(10) unsigned NOT NULL auto_increment,
  `zoneid` int(10) unsigned NOT NULL default '0',
  `locationtype` enum('country','state','zip') default 'country',
  `locationvalueid` int(10) unsigned NOT NULL default '0',
  `locationvalue` varchar(100) NOT NULL default '0',
  `locationcountryid` int(10) unsigned NOT NULL default '0',
  `locationvendorid` int unsigned NOT NULL default '0',
  PRIMARY KEY  (`locationid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS `%%PREFIX%%vendors` (
	`vendorid` int unsigned NOT NULL auto_increment,
	`vendorname` varchar(200) NOT NULL default '',
	`vendorfriendlyname` varchar(100) NOT NULL default '',
	`vendorphone` varchar(50) NOT NULL default '',
	`vendorbio` text NOT NULL,
	`vendoraddress` varchar(200) NOT NULL default '',
	`vendorcity` varchar(100) NOT NULL default '',
	`vendorcountry` varchar(100) NOT NULL default '',
	`vendorstate` varchar(100) NOT NULL default '',
	`vendorzip` varchar(20) NOT NULL default '',
	`vendornumsales` int unsigned NOT NULL default '0',
	`vendororderemail` varchar(200) NOT NULL default '',
	`vendorshipping` int(1) NOT NULL default '0',
	`vendoremail` varchar(200) NOT NULL default '',
	`vendoraccesscats` text NULL,
	`vendorlogo` varchar(200) NOT NULL default '',
	`vendorphoto` varchar(200) NOT NULL default '',
	`vendorprofitmargin` decimal(20,4) NOT NULL default '0.00',
	PRIMARY KEY(vendorid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS %%PREFIX%%product_tags(
	 tagid INT UNSIGNED NOT NULL AUTO_INCREMENT ,
	 tagname VARCHAR( 100 ) NOT NULL DEFAULT  '',
	 tagfriendlyname VARCHAR( 100 ) NOT NULL DEFAULT  '',
	 tagcount INT UNSIGNED NOT NULL DEFAULT  '0',
	 PRIMARY KEY ( tagid ),
	 INDEX ( tagname ),
	 INDEX ( tagfriendlyname )
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS %%PREFIX%%product_tagassociations(
	 tagid INT UNSIGNED NOT NULL DEFAULT  '0',
	 productid INT UNSIGNED NOT NULL DEFAULT  '0',
	 PRIMARY KEY ( tagid, productid ),
	 INDEX ( productid )
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS %%PREFIX%%gift_wrapping (
	wrapid int unsigned NOT NULL auto_increment,
	wrapname varchar(100) NOT NULL default '',
	wrapprice decimal(20, 4) NOT NULL default '0.00',
	wrapvisible int(1) NOT NULL default '0',
	wrapallowcomments int(1) NOT NULL default '0',
	wrappreview varchar(100) NOT NULL default '',
	PRIMARY KEY(wrapid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS [|PREFIX|]shipments (
	shipmentid int unsigned NOT NULL auto_increment,
	shipcustid int unsigned NOT NULL default '0',
	shipvendorid int unsigned NOT NULL default '0',
	shipdate int(11) NOT NULL default '0',
	shiptrackno varchar(50) NOT NULL default '',
	shipping_module varchar(100) NOT NULL default '',
	shipmethod varchar(100) NOT NULL default '',
	shiporderid int unsigned NOT NULL default '0',
	shiporderdate int(11) NOT NULL default '0',
	shipcomments TEXT NULL,
	shipbillfirstname varchar(255) NOT NULL default '',
	shipbilllastname varchar(255) NOT NULL default '',
	shipbillcompany varchar(100) NOT NULL default '',
	shipbillstreet1 varchar(255) NOT NULL default '',
	shipbillstreet2 varchar(255) NOT NULL default '',
	shipbillsuburb varchar(100) NOT NULL default '',
	shipbillstate varchar(50) NOT NULL default '',
	shipbillzip varchar(20) NOT NULL default '',
	shipbillcountry varchar(50) NOT NULL default '',
	shipbillcountrycode varchar(2) NOT NULL default '',
	shipbillcountryid int(11) NOT NULL default '0',
	shipbillstateid int(11) NOT NULL default '0',
	shipbillphone varchar(50) NOT NULL default '',
	shipbillemail varchar(250) NOT NULL default '',
	shipshipfirstname varchar(100) NOT NULL default '',
	shipshiplastname varchar(100) NOT NULL default '',
	shipshipcompany varchar(100) NOT NULL default '',
	shipshipstreet1 varchar(255) NOT NULL default '',
	shipshipstreet2 varchar(255) NOT NULL default '',
	shipshipsuburb varchar(100) NOT NULL default '',
	shipshipstate varchar(50) NOT NULL default '',
	shipshipzip varchar(20) NOT NULL default '',
	shipshipcountry varchar(50) NOT NULL default '',
	shipshipcountrycode varchar(2) NOT NULL default '',
	shipshipcountryid int(11) NOT NULL default '0',
	shipshipstateid int(11) NOT NULL default '0',
	shipshipphone varchar(50) NOT NULL default '',
	shipshipemail varchar(250) NOT NULL default '',
	PRIMARY KEY(shipmentid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS [|PREFIX|]shipment_items (
	itemid int unsigned NOT NULL auto_increment,
	shipid int unsigned NOT NULL default '0',
	itemprodid int unsigned NOT NULL default '0',
	itemordprodid int unsigned NOT NULL default '0',
	itemprodsku varchar(250) NOT NULL default '',
	itemprodname varchar(250) NOT NULL default '',
	itemqty int unsigned NOT NULL default '0',
	itemprodoptions text NULL,
	itemprodvariationid int unsigned NOT NULL default '0',
	itemprodeventname VARCHAR(255),
	itemprodeventdate INT(9),
	PRIMARY KEY(itemid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS [|PREFIX|]vendor_payments (
	paymentid int unsigned NOT NULL auto_increment,
	paymentfrom int(11) NOT NULL default '0',
	paymentto int(11) NOT NULL default '0',
	paymentvendorid int unsigned NOT NULL default '0',
	paymentamount decimal(20, 4) NOT NULL default '0.0000',
	paymentforwardbalance decimal(20, 4) NOT NULL default '0.0000',
	paymentdate int(11) NOT NULL default '0',
	paymentdeducted int(1) NOT NULL default '0',
	paymentmethod varchar(100) NOT NULL default '',
	paymentcomments text NULL,
	PRIMARY KEY(paymentid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_discounts`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_discounts` (
 `discountid` INT NOT NULL auto_increment,
 `discountprodid` INT NOT NULL default '0',
 `discountquantitymin` INT NOT NULL default '0',
 `discountquantitymax` INT NOT NULL default '0',
 `discounttype` ENUM('price', 'percent', 'fixed') NOT NULL default 'price',
 `discountamount` DECIMAL(20,4) NOT NULL default '0',
 PRIMARY KEY (`discountid`),
 INDEX `i_product_discounts_discountprodid` (`discountprodid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%product_comparisons`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_comparisons` (
  `product_id` int(11) NOT NULL,
  `comparison_id` varchar(255) NOT NULL,
  PRIMARY KEY  (`product_id`, `comparison_id`),
  KEY `i_product_comparisons_comparison_id` (`comparison_id`),
  KEY `i_product_comparisons_product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Table structure for table `%%PREFIX%%shopping_comparison_taxonomies`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shopping_comparison_taxonomies` (
	`id` varchar(255) NOT NULL,
	`filename` varchar(255) NOT NULL,
	`last_updated` int(11) NOT NULL,
	PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Table structure for table `%%PREFIX%%shopping_comparison_categories`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shopping_comparison_categories` (
	`id` int(11) NOT NULL,
	`shopping_comparison_id` varchar(255) NOT NULL,
	`parent_id` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`path` varchar(255) NOT NULL,
	`num_children` int(11) NOT NULL default '0',
	PRIMARY KEY  (`shopping_comparison_id`, `id`),
	KEY `i_shopping_comparison_categories_path` (`path`),
	KEY `i_shopping_comparison_categories_comparison_id` (`shopping_comparison_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

--
-- Table structure for table `%%PREFIX%%shopping_comparison_category_associations`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%shopping_comparison_category_associations` (
	`category_id` int(11) NOT NULL,
	`shopping_comparison_id` varchar(255) NOT NULL,
	`shopping_comparison_category_id` int(11) NOT NULL,
	PRIMARY KEY  (`category_id`, `shopping_comparison_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_configurable_fields` (
  `productfieldid` int(11) NOT NULL auto_increment,
  `fieldprodid` int(11) NOT NULL default '0',
  `fieldname` varchar(255) NOT NULL default '',
  `fieldtype` varchar(255) NOT NULL default '',
  `fieldfiletype` varchar(255) NOT NULL default '',
  `fieldfilesize` int(11) NOT NULL default '0',
  `fieldselectoptions` text NOT NULL,
  `fieldrequired` tinyint(4) NOT NULL default '0',
  `fieldsortorder` int(11) NOT NULL default '1',
  PRIMARY KEY  (`productfieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%order_configurable_fields` (
  `orderfieldid` int(11) NOT NULL auto_increment,
  `fieldid` int(11) NOT NULL default '0',
  `orderid` int(11) NOT NULL default '0',
  `ordprodid` int(11) NOT NULL default '0',
  `productid` int(11) NOT NULL default '0',
  `textcontents` text NULL,
  `filename` varchar(255) NOT NULL default '',
  `filetype` varchar(255) NOT NULL default '',
  `originalfilename` varchar(255) NOT NULL default '',
  `fieldname` varchar(255) NOT NULL default '',
  `fieldtype` varchar(255) NOT NULL default '',
  `fieldselectoptions` text NOT NULL,
  PRIMARY KEY  (`orderfieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%export_templates` (
	`exporttemplateid` int(11) unsigned NOT NULL auto_increment,
	`exporttemplatename` varchar(100) NOT NULL,
	`myobassetaccount` varchar(20) NOT NULL,
	`myobincomeaccount` varchar(20) NOT NULL,
	`myobexpenseaccount` varchar(20) NOT NULL,
	`peachtreereceivableaccount` varchar(20) NOT NULL,
	`peachtreeglaccount` varchar(20) NOT NULL,
	`modifyforpeachtree` tinyint(1) unsigned NOT NULL,
	`dateformat` varchar(15) NOT NULL,
	`priceformat` varchar(15) NOT NULL,
	`boolformat` varchar(15) NOT NULL,
	`blankforfalse` tinyint(1) unsigned NOT NULL,
	`striphtml` tinyint(1) unsigned NOT NULL,
	`vendorid` int(11) unsigned NOT NULL,
	`usedtypes` varchar(63) NOT NULL,
	`builtin` tinyint(1) unsigned NOT NULL,
	PRIMARY KEY  (`exporttemplateid`),
	KEY `exporttemplatename` (`exporttemplatename`),
	KEY `vendorid` (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%export_template_fields` (
	`exporttemplatefieldid` smallint(5) unsigned NOT NULL auto_increment,
	`exporttemplateid` smallint(5) unsigned NOT NULL,
	`fieldid` varchar(31) NOT NULL,
	`fieldtype` varchar(31) NOT NULL,
	`fieldname` varchar(63) NOT NULL,
	`includeinexport` tinyint(1) unsigned NOT NULL,
	`sortorder` tinyint(3) unsigned NOT NULL,
	PRIMARY KEY  (`exporttemplatefieldid`),
	KEY `exporttemplateid` (`exporttemplateid`,`fieldtype`,`includeinexport`,`sortorder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%export_method_settings` (
	`exportmethodid` int(11) unsigned NOT NULL auto_increment,
	`methodname` varchar(15) NOT NULL,
	`exporttemplateid` int(11) unsigned NOT NULL,
	`variablename` varchar(31) NOT NULL,
	`variablevalue` varchar(31) NOT NULL,
	PRIMARY KEY  (`exportmethodid`),
	KEY `methodname` (`methodname`,`exporttemplateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%discounts` (
	`discountid` int(11) NOT NULL auto_increment,
	`discountname` varchar(100) NOT NULL,
	`discountruletype` varchar(100) NOT NULL,
	`discountmaxuses` int(11) NOT NULL default '0',
	`discountcurrentuses` int(11) NOT NULL default '0',
	`discountexpiry` int(11) NOT NULL default '0',
	`discountenabled` tinyint(4) NOT NULL default '0',
	`sortorder` int(9) NOT NULL,
	`halts` int(1) NOT NULL,
	`configdata` text NOT NULL,
	`free_shipping_message` text NOT NULL,
	`free_shipping_message_location` text NOT NULL,
	PRIMARY KEY  (`discountid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%product_videos` (
	`video_id` VARCHAR( 25 ) NOT NULL ,
	`video_product_id` INT( 11 ) UNSIGNED NOT NULL ,
	`video_sort_order` INT( 11 ) UNSIGNED NOT NULL ,
	`video_title` VARCHAR( 255 ) NOT NULL ,
	`video_description` TEXT NOT NULL ,
	`video_length` VARCHAR( 10 ) NOT NULL,
	PRIMARY KEY ( `video_id` , `video_product_id` ),
	KEY ( `video_product_id` , `video_sort_order` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%email_provider_list_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_provider_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `provider_field_id` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `size` varchar(32) NOT NULL DEFAULT '',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `settings` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email_provider_list_id_provider_field_id` (`email_provider_list_id`,`provider_field_id`),
  KEY `idx_email_provider_list_id_name` (`email_provider_list_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%email_provider_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(64) NOT NULL DEFAULT '',
  `provider_list_id` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `last_field_update` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_provider_provider_list_id` (`provider`,`provider_list_id`),
  KEY `idx_provider_name` (`provider`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%email_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(64) NOT NULL DEFAULT '',
  `event` varchar(64) NOT NULL DEFAULT '',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_list_id` varchar(64) NOT NULL DEFAULT '',
  `field_map` text NOT NULL,
  `event_criteria` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- Default template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES (1, 'Default', '', '', '', '', '', 0, 'dmy-slash', 'number', 'yn', 0, 1, 0, 'customers,orders,products,salestax,redirects', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'BlankLine', '0');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'SubItems', 'combine');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 1, 'LineEnding', 'Windows');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerID', 'customers', 'Customer ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerName', 'customers', 'Customer Name', 0, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerFirstName', 'customers', 'First Name', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerLastName', 'customers', 'Last Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerCompany', 'customers', 'Company', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerEmail', 'customers', 'Email', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerPhone', 'customers', 'Phone', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerNotes', 'customers', 'Notes', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerCredit', 'customers', 'Store Credit', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerGroup', 'customers', 'Customer Group', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerDateJoined', 'customers', 'Date Joined', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerAddresses', 'customers', 'Addresses', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressName', 'customers', 'Address Name', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressFirstName', 'customers', 'Address First Name', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressLastName', 'customers', 'Address Last Name', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressCompany', 'customers', 'Address Company', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressLine1', 'customers', 'Address Line 1', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressLine2', 'customers', 'Address Line 2', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressSuburb', 'customers', 'City', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressState', 'customers', 'State/Province', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressStateAbbrv', 'customers', 'State', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressPostcode', 'customers', 'Zip', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressCountry', 'customers', 'Country', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressBuilding', 'customers', 'Building Type', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressPhone', 'customers', 'Address Phone', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'addressFormFields', 'customers', 'Address Form Fields', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'customerFormFields', 'customers', 'Form Fields', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderID', 'orders', 'Order ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderStatus', 'orders', 'Order Status', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderDate', 'orders', 'Order Date', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderSubtotalInc', 'orders', 'Subtotal (inc tax)', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderSubtotalEx', 'orders', 'Subtotal (ex tax)', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTaxtotal', 'orders', 'Tax Total', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTaxRate', 'orders', 'Tax Rate', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTaxName', 'orders', 'Tax Name', 1, 11 );
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderShipCostInc', 'orders', 'Shipping Cost (inc tax)', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderShipCostEx', 'orders', 'Shipping Cost (ex tax)', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderHandlingCostInc', 'orders', 'Handling Cost (inc tax)', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderHandlingCostEx', 'orders', 'Handling Cost (ex tax)', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalAmountInc', 'orders', 'Order Total (inc tax)', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalAmountEx', 'orders', 'Order Total (ex tax)', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerID', 'orders', 'Customer ID', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerName', 'orders', 'Customer Name', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerEmail', 'orders', 'Customer Email', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustomerPhone', 'orders', 'Customer Phone', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderShipMethod', 'orders', 'Ship Method', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderPayMethod', 'orders', 'Payment Method', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalQty', 'orders', 'Total Quantity', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTotalShipped', 'orders', 'Total Shipped', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderDateShipped', 'orders', 'Date Shipped', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCurrency', 'orders', 'Order Currency Code', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderExchangeRate', 'orders', 'Exchange Rate', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderNotes', 'orders', 'Order Notes', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderCustMessage', 'orders', 'Customer Message', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billName', 'orders', 'Billing Name', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billFirstName', 'orders', 'Billing First Name', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billLastName', 'orders', 'Billing Last Name', 1, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billCompany', 'orders', 'Billing Company', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billStreet1', 'orders', 'Billing Street 1', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billStreet2', 'orders', 'Billing Street 2', 1, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billSuburb', 'orders', 'Billing Suburb', 1, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billState', 'orders', 'Billing State', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billStateAbbrv', 'orders', 'Billing State', 1, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billZip', 'orders', 'Billing Zip', 1, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billCountry', 'orders', 'Billing Country', 1, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billSSC', 'orders', 'Billing Suburb + State + Zip', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billPhone', 'orders', 'Billing Phone', 1, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billEmail', 'orders', 'Billing Email', 1, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'billFormFields', 'orders', 'Billing Form Fields', 1, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipName', 'orders', 'Shipping Name', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipFirstName', 'orders', 'Shipping First Name', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipLastName', 'orders', 'Shipping Last Name', 1, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipCompany', 'orders', 'Shipping Company', 1, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipStreet1', 'orders', 'Shipping Street 1', 1, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipStreet2', 'orders', 'Shipping Street 2', 1, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipSuburb', 'orders', 'Shipping Suburb', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipState', 'orders', 'Shipping State', 0, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipStateAbbrv', 'orders', 'Shipping State', 1, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipZip', 'orders', 'Shipping Zip', 1, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipCountry', 'orders', 'Shipping Country', 1, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipSSC', 'orders', 'Shipping Suburb + State + Zip', 0, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipPhone', 'orders', 'Shipping Phone', 1, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipEmail', 'orders', 'Shipping Email', 1, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'shipFormFields', 'orders', 'Shipping Form Fields', 1, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdDetails', 'orders', 'Product Details', 1, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdID', 'orders', 'Product ID', 1, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdQty', 'orders', 'Product Qty', 1, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdSKU', 'orders', 'Product SKU', 1, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdName', 'orders', 'Product Name', 1, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdWeight', 'orders', 'Product Weight', 1, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdVariationDetails', 'orders', 'Product Variation Details', 1, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdPrice', 'orders', 'Product Unit Price', 1, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdIndex', 'orders', 'Product Index', 0, 65);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProdTotalPrice', 'orders', 'Product Total Price', 1, 66);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderGLAccount', 'orders', 'Peachtree General Ledger Account', 0, 67);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderPTTaxType', 'orders', 'Peachtree Tax Type', 0, 68);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderProductCount', 'orders', '# Unique Products in Order', 0, 69);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderWeight', 'orders', 'Combined Product Weight', 1, 70);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderTodaysDate', 'orders', 'Todays Date', 0, 71);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'orderAccountsReceivable', 'orders', 'Peachtree Accounts Receivable Account', 0, 72);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productID', 'products', 'Product ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productType', 'products', 'Product Type', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCode', 'products', 'Code', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productName', 'products', 'Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productBrand', 'products', 'Brand', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productBrandName', 'products', 'Brand + Name', 0, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productDesc', 'products', 'Description', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productTaxable', 'products', 'Taxable Product', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCostPrice', 'products', 'Cost Price', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productRetailPrice', 'products', 'Retail Price', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productSalePrice', 'products', 'Sale Price', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCalculatedPrice', 'products', 'Calculated Price', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productShippingPrice', 'products', 'Fixed Shipping Price', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productFreeShipping', 'products', 'Free Shipping', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productWarranty', 'products', 'Warranty', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productWeight', 'products', 'Weight', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productWidth', 'products', 'Width', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productHeight', 'products', 'Height', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productDepth', 'products', 'Depth', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productPurchasable', 'products', 'Allow Purchases', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVisible', 'products', 'Product Visible', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productNotVisible', 'products', 'Product Not Visible', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productAvailability', 'products', 'Product Availability', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productInventoried', 'products', 'Product Inventoried', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productStockLevel', 'products', 'Stock Level', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productLowStockLevel', 'products', 'Low Stock Level', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productDateAdded', 'products', 'Date Added', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productLastModified', 'products', 'Date Modified', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategories', 'products', 'Category Details', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategoryID', 'products', 'Category ID', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategoryName', 'products', 'Category Name', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCategoryPath', 'products', 'Category Path', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productImages', 'products', 'Images', 1, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productImageFile', 'products', 'Image File Name', 1, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productImageURL', 'products', 'Image URL', 1, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productPageTitle', 'products', 'Page Title', 1, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMetaKeywords', 'products', 'META Keywords', 1, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMetaDesc', 'products', 'META Description', 1, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVariations', 'products', 'Product Variations', 1, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarDetails', 'products', 'Variation Details', 1, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarSKU', 'products', 'SKU', 1, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarPrice', 'products', 'Price', 1, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarWeight', 'products', 'Weight', 1, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarStockLevel', 'products', 'Stock Level', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productVarLowStockLevel', 'products', 'Low Stock Level', 1, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMYOBAsset', 'products', 'MYOB Asset Acct', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMYOBIncome', 'products', 'MYOB Income Acct', 0, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productMYOBExpense', 'products', 'MYOB Expense Acct', 0, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'productCondition', 'products', 'Product Condition', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxDate', 'salestax', 'Period', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxTaxName', 'salestax', 'Tax', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxTaxRate', 'salestax', 'Rate', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxNumOrders', 'salestax', 'Number of Orders', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'salestaxTaxAmount', 'salestax', 'Tax Amount', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderOrderId', 'abandonorder', 'Order Id', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderCustomerName', 'abandonorder', 'Customer Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderCustomerEmail', 'abandonorder', 'Customer Email', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderCustomerPhone', 'abandonorder', 'Customer Phone', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderDate', 'abandonorder', 'Date', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'abandonorderTotalOrderAmount', 'abandonorder', 'Total Order Amount', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectPath', 'redirects', 'Old Path', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectOldURL', 'redirects', 'Old URL', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectNewURL', 'redirects', 'New URL', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectAssocType', 'redirects', 'Associated Type', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (1, 'redirectAssocId', 'redirects', 'Associated ID', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectNewURLOrAssocType', 'redirects', 'New URL or Associated Type', 0, 5);

-- MYOB template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES (2, 'MYOB', '', '', '', '', '', 0, 'dmy-slash', 'number', 'yn', 1, 1, 0, 'customers,orders,products', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'BlankLine', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'SubItems', 'rows');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 2, 'LineEnding', 'Windows');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerID', 'customers', 'Card ID', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerName', 'customers', 'Customer Name', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerFirstName', 'customers', 'First Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerLastName', 'customers', 'Co./Last Name', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerCompany', 'customers', 'Company', 0, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerEmail', 'customers', 'Email', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerPhone', 'customers', 'Phone', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerNotes', 'customers', 'Notes', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerCredit', 'customers', 'Store Credit', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerGroup', 'customers', 'Customer Group', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerDateJoined', 'customers', 'Date Joined', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerAddresses', 'customers', 'Addresses', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressName', 'customers', 'Address Contact Name', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressFirstName', 'customers', 'Address First Name', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressLastName', 'customers', 'Address Last Name', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressCompany', 'customers', 'Address Company', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressLine1', 'customers', 'Address Line 1', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressLine2', 'customers', 'Address Line 2', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressSuburb', 'customers', 'Address City', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressState', 'customers', 'Address State', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressStateAbbrv', 'customers', 'State Abbreviation', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressPostcode', 'customers', 'Address Postcode', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressCountry', 'customers', 'Address Country', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressBuilding', 'customers', 'Building Type', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressPhone', 'customers', 'Address Phone 1', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressFormFields', 'customers', 'Address Form Fields', 0, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerFormFields', 'customers', 'Form Fields', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderID', 'orders', 'Invoice #', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderStatus', 'orders', 'Order Status', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderDate', 'orders', 'Date', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderSubtotalInc', 'orders', 'Total', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTaxtotal', 'orders', 'Tax Amount', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTaxRate', 'orders', 'Tax Rate', 0, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTaxName', 'orders', 'Tax Code', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderShipCostInc', 'orders', 'Inc-Tax Freight Amount', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderHandlingCostInc', 'orders', 'Handling Cost', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTotalAmountInc', 'orders', 'Inc-Tax Total', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderCustomerID', 'orders', 'Card ID', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderShipMethod', 'orders', 'Ship Via', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderPayMethod', 'orders', 'Payment Method', 1, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTotalQty', 'orders', 'Total Quantity', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTotalShipped', 'orders', 'Total Shipped', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderDateShipped', 'orders', 'Shipping Date', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderCurrency', 'orders', 'Currency Code', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderExchangeRate', 'orders', 'Exchange Rate', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderNotes', 'orders', 'Comment', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderCustMessage', 'orders', 'Payment Notes', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billName', 'orders', '', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billFirstName', 'orders', 'First Name', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billLastName', 'orders', 'Co./Last Name', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billCompany', 'orders', 'Billing Company', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billStreet1', 'orders', 'Address Line 1', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billStreet2', 'orders', 'Address Line 2', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billSuburb', 'orders', 'Billing Suburb', 0, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billState', 'orders', 'Billing State', 0, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billStateAbbrv', 'orders', 'Billing State Abbreviation', 0, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billZip', 'orders', 'Billing Zip', 0, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billCountry', 'orders', 'Billing Country', 0, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billSSC', 'orders', '', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billPhone', 'orders', 'Billing Phone', 0, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billEmail', 'orders', 'Billing Email', 0, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billFormFields', 'orders', 'Billing Form Fields', 0, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipName', 'orders', 'Shipping Name', 0, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipFirstName', 'orders', 'First Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipLastName', 'orders', 'Co./Last Name', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipCompany', 'orders', 'Shipping Company', 0, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipStreet1', 'orders', 'Address Line 1', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipStreet2', 'orders', 'Address Line 2', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipSuburb', 'orders', 'Address Line 3', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipState', 'orders', 'Shipping State', 0, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipStateAbbrv', 'orders', 'Shipping State Abbreviation', 0, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipZip', 'orders', 'Shipping Zip', 0, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipCountry', 'orders', 'Address Line 4', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipSSC', 'orders', 'Address Line 3', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipPhone', 'orders', 'Shipping Phone', 0, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipEmail', 'orders', 'Shipping Email', 0, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'shipFormFields', 'orders', 'Shipping Form Fields', 0, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdDetails', 'orders', 'Product Details', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdID', 'orders', 'Item Number', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdQty', 'orders', 'Quantity', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdSKU', 'orders', 'Product SKU', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdName', 'orders', 'Description', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdPrice', 'orders', 'Inc-Tax Price', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdIndex', 'orders', 'Product Index', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProdTotalPrice', 'orders', 'Product Total Price', 0, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderGLAccount', 'orders', 'G/L Account', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderPTTaxType', 'orders', 'Peachtree Tax Type', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderProductCount', 'orders', '# Unique Products in Order', 0, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderTodaysDate', 'orders', 'Todays Date', 0, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'orderAccountsReceivable', 'orders', 'Peachtree Accounts Receivable Account', 0, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productID', 'products', 'Item Number', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productType', 'products', 'Product Type', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCode', 'products', 'Code', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productName', 'products', 'Item Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productBrand', 'products', 'Brand', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productBrandName', 'products', '', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productDesc', 'products', 'Description', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productTaxable', 'products', 'Taxable Product', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCostPrice', 'products', 'Standard Cost', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productRetailPrice', 'products', 'Retail Price', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productSalePrice', 'products', 'Sale Price', 0, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCalculatedPrice', 'products', 'Selling Price', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productShippingPrice', 'products', 'Fixed Shipping Price', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productFreeShipping', 'products', 'Free Shipping', 0, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productWarranty', 'products', 'Warranty', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productWeight', 'products', 'Weight', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productWidth', 'products', 'Width', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productHeight', 'products', 'Height', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productDepth', 'products', 'Depth', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productPurchasable', 'products', 'Sell', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVisible', 'products', 'Product Visible', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productNotVisible', 'products', 'Inactive Item', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productAvailability', 'products', 'Product Availability', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productInventoried', 'products', 'Inventory', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productStockLevel', 'products', 'Stock Level', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productLowStockLevel', 'products', 'Minimum Level', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productDateAdded', 'products', 'Date Added', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productLastModified', 'products', 'Date Modified', 0, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategories', 'products', 'Category Details', 0, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategoryID', 'products', 'Category ID', 0, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategoryName', 'products', 'Category Name', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCategoryPath', 'products', 'Category Path', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productPageTitle', 'products', 'Page Title', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMetaKeywords', 'products', 'META Keywords', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMetaDesc', 'products', 'META Description', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVariations', 'products', 'Product Variations', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarDetails', 'products', 'Variation Details', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarSKU', 'products', 'SKU', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarPrice', 'products', 'Price', 0, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarWeight', 'products', 'Weight', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarStockLevel', 'products', 'Stock Level', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productVarLowStockLevel', 'products', 'Low Stock Level', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMYOBAsset', 'products', 'Asset Acct', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMYOBIncome', 'products', 'Income Acct', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productMYOBExpense', 'products', 'Expense/COS Acct', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'productCondition', 'products', 'Product Condition', 0, 45);

-- Peachtree template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES (3, 'Peachtree Accounting', '', '', '', '', '', 1, 'dmy-slash', 'number', 'truefalse', 0, 1, 0, 'customers,orders,products,abandonorder', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'SubItems', 'rows');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'LineEnding', 'Windows');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES ('CSV', 3, 'BlankLine', '0');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerID', 'customers', 'Customer ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerName', 'customers', 'Customer Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerFirstName', 'customers', 'First Name', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerLastName', 'customers', 'Last Name', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerCompany', 'customers', 'Company', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerEmail', 'customers', 'Customer E-mail', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerPhone', 'customers', 'Telephone 1', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerNotes', 'customers', 'Notes', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerCredit', 'customers', 'Customer Balance', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerGroup', 'customers', 'Customer Group', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerDateJoined', 'customers', 'Customer Since Date', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'customerAddresses', 'customers', 'Addresses', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressName', 'customers', 'Ship to Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressFirstName', 'customers', 'Address First Name', 0, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressLastName', 'customers', 'Address Last Name', 0, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressCompany', 'customers', 'Address Company', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressLine1', 'customers', 'Ship to Address Line 1', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressLine2', 'customers', 'Ship to Address Line 2', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressSuburb', 'customers', 'Ship to City', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressState', 'customers', 'Ship to State', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressStateAbbrv', 'customers', 'Ship to State', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressPostcode', 'customers', 'Ship to Zipcode', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressCountry', 'customers', 'Ship to Country', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressBuilding', 'customers', 'Building Type', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'addressPhone', 'customers', 'Address Phone', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'addressFormFields', 'customers', 'Address Form Fields', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'customerFormFields', 'customers', 'Form Fields', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderID', 'orders', 'Invoice/CM #', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderStatus', 'orders', 'Order Status', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderDate', 'orders', 'Date', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderSubtotalInc', 'orders', 'Subtotal', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTaxtotal', 'orders', 'Tax Total', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTaxRate', 'orders', 'Tax Rate', 0, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTaxName', 'orders', 'Sales Tax Agency', 0, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderShipCostInc', 'orders', 'Shipping Cost', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderHandlingCostInc', 'orders', 'Handling Cost', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTotalAmountInc', 'orders', 'Order Total', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderCustomerID', 'orders', 'Customer ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderShipMethod', 'orders', 'Ship Via', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderPayMethod', 'orders', 'Payment Method', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTotalQty', 'orders', 'Total Quantity', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTotalShipped', 'orders', 'Total Shipped', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderDateShipped', 'orders', 'Ship Date', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderCurrency', 'orders', 'Order Currency Code', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderExchangeRate', 'orders', 'Exchange Rate', 0, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderNotes', 'orders', 'Internal Note', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderCustMessage', 'orders', 'Invoice Note', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billName', 'orders', 'Billing Name', 0, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billFirstName', 'orders', 'Billing First Name', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billLastName', 'orders', 'Billing Last Name', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billCompany', 'orders', 'Billing Company', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billStreet1', 'orders', 'Billing Street 1', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billStreet2', 'orders', 'Billing Street 2', 0, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billSuburb', 'orders', 'Billing Suburb', 0, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billState', 'orders', 'Billing State', 0, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billStateAbbrv', 'orders', 'Billing State Abbreviation', 0, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billZip', 'orders', 'Billing Zip', 0, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billCountry', 'orders', 'Billing Country', 0, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billSSC', 'orders', 'Billing Suburb + State + Zip', 0, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billPhone', 'orders', 'Billing Phone', 0, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'billEmail', 'orders', 'Billing Email', 0, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (2, 'billFormFields', 'orders', 'Billing Form Fields', 0, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipName', 'orders', 'Ship to Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipFirstName', 'orders', '', 0, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipLastName', 'orders', 'Shipping Last Name', 0, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipCompany', 'orders', 'Shipping Company', 0, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipStreet1', 'orders', 'Ship to Address-Line One', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipStreet2', 'orders', 'Ship to Address-Line Two', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipSuburb', 'orders', 'Ship to City', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipState', 'orders', 'Ship to State', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipStateAbbrv', 'orders', 'Shipping State Abbreviation', 0, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipZip', 'orders', 'Ship to Zipcode', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipCountry', 'orders', 'Ship to Country', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipSSC', 'orders', 'Shipping Suburb + State + Zip', 0, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipPhone', 'orders', 'Shipping Phone', 0, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipEmail', 'orders', 'Shipping Email', 0, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'shipFormFields', 'orders', 'Billing Form Fields', 0, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdDetails', 'orders', 'Product Details', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdID', 'orders', 'Item ID', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdQty', 'orders', 'Quantity', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdSKU', 'orders', 'UPC/SKU', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdName', 'orders', 'Description', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdPrice', 'orders', 'Unit Price', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdIndex', 'orders', 'Invoice/CM Distribution', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProdTotalPrice', 'orders', 'Amount', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderGLAccount', 'orders', 'G/L Account', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderPTTaxType', 'orders', 'Tax Type', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderProductCount', 'orders', 'Number of Distributions', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderTodaysDate', 'orders', 'Date Due', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'orderAccountsReceivable', 'orders', 'Accounts Receivable Account', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productID', 'products', 'Item ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productType', 'products', 'Item Type', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCode', 'products', 'UPC/SKU', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productName', 'products', 'Item Description', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productBrand', 'products', 'Brand', 0, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productBrandName', 'products', 'Brand + Name', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productDesc', 'products', 'Description for Sales ', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productTaxable', 'products', 'Is Taxable', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCostPrice', 'products', 'Last Unit Cost', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productRetailPrice', 'products', 'Retail Price', 0, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productSalePrice', 'products', 'Sales Price 1', 0, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCalculatedPrice', 'products', 'Sales Price 1', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productShippingPrice', 'products', 'Fixed Shipping Price', 0, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productFreeShipping', 'products', 'Free Shipping', 0, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productWarranty', 'products', 'Warranty', 0, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productWeight', 'products', 'Weight', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productWidth', 'products', 'Width', 0, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productHeight', 'products', 'Height', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productDepth', 'products', 'Depth', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productPurchasable', 'products', 'Allow Purchases', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVisible', 'products', 'Product Visible', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productNotVisible', 'products', 'Inactive', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productAvailability', 'products', 'Product Availability', 0, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productInventoried', 'products', 'Product Inventoried', 0, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productStockLevel', 'products', 'Quantity on Hand', 0, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productLowStockLevel', 'products', 'Minimum Stock', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productDateAdded', 'products', 'Date Added', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productLastModified', 'products', 'Effective Date ', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategories', 'products', 'Category Details', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategoryID', 'products', 'Category ID', 0, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategoryName', 'products', 'Category Name', 0, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCategoryPath', 'products', 'Category Path', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productPageTitle', 'products', 'Page Title', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMetaKeywords', 'products', 'META Keywords', 0, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMetaDesc', 'products', 'META Description', 0, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVariations', 'products', 'Product Variations', 0, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarDetails', 'products', 'Variation Details', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarSKU', 'products', 'SKU', 0, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarPrice', 'products', 'Price', 0, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarWeight', 'products', 'Weight', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarStockLevel', 'products', 'Stock Level', 0, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productVarLowStockLevel', 'products', 'Low Stock Level', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMYOBAsset', 'products', 'MYOB Asset Acct', 0, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMYOBIncome', 'products', 'MYOB Income Acct', 0, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productMYOBExpense', 'products', 'MYOB Expense Acct', 0, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (3, 'productCondition', 'products', 'Product Condition', 0, 45);

-- Bulk Edit template

INSERT INTO `%%PREFIX%%export_templates` (`exporttemplateid`, `exporttemplatename`, `myobassetaccount`, `myobincomeaccount`, `myobexpenseaccount`, `peachtreereceivableaccount`, `peachtreeglaccount`, `modifyforpeachtree`, `dateformat`, `priceformat`, `boolformat`, `blankforfalse`, `striphtml`, `vendorid`, `usedtypes`, `builtin`) VALUES(4, 'Bulk Edit', '', '', '', '', '', 0, 'mdy-slash', 'number', 'yn', 0, 0, 0, 'customers,products', 1);

INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'FieldSeparator', ',');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'FieldEnclosure', '"');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'IncludeHeader', '1');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'BlankLine', '0');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'SubItems', 'expand');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'SubItemSeparator', '|');
INSERT INTO `%%PREFIX%%export_method_settings` (`methodname`, `exporttemplateid`, `variablename`, `variablevalue`) VALUES('CSV', 4, 'LineEnding', 'Windows');

INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderOrderId', 'abandonorder', 'Order ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderCustomerName', 'abandonorder', 'Customer Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderCustomerEmail', 'abandonorder', 'Customer Email', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderCustomerPhone', 'abandonorder', 'Customer Phone', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderDate', 'abandonorder', 'Date', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'abandonorderTotalOrderAmount', 'abandonorder', 'Total Order Amount', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerID', 'customers', 'Customer ID', 0, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerName', 'customers', 'Customer Name', 0, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerDateJoined', 'customers', 'Date Joined', 0, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressName', 'customers', 'Address Name', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressStateAbbrv', 'customers', 'Address State Abbreviation', 0, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressBuilding', 'customers', 'Building Type', 0, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerEmail', 'customers', 'Email Address', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerFirstName', 'customers', 'First Name', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerLastName', 'customers', 'Last Name', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerCompany', 'customers', 'Company', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerPhone', 'customers', 'Phone', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerNotes', 'customers', 'Notes', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerCredit', 'customers', 'Store Credit', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerGroup', 'customers', 'Customer Group', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerAddresses', 'customers', 'Addresses', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressID', 'customers', 'Address ID', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressFirstName', 'customers', 'Address First Name', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressLastName', 'customers', 'Address Last Name', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressCompany', 'customers', 'Address Company', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressLine1', 'customers', 'Address Line 1', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressLine2', 'customers', 'Address Line 2', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressSuburb', 'customers', 'Address City', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressState', 'customers', 'Address State', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressPostcode', 'customers', 'Address Zip', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressCountry', 'customers', 'Address Country', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressPhone', 'customers', 'Address Phone', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'addressFormFields', 'customers', 'Address Form Fields', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'customerFormFields', 'customers', 'Form Fields', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderID', 'orders', 'Order ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderStatus', 'orders', 'Order Status', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderDate', 'orders', 'Order Date', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderSubtotal', 'orders', 'Subtotal', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTaxtotal', 'orders', 'Tax Total', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTaxRate', 'orders', 'Tax Rate', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTaxName', 'orders', 'Tax Name', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderShipCost', 'orders', 'Shipping Cost', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderHandlingCost', 'orders', 'Handling Cost', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTotalAmount', 'orders', 'Order Total', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerID', 'orders', 'Customer ID', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerName', 'orders', 'Customer Name', 1, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerEmail', 'orders', 'Customer Email', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustomerPhone', 'orders', 'Customer Phone', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderShipMethod', 'orders', 'Ship Method', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderPayMethod', 'orders', 'Payment Method', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTotalQty', 'orders', 'Total Quantity', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTotalShipped', 'orders', 'Total Shipped', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderDateShipped', 'orders', 'Date Shipped', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCurrency', 'orders', 'Order Currency Code', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderExchangeRate', 'orders', 'Exchange Rate', 1, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderNotes', 'orders', 'Order Notes', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCustMessage', 'orders', 'Customer Message', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billName', 'orders', 'Billing Name', 1, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billFirstName', 'orders', 'Billing First Name', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billLastName', 'orders', 'Billing Last Name', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billCompany', 'orders', 'Billing Company', 1, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billStreet1', 'orders', 'Billing Street 1', 1, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billStreet2', 'orders', 'Billing Street 2', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billSuburb', 'orders', 'Billing Suburb', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billState', 'orders', 'Billing State', 1, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billStateAbbrv', 'orders', 'Billing State Abbreviation', 1, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billZip', 'orders', 'Billing Zip', 1, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billCountry', 'orders', 'Billing Country', 1, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billSSC', 'orders', 'Billing Suburb + State + Zip', 1, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billPhone', 'orders', 'Billing Phone', 1, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billEmail', 'orders', 'Billing Email', 1, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'billFormFields', 'orders', 'Billing Form Fields', 1, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipName', 'orders', 'Shipping Name', 1, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipFirstName', 'orders', 'Shipping First Name', 1, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipLastName', 'orders', 'Shipping Last Name', 1, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipCompany', 'orders', 'Shipping Company', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipStreet1', 'orders', 'Shipping Street 1', 1, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipStreet2', 'orders', 'Shipping Street 2', 1, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipSuburb', 'orders', 'Shipping Suburb', 1, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipState', 'orders', 'Shipping State', 1, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipStateAbbrv', 'orders', 'Shipping State Abbreviation', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipZip', 'orders', 'Shipping Zip', 1, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipCountry', 'orders', 'Shipping Country', 1, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipSSC', 'orders', 'Shipping Suburb + State + Zip', 1, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipPhone', 'orders', 'Shipping Phone', 1, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipEmail', 'orders', 'Shipping Email', 1, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'shipFormFields', 'orders', 'Shipping Form Fields', 1, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdDetails', 'orders', 'Product Details', 1, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdID', 'orders', 'Product ID', 1, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdQty', 'orders', 'Product Qty', 1, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdSKU', 'orders', 'Product SKU', 1, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdName', 'orders', 'Product Name', 1, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdVariationDetails', 'orders', 'Product Variation Details', 1, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdPrice', 'orders', 'Product Unit Price', 1, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdIndex', 'orders', 'Product Index', 1, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdWeight', 'orders', 'Product Weight', 1, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProdTotalPrice', 'orders', 'Product Total Price', 1, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderGLAccount', 'orders', 'Peachtree General Ledger Account', 1, 65);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderPTTaxType', 'orders', 'Peachtree Tax Type', 1, 66);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderProductCount', 'orders', '# Unique Products in Order', 1, 67);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderCombinedWeight', 'orders', 'Combined Product Weight', 1, 68);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderTodaysDate', 'orders', 'Todays Date', 1, 69);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'orderAccountsReceivable', 'orders', 'Peachtree Accounts Receivable Account', 1, 70);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productID', 'products', 'Product ID', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productName', 'products', 'Product Name', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productType', 'products', 'Product Type', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCode', 'products', 'Product Code/SKU', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productBrand', 'products', 'Brand Name', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productBrandName', 'products', 'Brand + Name', 0, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productDesc', 'products', 'Product Description', 1, 6);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productPrice', 'products', 'Price', 1, 7);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCostPrice', 'products', 'Cost Price', 1, 8);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productRetailPrice', 'products', 'Retail Price', 1, 9);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productSalePrice', 'products', 'Sale Price', 1, 10);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productTaxable', 'products', 'Taxable Product?', 1, 11);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCalculatedPrice', 'products', 'Calculated Price', 0, 12);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productShippingPrice', 'products', 'Fixed Shipping Cost', 1, 13);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFreeShipping', 'products', 'Free Shipping', 1, 14);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productWarranty', 'products', 'Product Warranty', 1, 15);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productWeight', 'products', 'Product Weight', 1, 16);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productWidth', 'products', 'Product Width', 1, 17);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productHeight', 'products', 'Product Height', 1, 18);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productDepth', 'products', 'Product Depth', 1, 19);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productPurchasable', 'products', 'Allow Purchases?', 1, 20);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVisible', 'products', 'Product Visible?', 1, 21);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productNotVisible', 'products', 'Product Not Visible', 0, 22);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productAvailability', 'products', 'Product Availability', 1, 23);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productTrackInventory', 'products', 'Track Inventory', 1, 24);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productInventoried', 'products', 'Product Inventoried', 0, 25);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productStockLevel', 'products', 'Current Stock Level', 1, 26);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productLowStockLevel', 'products', 'Low Stock Level', 1, 27);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productDateAdded', 'products', 'Date Added', 0, 28);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productLastModified', 'products', 'Date Modified', 0, 29);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryString', 'products', 'Category', 1, 30);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFiles', 'products', 'Product Files', 1, 31);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileFileName', 'products', 'Product File', 1, 32);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFilePath', 'products', 'Product File Path', 0, 33);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileDescription', 'products', 'Product File Description', 1, 34);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileMaxDownloads', 'products', 'Product File Max Downloads', 1, 35);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileTotalDownloads', 'products', 'Product File Total Downloads', 0, 36);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productFileDisabledAfter', 'products', 'Product File Expires After', 1, 37);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategories', 'products', 'Category Details', 0, 38);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryID', 'products', 'Category ID', 0, 39);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryName', 'products', 'Category Name', 0, 40);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCategoryPath', 'products', 'Category Path', 0, 41);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImages', 'products', 'Product Images', 1, 42);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageID', 'products', 'Product Image ID', 1, 43);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImagePath', 'products', 'Product Image File', 1, 44);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageFile', 'products', 'Product Image File', 0, 45);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageURL', 'products', 'Product Image URL', 0, 46);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageDescription', 'products', 'Product Image Description', 1, 47);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageIsThumbnail', 'products', 'Product Image Is Thumbnail', 1, 48);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productImageIndex', 'products', 'Product Image Sort', 1, 49);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productSearchKeywords', 'products', 'Search Keywords', 1, 50);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productPageTitle', 'products', 'Page Title', 1, 51);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMetaKeywords', 'products', 'Meta Keywords', 1, 52);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMetaDesc', 'products', 'Meta Description', 1, 53);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVariations', 'products', 'Product Variations', 0, 54);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarDetails', 'products', 'Variation Details', 0, 55);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarSKU', 'products', 'SKU', 0, 56);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarPrice', 'products', 'Price', 0, 57);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarWeight', 'products', 'Weight', 0, 58);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarStockLevel', 'products', 'Stock Level', 0, 59);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productVarLowStockLevel', 'products', 'Low Stock Level', 0, 60);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMYOBAsset', 'products', 'MYOB Asset Acct', 1, 61);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMYOBIncome', 'products', 'MYOB Income Acct', 1, 62);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productMYOBExpense', 'products', 'MYOB Expense Acct', 1, 63);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productCondition', 'products', 'Product Condition', 1, 64);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productShowCondition', 'products', 'Show Product Condition?', 1, 65);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateRequired', 'products', 'Event Date Required?', 1, 66);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateName', 'products', 'Event Date Name', 1, 67);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateLimited', 'products', 'Event Date Is Limited?', 1, 68);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateStartDate', 'products', 'Event Date Start Date', 1, 69);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productEventDateEndDate', 'products', 'Event Date End Date', 1, 70);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productSortOrder', 'products', 'Sort Order', 1, 71);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productTaxClass', 'products', 'Product Tax Class', 1, 72);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'productUPC', 'products', 'Product UPC', 1, 73);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxDate', 'salestax', 'Period', 1, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxTaxName', 'salestax', 'Tax', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxTaxRate', 'salestax', 'Rate', 1, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxNumOrders', 'salestax', 'Number of Orders', 1, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'salestaxTaxAmount', 'salestax', 'Tax Amount', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectPath', 'redirects', 'Old Path', 0, 0);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectOldURL', 'redirects', 'Old URL', 1, 1);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectNewURL', 'redirects', 'New URL', 0, 2);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectAssocType', 'redirects', 'Associated Type', 0, 3);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectAssocId', 'redirects', 'Associated ID', 1, 5);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES(4, 'redirectNewURLOrAssocType', 'redirects', 'New URL', 1, 4);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsGlobalTradeItemNumber', 'products', 'GPS Global Trade Item Number', 1, 75);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsManufacturerPartNumber', 'products', 'GPS Manufacturer Part Number', 1, 76);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsGender', 'products', 'GPS Gender', 1, 77);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsAgeGroup', 'products', 'GPS Age Group', 1, 78);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsColor', 'products', 'GPS Color', 1, 79);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsSize', 'products', 'GPS Size', 1, 80);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsMaterial', 'products', 'GPS Material', 1, 81);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsPattern', 'products', 'GPS Pattern', 1, 82);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsItemGroupId', 'products', 'GPS Item Group ID', 1, 83);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsCategory', 'products', 'GPS Category', 1, 84);
INSERT INTO `%%PREFIX%%export_template_fields` (`exporttemplateid`, `fieldid`, `fieldtype`, `fieldname`, `includeinexport`, `sortorder`) VALUES (4, 'gpsGooglePsEnabled', 'products', 'GPS Enabled', 1, 85);

CREATE TABLE IF NOT EXISTS `%%PREFIX%%optimizer_config` (
  `optimizer_id` int(11) NOT NULL auto_increment ,
  `optimizer_type` varchar(255) NOT NULL,
  `optimizer_item_id` int(11) NOT NULL,
  `optimizer_config_date` int(11) NOT NULL,
  `optimizer_conversion_page` varchar(255) NOT NULL,
  `optimizer_conversion_url` varchar(255) NOT NULL,
  `optimizer_control_script` text NOT NULL,
  `optimizer_tracking_script` text NOT NULL,
  `optimizer_conversion_script` text NOT NULL,
  PRIMARY KEY  (`optimizer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `%%PREFIX%%shipping_methods` VALUES (1, 1, 'Flat Rate Per Order', 'shipping_flatrate', 0.0000, 1, 0);
INSERT INTO `%%PREFIX%%shipping_vars` VALUES (1, 1, 1, 'shipping_flatrate', 'is_setup', '1', 0);
INSERT INTO `%%PREFIX%%shipping_vars` VALUES (2, 1, 1, 'shipping_flatrate', 'shippingcost', '20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%redirects`
--
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `%%PREFIX%%redirects` (
  `redirectid` INT( 11 ) NOT NULL AUTO_INCREMENT ,
  `redirectpath` VARCHAR( 255 ) NOT NULL ,
  `redirectassocid` INT( 11 ) NOT NULL ,
  `redirectassoctype` SMALLINT( 1 ) NOT NULL ,
  `redirectmanual` VARCHAR( 255 ) NOT NULL,
  PRIMARY KEY  (`redirectid`),
  KEY `redirectpath` (`redirectpath`)
) ENGINE = MYISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%keystore` (
  `key` varchar(255) CHARACTER SET utf8 NOT NULL,
  `value` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_listing_template` (
 `id` int(11) unsigned NOT NULL auto_increment,
 `name` varchar(250) default NULL,
 `enabled` tinyint(1) unsigned default NULL,
 `user_id` int(11) unsigned default NULL,
 `site_id` int(5) unsigned default NULL,
 `is_private` tinyint(1) unsigned default NULL,
 `quantities` smallint(4) unsigned default NULL,
 `lot_size` mediumint(6) unsigned default NULL,
 `listing_type` varchar(50) default NULL,
 `is_default` tinyint(1) unsigned default '0',
 `listing_duration` varchar(10) default NULL,
 `primary_category_options` text NOT NULL,
 `primary_category_id` varchar(11) default NULL,
 `secondary_category_id` varchar(11) default NULL,
 `secondary_category_name` varchar(30) default NULL,
 `store_category1_id` varchar(11) default NULL,
 `store_category1_name` varchar(30) default NULL,
 `store_category2_id` varchar(11) default NULL,
 `store_category2_name` varchar(30) default NULL,
 `accept_best_offer` tinyint(1) unsigned default '0',
 `payment_method` text,
 `paypal_email` varchar(250) default NULL,
 `payment_instruction` varchar(900) default NULL,
 `item_country` varchar(3) default NULL,
 `item_zip` varchar(20) default NULL,
 `item_city` varchar(100) default NULL,
 `use_prod_image` tinyint(1) unsigned default NULL,
 `accept_return` tinyint(1) unsigned default '0',
 `return_offer_as` varchar(100) default NULL,
 `return_period` varchar(10) default NULL,
 `return_cost_by` varchar(100) default NULL,
 `return_policy_description` text,
 `use_domestic_shipping` tinyint(1) unsigned NOT NULL,
 `use_international_shipping` tinyint(1) unsigned default NULL,
 `handling_time` tinyint(2) unsigned NOT NULL,
 `use_salestax` tinyint(1) unsigned default NULL,
 `sales_tax_states` varchar(3) default NULL,
 `salestax_percent` decimal(7,4) default NULL,
 `salestax_inc_shipping` tinyint(1) unsigned default NULL,
 `counter_style` varchar(100) default NULL,
 `gallery_opt` varchar(100) default NULL,
 `featured_gallery_duration` varchar(9) NOT NULL,
 `listing_opt` text,
 `date_added` int(11) unsigned default NULL,
 `secondary_category_options` text NOT NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%ebay_shipping`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_shipping` (
 `id` int(11) NOT NULL auto_increment,
 `ebay_listing_template_id` int(11) default NULL,
 `area` enum('Domestic','International') default NULL,
 `cost_type` enum('Flat','Calculated','Freight') default NULL,
 `offer_pickup` tinyint(1) default NULL,
 `pickup_cost` decimal(20,2) default NULL,
 `is_free_shipping` tinyint(1) default NULL,
 `handling_cost` decimal(20,2) default NULL,
 `package_type` varchar(100) default NULL,
 `get_it_fast` tinyint(1) default NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `%%PREFIX%%ebay_shipping_serv`
--

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_shipping_serv` (
 `id` int(11) NOT NULL auto_increment,
 `ebay_shipping_id` int(11) default NULL,
 `name` varchar(100) default NULL,
 `cost` decimal(20,2) default NULL,
 `additional_cost` decimal(20,2) default NULL,
 `ship_to_locations` text NOT NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `ebay_item_id` varchar(19) DEFAULT NULL,
  `title` varchar(55) DEFAULT NULL,
  `start_time` varchar(28) NOT NULL,
  `end_time` varchar(28) NOT NULL,
  `datetime_listed` int(11) DEFAULT NULL,
  `listing_type` varchar(50) DEFAULT NULL,
  `listing_status` varchar(50) DEFAULT NULL,
  `current_price_currency` varchar(3) DEFAULT NULL,
  `current_price` decimal(20,4) DEFAULT NULL,
  `buyitnow_price_currency` varchar(3) DEFAULT NULL,
  `buyitnow_price` decimal(20,4) DEFAULT NULL,
  `site_id` int(5) DEFAULT NULL,
  `ebay_item_link` varchar(255) DEFAULT NULL,
  `quantity_remaining` int(5) DEFAULT NULL,
  `bid_count` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_item_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `amount` double(20,4) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_listing_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebay_listing_template_id` int(11) DEFAULT NULL,
  `selected_type` enum('CustomPrice','ProductPrice','PriceExtra','None') DEFAULT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `price_type` enum('Starting','Reserve','Buy') DEFAULT NULL,
  `calculate_operator` varchar(20) DEFAULT NULL,
  `calculate_option` varchar(50) DEFAULT NULL,
  `calculate_price` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `%%PREFIX%%ebay_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `category_id` varchar(11) NOT NULL,
  `parent_id` varchar(11) NOT NULL,
  `ebay_site_id` varchar(4) NOT NULL,
  `is_leaf` tinyint(1) unsigned NOT NULL,
  `lot_size_enabled` tinyint(1) unsigned NOT NULL,
  `best_offer_enabled` tinyint(1) unsigned NOT NULL,
  `reserve_price_allowed` tinyint(1) unsigned NOT NULL,
  `minimum_reserve_price` double(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id_2` (`category_id`,`ebay_site_id`),
  KEY `parent_id` (`parent_id`),
  KEY `ebay_site_id` (`ebay_site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS  `[|PREFIX|]tax_zones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` enum('country','state','zip') DEFAULT 'country',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE [|PREFIX|]tax_zones;
INSERT INTO [|PREFIX|]tax_zones (`name`, `default`) VALUES ('Default Zone', 1);

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
TRUNCATE [|PREFIX|]tax_classes;
INSERT INTO [|PREFIX|]tax_classes (`id`, `name`) VALUES (1, 'Non-Taxable Products');
INSERT INTO [|PREFIX|]tax_classes (`id`, `name`) VALUES (2, 'Shipping');
INSERT INTO [|PREFIX|]tax_classes (`id`, `name`) VALUES (3, 'Gift Wrapping');

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_zone_locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) unsigned NOT NULL,
  `type` enum('country','state','zip') NOT NULL DEFAULT 'country',
  `value_id` int(11) unsigned DEFAULT '0',
  `value` varchar(200) DEFAULT '',
  `country_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY (`tax_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_zone_customer_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) unsigned NOT NULL,
  `customer_group_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default_rate` decimal(20, 4) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]tax_rate_class_rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_id` int(11) unsigned NOT NULL,
  `tax_class_id` int(11) unsigned NOT NULL,
  `rate` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]order_taxes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) signed NOT NULL,
  `order_address_id` int unsigned NOT NULL,
  `tax_rate_id` int(11) unsigned NOT NULL,
  `tax_class_id` int(11) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  `rate` decimal(20,4) NOT NULL,
  `priority` int(11) unsigned NOT NULL DEFAULT '0',
  `priority_amount` decimal(20, 4) NOT NULL default '0',
  `line_amount` decimal(20, 4) NOT NULL default '0',
  PRIMARY KEY (`id`),
  KEY (`order_id`),
  KEY (`order_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]product_tax_pricing` (
  `price_reference` decimal(20, 4) NOT NULL DEFAULT '0',
  `calculated_price` decimal(20, 4) NOT NULL DEFAULT '0',
  `tax_zone_id` int(11) unsigned NOT NULL default '0',
  `tax_class_id` int(11) unsigned NOT NULL default '0',
  UNIQUE KEY (`price_reference`, `tax_zone_id`, `tax_class_id`),
  KEY (`tax_zone_id`),
  KEY (`tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]order_addresses` (
	`id` int unsigned not null auto_increment,
	`order_id` int unsigned not null,
	`first_name` varchar(255) not null default '',
	`last_name` varchar(255) not null default '',
	`company` varchar(100) not null default '',
	`address_1` varchar(255) not null default '',
	`address_2` varchar(255) not null default '',
	`city` varchar(50) not null default '',
	`zip` varchar(20) not null default '',
	`country` varchar(50) not null default '',
	`country_iso2` varchar(2) not null default '',
	`country_id` int unsigned not null default '0',
	`state` varchar(100) not null default '',
	`state_id` int unsigned not null default '0',
	`email` varchar(250) not null default '',
	`phone` varchar(250) not null default '',
	`form_session_id` int unsigned NOT NULL default '0',
	`total_items` int unsigned NOT NULL default '0',
	PRIMARY KEY(id),
	KEY (`order_id`),
	KEY (`form_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]order_shipping` (
	`id` int unsigned not null auto_increment,
	`order_address_id` int unsigned not null,
	`order_id` int unsigned not null,
	`base_cost` decimal(20, 4) not null default '0',
	`cost_ex_tax` decimal(20, 4) not null default '0',
	`cost_inc_tax` decimal(20, 4) not null default '0',
	`tax` decimal(20, 4) not null default '0',
	`method` varchar(250) not null default '',
	`module` varchar(100) not null default '',
	`tax_class_id` int unsigned not null default '0',
	`base_handling_cost` decimal(20,4) NOT NULL default '0',
	`handling_cost_ex_tax` decimal(20,4) NOT NULL default '0',
	`handling_cost_inc_tax` decimal(20,4) NOT NULL default '0',
	`handling_cost_tax` decimal(20,4) NOT NULL default '0',
	`handling_cost_tax_class_id` decimal(20,4) NOT NULL default '0',
	`shipping_zone_id` int unsigned not null default '0',
	`shipping_zone_name` varchar(250) not null default '',
	`total_shipped` int unsigned not null default '0',
	PRIMARY KEY(`id`),
	KEY (`order_id`),
	KEY (`order_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]coupon_locations` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`coupon_id` INT(11) DEFAULT NULL,
	`selected_type` VARCHAR(10) DEFAULT NULL,
	`value_id` INT(10) DEFAULT NULL,
	`value` VARCHAR(100) DEFAULT NULL,
	`country_id` INT(11) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]coupon_shipping_methods` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`coupon_id` INT(11) DEFAULT NULL,
	`module_id` VARCHAR(100) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `[|PREFIX|]coupon_usages` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`coupon_id` INT(11) NOT NULL,
	`customer` varchar(250) NOT NULL,
	`numuses` int(11) NOT NULL default '0',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `[|PREFIX|]google_ps_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `[|PREFIX|]google_ps_categories` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`google_ps_category_id` INT(11) UNSIGNED NOT NULL,
	`parent_id` INT(11) UNSIGNED NULL DEFAULT NULL,
	`name` VARCHAR(255) NULL DEFAULT NULL,
	`path` VARCHAR(255) NULL DEFAULT NULL,
	`num_children` INT(11) NULL DEFAULT '0',
	`flag` TINYINT(1) NOT NULL default '1',
	PRIMARY KEY (`id`),
	INDEX `google_ps_category_id_flag` (`google_ps_category_id`, `flag`),
	INDEX `parent_id_flag` (`parent_id`, `flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- -----------------------------------------------------
-- Data for `[|PREFIX|]google_ps_categories`
-- -----------------------------------------------------
INSERT INTO `[|PREFIX|]google_ps_categories` (`id`, `google_ps_category_id`, `parent_id`, `name`, `path`, `num_children`, `flag`) VALUES
(1, 1, 0, 'Animals', '', 2, 1),
(2, 2, 1, 'Live Animals', 'Animals', 0, 1),
(3, 3, 1, 'Pet Supplies', 'Animals', 16, 1),
(4, 4, 3, 'Bird Supplies', 'Animals > Pet Supplies', 5, 1),
(5, 5, 4, 'Bird Cages & Stands', 'Animals > Pet Supplies > Bird Supplies', 0, 1),
(6, 6, 4, 'Bird Food', 'Animals > Pet Supplies > Bird Supplies', 0, 1),
(7, 7, 4, 'Bird Ladders & Perches', 'Animals > Pet Supplies > Bird Supplies', 0, 1),
(8, 8, 4, 'Bird Toys', 'Animals > Pet Supplies > Bird Supplies', 0, 1),
(9, 9, 4, 'Bird Treats', 'Animals > Pet Supplies > Bird Supplies', 0, 1),
(10, 10, 3, 'Cat Supplies', 'Animals > Pet Supplies', 14, 1),
(11, 11, 10, 'Cat Apparel', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(12, 12, 10, 'Cat Beds', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(13, 13, 10, 'Cat Bowls, Feeders & Waterers', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(14, 14, 10, 'Cat Carriers & Crates', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(15, 15, 10, 'Cat Collars & Harnesses', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(16, 16, 10, 'Cat Flea & Tick Control', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(17, 17, 10, 'Cat Food', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(18, 18, 10, 'Cat Furniture', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(19, 19, 10, 'Cat Grooming', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(20, 20, 10, 'Cat Leashes', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(21, 21, 10, 'Cat Litter', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(22, 22, 10, 'Cat Litter Boxes', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(23, 23, 10, 'Cat Toys', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(24, 24, 10, 'Cat Treats', 'Animals > Pet Supplies > Cat Supplies', 0, 1),
(25, 25, 3, 'Dog Supplies', 'Animals > Pet Supplies', 12, 1),
(26, 26, 25, 'Dog Apparel', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(27, 27, 25, 'Dog Beds', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(28, 28, 25, 'Dog Bowls, Feeders & Waterers', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(29, 29, 25, 'Dog Carriers & Crates', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(30, 30, 25, 'Dog Collars & Harnesses', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(31, 31, 25, 'Dog Flea & Tick Control', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(32, 32, 25, 'Dog Food', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(33, 33, 25, 'Dog Grooming', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(34, 34, 25, 'Dog Houses', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(35, 35, 25, 'Dog Leashes', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(36, 36, 25, 'Dog Toys', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(37, 37, 25, 'Dog Treats', 'Animals > Pet Supplies > Dog Supplies', 0, 1),
(38, 38, 3, 'Fish Supplies', 'Animals > Pet Supplies', 11, 1),
(39, 39, 38, 'Aquarium Air Pumps', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(40, 40, 38, 'Aquarium Decor', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(41, 41, 38, 'Aquarium Filters', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(42, 42, 38, 'Aquarium Gravel & Substrates', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(43, 43, 38, 'Aquarium Heating', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(44, 44, 38, 'Aquarium Lighting', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(45, 45, 38, 'Aquarium Stands', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(46, 46, 38, 'Aquarium Water Pumps', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(47, 47, 38, 'Aquarium Water Treatments', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(48, 48, 38, 'Aquariums', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(49, 49, 38, 'Fish Food', 'Animals > Pet Supplies > Fish Supplies', 0, 1),
(50, 50, 3, 'Pet Bells & Charms', 'Animals > Pet Supplies', 0, 1),
(51, 51, 3, 'Pet Food Containers', 'Animals > Pet Supplies', 0, 1),
(52, 52, 3, 'Pet Food Scoops', 'Animals > Pet Supplies', 0, 1),
(53, 53, 3, 'Pet ID Tags', 'Animals > Pet Supplies', 0, 1),
(54, 54, 3, 'Pet Medical Collars', 'Animals > Pet Supplies', 0, 1),
(55, 55, 3, 'Pet Medicine', 'Animals > Pet Supplies', 0, 1),
(56, 56, 3, 'Pet Muzzles', 'Animals > Pet Supplies', 0, 1),
(57, 57, 3, 'Pet Playpens', 'Animals > Pet Supplies', 0, 1),
(58, 58, 3, 'Pet Scales', 'Animals > Pet Supplies', 0, 1),
(59, 59, 3, 'Pet Vitamins & Supplements', 'Animals > Pet Supplies', 0, 1),
(60, 60, 3, 'Reptile & Amphibian Supplies', 'Animals > Pet Supplies', 5, 1),
(61, 61, 60, 'Reptile & Amphibian Food', 'Animals > Pet Supplies > Reptile & Amphibian Supplies', 0, 1),
(62, 62, 60, 'Reptile & Amphibian Habitat Accessories', 'Animals > Pet Supplies > Reptile & Amphibian Supplies', 0, 1),
(63, 63, 60, 'Reptile & Amphibian Habitat Heating & Lighting', 'Animals > Pet Supplies > Reptile & Amphibian Supplies', 0, 1),
(64, 64, 60, 'Reptile & Amphibian Habitats', 'Animals > Pet Supplies > Reptile & Amphibian Supplies', 0, 1),
(65, 65, 60, 'Reptile & Amphibian Substrates', 'Animals > Pet Supplies > Reptile & Amphibian Supplies', 0, 1),
(66, 66, 3, 'Small Animal Supplies', 'Animals > Pet Supplies', 4, 1),
(67, 67, 66, 'Small Animal Bedding', 'Animals > Pet Supplies > Small Animal Supplies', 0, 1),
(68, 68, 66, 'Small Animal Food', 'Animals > Pet Supplies > Small Animal Supplies', 0, 1),
(69, 69, 66, 'Small Animal Habitat Accessories', 'Animals > Pet Supplies > Small Animal Supplies', 0, 1),
(70, 70, 66, 'Small Animal Habitats & Cages', 'Animals > Pet Supplies > Small Animal Supplies', 0, 1),
(71, 71, 0, 'Apparel & Accessories', '', 10, 1),
(72, 72, 71, 'Clothing', 'Apparel & Accessories', 20, 1),
(73, 73, 72, 'Activewear', 'Apparel & Accessories > Clothing', 25, 1),
(75, 75, 73, 'Active Pants', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(76, 76, 73, 'Active Shirts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(77, 77, 73, 'Active Shorts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(78, 78, 73, 'Active Tanks', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(79, 79, 73, 'Active Undergarments', 'Apparel & Accessories > Clothing > Activewear', 4, 1),
(80, 80, 79, 'Active Underwear', 'Apparel & Accessories > Clothing > Activewear > Active Undergarments', 0, 1),
(81, 81, 79, 'Compression Undergarment Shorts', 'Apparel & Accessories > Clothing > Activewear > Active Undergarments', 0, 1),
(82, 82, 79, 'Jock Straps', 'Apparel & Accessories > Clothing > Activewear > Active Undergarments', 0, 1),
(83, 83, 79, 'Sports Bras', 'Apparel & Accessories > Clothing > Activewear > Active Undergarments', 0, 1),
(84, 84, 73, 'Bicycle Bibs', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(85, 85, 73, 'Bicycle Jerseys', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(86, 86, 73, 'Bicycle Shorts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(87, 87, 73, 'Bicycle Tights', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(88, 88, 73, 'Boxing Shorts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(89, 89, 73, 'Dance Dresses', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(90, 90, 73, 'Dance Skirts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(91, 91, 73, 'Football Pants', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(92, 92, 73, 'Martial Arts Shorts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(93, 93, 73, 'Soccer Socks', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(94, 94, 73, 'Sweatshirts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(96, 96, 72, 'Baby & Toddler Clothing', 'Apparel & Accessories > Clothing', 8, 1),
(98, 98, 72, 'Dresses', 'Apparel & Accessories > Clothing', 3, 1),
(99, 99, 98, 'Day Dresses', 'Apparel & Accessories > Clothing > Dresses', 0, 1),
(100, 100, 98, 'Formal Dresses', 'Apparel & Accessories > Clothing > Dresses', 4, 1),
(103, 103, 100, 'Cocktail Dresses', 'Apparel & Accessories > Clothing > Dresses > Formal Dresses', 0, 1),
(104, 104, 100, 'Gowns', 'Apparel & Accessories > Clothing > Dresses > Formal Dresses', 0, 1),
(105, 105, 98, 'Little Black Dresses', 'Apparel & Accessories > Clothing > Dresses', 0, 1),
(108, 108, 72, 'One-pieces', 'Apparel & Accessories > Clothing', 3, 1),
(109, 109, 108, 'Jumpsuits', 'Apparel & Accessories > Clothing > One-pieces', 0, 1),
(110, 110, 108, 'Rompers', 'Apparel & Accessories > Clothing > One-pieces', 0, 1),
(111, 111, 72, 'Outerwear', 'Apparel & Accessories > Clothing', 8, 1),
(112, 112, 111, 'Coats', 'Apparel & Accessories > Clothing > Outerwear', 0, 1),
(113, 113, 111, 'Jackets', 'Apparel & Accessories > Clothing > Outerwear', 0, 1),
(118, 118, 111, 'Vests', 'Apparel & Accessories > Clothing > Outerwear', 0, 1),
(119, 119, 72, 'Pants', 'Apparel & Accessories > Clothing', 4, 1),
(120, 120, 119, 'Casual Pants', 'Apparel & Accessories > Clothing > Pants', 0, 1),
(121, 121, 119, 'Dress Pants', 'Apparel & Accessories > Clothing > Pants', 0, 1),
(122, 122, 72, 'Shorts', 'Apparel & Accessories > Clothing', 0, 1),
(123, 123, 72, 'Skirts', 'Apparel & Accessories > Clothing', 0, 1),
(124, 124, 72, 'Skorts', 'Apparel & Accessories > Clothing', 0, 1),
(125, 125, 72, 'Sleepwear', 'Apparel & Accessories > Clothing', 2, 1),
(126, 126, 125, 'Pajamas', 'Apparel & Accessories > Clothing > Sleepwear', 0, 1),
(127, 127, 125, 'Robes', 'Apparel & Accessories > Clothing > Sleepwear', 0, 1),
(128, 128, 72, 'Suits', 'Apparel & Accessories > Clothing', 4, 1),
(129, 129, 128, 'Pant Suits', 'Apparel & Accessories > Clothing > Suits', 0, 1),
(130, 130, 128, 'Skirt Suits', 'Apparel & Accessories > Clothing > Suits', 0, 1),
(131, 131, 128, 'Suit Separates', 'Apparel & Accessories > Clothing > Suits', 0, 1),
(132, 132, 128, 'Tuxedos', 'Apparel & Accessories > Clothing > Suits', 0, 1),
(133, 133, 72, 'Swimwear', 'Apparel & Accessories > Clothing', 7, 1),
(134, 134, 133, 'Cover-ups', 'Apparel & Accessories > Clothing > Swimwear', 0, 1),
(135, 135, 133, 'One-Piece Swimsuits', 'Apparel & Accessories > Clothing > Swimwear', 0, 1),
(136, 136, 133, 'Swim Briefs', 'Apparel & Accessories > Clothing > Swimwear', 0, 1),
(137, 137, 133, 'Swim Shorts', 'Apparel & Accessories > Clothing > Swimwear', 0, 1),
(138, 138, 133, 'Swimsuit Bottoms', 'Apparel & Accessories > Clothing > Swimwear', 0, 1),
(139, 139, 133, 'Swimsuit Tops', 'Apparel & Accessories > Clothing > Swimwear', 0, 1),
(140, 140, 133, 'Two-Piece Swimsuits', 'Apparel & Accessories > Clothing > Swimwear', 0, 1),
(141, 141, 72, 'Tops', 'Apparel & Accessories > Clothing', 6, 1),
(142, 142, 141, 'Camis & Tank Tops', 'Apparel & Accessories > Clothing > Tops', 0, 1),
(143, 143, 141, 'Shirts', 'Apparel & Accessories > Clothing > Tops', 0, 1),
(144, 144, 141, 'Strapless Tops', 'Apparel & Accessories > Clothing > Tops', 0, 1),
(145, 145, 141, 'Sweaters', 'Apparel & Accessories > Clothing > Tops', 0, 1),
(146, 146, 141, 'T-Shirts', 'Apparel & Accessories > Clothing > Tops', 0, 1),
(150, 150, 72, 'Underwear & Socks', 'Apparel & Accessories > Clothing', 8, 1),
(151, 151, 150, 'Bras', 'Apparel & Accessories > Clothing > Underwear & Socks', 0, 1),
(152, 152, 150, 'Hosiery', 'Apparel & Accessories > Clothing > Underwear & Socks', 0, 1),
(153, 153, 150, 'Lingerie', 'Apparel & Accessories > Clothing > Underwear & Socks', 0, 1),
(154, 154, 150, 'Lingerie Accessories', 'Apparel & Accessories > Clothing > Underwear & Socks', 2, 1),
(155, 155, 154, 'Garter Belts', 'Apparel & Accessories > Clothing > Underwear & Socks > Lingerie Accessories', 0, 1),
(156, 156, 154, 'Garters', 'Apparel & Accessories > Clothing > Underwear & Socks > Lingerie Accessories', 0, 1),
(157, 157, 150, 'Shapewear', 'Apparel & Accessories > Clothing > Underwear & Socks', 0, 1),
(158, 158, 150, 'Socks', 'Apparel & Accessories > Clothing > Underwear & Socks', 0, 1),
(159, 159, 150, 'Underwear', 'Apparel & Accessories > Clothing > Underwear & Socks', 0, 1),
(160, 160, 72, 'Uniforms', 'Apparel & Accessories > Clothing', 3, 1),
(161, 161, 160, 'Professional Uniforms', 'Apparel & Accessories > Clothing > Uniforms', 4, 1),
(162, 162, 161, 'Chef\'s Jackets', 'Apparel & Accessories > Clothing > Uniforms > Professional Uniforms', 0, 1),
(163, 163, 161, 'Security Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Professional Uniforms', 0, 1),
(164, 164, 161, 'White Coats', 'Apparel & Accessories > Clothing > Uniforms > Professional Uniforms', 0, 1),
(165, 165, 160, 'School Uniforms', 'Apparel & Accessories > Clothing > Uniforms', 0, 1),
(166, 166, 160, 'Sports Uniforms', 'Apparel & Accessories > Clothing > Uniforms', 10, 1),
(167, 167, 166, 'Baseball Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(168, 168, 166, 'Basketball Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(169, 169, 166, 'Cheerleading Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(170, 170, 166, 'Cricket Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(171, 171, 166, 'Football Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(172, 172, 166, 'Hockey Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(173, 173, 166, 'Martial Arts Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(174, 174, 166, 'Officiating Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(175, 175, 166, 'Softball Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(176, 176, 166, 'Wrestling Uniforms', 'Apparel & Accessories > Clothing > Uniforms > Sports Uniforms', 0, 1),
(177, 177, 71, 'Clothing Accessories', 'Apparel & Accessories', 24, 1),
(178, 178, 177, 'Aprons', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(179, 179, 177, 'Balaclavas', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(180, 180, 177, 'Belt Buckles', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(181, 181, 177, 'Belts', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(182, 182, 177, 'Folding Fans', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(183, 183, 177, 'Gloves & Mittens', 'Apparel & Accessories > Clothing Accessories', 3, 1),
(184, 184, 183, 'Gloves', 'Apparel & Accessories > Clothing Accessories > Gloves & Mittens', 0, 1),
(185, 185, 183, 'Mittens', 'Apparel & Accessories > Clothing Accessories > Gloves & Mittens', 0, 1),
(186, 186, 183, 'Ski & Snowboard Gloves', 'Apparel & Accessories > Clothing Accessories > Gloves & Mittens', 0, 1),
(187, 187, 177, 'Hair Accessories', 'Apparel & Accessories > Clothing Accessories', 9, 1),
(188, 188, 187, 'Hair Bands', 'Apparel & Accessories > Clothing Accessories > Hair Accessories', 0, 1),
(189, 189, 187, 'Hair Claws', 'Apparel & Accessories > Clothing Accessories > Hair Accessories', 0, 1),
(190, 190, 187, 'Hair Combs', 'Apparel & Accessories > Clothing Accessories > Hair Accessories', 0, 1),
(191, 191, 187, 'Hair Extensions', 'Apparel & Accessories > Clothing Accessories > Hair Accessories', 0, 1),
(193, 193, 187, 'Hair Pins & Clips', 'Apparel & Accessories > Clothing Accessories > Hair Accessories', 0, 1),
(195, 195, 187, 'Ponytail Holders', 'Apparel & Accessories > Clothing Accessories > Hair Accessories', 0, 1),
(196, 196, 177, 'Hats', 'Apparel & Accessories > Clothing Accessories', 7, 1),
(197, 197, 177, 'Headwear & Kerchiefs', 'Apparel & Accessories > Clothing Accessories', 3, 1),
(198, 198, 197, 'Bandanas & Handkerchiefs', 'Apparel & Accessories > Clothing Accessories > Headwear & Kerchiefs', 1, 1),
(199, 199, 198, 'Headties', 'Apparel & Accessories > Clothing Accessories > Headwear & Kerchiefs > Bandanas & Handkerchiefs', 0, 1),
(200, 200, 197, 'Headbands', 'Apparel & Accessories > Clothing Accessories > Headwear & Kerchiefs', 0, 1),
(201, 201, 197, 'Headdresses', 'Apparel & Accessories > Clothing Accessories > Headwear & Kerchiefs', 0, 1),
(203, 203, 177, 'Neckties', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(204, 204, 177, 'Pinback Buttons', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(205, 205, 177, 'Pocket Squares', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(206, 206, 177, 'Scarves & Shawls', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(207, 207, 177, 'Sunglasses', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(208, 208, 177, 'Suspenders', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(209, 209, 177, 'Tie Clips', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(210, 210, 177, 'Traditional Clothing Accessories', 'Apparel & Accessories > Clothing Accessories', 1, 1),
(211, 211, 210, 'Asian Traditional Clothing Accessories', 'Apparel & Accessories > Clothing Accessories > Traditional Clothing Accessories', 0, 1),
(212, 212, 177, 'Veils', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(213, 213, 177, 'Wallets & Money Clips', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(214, 214, 177, 'Wristbands', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(215, 215, 71, 'Costumes & Accessories', 'Apparel & Accessories', 5, 1),
(216, 216, 215, 'Costume Accessories', 'Apparel & Accessories > Costumes & Accessories', 1, 1),
(217, 217, 215, 'Costume Shoes', 'Apparel & Accessories > Costumes & Accessories', 0, 1),
(218, 218, 215, 'Costumes', 'Apparel & Accessories > Costumes & Accessories', 0, 1),
(219, 219, 215, 'Masks', 'Apparel & Accessories > Costumes & Accessories', 0, 1),
(220, 220, 215, 'Wigs', 'Apparel & Accessories > Costumes & Accessories', 0, 1),
(221, 221, 71, 'Jewelry', 'Apparel & Accessories', 11, 1),
(222, 222, 221, 'Anklets', 'Apparel & Accessories > Jewelry', 0, 1),
(223, 223, 221, 'Body Jewelry', 'Apparel & Accessories > Jewelry', 0, 1),
(224, 224, 221, 'Bracelets', 'Apparel & Accessories > Jewelry', 0, 1),
(225, 225, 221, 'Brooches & Lapels', 'Apparel & Accessories > Jewelry', 0, 1),
(226, 226, 221, 'Charms & Pendants', 'Apparel & Accessories > Jewelry', 0, 1),
(227, 227, 221, 'Cufflinks', 'Apparel & Accessories > Jewelry', 0, 1),
(228, 228, 221, 'Earrings', 'Apparel & Accessories > Jewelry', 0, 1),
(229, 229, 221, 'Necklaces', 'Apparel & Accessories > Jewelry', 0, 1),
(230, 230, 221, 'Precious Stones', 'Apparel & Accessories > Jewelry', 1, 1),
(231, 231, 230, 'Diamonds', 'Apparel & Accessories > Jewelry > Precious Stones', 0, 1),
(232, 232, 221, 'Rings', 'Apparel & Accessories > Jewelry', 0, 1),
(233, 233, 71, 'Jewelry Accessories', 'Apparel & Accessories', 2, 1),
(234, 234, 233, 'Jewelry Boxes', 'Apparel & Accessories > Jewelry Accessories', 0, 1),
(235, 235, 233, 'Jewelry Cleaners', 'Apparel & Accessories > Jewelry Accessories', 0, 1),
(236, 236, 71, 'Shoe Accessories', 'Apparel & Accessories', 3, 1),
(237, 237, 236, 'Shoe Covers', 'Apparel & Accessories > Shoe Accessories', 0, 1),
(238, 238, 236, 'Shoelaces', 'Apparel & Accessories > Shoe Accessories', 0, 1),
(239, 239, 236, 'Spurs', 'Apparel & Accessories > Shoe Accessories', 0, 1),
(240, 240, 71, 'Shoes', 'Apparel & Accessories', 12, 1),
(241, 241, 240, 'Athletic Shoes', 'Apparel & Accessories > Shoes', 19, 1),
(242, 242, 241, 'Ballet & Dance Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(243, 243, 241, 'Basketball Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(244, 244, 241, 'Bicycle Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(245, 245, 241, 'Bowling Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(246, 246, 241, 'Cheerleading Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(247, 247, 241, 'Cross Training Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(248, 248, 241, 'Golf Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(249, 249, 241, 'Rugby Boots', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(250, 250, 241, 'Running Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(251, 251, 241, 'Skateboarding Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(252, 252, 241, 'Tennis Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(253, 253, 241, 'Volleyball Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(254, 254, 241, 'Walking Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(255, 255, 241, 'Weightlifting Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(256, 256, 241, 'Wrestling Shoes', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(257, 257, 240, 'Boots', 'Apparel & Accessories > Shoes', 10, 1),
(259, 259, 257, 'Motorcycle Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(260, 260, 257, 'Rain Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(261, 261, 257, 'Riding Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(262, 262, 257, 'Shearling & Fur Trimmed Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(263, 263, 257, 'Snow Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(264, 264, 257, 'Tall Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(265, 265, 257, 'Western Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(266, 266, 257, 'Work & Safety Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(267, 267, 240, 'Flats', 'Apparel & Accessories > Shoes', 0, 1),
(268, 268, 240, 'Loafers', 'Apparel & Accessories > Shoes', 0, 1),
(269, 269, 240, 'Outdoor Shoes', 'Apparel & Accessories > Shoes', 6, 1),
(270, 270, 269, 'Climbing Shoes', 'Apparel & Accessories > Shoes > Outdoor Shoes', 0, 1),
(271, 271, 269, 'Fishing & Hunting Shoes', 'Apparel & Accessories > Shoes > Outdoor Shoes', 0, 1),
(272, 272, 269, 'Gardening Shoes', 'Apparel & Accessories > Shoes > Outdoor Shoes', 0, 1),
(273, 273, 269, 'Hiking Shoes', 'Apparel & Accessories > Shoes > Outdoor Shoes', 0, 1),
(274, 274, 269, 'Performance Boating Shoes', 'Apparel & Accessories > Shoes > Outdoor Shoes', 0, 1),
(275, 275, 269, 'Water Shoes', 'Apparel & Accessories > Shoes > Outdoor Shoes', 0, 1),
(276, 276, 240, 'Pumps', 'Apparel & Accessories > Shoes', 12, 1),
(277, 277, 276, 'Anklestrap & Anklewrap Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(278, 278, 276, 'Basic Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(279, 279, 276, 'D\'orsay & Two-Piece Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(282, 282, 276, 'Open Toe Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(284, 284, 276, 'Slingback Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(285, 285, 276, 'Spectator Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(286, 286, 276, 'T-Strap Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(287, 287, 240, 'Sandals', 'Apparel & Accessories > Shoes', 8, 1),
(288, 288, 287, 'Anklestrap & Anklewrap Sandals', 'Apparel & Accessories > Shoes > Sandals', 0, 1),
(289, 289, 287, 'Espadrilles', 'Apparel & Accessories > Shoes > Sandals', 0, 1),
(290, 290, 287, 'Fisherman Sandals', 'Apparel & Accessories > Shoes > Sandals', 0, 1),
(292, 292, 287, 'Slide Sandals', 'Apparel & Accessories > Shoes > Sandals', 0, 1),
(293, 293, 287, 'Slingback Sandals', 'Apparel & Accessories > Shoes > Sandals', 0, 1),
(294, 294, 287, 'T-Strap Sandals', 'Apparel & Accessories > Shoes > Sandals', 0, 1),
(295, 295, 287, 'Thongs & Flip-Flops', 'Apparel & Accessories > Shoes > Sandals', 0, 1),
(296, 296, 240, 'Slippers', 'Apparel & Accessories > Shoes', 0, 1),
(297, 297, 240, 'Sneakers', 'Apparel & Accessories > Shoes', 0, 1),
(298, 298, 71, 'Watch Accessories', 'Apparel & Accessories', 2, 1),
(299, 299, 298, 'Watch Bands', 'Apparel & Accessories > Watch Accessories', 0, 1),
(300, 300, 298, 'Watch Repair Kits', 'Apparel & Accessories > Watch Accessories', 0, 1),
(301, 301, 71, 'Watches', 'Apparel & Accessories', 0, 1),
(302, 302, 0, 'Arts & Entertainment', '', 9, 1),
(303, 303, 302, 'Artwork', 'Arts & Entertainment', 7, 1),
(304, 304, 303, 'Drawings', 'Arts & Entertainment > Artwork', 0, 1),
(305, 305, 303, 'Figurines, Sculptures & Statues', 'Arts & Entertainment > Artwork', 0, 1),
(306, 306, 303, 'Paintings', 'Arts & Entertainment > Artwork', 0, 1),
(307, 307, 303, 'Photographs', 'Arts & Entertainment > Artwork', 1, 1),
(308, 308, 307, 'Stock Photographs', 'Arts & Entertainment > Artwork > Photographs', 0, 1),
(309, 309, 303, 'Posters & Reproductions', 'Arts & Entertainment > Artwork', 0, 1),
(310, 310, 303, 'Prints', 'Arts & Entertainment > Artwork', 0, 1),
(311, 311, 303, 'Weatherprints & Outdoor Art', 'Arts & Entertainment > Artwork', 0, 1),
(312, 312, 302, 'Collectibles', 'Arts & Entertainment', 8, 1),
(313, 313, 312, 'Autographs', 'Arts & Entertainment > Collectibles', 0, 1),
(314, 314, 312, 'Coins & Currency', 'Arts & Entertainment > Collectibles', 0, 1),
(315, 315, 312, 'Collectible Weapons', 'Arts & Entertainment > Collectibles', 3, 1),
(316, 316, 315, 'Collectible Knives', 'Arts & Entertainment > Collectibles > Collectible Weapons', 0, 1),
(317, 317, 315, 'Collectible Swords', 'Arts & Entertainment > Collectibles > Collectible Weapons', 0, 1),
(318, 318, 315, 'Sword Stands & Displays', 'Arts & Entertainment > Collectibles > Collectible Weapons', 0, 1),
(319, 319, 312, 'Postage Stamps', 'Arts & Entertainment > Collectibles', 0, 1),
(320, 320, 312, 'Rocks & Fossils', 'Arts & Entertainment > Collectibles', 0, 1),
(321, 321, 312, 'Seal Stamps', 'Arts & Entertainment > Collectibles', 0, 1),
(322, 322, 312, 'Sports Collectibles', 'Arts & Entertainment > Collectibles', 3, 1),
(323, 323, 322, 'Autographed Sports Paraphernalia', 'Arts & Entertainment > Collectibles > Sports Collectibles', 6, 1),
(324, 324, 323, 'Auto Racing Autographed Paraphernalia', 'Arts & Entertainment > Collectibles > Sports Collectibles > Autographed Sports Paraphernalia', 0, 1),
(325, 325, 323, 'Baseball & Softball Autographed Paraphernalia', 'Arts & Entertainment > Collectibles > Sports Collectibles > Autographed Sports Paraphernalia', 0, 1),
(326, 326, 323, 'Basketball Autographed Paraphernalia', 'Arts & Entertainment > Collectibles > Sports Collectibles > Autographed Sports Paraphernalia', 0, 1),
(327, 327, 323, 'Football Autographed Paraphernalia', 'Arts & Entertainment > Collectibles > Sports Collectibles > Autographed Sports Paraphernalia', 0, 1),
(328, 328, 323, 'Hockey Autographed Paraphernalia', 'Arts & Entertainment > Collectibles > Sports Collectibles > Autographed Sports Paraphernalia', 0, 1),
(329, 329, 323, 'Soccer Autographed Paraphernalia', 'Arts & Entertainment > Collectibles > Sports Collectibles > Autographed Sports Paraphernalia', 0, 1),
(330, 330, 322, 'Sports Fan Accessories', 'Arts & Entertainment > Collectibles > Sports Collectibles', 6, 1),
(331, 331, 330, 'Auto Racing Fan Accessories', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Fan Accessories', 0, 1),
(332, 332, 330, 'Baseball & Softball Fan Accessories', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Fan Accessories', 0, 1),
(333, 333, 330, 'Basketball Fan Accessories', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Fan Accessories', 0, 1),
(334, 334, 330, 'Football Fan Accessories', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Fan Accessories', 0, 1),
(335, 335, 330, 'Hockey Fan Accessories', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Fan Accessories', 0, 1),
(336, 336, 330, 'Soccer Fan Accessories', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Fan Accessories', 0, 1),
(337, 337, 322, 'Sports Trading Cards', 'Arts & Entertainment > Collectibles > Sports Collectibles', 6, 1),
(338, 338, 337, 'Auto Racing Trading Cards', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Trading Cards', 0, 1),
(339, 339, 337, 'Baseball Trading Cards', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Trading Cards', 0, 1),
(340, 340, 337, 'Basketball Trading Cards', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Trading Cards', 0, 1),
(341, 341, 337, 'Football Trading Cards', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Trading Cards', 0, 1),
(342, 342, 337, 'Hockey Trading Cards', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Trading Cards', 0, 1),
(343, 343, 337, 'Soccer Trading Cards', 'Arts & Entertainment > Collectibles > Sports Collectibles > Sports Trading Cards', 0, 1),
(344, 344, 312, 'Vintage Advertisements', 'Arts & Entertainment > Collectibles', 0, 1),
(345, 345, 302, 'Crafts & Hobbies', 'Arts & Entertainment', 25, 1),
(346, 346, 345, 'Blank Books & Journals', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(347, 347, 345, 'Candle & Soap Making', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(348, 348, 345, 'Craft Pipe Cleaners', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(349, 349, 345, 'Decorative Stickers', 'Arts & Entertainment > Crafts & Hobbies', 1, 1),
(350, 350, 349, 'Wall Stickers', 'Arts & Entertainment > Crafts & Hobbies > Decorative Stickers', 0, 1),
(351, 351, 345, 'Drawing & Painting', 'Arts & Entertainment > Crafts & Hobbies', 8, 1),
(352, 352, 351, 'Art Brushes', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 0, 1),
(353, 353, 351, 'Art Easels', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 0, 1),
(354, 354, 351, 'Art Paper', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 5, 1),
(355, 355, 354, 'Construction Paper', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Art Paper', 0, 1),
(356, 356, 354, 'Origami Paper', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Art Paper', 0, 1),
(357, 357, 354, 'Sketch Pads', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Art Paper', 0, 1),
(358, 358, 354, 'Vellum', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Art Paper', 0, 1),
(359, 359, 354, 'Watercolor Paper', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Art Paper', 0, 1),
(360, 360, 351, 'Canvas & Boards', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 0, 1),
(361, 361, 351, 'Drafting', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 1, 1),
(362, 362, 361, 'Drafting Compasses', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Drafting', 0, 1),
(363, 363, 351, 'Drawing', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 4, 1),
(364, 364, 363, 'Art Charcoals', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Drawing', 0, 1),
(365, 365, 363, 'Art Pastels', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Drawing', 0, 1),
(366, 366, 363, 'Art Pencils', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Drawing', 0, 1),
(367, 367, 363, 'Art Pens', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Drawing', 0, 1),
(368, 368, 351, 'Painting', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 3, 1),
(369, 369, 368, 'Art Paint', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Painting', 0, 1),
(370, 370, 368, 'Palette Knives', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Painting', 0, 1),
(371, 371, 368, 'Palettes', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting > Painting', 0, 1),
(372, 372, 351, 'Stencils & Dies', 'Arts & Entertainment > Crafts & Hobbies > Drawing & Painting', 0, 1),
(373, 373, 345, 'Drawing & Painting Kits', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(374, 374, 345, 'Flower Arranging', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(375, 375, 345, 'Glass Crafts', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(376, 376, 345, 'Glitter', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(377, 377, 345, 'Homebrewing', 'Arts & Entertainment > Crafts & Hobbies', 2, 1),
(378, 378, 377, 'Beer Brewing', 'Arts & Entertainment > Crafts & Hobbies > Homebrewing', 0, 1),
(379, 379, 377, 'Wine Making', 'Arts & Entertainment > Crafts & Hobbies > Homebrewing', 0, 1),
(380, 380, 345, 'Jewelry Making', 'Arts & Entertainment > Crafts & Hobbies', 1, 1),
(381, 381, 380, 'Beads', 'Arts & Entertainment > Crafts & Hobbies > Jewelry Making', 0, 1),
(382, 382, 345, 'Juggling', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(383, 383, 345, 'Leather Crafts', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(384, 384, 345, 'Magic & Novelties', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(385, 385, 345, 'Magnets', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(386, 386, 345, 'Model Train Accessories', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(387, 387, 345, 'Model Trains & Train Sets', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(388, 388, 345, 'Mosaics', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(389, 389, 345, 'Pottery & Sculpting', 'Arts & Entertainment > Crafts & Hobbies', 1, 1),
(390, 390, 389, 'Modeling Clay & Dough', 'Arts & Entertainment > Crafts & Hobbies > Pottery & Sculpting', 0, 1),
(391, 391, 345, 'Printmaking', 'Arts & Entertainment > Crafts & Hobbies', 1, 1),
(392, 392, 391, 'Screen Printing', 'Arts & Entertainment > Crafts & Hobbies > Printmaking', 0, 1),
(393, 393, 345, 'Scale Models', 'Arts & Entertainment > Crafts & Hobbies', 2, 1),
(394, 394, 393, 'Model Kits', 'Arts & Entertainment > Crafts & Hobbies > Scale Models', 0, 1),
(395, 395, 393, 'Model Rocketry', 'Arts & Entertainment > Crafts & Hobbies > Scale Models', 0, 1),
(396, 396, 345, 'Scrapbooking', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(397, 397, 345, 'Sequins', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(398, 398, 345, 'Sewing & Needlecrafts', 'Arts & Entertainment > Crafts & Hobbies', 13, 1),
(399, 399, 398, 'Crochet', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(400, 400, 398, 'Cross Stitch', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(401, 401, 398, 'Fabric', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(402, 402, 398, 'Fabric Marking Tools', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(403, 403, 398, 'Knitting', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(404, 404, 398, 'Quilting', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(405, 405, 398, 'Sewing Buttons', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(406, 406, 398, 'Sewing Labels', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(407, 407, 398, 'Sewing Patterns', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(408, 408, 398, 'Thread', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(409, 409, 398, 'Weaving', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 1, 1),
(410, 410, 409, 'Weaving Looms', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts > Weaving', 0, 1),
(411, 411, 398, 'Yarns', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(412, 412, 398, 'Zippers', 'Arts & Entertainment > Crafts & Hobbies > Sewing & Needlecrafts', 0, 1),
(413, 413, 345, 'Woodworking', 'Arts & Entertainment > Crafts & Hobbies', 0, 1),
(414, 414, 302, 'Gift Giving', 'Arts & Entertainment', 4, 1),
(415, 415, 414, 'Fresh Cut Flowers', 'Arts & Entertainment > Gift Giving', 0, 1),
(416, 416, 414, 'Gift Certificates', 'Arts & Entertainment > Gift Giving', 0, 1),
(417, 417, 414, 'Gift Wrapping', 'Arts & Entertainment > Gift Giving', 3, 1),
(418, 418, 417, 'Bows & Ribbons', 'Arts & Entertainment > Gift Giving > Gift Wrapping', 0, 1),
(419, 419, 417, 'Gift Boxes and Tins', 'Arts & Entertainment > Gift Giving > Gift Wrapping', 0, 1),
(420, 420, 417, 'Wrapping Paper', 'Arts & Entertainment > Gift Giving > Gift Wrapping', 0, 1),
(421, 421, 414, 'Greeting Cards', 'Arts & Entertainment > Gift Giving', 0, 1),
(422, 422, 302, 'Musical Instrument Accessories', 'Arts & Entertainment', 11, 1),
(423, 423, 422, 'Brass Instrument Accessories', 'Arts & Entertainment > Musical Instrument Accessories', 7, 1),
(424, 424, 423, 'Brass Instrument Care & Cleaning', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories', 6, 1),
(425, 425, 424, 'Brass Instrument Brushes, Snakes & Cleaning Rods', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Brass Instrument Care & Cleaning', 0, 1),
(426, 426, 424, 'Brass Instrument Care Kits', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Brass Instrument Care & Cleaning', 0, 1),
(427, 427, 424, 'Brass Instrument Cleaners & Sanitizers', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Brass Instrument Care & Cleaning', 0, 1),
(428, 428, 424, 'Brass Instrument Guards', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Brass Instrument Care & Cleaning', 0, 1),
(429, 429, 424, 'Brass Instrument Lubricants', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Brass Instrument Care & Cleaning', 0, 1),
(430, 430, 424, 'Brass Instrument Polishing Cloths', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Brass Instrument Care & Cleaning', 0, 1),
(431, 431, 423, 'Brass Instrument Replacement Parts', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories', 0, 1),
(432, 432, 423, 'Euphonium Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories', 4, 1),
(433, 433, 432, 'Euphonium Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Euphonium Accessories', 0, 1),
(434, 434, 432, 'Euphonium Mouthpieces', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Euphonium Accessories', 0, 1),
(435, 435, 432, 'Euphonium Mutes', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Euphonium Accessories', 0, 1),
(436, 436, 432, 'Euphonium Stands', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Euphonium Accessories', 0, 1),
(437, 437, 423, 'French Horn Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories', 4, 1),
(438, 438, 437, 'French Horn Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > French Horn Accessories', 0, 1),
(439, 439, 437, 'French Horn Mouthpieces', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > French Horn Accessories', 0, 1),
(440, 440, 437, 'French Horn Mutes', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > French Horn Accessories', 0, 1),
(441, 441, 437, 'French Horn Stands', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > French Horn Accessories', 0, 1),
(442, 442, 423, 'Trombone Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories', 5, 1),
(443, 443, 442, 'Trombone Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trombone Accessories', 0, 1),
(444, 444, 442, 'Trombone Lyres', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trombone Accessories', 0, 1),
(445, 445, 442, 'Trombone Mouthpieces', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trombone Accessories', 0, 1),
(446, 446, 442, 'Trombone Mutes', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trombone Accessories', 0, 1),
(447, 447, 442, 'Trombone Stands', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trombone Accessories', 0, 1),
(448, 448, 423, 'Trumpet & Cornet Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories', 5, 1),
(449, 449, 448, 'Trumpet & Cornet Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trumpet & Cornet Accessories', 0, 1),
(450, 450, 448, 'Trumpet & Cornet Lyres', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trumpet & Cornet Accessories', 0, 1),
(451, 451, 448, 'Trumpet & Cornet Mouthpieces', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trumpet & Cornet Accessories', 0, 1),
(452, 452, 448, 'Trumpet & Cornet Mutes', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trumpet & Cornet Accessories', 0, 1),
(453, 453, 448, 'Trumpet & Cornet Stands', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Trumpet & Cornet Accessories', 0, 1),
(454, 454, 423, 'Tuba Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories', 4, 1),
(455, 455, 454, 'Tuba Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Tuba Accessories', 0, 1),
(456, 456, 454, 'Tuba Mouthpieces', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Tuba Accessories', 0, 1),
(457, 457, 454, 'Tuba Mutes', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Tuba Accessories', 0, 1),
(458, 458, 454, 'Tuba Stands', 'Arts & Entertainment > Musical Instrument Accessories > Brass Instrument Accessories > Tuba Accessories', 0, 1),
(459, 459, 422, 'Electronic Tuners', 'Arts & Entertainment > Musical Instrument Accessories', 0, 1),
(460, 460, 422, 'Music Stands', 'Arts & Entertainment > Musical Instrument Accessories', 0, 1),
(461, 461, 422, 'Musical Instrument Amplifiers', 'Arts & Entertainment > Musical Instrument Accessories', 0, 1),
(462, 462, 422, 'Musical Instrument Cases & Racks', 'Arts & Entertainment > Musical Instrument Accessories', 0, 1),
(463, 463, 422, 'Musical Instrument Stands', 'Arts & Entertainment > Musical Instrument Accessories', 0, 1),
(464, 464, 422, 'Musical Keyboard Accessories', 'Arts & Entertainment > Musical Instrument Accessories', 2, 1),
(465, 465, 464, 'Musical Keyboard Stands', 'Arts & Entertainment > Musical Instrument Accessories > Musical Keyboard Accessories', 0, 1),
(466, 466, 464, 'Sustain Pedals', 'Arts & Entertainment > Musical Instrument Accessories > Musical Keyboard Accessories', 0, 1),
(467, 467, 422, 'Percussion Accessories', 'Arts & Entertainment > Musical Instrument Accessories', 2, 1),
(468, 468, 467, 'Drumming Thrones', 'Arts & Entertainment > Musical Instrument Accessories > Percussion Accessories', 0, 1),
(469, 469, 467, 'Percussion Mallets', 'Arts & Entertainment > Musical Instrument Accessories > Percussion Accessories', 1, 1),
(470, 470, 469, 'Drum Sticks', 'Arts & Entertainment > Musical Instrument Accessories > Percussion Accessories > Percussion Mallets', 0, 1),
(471, 471, 422, 'Piano Accessories', 'Arts & Entertainment > Musical Instrument Accessories', 1, 1),
(472, 472, 471, 'Piano Benches', 'Arts & Entertainment > Musical Instrument Accessories > Piano Accessories', 0, 1),
(473, 473, 422, 'String Instrument Accessories', 'Arts & Entertainment > Musical Instrument Accessories', 7, 1),
(474, 474, 473, 'Cello Accessories', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories', 4, 1),
(475, 475, 474, 'Cello Bows', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Cello Accessories', 0, 1),
(476, 476, 474, 'Cello Cases', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Cello Accessories', 0, 1),
(477, 477, 474, 'Cello Mutes', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Cello Accessories', 0, 1),
(478, 478, 474, 'Cello Strings', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Cello Accessories', 0, 1),
(479, 479, 473, 'Guitar Accessories', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories', 11, 1),
(480, 480, 479, 'Acoustic Guitar Pickups', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(481, 481, 479, 'Capos', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(482, 482, 479, 'Electric Guitar Pickups', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(483, 483, 479, 'Guitar Bridge Pins', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(484, 484, 479, 'Guitar Cases & Gig Bags', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(485, 485, 479, 'Guitar Humidifiers', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(486, 486, 479, 'Guitar Picks', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(487, 487, 479, 'Guitar Slides', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(488, 488, 479, 'Guitar Stands', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(489, 489, 479, 'Guitar Strings', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(490, 490, 479, 'Guitar Tuning Machines', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Guitar Accessories', 0, 1),
(491, 491, 473, 'Harp Accessories', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories', 2, 1),
(492, 492, 491, 'Harp Cases', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Harp Accessories', 0, 1),
(493, 493, 491, 'Harp Strings', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Harp Accessories', 0, 1),
(494, 494, 473, 'String Instrument Care & Cleaning', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories', 3, 1),
(495, 495, 494, 'Bow Rosin', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > String Instrument Care & Cleaning', 0, 1),
(496, 496, 494, 'String Instrument Cleaning Cloths', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > String Instrument Care & Cleaning', 0, 1),
(497, 497, 494, 'String Instrument Polish', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > String Instrument Care & Cleaning', 0, 1),
(498, 498, 473, 'Upright Bass Accessories', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories', 4, 1),
(499, 499, 498, 'Upright Bass Bows', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Upright Bass Accessories', 0, 1),
(500, 500, 498, 'Upright Bass Cases', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Upright Bass Accessories', 0, 1),
(501, 501, 498, 'Upright Bass Mutes', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Upright Bass Accessories', 0, 1),
(502, 502, 498, 'Upright Bass Strings', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Upright Bass Accessories', 0, 1),
(503, 503, 473, 'Viola Accessories', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories', 4, 1),
(504, 504, 503, 'Viola Bows', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Viola Accessories', 0, 1),
(505, 505, 503, 'Viola Cases', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Viola Accessories', 0, 1),
(506, 506, 503, 'Viola Mutes', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Viola Accessories', 0, 1),
(507, 507, 503, 'Viola Strings', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Viola Accessories', 0, 1),
(508, 508, 473, 'Violin Accessories', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories', 8, 1),
(509, 509, 508, 'Violin & Viola Chinrests', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(510, 510, 508, 'Violin & Viola Shoulder Rests', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(511, 511, 508, 'Violin Bows', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(512, 512, 508, 'Violin Bridges', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(513, 513, 508, 'Violin Cases', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(514, 514, 508, 'Violin Mutes', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(515, 515, 508, 'Violin Strings', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(516, 516, 508, 'Violin Tuning Pegs', 'Arts & Entertainment > Musical Instrument Accessories > String Instrument Accessories > Violin Accessories', 0, 1),
(517, 517, 422, 'Woodwind Instrument Accessories', 'Arts & Entertainment > Musical Instrument Accessories', 10, 1),
(518, 518, 517, 'Bassoon Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 6, 1),
(519, 519, 518, 'Bassoon Care & Cleaning', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories', 1, 1),
(520, 520, 519, 'Bassoon Swabs', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories > Bassoon Care & Cleaning', 0, 1),
(521, 521, 518, 'Bassoon Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories', 0, 1),
(522, 522, 518, 'Bassoon Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories', 2, 1),
(523, 523, 522, 'Bassoon Bocals', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories > Bassoon Parts', 0, 1),
(524, 524, 522, 'Bassoon Small Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories > Bassoon Parts', 0, 1),
(525, 525, 518, 'Bassoon Reeds', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories', 0, 1),
(526, 526, 518, 'Bassoon Stands', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories', 0, 1),
(527, 527, 518, 'Bassoon Straps & Supports', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Bassoon Accessories', 0, 1),
(528, 528, 517, 'Clarinet Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 8, 1),
(529, 529, 528, 'Clarinet Care & Cleaning', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 3, 1),
(530, 530, 529, 'Clarinet Care Kits', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories > Clarinet Care & Cleaning', 0, 1),
(531, 531, 529, 'Clarinet Pad Savers', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories > Clarinet Care & Cleaning', 0, 1),
(532, 532, 529, 'Clarinet Swabs', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories > Clarinet Care & Cleaning', 0, 1),
(533, 533, 528, 'Clarinet Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 0, 1),
(534, 534, 528, 'Clarinet Ligatures & Caps', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 0, 1),
(535, 535, 528, 'Clarinet Lyres', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 0, 1),
(536, 536, 528, 'Clarinet Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 4, 1),
(537, 537, 536, 'Clarinet Barrels', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories > Clarinet Parts', 0, 1),
(538, 538, 536, 'Clarinet Bells', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories > Clarinet Parts', 0, 1),
(539, 539, 536, 'Clarinet Mouthpieces', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories > Clarinet Parts', 0, 1),
(540, 540, 536, 'Clarinet Small Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories > Clarinet Parts', 0, 1),
(541, 541, 528, 'Clarinet Pegs & Stands', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 0, 1),
(542, 542, 528, 'Clarinet Reeds', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 0, 1),
(543, 543, 528, 'Clarinet Straps & Supports', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Clarinet Accessories', 0, 1),
(544, 544, 517, 'Flute Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 5, 1),
(545, 545, 544, 'Flute Care & Cleaning', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories', 3, 1),
(546, 546, 545, 'Flute Care Kits', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories > Flute Care & Cleaning', 0, 1),
(547, 547, 545, 'Flute Cleaning Rods', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories > Flute Care & Cleaning', 0, 1),
(548, 548, 545, 'Flute Swabs', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories > Flute Care & Cleaning', 0, 1),
(549, 549, 544, 'Flute Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories', 0, 1),
(550, 550, 544, 'Flute Lyres', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories', 0, 1),
(551, 551, 544, 'Flute Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories', 2, 1),
(552, 552, 551, 'Flute Headjoints', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories > Flute Parts', 0, 1),
(553, 553, 551, 'Flute Small Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories > Flute Parts', 0, 1),
(554, 554, 544, 'Flute Pegs & Stands', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Flute Accessories', 0, 1),
(555, 555, 517, 'Harmonica Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 2, 1),
(556, 556, 555, 'Harmonica Cases', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Harmonica Accessories', 0, 1),
(557, 557, 555, 'Harmonica Holders', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Harmonica Accessories', 0, 1),
(558, 558, 517, 'Oboe Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 6, 1),
(559, 559, 558, 'Oboe Care & Cleaning', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories', 2, 1),
(560, 560, 559, 'Oboe Care Kits', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories > Oboe Care & Cleaning', 0, 1),
(561, 561, 559, 'Oboe Swabs', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories > Oboe Care & Cleaning', 0, 1),
(562, 562, 558, 'Oboe Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories', 0, 1),
(563, 563, 558, 'Oboe Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories', 1, 1),
(564, 564, 563, 'Oboe Small Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories > Oboe Parts', 0, 1),
(565, 565, 558, 'Oboe Pegs & Stands', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories', 0, 1),
(566, 566, 558, 'Oboe Reeds', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories', 0, 1),
(567, 567, 558, 'Oboe Straps & Supports', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Oboe Accessories', 0, 1),
(568, 568, 517, 'Saxophone Accessories', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 8, 1),
(569, 569, 568, 'Saxophone Care & Cleaning', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 3, 1),
(570, 570, 569, 'Saxophone Care Kits', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories > Saxophone Care & Cleaning', 0, 1),
(571, 571, 569, 'Saxophone Pad Savers', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories > Saxophone Care & Cleaning', 0, 1),
(572, 572, 569, 'Saxophone Swabs', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories > Saxophone Care & Cleaning', 0, 1),
(573, 573, 568, 'Saxophone Cases & Gigbags', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 0, 1),
(574, 574, 568, 'Saxophone Ligatures & Caps', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 0, 1),
(575, 575, 568, 'Saxophone Lyres', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 0, 1),
(576, 576, 568, 'Saxophone Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 3, 1),
(577, 577, 576, 'Saxophone Mouthpieces', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories > Saxophone Parts', 0, 1),
(578, 578, 576, 'Saxophone Necks', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories > Saxophone Parts', 0, 1),
(579, 579, 576, 'Saxophone Small Parts', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories > Saxophone Parts', 0, 1),
(580, 580, 568, 'Saxophone Pegs & Stands', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 0, 1),
(581, 581, 568, 'Saxophone Reeds', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 0, 1),
(582, 582, 568, 'Saxophone Straps & Supports', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories > Saxophone Accessories', 0, 1),
(583, 583, 517, 'Woodwind Cork Grease', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 0, 1),
(584, 584, 517, 'Woodwind Polishing Cloths', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 0, 1),
(585, 585, 517, 'Woodwind Reed Cases', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 0, 1),
(586, 586, 517, 'Woodwind Reed Knives', 'Arts & Entertainment > Musical Instrument Accessories > Woodwind Instrument Accessories', 0, 1),
(587, 587, 302, 'Musical Instruments', 'Arts & Entertainment', 8, 1),
(588, 588, 587, 'Accordions & Concertinas', 'Arts & Entertainment > Musical Instruments', 0, 1),
(589, 589, 587, 'Bagpipes', 'Arts & Entertainment > Musical Instruments', 0, 1),
(590, 590, 587, 'Brass', 'Arts & Entertainment > Musical Instruments', 9, 1),
(591, 591, 590, 'Cornets', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(592, 592, 590, 'Euphoniums', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(593, 593, 590, 'Flugel Horns', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(594, 594, 590, 'French Horns', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(595, 595, 590, 'Mellophones', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(596, 596, 590, 'Sousaphones', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(597, 597, 590, 'Trombones', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(598, 598, 590, 'Trumpets', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(599, 599, 590, 'Tubas', 'Arts & Entertainment > Musical Instruments > Brass', 0, 1),
(600, 600, 587, 'Musical Keyboards', 'Arts & Entertainment > Musical Instruments', 0, 1),
(601, 601, 587, 'Percussion', 'Arts & Entertainment > Musical Instruments', 8, 1),
(602, 602, 601, 'Bass Drums', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(603, 603, 601, 'Cymbals', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(604, 604, 601, 'Drum Kits', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(605, 605, 601, 'Electronic Drums', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(606, 606, 601, 'Hi-Hats', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(607, 607, 601, 'Snare Drums', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(608, 608, 601, 'Tambourines', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(609, 609, 601, 'Tom-Toms', 'Arts & Entertainment > Musical Instruments > Percussion', 0, 1),
(610, 610, 587, 'Pianos', 'Arts & Entertainment > Musical Instruments', 0, 1),
(611, 611, 587, 'String Instruments', 'Arts & Entertainment > Musical Instruments', 6, 1),
(612, 612, 611, 'Cellos', 'Arts & Entertainment > Musical Instruments > String Instruments', 0, 1),
(613, 613, 611, 'Guitars', 'Arts & Entertainment > Musical Instruments > String Instruments', 3, 1),
(614, 614, 613, 'Acoustic Guitars', 'Arts & Entertainment > Musical Instruments > String Instruments > Guitars', 0, 1),
(615, 615, 613, 'Bass Guitars', 'Arts & Entertainment > Musical Instruments > String Instruments > Guitars', 0, 1),
(616, 616, 613, 'Electric Guitars', 'Arts & Entertainment > Musical Instruments > String Instruments > Guitars', 0, 1),
(617, 617, 611, 'Harps', 'Arts & Entertainment > Musical Instruments > String Instruments', 0, 1),
(618, 618, 611, 'Upright Basses', 'Arts & Entertainment > Musical Instruments > String Instruments', 0, 1),
(619, 619, 611, 'Violas', 'Arts & Entertainment > Musical Instruments > String Instruments', 0, 1),
(620, 620, 611, 'Violins', 'Arts & Entertainment > Musical Instruments > String Instruments', 0, 1),
(621, 621, 587, 'Woodwinds', 'Arts & Entertainment > Musical Instruments', 9, 1),
(622, 622, 621, 'Bassoons', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(623, 623, 621, 'Clarinets', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(624, 624, 621, 'Flutes', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(625, 625, 621, 'Harmonicas', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(626, 626, 621, 'Jew\'s Harps', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(627, 627, 621, 'Oboes', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(628, 628, 621, 'Recorders', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(629, 629, 621, 'Saxophones', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(630, 630, 302, 'Party Supplies', 'Arts & Entertainment', 20, 1),
(631, 631, 630, 'Balloons', 'Arts & Entertainment > Party Supplies', 0, 1),
(632, 632, 630, 'Banners', 'Arts & Entertainment > Party Supplies', 0, 1),
(633, 633, 630, 'Birthday Candles', 'Arts & Entertainment > Party Supplies', 0, 1),
(634, 634, 630, 'Confetti', 'Arts & Entertainment > Party Supplies', 0, 1),
(635, 635, 630, 'Drinking Games', 'Arts & Entertainment > Party Supplies', 1, 1),
(636, 636, 635, 'Beer Pong', 'Arts & Entertainment > Party Supplies > Drinking Games', 1, 1),
(637, 637, 636, 'Beer Pong Tables', 'Arts & Entertainment > Party Supplies > Drinking Games > Beer Pong', 0, 1),
(638, 638, 630, 'Drinking Straws & Stirrers', 'Arts & Entertainment > Party Supplies', 0, 1),
(639, 639, 630, 'Envelope Seals', 'Arts & Entertainment > Party Supplies', 0, 1),
(640, 640, 630, 'Invitations', 'Arts & Entertainment > Party Supplies', 2, 1),
(641, 641, 640, 'Birthday Invitations', 'Arts & Entertainment > Party Supplies > Invitations', 0, 1),
(642, 642, 640, 'Wedding Invitations', 'Arts & Entertainment > Party Supplies > Invitations', 0, 1),
(643, 643, 630, 'Noisemakers & Party Blowers', 'Arts & Entertainment > Party Supplies', 0, 1),
(645, 645, 630, 'Place Cards', 'Arts & Entertainment > Party Supplies', 0, 1),
(646, 646, 630, 'Response Cards', 'Arts & Entertainment > Party Supplies', 1, 1),
(647, 647, 630, 'Sparklers', 'Arts & Entertainment > Party Supplies', 0, 1),
(648, 648, 630, 'Spray String', 'Arts & Entertainment > Party Supplies', 0, 1),
(649, 649, 630, 'Streamers', 'Arts & Entertainment > Party Supplies', 0, 1),
(650, 650, 630, 'Temporary Tattoos', 'Arts & Entertainment > Party Supplies', 0, 1),
(651, 651, 302, 'Religious Items', 'Arts & Entertainment', 2, 1),
(652, 652, 651, 'Prayer Beads', 'Arts & Entertainment > Religious Items', 0, 1),
(653, 653, 651, 'Religious Veils', 'Arts & Entertainment > Religious Items', 0, 1),
(654, 654, 302, 'Visual Effects', 'Arts & Entertainment', 2, 1),
(655, 655, 654, 'Fog Machines', 'Arts & Entertainment > Visual Effects', 0, 1),
(656, 656, 654, 'Visual Effect Lighting', 'Arts & Entertainment > Visual Effects', 0, 1),
(657, 657, 0, 'Baby & Toddler', '', 8, 1),
(658, 658, 657, 'Baby Bathing', 'Baby & Toddler', 1, 1),
(659, 659, 658, 'Baby Bathtubs', 'Baby & Toddler > Baby Bathing', 0, 1),
(660, 660, 657, 'Baby Health', 'Baby & Toddler', 2, 1),
(661, 661, 660, 'Nasal Aspirators', 'Baby & Toddler > Baby Health', 0, 1),
(662, 662, 660, 'Pacifiers & Teethers', 'Baby & Toddler > Baby Health', 0, 1),
(663, 663, 657, 'Baby Safety', 'Baby & Toddler', 5, 1),
(664, 664, 663, 'Baby Monitors', 'Baby & Toddler > Baby Safety', 0, 1),
(665, 665, 663, 'Baby Safety Harnesses & Leashes', 'Baby & Toddler > Baby Safety', 0, 1),
(666, 666, 663, 'Baby Safety Locks & Guards', 'Baby & Toddler > Baby Safety', 0, 1),
(667, 667, 663, 'Baby Safety Rails', 'Baby & Toddler > Baby Safety', 0, 1),
(668, 668, 663, 'Safety Gates', 'Baby & Toddler > Baby Safety', 0, 1),
(669, 669, 657, 'Baby Toys', 'Baby & Toddler', 10, 1),
(670, 670, 669, 'Alphabet Toys', 'Baby & Toddler > Baby Toys', 0, 1),
(671, 671, 669, 'Baby Bouncers & Rockers', 'Baby & Toddler > Baby Toys', 0, 1),
(672, 672, 669, 'Baby Jumpers & Swings', 'Baby & Toddler > Baby Toys', 0, 1),
(673, 673, 669, 'Baby Mobiles', 'Baby & Toddler > Baby Toys', 0, 1),
(674, 674, 669, 'Baby Walkers & Entertainers', 'Baby & Toddler > Baby Toys', 0, 1),
(675, 675, 669, 'Play Yards', 'Baby & Toddler > Baby Toys', 0, 1),
(676, 676, 669, 'Playmats', 'Baby & Toddler > Baby Toys', 0, 1),
(677, 677, 669, 'Push & Pull Toys', 'Baby & Toddler > Baby Toys', 0, 1),
(678, 678, 669, 'Rattles', 'Baby & Toddler > Baby Toys', 0, 1),
(679, 679, 669, 'Sorting & Stacking Toys', 'Baby & Toddler > Baby Toys', 0, 1),
(680, 680, 657, 'Baby Transport', 'Baby & Toddler', 3, 1),
(681, 681, 680, 'Baby & Toddler Car Seats', 'Baby & Toddler > Baby Transport', 0, 1),
(682, 682, 680, 'Baby Carriers', 'Baby & Toddler > Baby Transport', 0, 1),
(683, 683, 680, 'Baby Strollers', 'Baby & Toddler > Baby Transport', 0, 1),
(684, 684, 657, 'Baby Transport Accessories', 'Baby & Toddler', 3, 1),
(685, 685, 684, 'Baby & Toddler Car Seat Accessories', 'Baby & Toddler > Baby Transport Accessories', 0, 1),
(686, 686, 684, 'Baby Carrier Accessories', 'Baby & Toddler > Baby Transport Accessories', 0, 1),
(687, 687, 684, 'Baby Stroller Accessories', 'Baby & Toddler > Baby Transport Accessories', 0, 1),
(688, 688, 657, 'Diapering', 'Baby & Toddler', 5, 1),
(689, 689, 688, 'Baby Wipes', 'Baby & Toddler > Diapering', 0, 1),
(690, 690, 688, 'Diaper Pails', 'Baby & Toddler > Diapering', 0, 1),
(691, 691, 688, 'Diaper Rash Treatments', 'Baby & Toddler > Diapering', 0, 1),
(692, 692, 688, 'Diapers', 'Baby & Toddler > Diapering', 0, 1),
(693, 693, 688, 'Potty Seats', 'Baby & Toddler > Diapering', 0, 1),
(694, 694, 657, 'Nursing & Feeding', 'Baby & Toddler', 7, 1),
(695, 695, 694, 'Baby & Toddler Food', 'Baby & Toddler > Nursing & Feeding', 1, 1),
(696, 696, 695, 'Baby Formula', 'Baby & Toddler > Nursing & Feeding > Baby & Toddler Food', 0, 1),
(697, 697, 694, 'Baby Care Timers', 'Baby & Toddler > Nursing & Feeding', 0, 1),
(698, 698, 694, 'Bottle Warmers & Sterilizers', 'Baby & Toddler > Nursing & Feeding', 0, 1),
(699, 699, 694, 'Bottles', 'Baby & Toddler > Nursing & Feeding', 0, 1),
(700, 700, 694, 'Breast Pumps', 'Baby & Toddler > Nursing & Feeding', 0, 1),
(701, 701, 694, 'Nursing Pillows', 'Baby & Toddler > Nursing & Feeding', 0, 1),
(702, 702, 0, 'Business & Industrial', '', 16, 1),
(703, 703, 702, 'Agriculture', 'Business & Industrial', 0, 1),
(704, 704, 702, 'Construction', 'Business & Industrial', 1, 1),
(705, 705, 704, 'Surveying', 'Business & Industrial > Construction', 0, 1),
(706, 706, 702, 'Film & Television', 'Business & Industrial', 0, 1),
(707, 707, 702, 'Finance & Insurance', 'Business & Industrial', 0, 1),
(708, 708, 702, 'Food Service', 'Business & Industrial', 8, 1),
(709, 709, 708, 'Bus Tubs', 'Business & Industrial > Food Service', 0, 1),
(710, 710, 708, 'Concession Food Containers', 'Business & Industrial > Food Service', 0, 1),
(711, 711, 708, 'Disposable Tableware', 'Business & Industrial > Food Service', 4, 1),
(712, 712, 711, 'Disposable Bowls', 'Business & Industrial > Food Service > Disposable Tableware', 0, 1),
(713, 713, 711, 'Disposable Cups', 'Business & Industrial > Food Service > Disposable Tableware', 0, 1),
(714, 714, 711, 'Disposable Cutlery', 'Business & Industrial > Food Service > Disposable Tableware', 0, 1),
(715, 715, 711, 'Disposable Plates', 'Business & Industrial > Food Service > Disposable Tableware', 0, 1),
(716, 716, 708, 'Food Service Carts', 'Business & Industrial > Food Service', 0, 1),
(717, 717, 708, 'Plastic Food Baskets', 'Business & Industrial > Food Service', 0, 1),
(718, 718, 708, 'Plate & Dish Warmers', 'Business & Industrial > Food Service', 0, 1),
(719, 719, 708, 'Take-Out Containers', 'Business & Industrial > Food Service', 0, 1),
(720, 720, 708, 'Vending Machines', 'Business & Industrial > Food Service', 0, 1),
(721, 721, 702, 'Forestry & Logging', 'Business & Industrial', 0, 1),
(722, 722, 702, 'Heavy Machinery', 'Business & Industrial', 2, 1),
(723, 723, 722, 'Chippers', 'Business & Industrial > Heavy Machinery', 0, 1),
(724, 724, 722, 'Fork Lifts', 'Business & Industrial > Heavy Machinery', 0, 1),
(725, 725, 702, 'Hotel & Hospitality', 'Business & Industrial', 0, 1),
(726, 726, 702, 'Law Enforcement', 'Business & Industrial', 3, 1),
(727, 727, 726, 'Batons', 'Business & Industrial > Law Enforcement', 0, 1),
(728, 728, 726, 'Cuffs', 'Business & Industrial > Law Enforcement', 3, 1),
(729, 729, 728, 'Ankle Cuffs', 'Business & Industrial > Law Enforcement > Cuffs', 0, 1),
(730, 730, 728, 'Handcuffs', 'Business & Industrial > Law Enforcement > Cuffs', 0, 1),
(731, 731, 728, 'Leg Cuffs', 'Business & Industrial > Law Enforcement > Cuffs', 0, 1),
(732, 732, 726, 'Metal Detectors', 'Business & Industrial > Law Enforcement', 0, 1),
(733, 733, 702, 'Manufacturing', 'Business & Industrial', 0, 1),
(734, 734, 702, 'Medical', 'Business & Industrial', 6, 1),
(735, 735, 734, 'Hospital Gowns', 'Business & Industrial > Medical', 0, 1),
(736, 736, 734, 'Medical Equipment', 'Business & Industrial > Medical', 3, 1),
(737, 737, 736, 'Automated External Defibrillators', 'Business & Industrial > Medical > Medical Equipment', 0, 1),
(738, 738, 736, 'Otoscopes & Ophthalmoscopes', 'Business & Industrial > Medical > Medical Equipment', 0, 1),
(739, 739, 736, 'Stethoscopes', 'Business & Industrial > Medical > Medical Equipment', 0, 1),
(740, 740, 734, 'Medical Furniture', 'Business & Industrial > Medical', 6, 1),
(741, 741, 740, 'Chiropractic Tables', 'Business & Industrial > Medical > Medical Furniture', 0, 1),
(742, 742, 740, 'Examination Chairs', 'Business & Industrial > Medical > Medical Furniture', 3, 1),
(743, 743, 742, 'Dental Chairs', 'Business & Industrial > Medical > Medical Furniture > Examination Chairs', 0, 1),
(744, 744, 742, 'Gynecological Chairs', 'Business & Industrial > Medical > Medical Furniture > Examination Chairs', 0, 1),
(745, 745, 742, 'Optometry Chairs', 'Business & Industrial > Medical > Medical Furniture > Examination Chairs', 0, 1),
(746, 746, 740, 'Homecare & Hospital Beds', 'Business & Industrial > Medical > Medical Furniture', 0, 1),
(747, 747, 740, 'Medical Cabinets', 'Business & Industrial > Medical > Medical Furniture', 1, 1),
(748, 748, 747, 'Narcotics Boxes', 'Business & Industrial > Medical > Medical Furniture > Medical Cabinets', 0, 1),
(749, 749, 740, 'Medical Carts', 'Business & Industrial > Medical > Medical Furniture', 2, 1),
(750, 750, 749, 'Crash Carts', 'Business & Industrial > Medical > Medical Furniture > Medical Carts', 0, 1),
(751, 751, 749, 'IV Poles & Carts', 'Business & Industrial > Medical > Medical Furniture > Medical Carts', 0, 1),
(752, 752, 740, 'Surgical Tables', 'Business & Industrial > Medical > Medical Furniture', 0, 1),
(753, 753, 734, 'Medical Supplies', 'Business & Industrial > Medical', 2, 1),
(754, 754, 753, 'Medical Gloves', 'Business & Industrial > Medical > Medical Supplies', 0, 1),
(755, 755, 753, 'Medical Masks', 'Business & Industrial > Medical > Medical Supplies', 0, 1),
(756, 756, 734, 'Scrubs', 'Business & Industrial > Medical', 0, 1),
(757, 757, 734, 'Surgical Gowns', 'Business & Industrial > Medical', 0, 1),
(758, 758, 702, 'Mining & Quarrying', 'Business & Industrial', 0, 1),
(759, 759, 702, 'Piercing & Tattooing', 'Business & Industrial', 2, 1),
(760, 760, 759, 'Piercing Supplies', 'Business & Industrial > Piercing & Tattooing', 1, 1),
(761, 761, 760, 'Piercing Needles', 'Business & Industrial > Piercing & Tattooing > Piercing Supplies', 0, 1),
(762, 762, 759, 'Tattooing Supplies', 'Business & Industrial > Piercing & Tattooing', 3, 1),
(763, 763, 762, 'Tattooing Inks', 'Business & Industrial > Piercing & Tattooing > Tattooing Supplies', 0, 1),
(764, 764, 762, 'Tattooing Machines', 'Business & Industrial > Piercing & Tattooing > Tattooing Supplies', 0, 1),
(765, 765, 762, 'Tattooing Needles', 'Business & Industrial > Piercing & Tattooing > Tattooing Supplies', 0, 1),
(766, 766, 702, 'Protective Equipment', 'Business & Industrial', 8, 1),
(767, 767, 766, 'Bullet Proof Vests', 'Business & Industrial > Protective Equipment', 0, 1),
(768, 768, 766, 'Fire Repellent Clothing', 'Business & Industrial > Protective Equipment', 0, 1),
(769, 769, 766, 'Fireman\'s Masks', 'Business & Industrial > Protective Equipment', 0, 1),
(770, 770, 766, 'Gas Masks', 'Business & Industrial > Protective Equipment', 0, 1),
(771, 771, 766, 'Hardhats', 'Business & Industrial > Protective Equipment', 0, 1),
(772, 772, 766, 'Hazardous Material Suits', 'Business & Industrial > Protective Equipment', 0, 1),
(773, 773, 766, 'High-Visibility Clothing', 'Business & Industrial > Protective Equipment', 0, 1),
(774, 774, 766, 'Protective Eyewear', 'Business & Industrial > Protective Equipment', 0, 1),
(775, 775, 702, 'Retail', 'Business & Industrial', 6, 1),
(776, 776, 775, 'Clothing Display Racks', 'Business & Industrial > Retail', 0, 1),
(777, 777, 775, 'Mannequins', 'Business & Industrial > Retail', 0, 1),
(778, 778, 775, 'Money Handling', 'Business & Industrial > Retail', 6, 1),
(779, 779, 778, 'Banknote Verifiers', 'Business & Industrial > Retail > Money Handling', 0, 1),
(780, 780, 778, 'Cash Registers & POS Equipment', 'Business & Industrial > Retail > Money Handling', 3, 1),
(781, 781, 780, 'Cash Drawers', 'Business & Industrial > Retail > Money Handling > Cash Registers & POS Equipment', 0, 1),
(782, 782, 780, 'Credit Card Readers', 'Business & Industrial > Retail > Money Handling > Cash Registers & POS Equipment', 0, 1),
(783, 783, 780, 'Signature Capture Pads', 'Business & Industrial > Retail > Money Handling > Cash Registers & POS Equipment', 0, 1),
(784, 784, 778, 'Coin & Bill Counters', 'Business & Industrial > Retail > Money Handling', 0, 1),
(785, 785, 778, 'Money Changers', 'Business & Industrial > Retail > Money Handling', 0, 1),
(786, 786, 778, 'Money Deposit Bags', 'Business & Industrial > Retail > Money Handling', 0, 1),
(787, 787, 778, 'Paper Coin Wrappers & Bill Straps', 'Business & Industrial > Retail > Money Handling', 0, 1),
(788, 788, 775, 'Plastic Bags', 'Business & Industrial > Retail', 0, 1),
(789, 789, 775, 'Pricing Guns', 'Business & Industrial > Retail', 0, 1),
(790, 790, 775, 'Retail Display Cases', 'Business & Industrial > Retail', 0, 1),
(791, 791, 702, 'Science & Laboratory', 'Business & Industrial', 3, 1),
(792, 792, 791, 'Laboratory Chemicals', 'Business & Industrial > Science & Laboratory', 0, 1),
(793, 793, 791, 'Laboratory Equipment', 'Business & Industrial > Science & Laboratory', 8, 1),
(794, 794, 793, 'Autoclaves', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 0, 1),
(795, 795, 793, 'Centrifuges', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 0, 1),
(796, 796, 793, 'Laboratory Blenders', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 0, 1),
(797, 797, 793, 'Laboratory Hot Plates', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 0, 1),
(798, 798, 793, 'Laboratory Ovens', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 0, 1),
(799, 799, 793, 'Microscope Accessories', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 5, 1),
(800, 800, 799, 'Microscope Cameras', 'Business & Industrial > Science & Laboratory > Laboratory Equipment > Microscope Accessories', 0, 1),
(801, 801, 799, 'Microscope Eyepieces & Adapters', 'Business & Industrial > Science & Laboratory > Laboratory Equipment > Microscope Accessories', 0, 1),
(802, 802, 799, 'Microscope Objective Lenses', 'Business & Industrial > Science & Laboratory > Laboratory Equipment > Microscope Accessories', 0, 1),
(803, 803, 799, 'Microscope Replacement Bulbs', 'Business & Industrial > Science & Laboratory > Laboratory Equipment > Microscope Accessories', 0, 1),
(804, 804, 799, 'Microscope Slides', 'Business & Industrial > Science & Laboratory > Laboratory Equipment > Microscope Accessories', 0, 1),
(805, 805, 793, 'Microscopes', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 0, 1),
(806, 806, 793, 'Spectrophotometers', 'Business & Industrial > Science & Laboratory > Laboratory Equipment', 0, 1),
(807, 807, 791, 'Laboratory Supplies', 'Business & Industrial > Science & Laboratory', 8, 1),
(808, 808, 807, 'Beakers', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(809, 809, 807, 'Graduated Cylinders', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(810, 810, 807, 'Laboratory Flasks', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(811, 811, 807, 'Petri Dishes', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(812, 812, 807, 'Pipettes', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(813, 813, 807, 'Test Tube Racks', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(814, 814, 807, 'Test Tubes', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(815, 815, 807, 'Wash Bottles', 'Business & Industrial > Science & Laboratory > Laboratory Supplies', 0, 1),
(816, 816, 0, 'Cameras & Optics', '', 4, 1),
(817, 817, 816, 'Camera & Optic Accessories', 'Cameras & Optics', 7, 1),
(818, 818, 817, 'Camera & Optic Lens Accessories', 'Cameras & Optics > Camera & Optic Accessories', 5, 1),
(819, 819, 818, 'Lens Bags', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lens Accessories', 0, 1),
(820, 820, 818, 'Lens Caps', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lens Accessories', 0, 1),
(821, 821, 818, 'Lens Converters & Adapters', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lens Accessories', 0, 1),
(822, 822, 818, 'Lens Filters', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lens Accessories', 1, 1),
(823, 823, 822, 'Close-Up Filters', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lens Accessories > Lens Filters', 0, 1),
(824, 824, 818, 'Lens Hoods', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lens Accessories', 0, 1),
(825, 825, 817, 'Camera & Optic Lenses', 'Cameras & Optics > Camera & Optic Accessories', 3, 1),
(826, 826, 825, 'Camera Lenses', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lenses', 0, 1),
(827, 827, 825, 'Surveillance Camera Lenses', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lenses', 0, 1),
(828, 828, 825, 'Video Camera Lenses', 'Cameras & Optics > Camera & Optic Accessories > Camera & Optic Lenses', 0, 1),
(829, 829, 817, 'Camera Accessories', 'Cameras & Optics > Camera & Optic Accessories', 8, 1),
(830, 830, 829, 'Camera Bags', 'Cameras & Optics > Camera & Optic Accessories > Camera Accessories', 0, 1),
(831, 831, 829, 'Camera Flashes', 'Cameras & Optics > Camera & Optic Accessories > Camera Accessories', 0, 1),
(833, 833, 829, 'Film', 'Cameras & Optics > Camera & Optic Accessories > Camera Accessories', 0, 1),
(834, 834, 829, 'Flash Brackets', 'Cameras & Optics > Camera & Optic Accessories > Camera Accessories', 0, 1),
(835, 835, 829, 'Underwater Camera Housings', 'Cameras & Optics > Camera & Optic Accessories > Camera Accessories', 0, 1),
(836, 836, 817, 'Optic Accessories', 'Cameras & Optics > Camera & Optic Accessories', 5, 1),
(837, 837, 836, 'Binocular & Monocular Accessories', 'Cameras & Optics > Camera & Optic Accessories > Optic Accessories', 0, 1),
(838, 838, 836, 'Night Vision Optic Accessories', 'Cameras & Optics > Camera & Optic Accessories > Optic Accessories', 0, 1),
(839, 839, 836, 'Rangefinder Accessories', 'Cameras & Optics > Camera & Optic Accessories > Optic Accessories', 0, 1),
(840, 840, 836, 'Telescope Accessories', 'Cameras & Optics > Camera & Optic Accessories > Optic Accessories', 0, 1),
(841, 841, 836, 'Thermal Optic Accessories', 'Cameras & Optics > Camera & Optic Accessories > Optic Accessories', 0, 1),
(842, 842, 817, 'Tripod & Monopod Accessories', 'Cameras & Optics > Camera & Optic Accessories', 3, 1),
(843, 843, 842, 'Tripod & Monopod Cases', 'Cameras & Optics > Camera & Optic Accessories > Tripod & Monopod Accessories', 0, 1),
(844, 844, 842, 'Tripod & Monopod Heads', 'Cameras & Optics > Camera & Optic Accessories > Tripod & Monopod Accessories', 0, 1),
(845, 845, 842, 'Tripod Collars & Mounts', 'Cameras & Optics > Camera & Optic Accessories > Tripod & Monopod Accessories', 0, 1),
(846, 846, 817, 'Tripods & Monopods', 'Cameras & Optics > Camera & Optic Accessories', 0, 1),
(847, 847, 817, 'Video Camera Accessories', 'Cameras & Optics > Camera & Optic Accessories', 3, 1),
(848, 848, 847, 'Underwater Video Camera Housings', 'Cameras & Optics > Camera & Optic Accessories > Video Camera Accessories', 0, 1),
(849, 849, 847, 'Video Camera Bags', 'Cameras & Optics > Camera & Optic Accessories > Video Camera Accessories', 0, 1),
(850, 850, 847, 'Video Camera Lights', 'Cameras & Optics > Camera & Optic Accessories > Video Camera Accessories', 0, 1),
(851, 851, 816, 'Cameras', 'Cameras & Optics', 7, 1),
(852, 852, 851, 'Digital Cameras', 'Cameras & Optics > Cameras', 3, 1),
(853, 853, 852, 'Digital Point & Shoot Cameras', 'Cameras & Optics > Cameras > Digital Cameras', 0, 1),
(854, 854, 852, 'Digital SLRs', 'Cameras & Optics > Cameras > Digital Cameras', 0, 1),
(855, 855, 852, 'Mirrorless System Digital Cameras', 'Cameras & Optics > Cameras > Digital Cameras', 0, 1),
(856, 856, 851, 'Disposable Cameras', 'Cameras & Optics > Cameras', 0, 1),
(857, 857, 851, 'Film Cameras', 'Cameras & Optics > Cameras', 1, 1),
(858, 858, 857, 'Instant Cameras', 'Cameras & Optics > Cameras > Film Cameras', 0, 1),
(859, 859, 851, 'Surveillance Cameras', 'Cameras & Optics > Cameras', 1, 1),
(860, 860, 859, 'Hidden Cameras', 'Cameras & Optics > Cameras > Surveillance Cameras', 0, 1),
(861, 861, 851, 'Trail Cameras', 'Cameras & Optics > Cameras', 0, 1),
(862, 862, 851, 'Video Cameras', 'Cameras & Optics > Cameras', 0, 1),
(863, 863, 851, 'Webcams', 'Cameras & Optics > Cameras', 0, 1),
(864, 864, 816, 'Optics', 'Cameras & Optics', 5, 1),
(869, 869, 864, 'Rangefinders', 'Cameras & Optics > Optics', 0, 1),
(870, 870, 864, 'Scopes', 'Cameras & Optics > Optics', 3, 1),
(871, 871, 870, 'Gun Scopes & Sights', 'Cameras & Optics > Optics > Scopes', 0, 1),
(872, 872, 870, 'Spotting Scopes', 'Cameras & Optics > Optics > Scopes', 0, 1),
(873, 873, 870, 'Telescopes', 'Cameras & Optics > Optics > Scopes', 0, 1),
(874, 874, 816, 'Photography', 'Cameras & Optics', 3, 1),
(875, 875, 874, 'Darkroom', 'Cameras & Optics > Photography', 5, 1),
(876, 876, 875, 'Developing & Processing Equipment', 'Cameras & Optics > Photography > Darkroom', 5, 1),
(877, 877, 876, 'Copystands', 'Cameras & Optics > Photography > Darkroom > Developing & Processing Equipment', 0, 1),
(878, 878, 876, 'Darkroom Sinks', 'Cameras & Optics > Photography > Darkroom > Developing & Processing Equipment', 0, 1),
(879, 879, 876, 'Developing Tanks & Reels', 'Cameras & Optics > Photography > Darkroom > Developing & Processing Equipment', 0, 1),
(880, 880, 876, 'Print Trays, Washers & Dryers', 'Cameras & Optics > Photography > Darkroom > Developing & Processing Equipment', 0, 1),
(881, 881, 876, 'Retouching Equipment & Supplies', 'Cameras & Optics > Photography > Darkroom > Developing & Processing Equipment', 0, 1),
(882, 882, 875, 'Enlarging Equipment', 'Cameras & Optics > Photography > Darkroom', 5, 1),
(883, 883, 882, 'Analyzers & Exposure Meters', 'Cameras & Optics > Photography > Darkroom > Enlarging Equipment', 0, 1),
(884, 884, 882, 'Darkroom Easels', 'Cameras & Optics > Photography > Darkroom > Enlarging Equipment', 0, 1),
(885, 885, 882, 'Darkroom Timers', 'Cameras & Optics > Photography > Darkroom > Enlarging Equipment', 0, 1),
(886, 886, 882, 'Enlargers', 'Cameras & Optics > Photography > Darkroom > Enlarging Equipment', 0, 1),
(887, 887, 882, 'Focusing Aids', 'Cameras & Optics > Photography > Darkroom > Enlarging Equipment', 0, 1),
(888, 888, 875, 'Photographic Chemicals', 'Cameras & Optics > Photography > Darkroom', 5, 1),
(889, 889, 888, 'Developer', 'Cameras & Optics > Photography > Darkroom > Photographic Chemicals', 0, 1),
(890, 890, 888, 'Photographic Color Kits', 'Cameras & Optics > Photography > Darkroom > Photographic Chemicals', 0, 1),
(891, 891, 888, 'Photographic Fixers', 'Cameras & Optics > Photography > Darkroom > Photographic Chemicals', 0, 1),
(892, 892, 888, 'Photographic Toners', 'Cameras & Optics > Photography > Darkroom > Photographic Chemicals', 0, 1),
(893, 893, 888, 'Stop Baths', 'Cameras & Optics > Photography > Darkroom > Photographic Chemicals', 0, 1),
(894, 894, 875, 'Photographic Paper', 'Cameras & Optics > Photography > Darkroom', 0, 1),
(895, 895, 875, 'Safelights', 'Cameras & Optics > Photography > Darkroom', 0, 1),
(896, 896, 874, 'Lighting & Studio', 'Cameras & Optics > Photography', 10, 1),
(897, 897, 896, 'Backgrounds', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(898, 898, 896, 'Flash Diffusers', 'Cameras & Optics > Photography > Lighting & Studio', 1, 1),
(899, 899, 898, 'Camera Flash Diffusers', 'Cameras & Optics > Photography > Lighting & Studio > Flash Diffusers', 0, 1),
(900, 900, 896, 'Light Controls', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(901, 901, 896, 'Light Meters', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(902, 902, 896, 'Lighting Filters & Gels', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(903, 903, 896, 'Studio Lights & Flashes', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(904, 904, 896, 'Studio Mountings', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(905, 905, 874, 'Photo Negative & Slide Storage', 'Cameras & Optics > Photography', 0, 1),
(906, 906, 0, 'Electronics', '', 17, 1),
(907, 907, 906, 'Arcade Equipment', 'Electronics', 5, 1),
(908, 908, 907, 'Pinball Machine Accessories', 'Electronics > Arcade Equipment', 0, 1),
(909, 909, 907, 'Pinball Machines', 'Electronics > Arcade Equipment', 0, 1),
(910, 910, 907, 'Skee-Ball Machines', 'Electronics > Arcade Equipment', 0, 1),
(911, 911, 907, 'Video Game Arcade Cabinet Accessories', 'Electronics > Arcade Equipment', 0, 1),
(912, 912, 907, 'Video Game Arcade Cabinets', 'Electronics > Arcade Equipment', 0, 1),
(913, 913, 906, 'Audio', 'Electronics', 6, 1),
(914, 914, 913, 'Audio Accessories', 'Electronics > Audio', 7, 1),
(918, 918, 914, 'Karaoke System Accessories', 'Electronics > Audio > Audio Accessories', 1, 1),
(919, 919, 918, 'Karaoke Chips', 'Electronics > Audio > Audio Accessories > Karaoke System Accessories', 0, 1),
(920, 920, 914, 'MP3 Player Accessories', 'Electronics > Audio > Audio Accessories', 2, 1),
(921, 921, 920, 'MP3 Player Cases', 'Electronics > Audio > Audio Accessories > MP3 Player Accessories', 0, 1),
(922, 922, 914, 'Microphone Accessories', 'Electronics > Audio > Audio Accessories', 1, 1),
(923, 923, 922, 'Microphone Stands', 'Electronics > Audio > Audio Accessories > Microphone Accessories', 0, 1),
(924, 924, 914, 'Satellite Radio Accessories', 'Electronics > Audio > Audio Accessories', 0, 1),
(925, 925, 914, 'Turntable Accessories', 'Electronics > Audio > Audio Accessories', 1, 1),
(926, 926, 925, 'Turntable Cartridges & Needles', 'Electronics > Audio > Audio Accessories > Turntable Accessories', 0, 1),
(927, 927, 913, 'Audio Components', 'Electronics > Audio', 9, 1),
(928, 928, 927, 'Audio Amplifiers', 'Electronics > Audio > Audio Components', 3, 1),
(929, 929, 928, 'Headphone Amplifiers', 'Electronics > Audio > Audio Components > Audio Amplifiers', 0, 1),
(931, 931, 927, 'Audio Mixers', 'Electronics > Audio > Audio Components', 0, 1),
(932, 932, 927, 'Audio Receivers', 'Electronics > Audio > Audio Components', 0, 1),
(933, 933, 927, 'Audio Samplers', 'Electronics > Audio > Audio Components', 0, 1),
(934, 934, 927, 'Headphones', 'Electronics > Audio > Audio Components', 0, 1),
(935, 935, 927, 'Microphones', 'Electronics > Audio > Audio Components', 1, 1),
(936, 936, 935, 'Video Camera Microphones', 'Electronics > Audio > Audio Components > Microphones', 0, 1),
(937, 937, 927, 'Signal Processors', 'Electronics > Audio > Audio Components', 5, 1),
(938, 938, 937, 'Effects Processors', 'Electronics > Audio > Audio Components > Signal Processors', 0, 1),
(939, 939, 937, 'Equalizers', 'Electronics > Audio > Audio Components > Signal Processors', 0, 1),
(940, 940, 937, 'Microphone Preamps', 'Electronics > Audio > Audio Components > Signal Processors', 0, 1),
(941, 941, 937, 'Phono Preamps', 'Electronics > Audio > Audio Components > Signal Processors', 0, 1),
(942, 942, 927, 'Speakers', 'Electronics > Audio > Audio Components', 3, 1),
(943, 943, 942, 'Computer Speakers', 'Electronics > Audio > Audio Components > Speakers', 0, 1),
(944, 944, 942, 'Studio Monitors', 'Electronics > Audio > Audio Components > Speakers', 0, 1),
(945, 945, 913, 'Audio Players & Recorders', 'Electronics > Audio', 13, 1),
(946, 946, 945, 'Audio Recorders', 'Electronics > Audio > Audio Players & Recorders', 2, 1),
(947, 947, 946, 'Voice Recorders', 'Electronics > Audio > Audio Players & Recorders > Audio Recorders', 0, 1),
(948, 948, 945, 'Boomboxes', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(949, 949, 945, 'CD Players', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(950, 950, 945, 'Cassette Players', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(951, 951, 945, 'Home Theater Systems', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(952, 952, 945, 'Jukeboxes', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(953, 953, 945, 'Karaoke Systems', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(954, 954, 945, 'MP3 Players', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(955, 955, 945, 'MiniDisc Players', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(956, 956, 945, 'Radio Scanners', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(957, 957, 945, 'Radios', 'Electronics > Audio > Audio Players & Recorders', 3, 1),
(958, 958, 957, 'Clock Radios', 'Electronics > Audio > Audio Players & Recorders > Radios', 0, 1),
(959, 959, 957, 'Satellite Radios', 'Electronics > Audio > Audio Players & Recorders > Radios', 0, 1),
(960, 960, 945, 'Record Players', 'Electronics > Audio > Audio Players & Recorders', 0, 1),
(961, 961, 945, 'Stereo Systems', 'Electronics > Audio > Audio Players & Recorders', 1, 1),
(962, 962, 961, 'Mini Systems', 'Electronics > Audio > Audio Players & Recorders > Stereo Systems', 0, 1),
(963, 963, 913, 'DJ & Specialty Audio', 'Electronics > Audio', 5, 1),
(964, 964, 963, 'CDJs', 'Electronics > Audio > DJ & Specialty Audio', 0, 1),
(965, 965, 963, 'Computer DJ Systems', 'Electronics > Audio > DJ & Specialty Audio', 0, 1),
(966, 966, 963, 'DJ Equipment Accessories', 'Electronics > Audio > DJ & Specialty Audio', 0, 1),
(967, 967, 963, 'DJ Mixers', 'Electronics > Audio > DJ & Specialty Audio', 0, 1),
(968, 968, 963, 'DJ Turntables', 'Electronics > Audio > DJ & Specialty Audio', 0, 1),
(969, 969, 913, 'Public Address Systems', 'Electronics > Audio', 0, 1),
(970, 970, 913, 'Stage Equipment', 'Electronics > Audio', 1, 1),
(971, 971, 970, 'Wireless Transmitters', 'Electronics > Audio > Stage Equipment', 0, 1),
(972, 972, 906, 'Circuit Components', 'Electronics', 4, 1),
(973, 973, 972, 'Circuit Prototyping', 'Electronics > Circuit Components', 2, 1),
(974, 974, 973, 'Breadboards', 'Electronics > Circuit Components > Circuit Prototyping', 0, 1),
(975, 975, 973, 'Development Boards', 'Electronics > Circuit Components > Circuit Prototyping', 0, 1),
(976, 976, 972, 'Optoelectronics', 'Electronics > Circuit Components', 1, 1),
(977, 977, 976, 'Laser Diodes', 'Electronics > Circuit Components > Optoelectronics', 0, 1),
(978, 978, 972, 'Passive Circuit Components', 'Electronics > Circuit Components', 4, 1),
(979, 979, 978, 'Capacitors', 'Electronics > Circuit Components > Passive Circuit Components', 0, 1),
(980, 980, 978, 'Inductors', 'Electronics > Circuit Components > Passive Circuit Components', 0, 1),
(981, 981, 978, 'Potentiometers', 'Electronics > Circuit Components > Passive Circuit Components', 0, 1),
(982, 982, 978, 'Resistors', 'Electronics > Circuit Components > Passive Circuit Components', 0, 1),
(983, 983, 972, 'Semiconductors', 'Electronics > Circuit Components', 5, 1),
(984, 984, 983, 'Diodes', 'Electronics > Circuit Components > Semiconductors', 0, 1),
(985, 985, 983, 'Microcontrollers', 'Electronics > Circuit Components > Semiconductors', 0, 1),
(986, 986, 983, 'Op Amps', 'Electronics > Circuit Components > Semiconductors', 0, 1),
(987, 987, 983, 'Transistors', 'Electronics > Circuit Components > Semiconductors', 0, 1),
(988, 988, 983, 'Voltage Regulator ICs', 'Electronics > Circuit Components > Semiconductors', 0, 1),
(989, 989, 906, 'Communications', 'Electronics', 11, 1),
(990, 990, 989, 'Answering Machines', 'Electronics > Communications', 1, 1),
(991, 991, 990, 'On Hold Systems', 'Electronics > Communications > Answering Machines', 0, 1),
(992, 992, 989, 'Caller IDs', 'Electronics > Communications', 0, 1),
(994, 994, 989, 'Communication Radios', 'Electronics > Communications', 2, 1),
(995, 995, 994, 'CB Radios', 'Electronics > Communications > Communication Radios', 0, 1),
(996, 996, 994, 'Two-Way Radios', 'Electronics > Communications > Communication Radios', 0, 1),
(997, 997, 989, 'Headsets', 'Electronics > Communications', 0, 1),
(998, 998, 989, 'Intercoms', 'Electronics > Communications', 0, 1),
(999, 999, 989, 'Pagers', 'Electronics > Communications', 0, 1),
(1000, 1000, 989, 'Telephony', 'Electronics > Communications', 7, 1),
(1001, 1001, 1000, 'Conference Phones', 'Electronics > Communications > Telephony', 0, 1),
(1002, 1002, 1000, 'Corded Phones', 'Electronics > Communications > Telephony', 0, 1),
(1003, 1003, 1000, 'Cordless Phones', 'Electronics > Communications > Telephony', 0, 1),
(1004, 1004, 1000, 'Mobile Phone Accessories', 'Electronics > Communications > Telephony', 2, 1),
(1005, 1005, 1004, 'Mobile Phone Cases', 'Electronics > Communications > Telephony > Mobile Phone Accessories', 0, 1),
(1006, 1006, 1004, 'Mobile Phone Charms & Straps', 'Electronics > Communications > Telephony > Mobile Phone Accessories', 0, 1),
(1007, 1007, 1000, 'Mobile Phones', 'Electronics > Communications > Telephony', 2, 1),
(1008, 1008, 1007, 'Feature Phones', 'Electronics > Communications > Telephony > Mobile Phones', 0, 1),
(1009, 1009, 1007, 'Smartphones', 'Electronics > Communications > Telephony > Mobile Phones', 0, 1),
(1010, 1010, 1000, 'Satellite Phones', 'Electronics > Communications > Telephony', 0, 1),
(1011, 1011, 1000, 'Telephone Accessories', 'Electronics > Communications > Telephony', 1, 1),
(1012, 1012, 1011, 'Phone Cards', 'Electronics > Communications > Telephony > Telephone Accessories', 0, 1),
(1013, 1013, 989, 'Video Conferencing', 'Electronics > Communications', 0, 1),
(1014, 1014, 906, 'Components', 'Electronics', 5, 1),
(1015, 1015, 1014, 'Connectors', 'Electronics > Components', 2, 1),
(1016, 1016, 1015, 'Keystone Jacks', 'Electronics > Components > Connectors', 0, 1),
(1017, 1017, 1015, 'RCA Jacks', 'Electronics > Components > Connectors', 0, 1),
(1018, 1018, 1014, 'Converters', 'Electronics > Components', 2, 1),
(1019, 1019, 1018, 'Scan Converters', 'Electronics > Components > Converters', 0, 1),
(1020, 1020, 1018, 'Voltage Converters', 'Electronics > Components > Converters', 0, 1),
(1021, 1021, 1014, 'Modulators', 'Electronics > Components', 1, 1),
(1022, 1022, 1021, 'RF Modulators', 'Electronics > Components > Modulators', 0, 1),
(1023, 1023, 1014, 'Splitters', 'Electronics > Components', 2, 1),
(1024, 1024, 1023, 'RF Splitters', 'Electronics > Components > Splitters', 0, 1),
(1025, 1025, 1023, 'UHF Splitters', 'Electronics > Components > Splitters', 0, 1),
(1026, 1026, 1014, 'Transformers', 'Electronics > Components', 1, 1),
(1027, 1027, 1026, 'Baluns', 'Electronics > Components > Transformers', 0, 1),
(1028, 1028, 906, 'Computers', 'Electronics', 10, 1),
(1029, 1029, 1028, 'Barebone Computers', 'Electronics > Computers', 0, 1),
(1030, 1030, 1028, 'Computer Accessories', 'Electronics > Computers', 6, 1),
(1031, 1031, 1030, 'Handheld Device Accessories', 'Electronics > Computers > Computer Accessories', 3, 1),
(1032, 1032, 1031, 'E-Book Reader Accessories', 'Electronics > Computers > Computer Accessories > Handheld Device Accessories', 1, 1),
(1033, 1033, 1032, 'E-Book Reader Cases', 'Electronics > Computers > Computer Accessories > Handheld Device Accessories > E-Book Reader Accessories', 0, 1),
(1034, 1034, 1031, 'PDA Accessories', 'Electronics > Computers > Computer Accessories > Handheld Device Accessories', 1, 1),
(1035, 1035, 1034, 'PDA Cases', 'Electronics > Computers > Computer Accessories > Handheld Device Accessories > PDA Accessories', 0, 1),
(1036, 1036, 1031, 'Stylus Pens', 'Electronics > Computers > Computer Accessories > Handheld Device Accessories', 0, 1),
(1037, 1037, 1030, 'Laptop Accessories', 'Electronics > Computers > Computer Accessories', 4, 1),
(1038, 1038, 1037, 'Laptop Docking Stations', 'Electronics > Computers > Computer Accessories > Laptop Accessories', 0, 1),
(1041, 1041, 1030, 'Mouse Pads', 'Electronics > Computers > Computer Accessories', 0, 1),
(1042, 1042, 1030, 'Tablet PC Accessories', 'Electronics > Computers > Computer Accessories', 4, 1),
(1045, 1045, 1028, 'Computer Components', 'Electronics > Computers', 16, 1),
(1046, 1046, 1045, 'Audio Cards', 'Electronics > Computers > Computer Components', 0, 1),
(1047, 1047, 1045, 'Computer Cases', 'Electronics > Computers > Computer Components', 0, 1),
(1048, 1048, 1045, 'Computer Racks & Mounts', 'Electronics > Computers > Computer Components', 0, 1),
(1049, 1049, 1045, 'Computer Starter Kits', 'Electronics > Computers > Computer Components', 0, 1),
(1050, 1050, 1045, 'Computer System Cooling', 'Electronics > Computers > Computer Components', 0, 1),
(1051, 1051, 1045, 'I/O Cards', 'Electronics > Computers > Computer Components', 4, 1),
(1052, 1052, 1051, 'FireWire Cards', 'Electronics > Computers > Computer Components > I/O Cards', 0, 1),
(1053, 1053, 1051, 'Parallel Cards', 'Electronics > Computers > Computer Components > I/O Cards', 0, 1),
(1054, 1054, 1051, 'Serial Cards', 'Electronics > Computers > Computer Components > I/O Cards', 0, 1),
(1055, 1055, 1051, 'USB Cards', 'Electronics > Computers > Computer Components > I/O Cards', 0, 1),
(1056, 1056, 1045, 'Input Devices', 'Electronics > Computers > Computer Components', 12, 1),
(1057, 1057, 1056, 'Barcode Scanners', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1058, 1058, 1056, 'Computer Keyboards', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1059, 1059, 1056, 'Digital Note Taking Pens', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1060, 1060, 1056, 'Fingerprint Readers', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1061, 1061, 1056, 'Game Controllers', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1062, 1062, 1056, 'Graphics Tablets', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1063, 1063, 1056, 'KVM Switches', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1064, 1064, 1056, 'Memory Card Readers', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1065, 1065, 1056, 'Mice & Trackballs', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1066, 1066, 1056, 'Numeric Keypads', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1067, 1067, 1056, 'Touchpads', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(1068, 1068, 1045, 'Laptop Parts', 'Electronics > Computers > Computer Components', 3, 1),
(1069, 1069, 1068, 'Laptop Replacement Keyboards', 'Electronics > Computers > Computer Components > Laptop Parts', 0, 1),
(1070, 1070, 1068, 'Laptop Replacement Screens', 'Electronics > Computers > Computer Components > Laptop Parts', 0, 1),
(1071, 1071, 1068, 'Laptop Shells', 'Electronics > Computers > Computer Components > Laptop Parts', 0, 1),
(1072, 1072, 1045, 'Motherboards', 'Electronics > Computers > Computer Components', 0, 1),
(1073, 1073, 1045, 'Output Devices', 'Electronics > Computers > Computer Components', 0, 1),
(1074, 1074, 1045, 'Power Supplies', 'Electronics > Computers > Computer Components', 0, 1),
(1075, 1075, 1045, 'Processors', 'Electronics > Computers > Computer Components', 0, 1),
(1076, 1076, 1045, 'Storage Devices', 'Electronics > Computers > Computer Components', 9, 1),
(1077, 1077, 1076, 'Disk Arrays', 'Electronics > Computers > Computer Components > Storage Devices', 0, 1),
(1078, 1078, 1076, 'Disk Duplicators', 'Electronics > Computers > Computer Components > Storage Devices', 3, 1),
(1079, 1079, 1078, 'CD/DVD Duplicators', 'Electronics > Computers > Computer Components > Storage Devices > Disk Duplicators', 0, 1),
(1080, 1080, 1078, 'Hard Drive Duplicators', 'Electronics > Computers > Computer Components > Storage Devices > Disk Duplicators', 0, 1),
(1081, 1081, 1078, 'USB Drive Duplicators', 'Electronics > Computers > Computer Components > Storage Devices > Disk Duplicators', 0, 1),
(1082, 1082, 1076, 'Floppy Drives', 'Electronics > Computers > Computer Components > Storage Devices', 0, 1),
(1083, 1083, 1076, 'Hard Drives', 'Electronics > Computers > Computer Components > Storage Devices', 1, 1),
(1084, 1084, 1083, 'Solid State Drives', 'Electronics > Computers > Computer Components > Storage Devices > Hard Drives', 0, 1),
(1085, 1085, 1076, 'Network Storage Systems', 'Electronics > Computers > Computer Components > Storage Devices', 2, 1),
(1086, 1086, 1085, 'Network Storage Servers', 'Electronics > Computers > Computer Components > Storage Devices > Network Storage Systems', 0, 1),
(1087, 1087, 1085, 'Storage Area Networks', 'Electronics > Computers > Computer Components > Storage Devices > Network Storage Systems', 0, 1),
(1088, 1088, 1076, 'Optical Drives', 'Electronics > Computers > Computer Components > Storage Devices', 3, 1),
(1089, 1089, 1088, 'CD Drives', 'Electronics > Computers > Computer Components > Storage Devices > Optical Drives', 0, 1),
(1090, 1090, 1088, 'DVD Drives', 'Electronics > Computers > Computer Components > Storage Devices > Optical Drives', 0, 1),
(1091, 1091, 1088, 'MO Drives', 'Electronics > Computers > Computer Components > Storage Devices > Optical Drives', 0, 1),
(1092, 1092, 1076, 'Storage Drive Accessories', 'Electronics > Computers > Computer Components > Storage Devices', 4, 1),
(1093, 1093, 1092, 'Hard Drive Carrying Cases', 'Electronics > Computers > Computer Components > Storage Devices > Storage Drive Accessories', 0, 1),
(1094, 1094, 1092, 'Hard Drive Docks', 'Electronics > Computers > Computer Components > Storage Devices > Storage Drive Accessories', 0, 1),
(1095, 1095, 1092, 'Hard Drive Enclosures', 'Electronics > Computers > Computer Components > Storage Devices > Storage Drive Accessories', 0, 1),
(1096, 1096, 1092, 'Hard Drive Mounts', 'Electronics > Computers > Computer Components > Storage Devices > Storage Drive Accessories', 0, 1),
(1097, 1097, 1076, 'Tape Drives', 'Electronics > Computers > Computer Components > Storage Devices', 0, 1),
(1098, 1098, 1076, 'USB Flash Drives', 'Electronics > Computers > Computer Components > Storage Devices', 0, 1),
(1099, 1099, 1045, 'TV Tuner Cards', 'Electronics > Computers > Computer Components', 0, 1),
(1100, 1100, 1045, 'USB & FireWire Hubs', 'Electronics > Computers > Computer Components', 0, 1),
(1101, 1101, 1045, 'Video Cards', 'Electronics > Computers > Computer Components', 0, 1),
(1102, 1102, 1028, 'Desktop Computers', 'Electronics > Computers', 0, 1),
(1103, 1103, 1028, 'Handheld Devices', 'Electronics > Computers', 3, 1),
(1104, 1104, 1103, 'Data Collection Terminals', 'Electronics > Computers > Handheld Devices', 0, 1),
(1105, 1105, 1103, 'E-Book Readers', 'Electronics > Computers > Handheld Devices', 0, 1),
(1106, 1106, 1103, 'PDAs', 'Electronics > Computers > Handheld Devices', 0, 1),
(1107, 1107, 1028, 'Interactive Kiosks', 'Electronics > Computers', 0, 1),
(1108, 1108, 1028, 'Laptops', 'Electronics > Computers', 1, 1),
(1109, 1109, 1108, 'Netbooks', 'Electronics > Computers > Laptops', 0, 1),
(1111, 1111, 1028, 'Tablet PCs', 'Electronics > Computers', 0, 1),
(1112, 1112, 906, 'Electronics Accessories', 'Electronics', 13, 1),
(1113, 1113, 1112, 'Adapters', 'Electronics > Electronics Accessories', 5, 1),
(1114, 1114, 1113, 'Audio & Video Adapters', 'Electronics > Electronics Accessories > Adapters', 0, 1),
(1115, 1115, 1113, 'Memory Adapters', 'Electronics > Electronics Accessories > Adapters', 0, 1),
(1116, 1116, 1113, 'Power Adapters', 'Electronics > Electronics Accessories > Adapters', 1, 1),
(1117, 1117, 1116, 'Laptop Power Adapters', 'Electronics > Electronics Accessories > Adapters > Power Adapters', 0, 1),
(1118, 1118, 1113, 'Power Line Network Adapters', 'Electronics > Electronics Accessories > Adapters', 0, 1),
(1119, 1119, 1113, 'Storage Adapters', 'Electronics > Electronics Accessories > Adapters', 0, 1),
(1120, 1120, 1112, 'Antennas', 'Electronics > Electronics Accessories', 3, 1),
(1121, 1121, 1120, 'Communication Antennas', 'Electronics > Electronics Accessories > Antennas', 0, 1),
(1122, 1122, 1120, 'Radio Antennas', 'Electronics > Electronics Accessories > Antennas', 0, 1),
(1123, 1123, 1120, 'Television Antennas', 'Electronics > Electronics Accessories > Antennas', 0, 1),
(1124, 1124, 1112, 'Blank Media', 'Electronics > Electronics Accessories', 8, 1),
(1125, 1125, 1124, 'Blank Audio Tapes', 'Electronics > Electronics Accessories > Blank Media', 1, 1),
(1126, 1126, 1125, 'Micro Cassettes', 'Electronics > Electronics Accessories > Blank Media > Blank Audio Tapes', 0, 1),
(1127, 1127, 1124, 'Blank Blu-ray Discs', 'Electronics > Electronics Accessories > Blank Media', 0, 1),
(1128, 1128, 1124, 'Blank CDs', 'Electronics > Electronics Accessories > Blank Media', 0, 1),
(1129, 1129, 1124, 'Blank DVDs', 'Electronics > Electronics Accessories > Blank Media', 0, 1),
(1130, 1130, 1124, 'Blank Video Tapes', 'Electronics > Electronics Accessories > Blank Media', 0, 1),
(1131, 1131, 1124, 'Computer Disks', 'Electronics > Electronics Accessories > Blank Media', 1, 1),
(1132, 1132, 1131, 'Floppy Disks', 'Electronics > Electronics Accessories > Blank Media > Computer Disks', 0, 1),
(1133, 1133, 1124, 'Computer Tapes', 'Electronics > Electronics Accessories > Blank Media', 0, 1),
(1134, 1134, 1124, 'MiniDiscs', 'Electronics > Electronics Accessories > Blank Media', 0, 1),
(1135, 1135, 1112, 'Cable Management', 'Electronics > Electronics Accessories', 3, 1),
(1136, 1136, 1135, 'Cable Clips', 'Electronics > Electronics Accessories > Cable Management', 0, 1),
(1137, 1137, 1135, 'Patch Panels', 'Electronics > Electronics Accessories > Cable Management', 0, 1),
(1138, 1138, 1135, 'Wire & Cable Ties', 'Electronics > Electronics Accessories > Cable Management', 0, 1),
(1139, 1139, 1112, 'Cables', 'Electronics > Electronics Accessories', 9, 1),
(1140, 1140, 1139, 'Audio & Video Cables', 'Electronics > Electronics Accessories > Cables', 3, 1),
(1141, 1141, 1140, 'DVI Cables', 'Electronics > Electronics Accessories > Cables > Audio & Video Cables', 0, 1),
(1142, 1142, 1140, 'HDMI Cables', 'Electronics > Electronics Accessories > Cables > Audio & Video Cables', 0, 1),
(1143, 1143, 1140, 'Speaker Cables', 'Electronics > Electronics Accessories > Cables > Audio & Video Cables', 0, 1),
(1144, 1144, 1139, 'Data Transfer Cables', 'Electronics > Electronics Accessories > Cables', 3, 1),
(1145, 1145, 1144, 'FireWire Cables', 'Electronics > Electronics Accessories > Cables > Data Transfer Cables', 0, 1),
(1146, 1146, 1144, 'USB Cables', 'Electronics > Electronics Accessories > Cables > Data Transfer Cables', 0, 1),
(1147, 1147, 1144, 'iOS Cables', 'Electronics > Electronics Accessories > Cables > Data Transfer Cables', 0, 1),
(1148, 1148, 1139, 'KVM Cables', 'Electronics > Electronics Accessories > Cables', 0, 1),
(1149, 1149, 1139, 'Network Cables', 'Electronics > Electronics Accessories > Cables', 1, 1),
(1150, 1150, 1149, 'Ethernet Cables', 'Electronics > Electronics Accessories > Cables > Network Cables', 0, 1),
(1151, 1151, 1139, 'Optical Cables', 'Electronics > Electronics Accessories > Cables', 0, 1),
(1152, 1152, 1139, 'Storage Cables', 'Electronics > Electronics Accessories > Cables', 4, 1),
(1153, 1153, 1152, 'SATA Cables', 'Electronics > Electronics Accessories > Cables > Storage Cables', 0, 1),
(1154, 1154, 1139, 'System & Power Cables', 'Electronics > Electronics Accessories > Cables', 0, 1),
(1155, 1155, 1139, 'Telephone Cables', 'Electronics > Electronics Accessories > Cables', 0, 1),
(1156, 1156, 1112, 'Electronics Cleaners', 'Electronics > Electronics Accessories', 2, 1),
(1157, 1157, 1156, 'Audio & Video Cleaners', 'Electronics > Electronics Accessories > Electronics Cleaners', 0, 1),
(1158, 1158, 1156, 'Camera Cleaners', 'Electronics > Electronics Accessories > Electronics Cleaners', 0, 1),
(1159, 1159, 1112, 'Memory', 'Electronics > Electronics Accessories', 5, 1),
(1160, 1160, 1159, 'Cache Memory', 'Electronics > Electronics Accessories > Memory', 0, 1),
(1161, 1161, 1159, 'Flash Memory', 'Electronics > Electronics Accessories > Memory', 1, 1),
(1162, 1162, 1161, 'Flash Memory Cards', 'Electronics > Electronics Accessories > Memory > Flash Memory', 0, 1),
(1163, 1163, 1159, 'RAM', 'Electronics > Electronics Accessories > Memory', 0, 1),
(1164, 1164, 1159, 'ROM', 'Electronics > Electronics Accessories > Memory', 0, 1),
(1165, 1165, 1159, 'Video Memory', 'Electronics > Electronics Accessories > Memory', 0, 1),
(1166, 1166, 1112, 'Memory Accessories', 'Electronics > Electronics Accessories', 1, 1),
(1167, 1167, 1166, 'Memory Cases', 'Electronics > Electronics Accessories > Memory Accessories', 0, 1),
(1168, 1168, 1112, 'Power', 'Electronics > Electronics Accessories', 9, 1),
(1169, 1169, 1168, 'Batteries', 'Electronics > Electronics Accessories > Power', 7, 1),
(1170, 1170, 1169, 'Camera Batteries', 'Electronics > Electronics Accessories > Power > Batteries', 0, 1),
(1171, 1171, 1169, 'Cordless Phone Batteries', 'Electronics > Electronics Accessories > Power > Batteries', 0, 1),
(1172, 1172, 1169, 'Laptop Batteries', 'Electronics > Electronics Accessories > Power > Batteries', 0, 1),
(1173, 1173, 1169, 'Mobile Phone Batteries', 'Electronics > Electronics Accessories > Power > Batteries', 0, 1),
(1174, 1174, 1169, 'Multipurpose Batteries', 'Electronics > Electronics Accessories > Power > Batteries', 0, 1),
(1175, 1175, 1169, 'PDA Batteries', 'Electronics > Electronics Accessories > Power > Batteries', 0, 1),
(1176, 1176, 1169, 'Video Camera Batteries', 'Electronics > Electronics Accessories > Power > Batteries', 0, 1),
(1177, 1177, 1168, 'Chargers', 'Electronics > Electronics Accessories > Power', 7, 1),
(1178, 1178, 1177, 'Camera Battery Chargers', 'Electronics > Electronics Accessories > Power > Chargers', 0, 1),
(1179, 1179, 1177, 'E-book Reader Chargers', 'Electronics > Electronics Accessories > Power > Chargers', 0, 1),
(1180, 1180, 1177, 'MP3 Player Chargers', 'Electronics > Electronics Accessories > Power > Chargers', 0, 1),
(1181, 1181, 1177, 'Mobile Phone Chargers', 'Electronics > Electronics Accessories > Power > Chargers', 0, 1),
(1182, 1182, 1177, 'PDA Chargers', 'Electronics > Electronics Accessories > Power > Chargers', 0, 1),
(1183, 1183, 1177, 'Solar Chargers', 'Electronics > Electronics Accessories > Power > Chargers', 0, 1),
(1185, 1185, 1168, 'Power Enclosures', 'Electronics > Electronics Accessories > Power', 0, 1),
(1186, 1186, 1168, 'Power Inverters', 'Electronics > Electronics Accessories > Power', 0, 1),
(1187, 1187, 1168, 'Surge Protection Devices', 'Electronics > Electronics Accessories > Power', 0, 1),
(1188, 1188, 1168, 'UPS', 'Electronics > Electronics Accessories > Power', 0, 1),
(1189, 1189, 1168, 'UPS Accessories', 'Electronics > Electronics Accessories > Power', 0, 1),
(1190, 1190, 1112, 'Remote Controls', 'Electronics > Electronics Accessories', 0, 1),
(1191, 1191, 906, 'GPS', 'Electronics', 3, 1),
(1192, 1192, 1191, 'Automotive GPS', 'Electronics > GPS', 0, 1),
(1193, 1193, 1191, 'Aviation GPS', 'Electronics > GPS', 0, 1),
(1194, 1194, 1191, 'Sport GPS', 'Electronics > GPS', 0, 1),
(1195, 1195, 906, 'GPS Accessories', 'Electronics', 1, 1),
(1196, 1196, 1195, 'GPS Cases', 'Electronics > GPS Accessories', 0, 1),
(1197, 1197, 906, 'Marine Electronics', 'Electronics', 4, 1),
(1198, 1198, 1197, 'Fish Finders', 'Electronics > Marine Electronics', 0, 1),
(1199, 1199, 1197, 'Marine Chartplotters & GPS', 'Electronics > Marine Electronics', 0, 1),
(1200, 1200, 1197, 'Marine Radar', 'Electronics > Marine Electronics', 0, 1),
(1201, 1201, 1197, 'Marine Radios', 'Electronics > Marine Electronics', 0, 1),
(1202, 1202, 906, 'Networking', 'Electronics', 9, 1),
(1203, 1203, 1202, 'Bridges & Routers', 'Electronics > Networking', 6, 1),
(1206, 1206, 1202, 'Concentrators & Multiplexers', 'Electronics > Networking', 0, 1),
(1207, 1207, 1202, 'Hubs & Switches', 'Electronics > Networking', 0, 1),
(1208, 1208, 1202, 'Media Converters', 'Electronics > Networking', 0, 1),
(1209, 1209, 1202, 'Modems', 'Electronics > Networking', 0, 1),
(1210, 1210, 1202, 'Network Cards', 'Electronics > Networking', 1, 1),
(1211, 1211, 1210, 'XBox 360 Network Cards', 'Electronics > Networking > Network Cards', 0, 1),
(1212, 1212, 1202, 'Network Security & Firewall Devices', 'Electronics > Networking', 0, 1),
(1213, 1213, 1202, 'Print Servers', 'Electronics > Networking', 0, 1),
(1214, 1214, 1202, 'Repeaters & Transceivers', 'Electronics > Networking', 0, 1),
(1215, 1215, 906, 'Print, Copy, Scan & Fax', 'Electronics', 3, 1),
(1216, 1216, 1215, 'Fax Machines', 'Electronics > Print, Copy, Scan & Fax', 0, 1),
(1217, 1217, 1215, 'Printers & Copiers', 'Electronics > Print, Copy, Scan & Fax', 2, 1),
(1218, 1218, 1217, 'Copiers', 'Electronics > Print, Copy, Scan & Fax > Printers & Copiers', 0, 1),
(1219, 1219, 1217, 'Printers', 'Electronics > Print, Copy, Scan & Fax > Printers & Copiers', 4, 1),
(1220, 1220, 1219, 'Dot Matrix Printers', 'Electronics > Print, Copy, Scan & Fax > Printers & Copiers > Printers', 0, 1),
(1221, 1221, 1219, 'Inkjet Printers', 'Electronics > Print, Copy, Scan & Fax > Printers & Copiers > Printers', 0, 1),
(1222, 1222, 1219, 'Laser Printers', 'Electronics > Print, Copy, Scan & Fax > Printers & Copiers > Printers', 0, 1),
(1223, 1223, 1219, 'Photo Printers', 'Electronics > Print, Copy, Scan & Fax > Printers & Copiers > Printers', 0, 1),
(1224, 1224, 1215, 'Scanners', 'Electronics > Print, Copy, Scan & Fax', 0, 1),
(1225, 1225, 906, 'Print, Copy, Scan & Fax Accessories', 'Electronics', 3, 1),
(1226, 1226, 1225, 'Copier Accessories', 'Electronics > Print, Copy, Scan & Fax Accessories', 0, 1),
(1227, 1227, 1225, 'Printer Accessories', 'Electronics > Print, Copy, Scan & Fax Accessories', 6, 1),
(1228, 1228, 1227, 'Printer Consumables', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories', 4, 1),
(1229, 1229, 1228, 'Printer Filters', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories > Printer Consumables', 0, 1),
(1230, 1230, 1228, 'Printer Ribbons', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories > Printer Consumables', 0, 1),
(1231, 1231, 1228, 'Printheads', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories > Printer Consumables', 0, 1),
(1232, 1232, 1228, 'Toner & Inkjet Cartridges', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories > Printer Consumables', 2, 1),
(1233, 1233, 1232, 'Oil Rollers', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories > Printer Consumables > Toner & Inkjet Cartridges', 0, 1),
(1234, 1234, 1232, 'Printer Drum Kits', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories > Printer Consumables > Toner & Inkjet Cartridges', 0, 1),
(1235, 1235, 1227, 'Printer Duplexers', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories', 0, 1),
(1236, 1236, 1227, 'Printer Maintenance Kits', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories', 0, 1),
(1237, 1237, 1227, 'Printer Memory', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories', 0, 1),
(1238, 1238, 1227, 'Printer Trays', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories', 0, 1),
(1239, 1239, 1225, 'Scanner Accessories', 'Electronics > Print, Copy, Scan & Fax Accessories', 0, 1),
(1240, 1240, 906, 'Toll Collection Devices', 'Electronics', 0, 1),
(1241, 1241, 906, 'Video', 'Electronics', 10, 1),
(1242, 1242, 1241, 'Computer Monitors', 'Electronics > Video', 0, 1),
(1243, 1243, 1241, 'Projectors', 'Electronics > Video', 3, 1),
(1244, 1244, 1243, 'Multimedia Projectors', 'Electronics > Video > Projectors', 0, 1),
(1245, 1245, 1243, 'Overhead Projectors', 'Electronics > Video > Projectors', 0, 1),
(1246, 1246, 1243, 'Slide Projectors', 'Electronics > Video > Projectors', 0, 1),
(1247, 1247, 1241, 'Televisions', 'Electronics > Video', 4, 1),
(1248, 1248, 1247, 'CRT Televisions', 'Electronics > Video > Televisions', 0, 1),
(1249, 1249, 1247, 'Flat Panel Televisions', 'Electronics > Video > Televisions', 0, 1),
(1250, 1250, 1247, 'Portable Televisions', 'Electronics > Video > Televisions', 0, 1),
(1251, 1251, 1247, 'Projection Televisions', 'Electronics > Video > Televisions', 0, 1),
(1252, 1252, 1241, 'Video Accessories', 'Electronics > Video', 5, 1),
(1253, 1253, 1252, '3D Glasses', 'Electronics > Video > Video Accessories', 0, 1),
(1254, 1254, 1252, 'Computer Monitor Accessories', 'Electronics > Video > Video Accessories', 0, 1),
(1255, 1255, 1252, 'Projector Accessories', 'Electronics > Video > Video Accessories', 4, 1),
(1256, 1256, 1255, 'Projection Screen Stands', 'Electronics > Video > Video Accessories > Projector Accessories', 0, 1),
(1257, 1257, 1255, 'Projection Screens', 'Electronics > Video > Video Accessories > Projector Accessories', 0, 1),
(1258, 1258, 1255, 'Projector Mounts', 'Electronics > Video > Video Accessories > Projector Accessories', 0, 1),
(1259, 1259, 1255, 'Projector Replacement Lamps', 'Electronics > Video > Video Accessories > Projector Accessories', 0, 1),
(1260, 1260, 1252, 'Rewinders', 'Electronics > Video > Video Accessories', 0, 1),
(1261, 1261, 1252, 'Television Accessories', 'Electronics > Video > Video Accessories', 4, 1),
(1263, 1263, 1241, 'Video Editing Hardware & Production Equipment', 'Electronics > Video', 0, 1),
(1264, 1264, 1241, 'Video Multiplexers', 'Electronics > Video', 0, 1),
(1265, 1265, 1241, 'Video Players & Recorders', 'Electronics > Video', 5, 1),
(1266, 1266, 1265, 'DVD Players', 'Electronics > Video > Video Players & Recorders', 2, 1),
(1267, 1267, 1266, 'Blu-Ray Players', 'Electronics > Video > Video Players & Recorders > DVD Players', 0, 1),
(1268, 1268, 1266, 'HD-DVD Players', 'Electronics > Video > Video Players & Recorders > DVD Players', 0, 1),
(1269, 1269, 1265, 'DVD Recorders', 'Electronics > Video > Video Players & Recorders', 2, 1),
(1270, 1270, 1269, 'Blu-Ray Recorders', 'Electronics > Video > Video Players & Recorders > DVD Recorders', 0, 1),
(1271, 1271, 1269, 'HD-DVD Recorders', 'Electronics > Video > Video Players & Recorders > DVD Recorders', 0, 1),
(1272, 1272, 1265, 'Digital Video Recorders', 'Electronics > Video > Video Players & Recorders', 0, 1),
(1273, 1273, 1265, 'Home Media Players', 'Electronics > Video > Video Players & Recorders', 0, 1),
(1274, 1274, 1265, 'VCRs', 'Electronics > Video > Video Players & Recorders', 0, 1),
(1275, 1275, 1241, 'Video Receivers', 'Electronics > Video', 1, 1),
(1276, 1276, 1275, 'Satellite Receivers', 'Electronics > Video > Video Receivers', 0, 1),
(1277, 1277, 1241, 'Video Servers', 'Electronics > Video', 0, 1),
(1278, 1278, 906, 'Video Game Console Accessories', 'Electronics', 2, 1),
(1279, 1279, 1278, 'Home Game Console Accessories', 'Electronics > Video Game Console Accessories', 14, 1),
(1280, 1280, 1279, 'All PlayStation Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 3, 1),
(1281, 1281, 1280, 'PlayStation (original) Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories > All PlayStation Accessories', 0, 1),
(1282, 1282, 1280, 'PlayStation 2 Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories > All PlayStation Accessories', 0, 1),
(1283, 1283, 1280, 'PlayStation 3 Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories > All PlayStation Accessories', 0, 1),
(1284, 1284, 1279, 'All XBox Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 2, 1),
(1285, 1285, 1284, 'XBox (original) Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories > All XBox Accessories', 0, 1),
(1286, 1286, 1284, 'XBox 360 Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories > All XBox Accessories', 0, 1),
(1287, 1287, 1279, 'Dreamcast Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1288, 1288, 1279, 'GameCube Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1289, 1289, 1279, 'Jaguar Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1290, 1290, 1279, 'Neo Geo Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1291, 1291, 1279, 'Nintendo 64 Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1292, 1292, 1279, 'Nintendo Entertainment System Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1293, 1293, 1279, 'Sega Genesis Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1294, 1294, 1279, 'Sega Master System Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1295, 1295, 1279, 'Super Nintendo Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1296, 1296, 1279, 'Turbografx 16 Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1297, 1297, 1279, 'Wii Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1298, 1298, 1279, 'Wii U Accessories', 'Electronics > Video Game Console Accessories > Home Game Console Accessories', 0, 1),
(1299, 1299, 1278, 'Portable Game Console Accessories', 'Electronics > Video Game Console Accessories', 8, 1),
(1300, 1300, 1299, 'All Game Boy Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 2, 1),
(1301, 1301, 1300, 'Game Boy Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories > All Game Boy Accessories', 0, 1),
(1302, 1302, 1300, 'Game Boy Advance Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories > All Game Boy Accessories', 0, 1),
(1303, 1303, 1299, 'Atari Lynx Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 0, 1),
(1304, 1304, 1299, 'Game Gear Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 0, 1),
(1305, 1305, 1299, 'N-Gage Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 0, 1),
(1306, 1306, 1299, 'Neo Geo Pocket Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 0, 1),
(1307, 1307, 1299, 'Nintendo DS Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 0, 1),
(1308, 1308, 1299, 'PlayStation Portable Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 0, 1),
(1309, 1309, 1299, 'PlayStation Vita Accessories', 'Electronics > Video Game Console Accessories > Portable Game Console Accessories', 0, 1),
(1310, 1310, 906, 'Video Game Consoles', 'Electronics', 2, 1),
(1311, 1311, 1310, 'Home Game Consoles', 'Electronics > Video Game Consoles', 17, 1),
(1312, 1312, 1311, 'Dreamcast', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1313, 1313, 1311, 'GameCube', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1314, 1314, 1311, 'Jaguar', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1315, 1315, 1311, 'Neo Geo', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1316, 1316, 1311, 'Nintendo 64', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1317, 1317, 1311, 'Nintendo Entertainment System', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1318, 1318, 1311, 'PlayStation (original)', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1319, 1319, 1311, 'PlayStation 2', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1320, 1320, 1311, 'PlayStation 3', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1321, 1321, 1311, 'Sega Genesis', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1322, 1322, 1311, 'Sega Master System', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1323, 1323, 1311, 'Super Nintendo', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1324, 1324, 1311, 'Turbografx 16', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1325, 1325, 1311, 'Wii', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1326, 1326, 1311, 'Wii U', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1327, 1327, 1311, 'XBox (original)', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1328, 1328, 1311, 'XBox 360', 'Electronics > Video Game Consoles > Home Game Consoles', 0, 1),
(1329, 1329, 1310, 'Portable Game Consoles', 'Electronics > Video Game Consoles', 11, 1),
(1330, 1330, 1329, 'All Game Boy Consoles', 'Electronics > Video Game Consoles > Portable Game Consoles', 2, 1),
(1331, 1331, 1330, 'Game Boy', 'Electronics > Video Game Consoles > Portable Game Consoles > All Game Boy Consoles', 0, 1),
(1332, 1332, 1330, 'Game Boy Advance', 'Electronics > Video Game Consoles > Portable Game Consoles > All Game Boy Consoles', 0, 1),
(1333, 1333, 1329, 'Atari Lynx', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1334, 1334, 1329, 'Game Gear', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1335, 1335, 1329, 'N-Gage', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1336, 1336, 1329, 'Neo Geo Pocket', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1337, 1337, 1329, 'Nintendo DS', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1338, 1338, 1329, 'Nintendo DS3', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1339, 1339, 1329, 'PlayStation Portable', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1340, 1340, 1329, 'PlayStation Vita', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1341, 1341, 1329, 'Retrogen', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(1342, 1342, 0, 'Food, Beverages & Tobacco', '', 3, 1),
(1343, 1343, 1342, 'Beverages', 'Food, Beverages & Tobacco', 11, 1),
(1344, 1344, 1343, 'Beer', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1345, 1345, 1343, 'Cocoa', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1346, 1346, 1343, 'Coffee', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1347, 1347, 1343, 'Drink Powders', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1348, 1348, 1343, 'Juice', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1349, 1349, 1343, 'Liquor & Spirits', 'Food, Beverages & Tobacco > Beverages', 8, 1),
(1350, 1350, 1349, 'Brandy', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 1, 1),
(1351, 1351, 1350, 'Cognac', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits > Brandy', 0, 1),
(1352, 1352, 1349, 'Gin', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 0, 1),
(1353, 1353, 1349, 'Liqueurs', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 0, 1),
(1354, 1354, 1349, 'Rum', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 0, 1),
(1355, 1355, 1349, 'Schnapps', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 0, 1),
(1356, 1356, 1349, 'Tequila', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 0, 1),
(1357, 1357, 1349, 'Vodka', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 0, 1),
(1358, 1358, 1349, 'Whiskey', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits', 3, 1),
(1359, 1359, 1358, 'American Whiskey', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits > Whiskey', 0, 1),
(1360, 1360, 1358, 'Irish Whiskey', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits > Whiskey', 0, 1),
(1361, 1361, 1358, 'Scotch Whiskey', 'Food, Beverages & Tobacco > Beverages > Liquor & Spirits > Whiskey', 0, 1),
(1362, 1362, 1343, 'Milk', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1363, 1363, 1343, 'Soda Pop', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1364, 1364, 1343, 'Tea & Infusions', 'Food, Beverages & Tobacco > Beverages', 0, 1),
(1365, 1365, 1343, 'Water', 'Food, Beverages & Tobacco > Beverages', 2, 1),
(1368, 1368, 1343, 'Wine', 'Food, Beverages & Tobacco > Beverages', 3, 1),
(1369, 1369, 1368, 'Dessert Wine', 'Food, Beverages & Tobacco > Beverages > Wine', 3, 1),
(1370, 1370, 1369, 'Port', 'Food, Beverages & Tobacco > Beverages > Wine > Dessert Wine', 0, 1),
(1371, 1371, 1369, 'Sherry', 'Food, Beverages & Tobacco > Beverages > Wine > Dessert Wine', 0, 1),
(1372, 1372, 1369, 'Vermouth', 'Food, Beverages & Tobacco > Beverages > Wine > Dessert Wine', 0, 1),
(1373, 1373, 1368, 'Rice Wine', 'Food, Beverages & Tobacco > Beverages > Wine', 0, 1),
(1374, 1374, 1368, 'Sparkling Wine', 'Food, Beverages & Tobacco > Beverages > Wine', 0, 1),
(1375, 1375, 1342, 'Food Items', 'Food, Beverages & Tobacco', 16, 1),
(1376, 1376, 1375, 'Appetizers & Snacks', 'Food, Beverages & Tobacco > Food Items', 7, 1),
(1377, 1377, 1376, 'Chips', 'Food, Beverages & Tobacco > Food Items > Appetizers & Snacks', 0, 1),
(1378, 1378, 1376, 'Crackers', 'Food, Beverages & Tobacco > Food Items > Appetizers & Snacks', 0, 1),
(1379, 1379, 1376, 'Jerky', 'Food, Beverages & Tobacco > Food Items > Appetizers & Snacks', 0, 1),
(1380, 1380, 1376, 'Popcorn & Popcorn Cakes', 'Food, Beverages & Tobacco > Food Items > Appetizers & Snacks', 0, 1),
(1381, 1381, 1376, 'Pretzels', 'Food, Beverages & Tobacco > Food Items > Appetizers & Snacks', 0, 1),
(1382, 1382, 1376, 'Rice Cakes', 'Food, Beverages & Tobacco > Food Items > Appetizers & Snacks', 0, 1),
(1383, 1383, 1376, 'Soy Cakes', 'Food, Beverages & Tobacco > Food Items > Appetizers & Snacks', 0, 1),
(1384, 1384, 1375, 'Baked Goods', 'Food, Beverages & Tobacco > Food Items', 6, 1),
(1385, 1385, 1384, 'Bagels', 'Food, Beverages & Tobacco > Food Items > Baked Goods', 0, 1),
(1386, 1386, 1384, 'Breads & Buns', 'Food, Beverages & Tobacco > Food Items > Baked Goods', 0, 1),
(1387, 1387, 1384, 'Cakes & Brownies', 'Food, Beverages & Tobacco > Food Items > Baked Goods', 0, 1),
(1388, 1388, 1384, 'Cookies', 'Food, Beverages & Tobacco > Food Items > Baked Goods', 0, 1),
(1389, 1389, 1384, 'Fudge', 'Food, Beverages & Tobacco > Food Items > Baked Goods', 0, 1),
(1390, 1390, 1384, 'Muffins', 'Food, Beverages & Tobacco > Food Items > Baked Goods', 0, 1),
(1391, 1391, 1375, 'Candy, Sweets & Gum', 'Food, Beverages & Tobacco > Food Items', 2, 1),
(1392, 1392, 1391, 'Candy & Chocolate', 'Food, Beverages & Tobacco > Food Items > Candy, Sweets & Gum', 3, 1),
(1393, 1393, 1392, 'Candy Bars & Miniatures', 'Food, Beverages & Tobacco > Food Items > Candy, Sweets & Gum > Candy & Chocolate', 0, 1),
(1394, 1394, 1392, 'Gummy Candies', 'Food, Beverages & Tobacco > Food Items > Candy, Sweets & Gum > Candy & Chocolate', 0, 1),
(1395, 1395, 1392, 'Jelly Beans', 'Food, Beverages & Tobacco > Food Items > Candy, Sweets & Gum > Candy & Chocolate', 0, 1),
(1396, 1396, 1391, 'Chewing Gum', 'Food, Beverages & Tobacco > Food Items > Candy, Sweets & Gum', 0, 1),
(1397, 1397, 1375, 'Canned & Packaged Goods', 'Food, Beverages & Tobacco > Food Items', 0, 1),
(1398, 1398, 1375, 'Condiments & Sauces', 'Food, Beverages & Tobacco > Food Items', 19, 1),
(1399, 1399, 1398, 'Barbecue Sauce', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1400, 1400, 1398, 'Bean Pastes & Sauces', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1401, 1401, 1398, 'Coffee Creamer', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1402, 1402, 1398, 'Honey', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1403, 1403, 1398, 'Hot Sauce', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1404, 1404, 1398, 'Jams & Jellies', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1405, 1405, 1398, 'Ketchup', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1406, 1406, 1398, 'Mayonnaise', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1407, 1407, 1398, 'Mustard', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1408, 1408, 1398, 'Nut Butters', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 2, 1),
(1409, 1409, 1408, 'Almond Butter', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces > Nut Butters', 0, 1),
(1410, 1410, 1408, 'Peanut Butter', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces > Nut Butters', 0, 1),
(1411, 1411, 1398, 'Salad Dressings & Toppers', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1412, 1412, 1398, 'Salsa', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1413, 1413, 1398, 'Satay Sauce', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1414, 1414, 1398, 'Soy Sauce', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1415, 1415, 1398, 'Steak Sauce', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1416, 1416, 1398, 'Sweet Bean Sauce', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1417, 1417, 1398, 'Syrup', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 4, 1),
(1418, 1418, 1417, 'Agave Syrup', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces > Syrup', 0, 1),
(1419, 1419, 1417, 'Flavored Syrup', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces > Syrup', 0, 1),
(1420, 1420, 1417, 'Maple Syrup', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces > Syrup', 0, 1),
(1421, 1421, 1417, 'Snow Cone Syrup', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces > Syrup', 0, 1),
(1422, 1422, 1398, 'Tahini', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1423, 1423, 1398, 'Vinegar', 'Food, Beverages & Tobacco > Food Items > Condiments & Sauces', 0, 1),
(1424, 1424, 1375, 'Cooking & Baking Supplies', 'Food, Beverages & Tobacco > Food Items', 8, 1),
(1425, 1425, 1424, 'Artificial Sweeteners', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 0, 1),
(1426, 1426, 1424, 'Baking Mixes', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 0, 1),
(1427, 1427, 1424, 'Baking Powder', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 0, 1),
(1428, 1428, 1424, 'Cooking Oils', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 6, 1),
(1429, 1429, 1428, 'Canola Oil', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies > Cooking Oils', 0, 1),
(1430, 1430, 1428, 'Olive Oil', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies > Cooking Oils', 0, 1),
(1431, 1431, 1428, 'Peanut Oil', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies > Cooking Oils', 0, 1),
(1432, 1432, 1428, 'Rice Oil', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies > Cooking Oils', 0, 1),
(1433, 1433, 1428, 'Soybean Oil', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies > Cooking Oils', 0, 1),
(1434, 1434, 1428, 'Vegetable Oil', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies > Cooking Oils', 0, 1),
(1435, 1435, 1424, 'Floss Sugar', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 0, 1),
(1436, 1436, 1424, 'Flour', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 0, 1),
(1437, 1437, 1424, 'Sugar', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 0, 1),
(1438, 1438, 1424, 'Yeast', 'Food, Beverages & Tobacco > Food Items > Cooking & Baking Supplies', 0, 1),
(1439, 1439, 1375, 'Dairy Products', 'Food, Beverages & Tobacco > Food Items', 4, 1),
(1440, 1440, 1439, 'Cheese', 'Food, Beverages & Tobacco > Food Items > Dairy Products', 0, 1),
(1441, 1441, 1439, 'Cottage Cheese', 'Food, Beverages & Tobacco > Food Items > Dairy Products', 0, 1),
(1442, 1442, 1439, 'Ice Cream', 'Food, Beverages & Tobacco > Food Items > Dairy Products', 0, 1),
(1443, 1443, 1439, 'Yogurt', 'Food, Beverages & Tobacco > Food Items > Dairy Products', 0, 1),
(1444, 1444, 1375, 'Food Gift Baskets', 'Food, Beverages & Tobacco > Food Items', 0, 1),
(1445, 1445, 1375, 'Frozen Meals & Appetizers', 'Food, Beverages & Tobacco > Food Items', 0, 1),
(1446, 1446, 1375, 'Fruits & Vegetables', 'Food, Beverages & Tobacco > Food Items', 1, 1),
(1447, 1447, 1446, 'Dried Fruits', 'Food, Beverages & Tobacco > Food Items > Fruits & Vegetables', 0, 1),
(1448, 1448, 1375, 'Grains, Rice & Cereals', 'Food, Beverages & Tobacco > Food Items', 9, 1),
(1449, 1449, 1448, 'Amaranth', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1450, 1450, 1448, 'Barley', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1451, 1451, 1448, 'Breakfast Cereal', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1452, 1452, 1448, 'Buckwheat', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1453, 1453, 1448, 'Cornmeal', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1454, 1454, 1448, 'Millet', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1455, 1455, 1448, 'Oats, Grits & Oatmeal', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1456, 1456, 1448, 'Rice', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1457, 1457, 1448, 'Wheat', 'Food, Beverages & Tobacco > Food Items > Grains, Rice & Cereals', 0, 1),
(1458, 1458, 1375, 'Meat, Seafood & Eggs', 'Food, Beverages & Tobacco > Food Items', 3, 1),
(1459, 1459, 1458, 'Eggs', 'Food, Beverages & Tobacco > Food Items > Meat, Seafood & Eggs', 0, 1),
(1460, 1460, 1458, 'Meat', 'Food, Beverages & Tobacco > Food Items > Meat, Seafood & Eggs', 0, 1),
(1461, 1461, 1458, 'Seafood', 'Food, Beverages & Tobacco > Food Items > Meat, Seafood & Eggs', 0, 1),
(1462, 1462, 1375, 'Nuts & Seeds', 'Food, Beverages & Tobacco > Food Items', 11, 1),
(1463, 1463, 1462, 'Almonds', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1464, 1464, 1462, 'Cashews', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1465, 1465, 1462, 'Hazelnuts', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1466, 1466, 1462, 'Macadamia Nuts', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1467, 1467, 1462, 'Peanuts', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1468, 1468, 1462, 'Pine Nuts', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1469, 1469, 1462, 'Pistachios', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1470, 1470, 1462, 'Pumpkin Seeds', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1471, 1471, 1462, 'Sesame Seeds', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1472, 1472, 1462, 'Sunflower Seeds', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1473, 1473, 1462, 'Walnuts', 'Food, Beverages & Tobacco > Food Items > Nuts & Seeds', 0, 1),
(1474, 1474, 1375, 'Pasta & Noodles', 'Food, Beverages & Tobacco > Food Items', 0, 1),
(1475, 1475, 1375, 'Seasonings & Spices', 'Food, Beverages & Tobacco > Food Items', 3, 1),
(1476, 1476, 1475, 'Herbs & Spices', 'Food, Beverages & Tobacco > Food Items > Seasonings & Spices', 0, 1),
(1477, 1477, 1475, 'MSG', 'Food, Beverages & Tobacco > Food Items > Seasonings & Spices', 0, 1),
(1478, 1478, 1475, 'Salt', 'Food, Beverages & Tobacco > Food Items > Seasonings & Spices', 0, 1),
(1479, 1479, 1375, 'Soups & Broths', 'Food, Beverages & Tobacco > Food Items', 0, 1),
(1480, 1480, 1342, 'Tobacco Products', 'Food, Beverages & Tobacco', 5, 1),
(1481, 1481, 1480, 'Chewing Tobacco', 'Food, Beverages & Tobacco > Tobacco Products', 0, 1),
(1482, 1482, 1480, 'Cigarettes', 'Food, Beverages & Tobacco > Tobacco Products', 0, 1),
(1483, 1483, 1480, 'Cigars', 'Food, Beverages & Tobacco > Tobacco Products', 0, 1),
(1484, 1484, 1480, 'Electronic Cigarettes', 'Food, Beverages & Tobacco > Tobacco Products', 0, 1),
(1485, 1485, 1480, 'Loose Tobacco', 'Food, Beverages & Tobacco > Tobacco Products', 0, 1),
(1486, 1486, 0, 'Furniture', '', 18, 1),
(1487, 1487, 1486, 'Baby & Toddler Furniture', 'Furniture', 4, 1),
(1488, 1488, 1487, 'Bassinets', 'Furniture > Baby & Toddler Furniture', 0, 1),
(1489, 1489, 1487, 'Beds, Cribs & Cradles', 'Furniture > Baby & Toddler Furniture', 0, 1),
(1490, 1490, 1487, 'Changing Tables', 'Furniture > Baby & Toddler Furniture', 0, 1),
(1491, 1491, 1487, 'High Chairs & Boosters', 'Furniture > Baby & Toddler Furniture', 0, 1),
(1492, 1492, 1486, 'Bean Bags', 'Furniture', 0, 1),
(1493, 1493, 1486, 'Bedroom Furniture', 'Furniture', 10, 1),
(1494, 1494, 1493, 'Armoires', 'Furniture > Bedroom Furniture', 0, 1),
(1495, 1495, 1493, 'Bed Accessories', 'Furniture > Bedroom Furniture', 1, 1),
(1496, 1496, 1495, 'Waterbed Accessories', 'Furniture > Bedroom Furniture > Bed Accessories', 0, 1),
(1497, 1497, 1493, 'Bed Frames', 'Furniture > Bedroom Furniture', 0, 1),
(1498, 1498, 1493, 'Beds', 'Furniture > Bedroom Furniture', 0, 1),
(1499, 1499, 1493, 'Box Springs', 'Furniture > Bedroom Furniture', 0, 1),
(1500, 1500, 1493, 'Dressers', 'Furniture > Bedroom Furniture', 0, 1),
(1501, 1501, 1493, 'Headboards & Footboards', 'Furniture > Bedroom Furniture', 0, 1),
(1502, 1502, 1493, 'Mattresses', 'Furniture > Bedroom Furniture', 1, 1),
(1503, 1503, 1502, 'Waterbeds', 'Furniture > Bedroom Furniture > Mattresses', 0, 1),
(1504, 1504, 1493, 'Nightstands', 'Furniture > Bedroom Furniture', 0, 1),
(1505, 1505, 1493, 'Storage Chests', 'Furniture > Bedroom Furniture', 1, 1),
(1506, 1506, 1505, 'Toy Chests', 'Furniture > Bedroom Furniture > Storage Chests', 0, 1),
(1507, 1507, 1486, 'Benches', 'Furniture', 3, 1),
(1508, 1508, 1507, 'Outdoor Benches', 'Furniture > Benches', 0, 1),
(1509, 1509, 1507, 'Storage Benches', 'Furniture > Benches', 0, 1),
(1510, 1510, 1507, 'Vanity Benches', 'Furniture > Benches', 0, 1),
(1511, 1511, 1486, 'Carts', 'Furniture', 2, 1),
(1512, 1512, 1511, 'Audio & Video Carts', 'Furniture > Carts', 0, 1),
(1513, 1513, 1511, 'Kitchen Carts', 'Furniture > Carts', 0, 1),
(1514, 1514, 1486, 'Chairs', 'Furniture', 8, 1),
(1515, 1515, 1514, 'Bar Stools', 'Furniture > Chairs', 0, 1),
(1516, 1516, 1514, 'Chaises', 'Furniture > Chairs', 0, 1),
(1517, 1517, 1514, 'Club Chairs', 'Furniture > Chairs', 0, 1),
(1518, 1518, 1514, 'Living Room Chairs', 'Furniture > Chairs', 2, 1),
(1519, 1519, 1518, 'Accent Chairs', 'Furniture > Chairs > Living Room Chairs', 0, 1),
(1520, 1520, 1518, 'Recliners', 'Furniture > Chairs > Living Room Chairs', 0, 1),
(1521, 1521, 1514, 'Office Chairs', 'Furniture > Chairs', 0, 1),
(1522, 1522, 1514, 'Outdoor Chairs', 'Furniture > Chairs', 3, 1),
(1523, 1523, 1522, 'Adirondack Chairs', 'Furniture > Chairs > Outdoor Chairs', 0, 1),
(1524, 1524, 1522, 'Beach & Deck Chairs', 'Furniture > Chairs > Outdoor Chairs', 0, 1),
(1525, 1525, 1522, 'Sunloungers', 'Furniture > Chairs > Outdoor Chairs', 0, 1),
(1526, 1526, 1514, 'Rocking Chairs', 'Furniture > Chairs', 0, 1),
(1527, 1527, 1514, 'Sleeper Chairs', 'Furniture > Chairs', 0, 1),
(1528, 1528, 1486, 'Desks & Tables', 'Furniture', 8, 1),
(1529, 1529, 1528, 'Art Tables', 'Furniture > Desks & Tables', 1, 1),
(1530, 1530, 1529, 'Drafting Tables', 'Furniture > Desks & Tables > Art Tables', 0, 1),
(1531, 1531, 1528, 'Conference Room Tables', 'Furniture > Desks & Tables', 0, 1),
(1532, 1532, 1528, 'Desks', 'Furniture > Desks & Tables', 0, 1),
(1533, 1533, 1528, 'Folding Tables', 'Furniture > Desks & Tables', 0, 1),
(1534, 1534, 1528, 'Kitchen & Dining Room Tables', 'Furniture > Desks & Tables', 0, 1),
(1535, 1535, 1528, 'Living Room Tables', 'Furniture > Desks & Tables', 4, 1),
(1536, 1536, 1535, 'Coffee Tables', 'Furniture > Desks & Tables > Living Room Tables', 0, 1),
(1537, 1537, 1535, 'End Tables', 'Furniture > Desks & Tables > Living Room Tables', 0, 1),
(1538, 1538, 1535, 'Poker & Game Tables', 'Furniture > Desks & Tables > Living Room Tables', 0, 1),
(1539, 1539, 1535, 'Sofa Tables', 'Furniture > Desks & Tables > Living Room Tables', 0, 1),
(1540, 1540, 1528, 'Outdoor Tables', 'Furniture > Desks & Tables', 0, 1),
(1541, 1541, 1528, 'Sewing Machine Tables', 'Furniture > Desks & Tables', 0, 1),
(1542, 1542, 1486, 'Futon Pads', 'Furniture', 0, 1),
(1543, 1543, 1486, 'Futons', 'Furniture', 0, 1),
(1544, 1544, 1486, 'Hutches', 'Furniture', 0, 1),
(1545, 1545, 1486, 'Kitchen & Dining Room Furniture', 'Furniture', 2, 1),
(1546, 1546, 1545, 'Buffets & Sideboards', 'Furniture > Kitchen & Dining Room Furniture', 0, 1),
(1547, 1547, 1545, 'China Cabinets', 'Furniture > Kitchen & Dining Room Furniture', 0, 1),
(1548, 1548, 1486, 'Living Room Furniture', 'Furniture', 4, 1),
(1549, 1549, 1548, 'Entertainment & Media Centers', 'Furniture > Living Room Furniture', 0, 1),
(1550, 1550, 1548, 'Ottomans', 'Furniture > Living Room Furniture', 0, 1),
(1551, 1551, 1548, 'Racks & Stands', 'Furniture > Living Room Furniture', 0, 1),
(1552, 1552, 1548, 'Room Dividers', 'Furniture > Living Room Furniture', 0, 1),
(1553, 1553, 1486, 'Massage Furniture', 'Furniture', 3, 1),
(1554, 1554, 1553, 'Electric Massaging Chairs', 'Furniture > Massage Furniture', 0, 1),
(1555, 1555, 1553, 'Massage Chairs', 'Furniture > Massage Furniture', 0, 1),
(1556, 1556, 1553, 'Massage Tables', 'Furniture > Massage Furniture', 0, 1),
(1557, 1557, 1486, 'Outdoor Furniture', 'Furniture', 0, 1),
(1558, 1558, 1486, 'Shelving', 'Furniture', 1, 1),
(1559, 1559, 1558, 'Bookcases', 'Furniture > Shelving', 0, 1),
(1560, 1560, 1486, 'Sofas', 'Furniture', 3, 1),
(1561, 1561, 1560, 'Loveseats', 'Furniture > Sofas', 0, 1),
(1562, 1562, 1560, 'Outdoor Sofas', 'Furniture > Sofas', 0, 1),
(1563, 1563, 1560, 'Sofabeds', 'Furniture > Sofas', 0, 1),
(1564, 1564, 1486, 'Vanities', 'Furniture', 1, 1),
(1565, 1565, 1564, 'Bathroom Vanities', 'Furniture > Vanities', 0, 1),
(1566, 1566, 1486, 'Wine Racks & Cellars', 'Furniture', 1, 1),
(1567, 1567, 1566, 'Wine Coolers', 'Furniture > Wine Racks & Cellars', 0, 1),
(1568, 1568, 0, 'Hardware', '', 17, 1),
(1569, 1569, 1568, 'Adhesives, Coatings & Sealants', 'Hardware', 6, 1),
(1570, 1570, 1569, 'Caulk', 'Hardware > Adhesives, Coatings & Sealants', 0, 1),
(1571, 1571, 1569, 'Cements', 'Hardware > Adhesives, Coatings & Sealants', 0, 1),
(1572, 1572, 1569, 'Coatings', 'Hardware > Adhesives, Coatings & Sealants', 0, 1),
(1573, 1573, 1569, 'Glues', 'Hardware > Adhesives, Coatings & Sealants', 6, 1),
(1574, 1574, 1573, 'Glue Gun Sticks', 'Hardware > Adhesives, Coatings & Sealants > Glues', 0, 1),
(1575, 1575, 1573, 'Glue Sticks', 'Hardware > Adhesives, Coatings & Sealants > Glues', 0, 1),
(1576, 1576, 1573, 'Rubber Cement', 'Hardware > Adhesives, Coatings & Sealants > Glues', 0, 1),
(1577, 1577, 1573, 'Super Glue', 'Hardware > Adhesives, Coatings & Sealants > Glues', 0, 1),
(1578, 1578, 1573, 'White Glue', 'Hardware > Adhesives, Coatings & Sealants > Glues', 0, 1),
(1579, 1579, 1573, 'Wood Glue', 'Hardware > Adhesives, Coatings & Sealants > Glues', 0, 1),
(1580, 1580, 1569, 'Joint Compounds', 'Hardware > Adhesives, Coatings & Sealants', 0, 1),
(1581, 1581, 1569, 'Sealants', 'Hardware > Adhesives, Coatings & Sealants', 0, 1),
(1582, 1582, 1568, 'Building Materials', 'Hardware', 6, 1),
(1583, 1583, 1582, 'Bricks, Stones & Concrete', 'Hardware > Building Materials', 0, 1),
(1584, 1584, 1582, 'Doors', 'Hardware > Building Materials', 3, 1),
(1585, 1585, 1584, 'Garage Doors', 'Hardware > Building Materials > Doors', 0, 1),
(1586, 1586, 1584, 'Home Doors', 'Hardware > Building Materials > Doors', 1, 1),
(1587, 1587, 1586, 'Screen Doors', 'Hardware > Building Materials > Doors > Home Doors', 0, 1),
(1588, 1588, 1584, 'Utility Doors', 'Hardware > Building Materials > Doors', 1, 1),
(1589, 1589, 1588, 'Pet Doors', 'Hardware > Building Materials > Doors > Utility Doors', 0, 1),
(1590, 1590, 1582, 'Glass', 'Hardware > Building Materials', 0, 1),
(1591, 1591, 1582, 'Hatches', 'Hardware > Building Materials', 0, 1),
(1592, 1592, 1582, 'Lumber', 'Hardware > Building Materials', 0, 1),
(1593, 1593, 1582, 'Windows', 'Hardware > Building Materials', 0, 1),
(1594, 1594, 1568, 'Chemicals', 'Hardware', 3, 1),
(1595, 1595, 1594, 'Acid Neutralizers', 'Hardware > Chemicals', 0, 1),
(1596, 1596, 1594, 'Chimney Cleaners', 'Hardware > Chemicals', 0, 1),
(1597, 1597, 1594, 'Drain Cleaners', 'Hardware > Chemicals', 0, 1),
(1598, 1598, 1568, 'Countertops', 'Hardware', 5, 1),
(1599, 1599, 1598, 'Ceramic & Porcelain Countertops', 'Hardware > Countertops', 0, 1),
(1600, 1600, 1598, 'Hardwood Countertops', 'Hardware > Countertops', 0, 1),
(1601, 1601, 1598, 'Laminate Countertops', 'Hardware > Countertops', 0, 1),
(1602, 1602, 1598, 'Stone Countertops', 'Hardware > Countertops', 3, 1),
(1603, 1603, 1602, 'Granite Countertops', 'Hardware > Countertops > Stone Countertops', 0, 1),
(1604, 1604, 1602, 'Marble Countertops', 'Hardware > Countertops > Stone Countertops', 0, 1),
(1605, 1605, 1602, 'Tile Countertops', 'Hardware > Countertops > Stone Countertops', 0, 1),
(1606, 1606, 1598, 'Vinyl Countertops', 'Hardware > Countertops', 0, 1),
(1607, 1607, 1568, 'Electrical Supplies', 'Hardware', 11, 1),
(1608, 1608, 1607, 'Electrical Wires', 'Hardware > Electrical Supplies', 0, 1),
(1609, 1609, 1607, 'Extension Cords', 'Hardware > Electrical Supplies', 0, 1),
(1610, 1610, 1607, 'Heat-Shrink Tubing', 'Hardware > Electrical Supplies', 0, 1),
(1611, 1611, 1607, 'Light Switches', 'Hardware > Electrical Supplies', 0, 1),
(1612, 1612, 1607, 'Mount Boxes & Brackets', 'Hardware > Electrical Supplies', 0, 1),
(1613, 1613, 1607, 'Wall Plates', 'Hardware > Electrical Supplies', 0, 1),
(1614, 1614, 1607, 'Wall Sockets', 'Hardware > Electrical Supplies', 0, 1),
(1615, 1615, 1607, 'Wire Binding Spools', 'Hardware > Electrical Supplies', 0, 1),
(1616, 1616, 1607, 'Wire Closers', 'Hardware > Electrical Supplies', 0, 1),
(1617, 1617, 1607, 'Wire Shelving', 'Hardware > Electrical Supplies', 0, 1),
(1618, 1618, 1607, 'Wiring Panels', 'Hardware > Electrical Supplies', 0, 1),
(1619, 1619, 1568, 'Flooring', 'Hardware', 6, 1),
(1620, 1620, 1619, 'Carpets', 'Hardware > Flooring', 0, 1),
(1621, 1621, 1619, 'Ceramic & Porcelain Flooring', 'Hardware > Flooring', 0, 1),
(1622, 1622, 1619, 'Hardwood Flooring', 'Hardware > Flooring', 0, 1),
(1623, 1623, 1619, 'Laminate Flooring', 'Hardware > Flooring', 0, 1),
(1624, 1624, 1619, 'Stone Flooring', 'Hardware > Flooring', 3, 1),
(1625, 1625, 1624, 'Granite Flooring', 'Hardware > Flooring > Stone Flooring', 0, 1),
(1626, 1626, 1624, 'Marble Flooring', 'Hardware > Flooring > Stone Flooring', 0, 1),
(1627, 1627, 1624, 'Tile Flooring', 'Hardware > Flooring > Stone Flooring', 0, 1),
(1628, 1628, 1619, 'Vinyl Flooring', 'Hardware > Flooring', 0, 1),
(1629, 1629, 1568, 'Hardware Accessories', 'Hardware', 24, 1),
(1630, 1630, 1629, 'Cabinet Hardware', 'Hardware > Hardware Accessories', 4, 1),
(1631, 1631, 1630, 'Cabinet Backplates', 'Hardware > Hardware Accessories > Cabinet Hardware', 0, 1),
(1632, 1632, 1630, 'Cabinet Catches', 'Hardware > Hardware Accessories > Cabinet Hardware', 0, 1),
(1633, 1633, 1630, 'Cabinet Doors', 'Hardware > Hardware Accessories > Cabinet Hardware', 0, 1),
(1634, 1634, 1630, 'Cabinet Knobs & Handles', 'Hardware > Hardware Accessories > Cabinet Hardware', 0, 1),
(1635, 1635, 1629, 'Chains', 'Hardware > Hardware Accessories', 0, 1),
(1636, 1636, 1629, 'Coils', 'Hardware > Hardware Accessories', 0, 1),
(1637, 1637, 1629, 'Controls', 'Hardware > Hardware Accessories', 3, 1),
(1638, 1638, 1637, 'Control Panels', 'Hardware > Hardware Accessories > Controls', 0, 1),
(1639, 1639, 1637, 'HVAC Controls', 'Hardware > Hardware Accessories > Controls', 0, 1),
(1640, 1640, 1637, 'Thermostats', 'Hardware > Hardware Accessories > Controls', 0, 1),
(1641, 1641, 1629, 'Door Knobs', 'Hardware > Hardware Accessories', 0, 1),
(1642, 1642, 1629, 'Drop Cloths', 'Hardware > Hardware Accessories', 0, 1),
(1643, 1643, 1629, 'Drywall Anchors', 'Hardware > Hardware Accessories', 0, 1),
(1644, 1644, 1629, 'Filters & Screens', 'Hardware > Hardware Accessories', 0, 1),
(1645, 1645, 1629, 'Hinges', 'Hardware > Hardware Accessories', 0, 1),
(1646, 1646, 1629, 'Latches', 'Hardware > Hardware Accessories', 0, 1),
(1647, 1647, 1629, 'Lubricants', 'Hardware > Hardware Accessories', 0, 1),
(1648, 1648, 1629, 'Nails', 'Hardware > Hardware Accessories', 0, 1),
(1649, 1649, 1629, 'Nuts & Bolts', 'Hardware > Hardware Accessories', 0, 1),
(1650, 1650, 1629, 'Pull Chains', 'Hardware > Hardware Accessories', 0, 1),
(1651, 1651, 1629, 'Rope', 'Hardware > Hardware Accessories', 0, 1),
(1652, 1652, 1629, 'Screw Posts', 'Hardware > Hardware Accessories', 0, 1),
(1653, 1653, 1629, 'Screws', 'Hardware > Hardware Accessories', 3, 1),
(1654, 1654, 1653, 'Drywall Screws', 'Hardware > Hardware Accessories > Screws', 0, 1),
(1655, 1655, 1653, 'Metal Screws', 'Hardware > Hardware Accessories > Screws', 0, 1),
(1656, 1656, 1653, 'Wood Screws', 'Hardware > Hardware Accessories > Screws', 0, 1),
(1657, 1657, 1629, 'Solder & Flux', 'Hardware > Hardware Accessories', 0, 1),
(1658, 1658, 1629, 'Tape', 'Hardware > Hardware Accessories', 8, 1),
(1659, 1659, 1658, 'Copper Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1660, 1660, 1658, 'Drywall Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1661, 1661, 1658, 'Duct Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1662, 1662, 1658, 'Electrical Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1663, 1663, 1658, 'Gaffers Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1664, 1664, 1658, 'Heat Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1665, 1665, 1658, 'Masking Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1666, 1666, 1658, 'Teflon Tape', 'Hardware > Hardware Accessories > Tape', 0, 1),
(1667, 1667, 1629, 'Tarps', 'Hardware > Hardware Accessories', 0, 1),
(1668, 1668, 1629, 'Tool Storage & Organization', 'Hardware > Hardware Accessories', 6, 1),
(1669, 1669, 1668, 'Garden Hose Storage', 'Hardware > Hardware Accessories > Tool Storage & Organization', 0, 1),
(1670, 1670, 1668, 'Tool & Duty Belts', 'Hardware > Hardware Accessories > Tool Storage & Organization', 0, 1),
(1671, 1671, 1668, 'Tool Boxes', 'Hardware > Hardware Accessories > Tool Storage & Organization', 0, 1),
(1672, 1672, 1668, 'Tool Cabinets', 'Hardware > Hardware Accessories > Tool Storage & Organization', 0, 1),
(1673, 1673, 1668, 'Tool Sheaths', 'Hardware > Hardware Accessories > Tool Storage & Organization', 0, 1),
(1674, 1674, 1668, 'Work Benches', 'Hardware > Hardware Accessories > Tool Storage & Organization', 0, 1),
(1675, 1675, 1629, 'Twine', 'Hardware > Hardware Accessories', 0, 1),
(1676, 1676, 1629, 'Vents & Flues', 'Hardware > Hardware Accessories', 0, 1),
(1677, 1677, 1629, 'Washers', 'Hardware > Hardware Accessories', 0, 1),
(1678, 1678, 1568, 'Home Fencing', 'Hardware', 5, 1),
(1679, 1679, 1678, 'Fences', 'Hardware > Home Fencing', 0, 1),
(1680, 1680, 1678, 'Fencing Pickets', 'Hardware > Home Fencing', 0, 1),
(1681, 1681, 1678, 'Fencing Posts', 'Hardware > Home Fencing', 0, 1),
(1682, 1682, 1678, 'Gates', 'Hardware > Home Fencing', 0, 1),
(1683, 1683, 1678, 'Wire Fencing', 'Hardware > Home Fencing', 2, 1),
(1684, 1684, 1683, 'Barbed & Razor Wire', 'Hardware > Home Fencing > Wire Fencing', 0, 1),
(1685, 1685, 1683, 'Chain Link Fencing', 'Hardware > Home Fencing > Wire Fencing', 0, 1),
(1686, 1686, 1568, 'Insulation', 'Hardware', 3, 1),
(1687, 1687, 1686, 'Building Insulation', 'Hardware > Insulation', 0, 1),
(1688, 1688, 1686, 'Pipe Insulation', 'Hardware > Insulation', 0, 1),
(1689, 1689, 1686, 'Window & Door Insulation', 'Hardware > Insulation', 0, 1),
(1690, 1690, 1568, 'Locks & Locksmithing', 'Hardware', 3, 1),
(1691, 1691, 1690, 'Deadbolt Locks', 'Hardware > Locks & Locksmithing', 0, 1),
(1692, 1692, 1690, 'Key Card Entry Systems', 'Hardware > Locks & Locksmithing', 0, 1),
(1693, 1693, 1690, 'Padlocks', 'Hardware > Locks & Locksmithing', 0, 1),
(1694, 1694, 1568, 'Painting & Wall Covering Supplies', 'Hardware', 9, 1),
(1695, 1695, 1694, 'Finishes', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1696, 1696, 1694, 'Paint', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1697, 1697, 1694, 'Paint Binders', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1698, 1698, 1694, 'Paint Removers', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1699, 1699, 1694, 'Primers', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1700, 1700, 1694, 'Solvents', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1701, 1701, 1694, 'Stains', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1702, 1702, 1694, 'Varnishes', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1703, 1703, 1694, 'Wallpaper', 'Hardware > Painting & Wall Covering Supplies', 0, 1),
(1704, 1704, 1568, 'Plumbing', 'Hardware', 20, 1),
(1705, 1705, 1704, 'Ballcocks & Flappers', 'Hardware > Plumbing', 0, 1),
(1706, 1706, 1704, 'Drain Accessories', 'Hardware > Plumbing', 5, 1),
(1707, 1707, 1706, 'Drain Frames', 'Hardware > Plumbing > Drain Accessories', 0, 1),
(1708, 1708, 1706, 'Drain Liners', 'Hardware > Plumbing > Drain Accessories', 0, 1),
(1709, 1709, 1706, 'Drain Openers', 'Hardware > Plumbing > Drain Accessories', 0, 1),
(1710, 1710, 1706, 'Drain Rods', 'Hardware > Plumbing > Drain Accessories', 0, 1),
(1711, 1711, 1706, 'Plumbing Wastes', 'Hardware > Plumbing > Drain Accessories', 0, 1),
(1712, 1712, 1704, 'Fuel Lines & Accessories', 'Hardware > Plumbing', 0, 1),
(1713, 1713, 1704, 'Hoses', 'Hardware > Plumbing', 0, 1),
(1714, 1714, 1704, 'Nozzles', 'Hardware > Plumbing', 0, 1),
(1715, 1715, 1704, 'Plumbing Fittings', 'Hardware > Plumbing', 5, 1),
(1716, 1716, 1715, 'Flanges', 'Hardware > Plumbing > Plumbing Fittings', 0, 1),
(1717, 1717, 1715, 'Piping Adaptors & Bushings', 'Hardware > Plumbing > Plumbing Fittings', 0, 1),
(1718, 1718, 1715, 'Piping Caps & Plugs', 'Hardware > Plumbing > Plumbing Fittings', 0, 1),
(1719, 1719, 1715, 'Piping Clamps', 'Hardware > Plumbing > Plumbing Fittings', 0, 1),
(1720, 1720, 1715, 'Piping Connectors', 'Hardware > Plumbing > Plumbing Fittings', 0, 1),
(1721, 1721, 1704, 'Plumbing Fixtures', 'Hardware > Plumbing', 10, 1),
(1722, 1722, 1721, 'Bathtub Accessories', 'Hardware > Plumbing > Plumbing Fixtures', 1, 1),
(1723, 1723, 1722, 'Bathtub Spouts', 'Hardware > Plumbing > Plumbing Fixtures > Bathtub Accessories', 0, 1),
(1724, 1724, 1721, 'Bathtubs', 'Hardware > Plumbing > Plumbing Fixtures', 0, 1),
(1725, 1725, 1721, 'Faucet Accessories', 'Hardware > Plumbing > Plumbing Fixtures', 0, 1),
(1726, 1726, 1721, 'Faucets', 'Hardware > Plumbing > Plumbing Fixtures', 1, 1),
(1727, 1727, 1726, 'Pre-Rinse Faucets', 'Hardware > Plumbing > Plumbing Fixtures > Faucets', 0, 1),
(1728, 1728, 1721, 'Fixture Plates', 'Hardware > Plumbing > Plumbing Fixtures', 0, 1),
(1729, 1729, 1721, 'Shower', 'Hardware > Plumbing > Plumbing Fixtures', 10, 1),
(1730, 1730, 1729, 'Arm Mounts', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1731, 1731, 1729, 'Shower Arm Diverters', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1732, 1732, 1729, 'Shower Bars', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1733, 1733, 1729, 'Shower Bases', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1734, 1734, 1729, 'Shower Doors', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1735, 1735, 1729, 'Shower Enclosures', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1736, 1736, 1729, 'Shower Heads', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1737, 1737, 1729, 'Shower Panels', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1738, 1738, 1729, 'Shower Rods', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1739, 1739, 1729, 'Shower Water Filters', 'Hardware > Plumbing > Plumbing Fixtures > Shower', 0, 1),
(1740, 1740, 1721, 'Sink Accessories', 'Hardware > Plumbing > Plumbing Fixtures', 1, 1),
(1741, 1741, 1740, 'Sink Legs', 'Hardware > Plumbing > Plumbing Fixtures > Sink Accessories', 0, 1),
(1742, 1742, 1721, 'Sinks', 'Hardware > Plumbing > Plumbing Fixtures', 2, 1),
(1743, 1743, 1742, 'Bathroom Sinks', 'Hardware > Plumbing > Plumbing Fixtures > Sinks', 0, 1),
(1744, 1744, 1742, 'Kitchen Sinks', 'Hardware > Plumbing > Plumbing Fixtures > Sinks', 0, 1),
(1745, 1745, 1721, 'Toilet & Bidet Accessories', 'Hardware > Plumbing > Plumbing Fixtures', 3, 1),
(1746, 1746, 1745, 'Tank Levers', 'Hardware > Plumbing > Plumbing Fixtures > Toilet & Bidet Accessories', 0, 1),
(1747, 1747, 1745, 'Toilet Seats', 'Hardware > Plumbing > Plumbing Fixtures > Toilet & Bidet Accessories', 0, 1),
(1748, 1748, 1745, 'Toilet Trim', 'Hardware > Plumbing > Plumbing Fixtures > Toilet & Bidet Accessories', 0, 1),
(1749, 1749, 1721, 'Toilets & Bidets', 'Hardware > Plumbing > Plumbing Fixtures', 3, 1),
(1750, 1750, 1749, 'Bidets', 'Hardware > Plumbing > Plumbing Fixtures > Toilets & Bidets', 0, 1),
(1751, 1751, 1749, 'Toilets', 'Hardware > Plumbing > Plumbing Fixtures > Toilets & Bidets', 0, 1),
(1752, 1752, 1749, 'Urinals', 'Hardware > Plumbing > Plumbing Fixtures > Toilets & Bidets', 0, 1),
(1753, 1753, 1704, 'Plumbing Pipes', 'Hardware > Plumbing', 3, 1),
(1754, 1754, 1753, 'Piping Nipples', 'Hardware > Plumbing > Plumbing Pipes', 0, 1),
(1755, 1755, 1753, 'Push-Fit Pipes', 'Hardware > Plumbing > Plumbing Pipes', 0, 1),
(1756, 1756, 1753, 'Steel Pipes', 'Hardware > Plumbing > Plumbing Pipes', 0, 1),
(1757, 1757, 1704, 'Plumbing Pumps', 'Hardware > Plumbing', 0, 1),
(1758, 1758, 1704, 'Plumbing Regulators', 'Hardware > Plumbing', 0, 1),
(1759, 1759, 1704, 'Plumbing Stops', 'Hardware > Plumbing', 0, 1),
(1760, 1760, 1704, 'Plumbing Taps', 'Hardware > Plumbing', 3, 1),
(1761, 1761, 1760, 'Gas Taps', 'Hardware > Plumbing > Plumbing Taps', 0, 1),
(1762, 1762, 1760, 'Hose Bibbs', 'Hardware > Plumbing > Plumbing Taps', 0, 1),
(1763, 1763, 1760, 'Water Taps', 'Hardware > Plumbing > Plumbing Taps', 0, 1),
(1764, 1764, 1704, 'Plumbing Valves', 'Hardware > Plumbing', 1, 1),
(1765, 1765, 1764, 'Ball Valves', 'Hardware > Plumbing > Plumbing Valves', 0, 1),
(1766, 1766, 1704, 'Repair Kits', 'Hardware > Plumbing', 1, 1),
(1767, 1767, 1766, 'Tube Repair Kits', 'Hardware > Plumbing > Repair Kits', 0, 1),
(1768, 1768, 1704, 'Thermocouples', 'Hardware > Plumbing', 0, 1),
(1769, 1769, 1704, 'Traps & Strainers', 'Hardware > Plumbing', 3, 1),
(1770, 1770, 1769, 'Bath Traps', 'Hardware > Plumbing > Traps & Strainers', 0, 1),
(1771, 1771, 1769, 'Bottle Traps', 'Hardware > Plumbing > Traps & Strainers', 0, 1),
(1772, 1772, 1769, 'Shower Traps', 'Hardware > Plumbing > Traps & Strainers', 0, 1),
(1773, 1773, 1704, 'Tube Cleaners', 'Hardware > Plumbing', 0, 1),
(1774, 1774, 1704, 'Water Dispensing & Filtration', 'Hardware > Plumbing', 5, 1),
(1775, 1775, 1774, 'In-Line Water Filters', 'Hardware > Plumbing > Water Dispensing & Filtration', 1, 1),
(1776, 1776, 1775, 'Refrigerator Water Filters', 'Hardware > Plumbing > Water Dispensing & Filtration > In-Line Water Filters', 0, 1),
(1777, 1777, 1774, 'Water Dispensers', 'Hardware > Plumbing > Water Dispensing & Filtration', 2, 1),
(1778, 1778, 1777, 'Drinking Fountains', 'Hardware > Plumbing > Water Dispensing & Filtration > Water Dispensers', 0, 1),
(1779, 1779, 1777, 'Water Chillers', 'Hardware > Plumbing > Water Dispensing & Filtration > Water Dispensers', 0, 1),
(1780, 1780, 1774, 'Water Distillers', 'Hardware > Plumbing > Water Dispensing & Filtration', 0, 1),
(1781, 1781, 1774, 'Water Filtration Accessories', 'Hardware > Plumbing > Water Dispensing & Filtration', 2, 1),
(1782, 1782, 1781, 'Water Filter Cartridges', 'Hardware > Plumbing > Water Dispensing & Filtration > Water Filtration Accessories', 0, 1),
(1783, 1783, 1781, 'Water Filter Housings', 'Hardware > Plumbing > Water Dispensing & Filtration > Water Filtration Accessories', 0, 1),
(1784, 1784, 1774, 'Water Softeners', 'Hardware > Plumbing > Water Dispensing & Filtration', 0, 1),
(1785, 1785, 1704, 'Water Levelers', 'Hardware > Plumbing', 0, 1),
(1786, 1786, 1704, 'Well Supplies', 'Hardware > Plumbing', 0, 1),
(1787, 1787, 1568, 'Roofing', 'Hardware', 3, 1),
(1788, 1788, 1787, 'Gutter Accessories', 'Hardware > Roofing', 0, 1),
(1789, 1789, 1787, 'Gutters', 'Hardware > Roofing', 0, 1),
(1790, 1790, 1787, 'Roof Flashings', 'Hardware > Roofing', 0, 1),
(1791, 1791, 1568, 'Solar Energy', 'Hardware', 2, 1),
(1792, 1792, 1791, 'Solar Energy Kits', 'Hardware > Solar Energy', 0, 1),
(1793, 1793, 1791, 'Solar Panels', 'Hardware > Solar Energy', 0, 1),
(1794, 1794, 1568, 'Storage Tanks', 'Hardware', 3, 1),
(1795, 1795, 1794, 'Food Tanks', 'Hardware > Storage Tanks', 0, 1),
(1796, 1796, 1794, 'Oil Tanks', 'Hardware > Storage Tanks', 0, 1),
(1797, 1797, 1794, 'Water Tanks', 'Hardware > Storage Tanks', 0, 1),
(1798, 1798, 1568, 'Tool Accessories', 'Hardware', 11, 1),
(1799, 1799, 1798, 'Drill Accessories', 'Hardware > Tool Accessories', 1, 1),
(1800, 1800, 1799, 'Drill Bits', 'Hardware > Tool Accessories > Drill Accessories', 0, 1),
(1801, 1801, 1798, 'Flashlight Accessories', 'Hardware > Tool Accessories', 0, 1),
(1802, 1802, 1798, 'Generator Accessories', 'Hardware > Tool Accessories', 2, 1),
(1803, 1803, 1802, 'Generator Covers', 'Hardware > Tool Accessories > Generator Accessories', 0, 1),
(1804, 1804, 1802, 'Generator Replacement Parts', 'Hardware > Tool Accessories > Generator Accessories', 0, 1),
(1805, 1805, 1798, 'Industrial Staples', 'Hardware > Tool Accessories', 0, 1),
(1806, 1806, 1798, 'Router Accessories', 'Hardware > Tool Accessories', 2, 1),
(1807, 1807, 1806, 'Router Bits', 'Hardware > Tool Accessories > Router Accessories', 0, 1),
(1808, 1808, 1806, 'Router Tables', 'Hardware > Tool Accessories > Router Accessories', 0, 1),
(1809, 1809, 1798, 'Sanding Accessories', 'Hardware > Tool Accessories', 1, 1),
(1810, 1810, 1809, 'Sandpaper & Sanding Sponges', 'Hardware > Tool Accessories > Sanding Accessories', 0, 1),
(1811, 1811, 1798, 'Shaper Accessories', 'Hardware > Tool Accessories', 1, 1),
(1812, 1812, 1811, 'Shaper Cutters', 'Hardware > Tool Accessories > Shaper Accessories', 0, 1),
(1813, 1813, 1798, 'Soldering Iron Accessories', 'Hardware > Tool Accessories', 2, 1),
(1814, 1814, 1813, 'Soldering Iron Stands', 'Hardware > Tool Accessories > Soldering Iron Accessories', 0, 1),
(1815, 1815, 1813, 'Soldering Iron Tips', 'Hardware > Tool Accessories > Soldering Iron Accessories', 0, 1),
(1816, 1816, 1798, 'Tool Blades', 'Hardware > Tool Accessories', 1, 1),
(1817, 1817, 1816, 'Saw Blades', 'Hardware > Tool Accessories > Tool Blades', 0, 1),
(1818, 1818, 1798, 'Tool Handles', 'Hardware > Tool Accessories', 0, 1),
(1819, 1819, 1798, 'Tool Stands', 'Hardware > Tool Accessories', 1, 1),
(1820, 1820, 1819, 'Saw Stands', 'Hardware > Tool Accessories > Tool Stands', 0, 1),
(1821, 1821, 1568, 'Tools', 'Hardware', 68, 1),
(1822, 1822, 1821, 'Anvils', 'Hardware > Tools', 0, 1),
(1823, 1823, 1821, 'Awls', 'Hardware > Tools', 0, 1),
(1824, 1824, 1821, 'Axes', 'Hardware > Tools', 0, 1),
(1825, 1825, 1821, 'Benders', 'Hardware > Tools', 0, 1),
(1826, 1826, 1821, 'Blowguns', 'Hardware > Tools', 0, 1),
(1827, 1827, 1821, 'Brushes', 'Hardware > Tools', 4, 1),
(1828, 1828, 1827, 'Air Brushes', 'Hardware > Tools > Brushes', 0, 1),
(1829, 1829, 1827, 'Chimney Brushes', 'Hardware > Tools > Brushes', 0, 1),
(1830, 1830, 1827, 'Paint Brushes', 'Hardware > Tools > Brushes', 0, 1),
(1831, 1831, 1827, 'Pipe Brushes', 'Hardware > Tools > Brushes', 0, 1),
(1832, 1832, 1821, 'Carving Tools', 'Hardware > Tools', 4, 1),
(1833, 1833, 1832, 'Carving Spoons', 'Hardware > Tools > Carving Tools', 0, 1),
(1834, 1834, 1832, 'Chisels', 'Hardware > Tools > Carving Tools', 0, 1),
(1835, 1835, 1832, 'Gouges', 'Hardware > Tools > Carving Tools', 0, 1),
(1836, 1836, 1832, 'Wood Carving Knives', 'Hardware > Tools > Carving Tools', 0, 1),
(1837, 1837, 1821, 'Caulking Tools', 'Hardware > Tools', 3, 1),
(1838, 1838, 1837, 'Caulking Guns', 'Hardware > Tools > Caulking Tools', 0, 1),
(1839, 1839, 1837, 'Caulking Irons', 'Hardware > Tools > Caulking Tools', 0, 1),
(1840, 1840, 1837, 'Caulking Mallets', 'Hardware > Tools > Caulking Tools', 0, 1),
(1841, 1841, 1821, 'Compactors', 'Hardware > Tools', 0, 1),
(1842, 1842, 1821, 'Compressors', 'Hardware > Tools', 2, 1),
(1843, 1843, 1842, 'Air Compressors', 'Hardware > Tools > Compressors', 0, 1),
(1844, 1844, 1842, 'Gas Compressors', 'Hardware > Tools > Compressors', 0, 1),
(1845, 1845, 1821, 'Concrete Brooms', 'Hardware > Tools', 0, 1),
(1846, 1846, 1821, 'Crowbars', 'Hardware > Tools', 0, 1),
(1847, 1847, 1821, 'Cutters', 'Hardware > Tools', 7, 1),
(1848, 1848, 1847, 'Bolt Cutters', 'Hardware > Tools > Cutters', 0, 1),
(1849, 1849, 1847, 'Glass Cutters', 'Hardware > Tools > Cutters', 0, 1),
(1850, 1850, 1847, 'Nibblers', 'Hardware > Tools > Cutters', 0, 1),
(1851, 1851, 1847, 'Pipe Cutters', 'Hardware > Tools > Cutters', 0, 1),
(1852, 1852, 1847, 'Rebar Cutters', 'Hardware > Tools > Cutters', 0, 1),
(1853, 1853, 1847, 'Tile & Shingle Cutters', 'Hardware > Tools > Cutters', 0, 1),
(1854, 1854, 1847, 'Utility Knives', 'Hardware > Tools > Cutters', 0, 1),
(1855, 1855, 1821, 'Deburrers', 'Hardware > Tools', 0, 1),
(1856, 1856, 1821, 'Die Sets', 'Hardware > Tools', 0, 1),
(1857, 1857, 1821, 'Dollies & Hand Trucks', 'Hardware > Tools', 0, 1),
(1858, 1858, 1821, 'Drills', 'Hardware > Tools', 5, 1),
(1859, 1859, 1858, 'Augers', 'Hardware > Tools > Drills', 0, 1),
(1860, 1860, 1858, 'Drill Presses', 'Hardware > Tools > Drills', 0, 1),
(1861, 1861, 1858, 'Handheld Power Drills', 'Hardware > Tools > Drills', 0, 1),
(1862, 1862, 1858, 'Mortisers', 'Hardware > Tools > Drills', 0, 1),
(1863, 1863, 1858, 'Pneumatic Drills', 'Hardware > Tools > Drills', 0, 1),
(1864, 1864, 1821, 'Fasteners', 'Hardware > Tools', 0, 1),
(1865, 1865, 1821, 'Flashlights', 'Hardware > Tools', 2, 1),
(1866, 1866, 1865, 'Headlamps', 'Hardware > Tools > Flashlights', 0, 1),
(1867, 1867, 1865, 'Torch Lights', 'Hardware > Tools > Flashlights', 0, 1),
(1868, 1868, 1821, 'Generators', 'Hardware > Tools', 0, 1),
(1869, 1869, 1821, 'Glue Guns', 'Hardware > Tools', 0, 1),
(1870, 1870, 1821, 'Grinders', 'Hardware > Tools', 0, 1),
(1871, 1871, 1821, 'Grips', 'Hardware > Tools', 0, 1),
(1872, 1872, 1821, 'Hammering', 'Hardware > Tools', 3, 1),
(1873, 1873, 1872, 'Air Hammers', 'Hardware > Tools > Hammering', 0, 1),
(1874, 1874, 1872, 'Hammers', 'Hardware > Tools > Hammering', 2, 1),
(1875, 1875, 1874, 'Mallets', 'Hardware > Tools > Hammering > Hammers', 0, 1),
(1876, 1876, 1874, 'Sledgehammers', 'Hardware > Tools > Hammering > Hammers', 0, 1),
(1877, 1877, 1872, 'Jackhammers', 'Hardware > Tools > Hammering', 0, 1),
(1878, 1878, 1821, 'Heat Guns', 'Hardware > Tools', 0, 1),
(1879, 1879, 1821, 'Hex Keys', 'Hardware > Tools', 0, 1),
(1880, 1880, 1821, 'Hoisting', 'Hardware > Tools', 6, 1),
(1881, 1881, 1880, 'Air Casters', 'Hardware > Tools > Hoisting', 0, 1),
(1882, 1882, 1880, 'Buckhoists', 'Hardware > Tools > Hoisting', 0, 1),
(1883, 1883, 1880, 'Chainhoists', 'Hardware > Tools > Hoisting', 0, 1),
(1884, 1884, 1880, 'Jack Lifts', 'Hardware > Tools > Hoisting', 0, 1),
(1885, 1885, 1880, 'Pallet Jacks', 'Hardware > Tools > Hoisting', 0, 1),
(1886, 1886, 1880, 'Wire Hoists', 'Hardware > Tools > Hoisting', 0, 1),
(1887, 1887, 1821, 'Impact Wrenches & Drivers', 'Hardware > Tools', 0, 1),
(1888, 1888, 1821, 'Industrial Vibrators', 'Hardware > Tools', 0, 1),
(1889, 1889, 1821, 'Ladders & Scaffolding', 'Hardware > Tools', 6, 1),
(1890, 1890, 1889, 'Aluminum Ladders', 'Hardware > Tools > Ladders & Scaffolding', 0, 1),
(1891, 1891, 1889, 'Ladder Carts', 'Hardware > Tools > Ladders & Scaffolding', 0, 1),
(1892, 1892, 1889, 'Scaffolding', 'Hardware > Tools > Ladders & Scaffolding', 0, 1),
(1893, 1893, 1889, 'Step Stools', 'Hardware > Tools > Ladders & Scaffolding', 0, 1),
(1894, 1894, 1889, 'Wooden Ladders', 'Hardware > Tools > Ladders & Scaffolding', 0, 1),
(1895, 1895, 1889, 'Work Platforms', 'Hardware > Tools > Ladders & Scaffolding', 0, 1),
(1896, 1896, 1821, 'Lathes', 'Hardware > Tools', 0, 1),
(1897, 1897, 1821, 'Light Bulb Changers', 'Hardware > Tools', 0, 1),
(1898, 1898, 1821, 'Marking Tools', 'Hardware > Tools', 4, 1),
(1899, 1899, 1898, 'Carpenter Pencils', 'Hardware > Tools > Marking Tools', 0, 1),
(1900, 1900, 1898, 'Chalk Lines', 'Hardware > Tools > Marking Tools', 0, 1),
(1901, 1901, 1898, 'Marking Chisels', 'Hardware > Tools > Marking Tools', 0, 1),
(1902, 1902, 1898, 'Marking Knives', 'Hardware > Tools > Marking Tools', 0, 1),
(1903, 1903, 1821, 'Masonry Tools', 'Hardware > Tools', 8, 1),
(1904, 1904, 1903, 'Brick Tools', 'Hardware > Tools > Masonry Tools', 0, 1),
(1905, 1905, 1903, 'Cement Mixers', 'Hardware > Tools > Masonry Tools', 0, 1),
(1906, 1906, 1903, 'Construction Lines', 'Hardware > Tools > Masonry Tools', 0, 1),
(1907, 1907, 1903, 'Edgers', 'Hardware > Tools > Masonry Tools', 0, 1),
(1908, 1908, 1903, 'Floats', 'Hardware > Tools > Masonry Tools', 0, 1),
(1909, 1909, 1903, 'Masonry Jointers', 'Hardware > Tools > Masonry Tools', 0, 1),
(1910, 1910, 1903, 'Masonry Trowels', 'Hardware > Tools > Masonry Tools', 0, 1),
(1911, 1911, 1903, 'Power Trowels', 'Hardware > Tools > Masonry Tools', 0, 1),
(1912, 1912, 1821, 'Measuring Tools & Sensors', 'Hardware > Tools', 38, 1),
(1913, 1913, 1912, 'Altimeters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1914, 1914, 1912, 'Barometers', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1915, 1915, 1912, 'Cable Testers', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1916, 1916, 1912, 'Calipers', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1917, 1917, 1912, 'Cruising Rods', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1918, 1918, 1912, 'Dividers', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1919, 1919, 1912, 'Flow Meters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1920, 1920, 1912, 'Gas Detectors', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1921, 1921, 1912, 'Gauges', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1923, 1923, 1912, 'Hygrometers', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1924, 1924, 1912, 'Knife Guides', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1925, 1925, 1912, 'Leak Detectors', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1926, 1926, 1912, 'Levels', 'Hardware > Tools > Measuring Tools & Sensors', 3, 1),
(1927, 1927, 1926, 'Bubble Levels', 'Hardware > Tools > Measuring Tools & Sensors > Levels', 0, 1),
(1928, 1928, 1926, 'Laser Levels', 'Hardware > Tools > Measuring Tools & Sensors > Levels', 0, 1),
(1929, 1929, 1926, 'Sight Levels', 'Hardware > Tools > Measuring Tools & Sensors > Levels', 0, 1),
(1930, 1930, 1912, 'Measuring Wheels', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1931, 1931, 1912, 'Metal & Voltage Detectors', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1932, 1932, 1912, 'Moisture Meters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1933, 1933, 1912, 'Pipe Locators', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1934, 1934, 1912, 'Probes & Finders', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1935, 1935, 1912, 'Protractors', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1936, 1936, 1912, 'Rebar Locators', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1937, 1937, 1912, 'Rulers', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1938, 1938, 1912, 'Scales', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1939, 1939, 1912, 'Seismometer', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1940, 1940, 1912, 'Sound Meters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1941, 1941, 1912, 'Squares', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1942, 1942, 1912, 'Straight Edges', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1943, 1943, 1912, 'Stud Sensors', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1944, 1944, 1912, 'Tape Measures', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1945, 1945, 1912, 'Theodolites', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1946, 1946, 1912, 'Thermometers', 'Hardware > Tools > Measuring Tools & Sensors', 1, 1),
(1947, 1947, 1946, 'Infrared Thermometers', 'Hardware > Tools > Measuring Tools & Sensors > Thermometers', 0, 1),
(1948, 1948, 1912, 'UV Light Meters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1949, 1949, 1912, 'Vibration Meters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1950, 1950, 1912, 'Weather Forecasters & Stations', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1951, 1951, 1912, 'Wire Locators', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1952, 1952, 1912, 'pH Meters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(1953, 1953, 1821, 'Milling Machines', 'Hardware > Tools', 0, 1),
(1954, 1954, 1821, 'Nail Pullers', 'Hardware > Tools', 0, 1),
(1955, 1955, 1821, 'Nailers & Staplers', 'Hardware > Tools', 0, 1),
(1956, 1956, 1821, 'Nut Drivers', 'Hardware > Tools', 0, 1),
(1957, 1957, 1821, 'Paint Tools', 'Hardware > Tools', 4, 1),
(1958, 1958, 1957, 'Paint Rollers', 'Hardware > Tools > Paint Tools', 0, 1),
(1959, 1959, 1957, 'Paint Sponges', 'Hardware > Tools > Paint Tools', 0, 1),
(1960, 1960, 1957, 'Paint Sprayers', 'Hardware > Tools > Paint Tools', 0, 1),
(1961, 1961, 1957, 'Paint Stripper', 'Hardware > Tools > Paint Tools', 0, 1),
(1962, 1962, 1821, 'Pick Up Tools', 'Hardware > Tools', 0, 1),
(1963, 1963, 1821, 'Planes', 'Hardware > Tools', 0, 1),
(1964, 1964, 1821, 'Pliers', 'Hardware > Tools', 0, 1),
(1965, 1965, 1821, 'Plungers', 'Hardware > Tools', 0, 1),
(1966, 1966, 1821, 'Polishers & Buffers', 'Hardware > Tools', 0, 1),
(1967, 1967, 1821, 'Post Hole Diggers', 'Hardware > Tools', 0, 1),
(1968, 1968, 1821, 'Punches', 'Hardware > Tools', 0, 1),
(1969, 1969, 1821, 'Putty Knives & Scrapers', 'Hardware > Tools', 0, 1),
(1970, 1970, 1821, 'Reamers', 'Hardware > Tools', 0, 1),
(1971, 1971, 1821, 'Routers', 'Hardware > Tools', 0, 1),
(1972, 1972, 1821, 'Sanders', 'Hardware > Tools', 0, 1),
(1973, 1973, 1821, 'Sanding Blocks', 'Hardware > Tools', 0, 1),
(1974, 1974, 1821, 'Saw Horses', 'Hardware > Tools', 0, 1),
(1975, 1975, 1821, 'Saws', 'Hardware > Tools', 10, 1),
(1976, 1976, 1975, 'Band Saws', 'Hardware > Tools > Saws', 0, 1),
(1977, 1977, 1975, 'Cut-Off Saws', 'Hardware > Tools > Saws', 0, 1),
(1978, 1978, 1975, 'Hacksaws', 'Hardware > Tools > Saws', 0, 1),
(1979, 1979, 1975, 'Hand Saws', 'Hardware > Tools > Saws', 0, 1),
(1980, 1980, 1975, 'Handheld Circular Saws', 'Hardware > Tools > Saws', 0, 1),
(1981, 1981, 1975, 'Jig Saws', 'Hardware > Tools > Saws', 0, 1),
(1982, 1982, 1975, 'Miter Saws', 'Hardware > Tools > Saws', 0, 1),
(1983, 1983, 1975, 'Reciprocating Saws', 'Hardware > Tools > Saws', 0, 1),
(1984, 1984, 1975, 'Scroll Saws', 'Hardware > Tools > Saws', 0, 1),
(1985, 1985, 1975, 'Table Saws', 'Hardware > Tools > Saws', 0, 1),
(1986, 1986, 1821, 'Screwdrivers', 'Hardware > Tools', 0, 1),
(1987, 1987, 1821, 'Shapers', 'Hardware > Tools', 0, 1),
(1988, 1988, 1821, 'Sharpeners', 'Hardware > Tools', 2, 1),
(1989, 1989, 1988, 'Chainsaw Sharpeners', 'Hardware > Tools > Sharpeners', 0, 1),
(1990, 1990, 1988, 'Sharpening Stones', 'Hardware > Tools > Sharpeners', 0, 1),
(1991, 1991, 1821, 'Soldering Irons', 'Hardware > Tools', 0, 1),
(1992, 1992, 1821, 'Tap Reseaters', 'Hardware > Tools', 0, 1),
(1993, 1993, 1821, 'Threading Machines', 'Hardware > Tools', 0, 1),
(1994, 1994, 1821, 'Tool Clamps', 'Hardware > Tools', 1, 1),
(1995, 1995, 1994, 'Vise Clamps', 'Hardware > Tools > Tool Clamps', 0, 1),
(1996, 1996, 1821, 'Tool Files', 'Hardware > Tools', 0, 1),
(1997, 1997, 1821, 'Tool Keys', 'Hardware > Tools', 3, 1),
(1998, 1998, 1997, 'Manhole Keys', 'Hardware > Tools > Tool Keys', 0, 1),
(1999, 1999, 1997, 'Radiator Keys', 'Hardware > Tools > Tool Keys', 0, 1),
(2000, 2000, 1997, 'Stopcock Keys', 'Hardware > Tools > Tool Keys', 0, 1),
(2001, 2001, 1821, 'Tool Knives', 'Hardware > Tools', 1, 1),
(2002, 2002, 2001, 'Sheetrock Knives', 'Hardware > Tools > Tool Knives', 0, 1),
(2003, 2003, 1821, 'Tool Sets', 'Hardware > Tools', 2, 1),
(2004, 2004, 2003, 'Power Tool Combo Sets', 'Hardware > Tools > Tool Sets', 0, 1),
(2005, 2005, 2003, 'Woodworking Tool Sets', 'Hardware > Tools > Tool Sets', 0, 1),
(2006, 2006, 1821, 'Welding Tools', 'Hardware > Tools', 0, 1),
(2007, 2007, 1821, 'Wire & Cable Tools', 'Hardware > Tools', 5, 1),
(2008, 2008, 2007, 'Cable Slitters', 'Hardware > Tools > Wire & Cable Tools', 0, 1),
(2009, 2009, 2007, 'Snippers', 'Hardware > Tools > Wire & Cable Tools', 0, 1),
(2010, 2010, 2007, 'Wire Crimpers', 'Hardware > Tools > Wire & Cable Tools', 0, 1),
(2011, 2011, 2007, 'Wire Cutters', 'Hardware > Tools > Wire & Cable Tools', 0, 1),
(2012, 2012, 2007, 'Wire Strippers', 'Hardware > Tools > Wire & Cable Tools', 0, 1),
(2013, 2013, 1821, 'Wrenches', 'Hardware > Tools', 1, 1),
(2014, 2014, 2013, 'Socket Wrenches', 'Hardware > Tools > Wrenches', 0, 1),
(2015, 2015, 0, 'Health & Beauty', '', 2, 1),
(2016, 2016, 2015, 'Health Care', 'Health & Beauty', 15, 1),
(2017, 2017, 2016, 'Arthritis Care', 'Health & Beauty > Health Care', 0, 1),
(2018, 2018, 2016, 'Biometric Monitor Accessories', 'Health & Beauty > Health Care', 3, 1),
(2019, 2019, 2018, 'Bathroom Scale Accessories', 'Health & Beauty > Health Care > Biometric Monitor Accessories', 0, 1),
(2020, 2020, 2018, 'Blood Glucose Meter Accessories', 'Health & Beauty > Health Care > Biometric Monitor Accessories', 2, 1),
(2021, 2021, 2020, 'Blood Glucose Test Strips', 'Health & Beauty > Health Care > Biometric Monitor Accessories > Blood Glucose Meter Accessories', 0, 1),
(2022, 2022, 2020, 'Lancing Devices', 'Health & Beauty > Health Care > Biometric Monitor Accessories > Blood Glucose Meter Accessories', 0, 1),
(2023, 2023, 2018, 'Heart Rate Monitor Accessories', 'Health & Beauty > Health Care > Biometric Monitor Accessories', 0, 1),
(2024, 2024, 2016, 'Biometric Monitors', 'Health & Beauty > Health Care', 11, 1),
(2025, 2025, 2024, 'Bathroom Scales', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2026, 2026, 2024, 'Blood Glucose Meters', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2027, 2027, 2024, 'Blood Pressure Monitors', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2028, 2028, 2024, 'Body Fat Analyzers', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2029, 2029, 2024, 'Breathalyzers', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2030, 2030, 2024, 'Cholesterol Analyzers', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2031, 2031, 2024, 'Fertility Monitors', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2032, 2032, 2024, 'Heart Rate Monitors', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2033, 2033, 2024, 'Medical Thermometers', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2034, 2034, 2024, 'Pedometers', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2035, 2035, 2024, 'Prenatal Heart Monitors', 'Health & Beauty > Health Care > Biometric Monitors', 0, 1),
(2036, 2036, 2016, 'Contraceptives', 'Health & Beauty > Health Care', 1, 1),
(2037, 2037, 2036, 'Condoms', 'Health & Beauty > Health Care > Contraceptives', 0, 1),
(2038, 2038, 2016, 'Diabetes Care', 'Health & Beauty > Health Care', 0, 1),
(2039, 2039, 2016, 'Drug Tests', 'Health & Beauty > Health Care', 0, 1),
(2040, 2040, 2016, 'First Aid', 'Health & Beauty > Health Care', 6, 1),
(2041, 2041, 2040, 'Antiseptics & Cleaning Supplies', 'Health & Beauty > Health Care > First Aid', 0, 1),
(2042, 2042, 2040, 'Bandages & Tapes', 'Health & Beauty > Health Care > First Aid', 0, 1),
(2043, 2043, 2040, 'Eye Wash Supplies', 'Health & Beauty > Health Care > First Aid', 0, 1),
(2044, 2044, 2040, 'First Aid Kits', 'Health & Beauty > Health Care > First Aid', 0, 1),
(2045, 2045, 2040, 'Hot & Cold Therapies', 'Health & Beauty > Health Care > First Aid', 1, 1),
(2046, 2046, 2045, 'Ice Packs', 'Health & Beauty > Health Care > First Aid > Hot & Cold Therapies', 0, 1),
(2047, 2047, 2040, 'Rash Treatments', 'Health & Beauty > Health Care > First Aid', 0, 1),
(2048, 2048, 2016, 'Fitness & Nutrition', 'Health & Beauty > Health Care', 5, 1),
(2049, 2049, 2048, 'Electrolytes', 'Health & Beauty > Health Care > Fitness & Nutrition', 0, 1),
(2050, 2050, 2048, 'Nutrition Bars', 'Health & Beauty > Health Care > Fitness & Nutrition', 0, 1),
(2051, 2051, 2048, 'Traditional Chinese Tonics', 'Health & Beauty > Health Care > Fitness & Nutrition', 0, 1),
(2052, 2052, 2048, 'Vitamins & Supplements', 'Health & Beauty > Health Care > Fitness & Nutrition', 0, 1),
(2053, 2053, 2048, 'Weight Loss Products', 'Health & Beauty > Health Care > Fitness & Nutrition', 1, 1),
(2054, 2054, 2053, 'Diet Pills', 'Health & Beauty > Health Care > Fitness & Nutrition > Weight Loss Products', 0, 1),
(2055, 2055, 2016, 'Incontinence Aids', 'Health & Beauty > Health Care', 0, 1),
(2056, 2056, 2016, 'Medicine', 'Health & Beauty > Health Care', 6, 1),
(2057, 2057, 2056, 'Allergies & Sinus', 'Health & Beauty > Health Care > Medicine', 0, 1),
(2058, 2058, 2056, 'Cough, Cold & Flu', 'Health & Beauty > Health Care > Medicine', 0, 1),
(2059, 2059, 2056, 'Gastrointestinal Treatments', 'Health & Beauty > Health Care > Medicine', 0, 1),
(2060, 2060, 2056, 'Pain Relievers', 'Health & Beauty > Health Care > Medicine', 0, 1),
(2061, 2061, 2056, 'Prescription Drugs', 'Health & Beauty > Health Care > Medicine', 0, 1),
(2062, 2062, 2056, 'Sleeping Medication', 'Health & Beauty > Health Care > Medicine', 0, 1),
(2063, 2063, 2016, 'Mobility & Special Needs', 'Health & Beauty > Health Care', 4, 1),
(2064, 2064, 2063, 'Accessibility Equipment', 'Health & Beauty > Health Care > Mobility & Special Needs', 2, 1),
(2065, 2065, 2064, 'Mobility Scooters', 'Health & Beauty > Health Care > Mobility & Special Needs > Accessibility Equipment', 0, 1),
(2066, 2066, 2064, 'Wheelchairs', 'Health & Beauty > Health Care > Mobility & Special Needs > Accessibility Equipment', 2, 1),
(2067, 2067, 2066, 'Manual Wheelchairs', 'Health & Beauty > Health Care > Mobility & Special Needs > Accessibility Equipment > Wheelchairs', 0, 1),
(2068, 2068, 2066, 'Powered Wheelchairs', 'Health & Beauty > Health Care > Mobility & Special Needs > Accessibility Equipment > Wheelchairs', 0, 1),
(2069, 2069, 2063, 'Accessibility Equipment Accessories', 'Health & Beauty > Health Care > Mobility & Special Needs', 0, 1),
(2070, 2070, 2063, 'Walking Aids', 'Health & Beauty > Health Care > Mobility & Special Needs', 3, 1),
(2071, 2071, 2070, 'Canes', 'Health & Beauty > Health Care > Mobility & Special Needs > Walking Aids', 0, 1),
(2072, 2072, 2070, 'Crutches', 'Health & Beauty > Health Care > Mobility & Special Needs > Walking Aids', 0, 1),
(2073, 2073, 2070, 'Walkers', 'Health & Beauty > Health Care > Mobility & Special Needs > Walking Aids', 0, 1),
(2074, 2074, 2016, 'Pregnancy Tests', 'Health & Beauty > Health Care', 0, 1),
(2075, 2075, 2016, 'Respiratory Care', 'Health & Beauty > Health Care', 1, 1),
(2076, 2076, 2075, 'Nebulizers', 'Health & Beauty > Health Care > Respiratory Care', 0, 1),
(2077, 2077, 2016, 'Smoking Cessation', 'Health & Beauty > Health Care', 0, 1),
(2078, 2078, 2016, 'Supports & Braces', 'Health & Beauty > Health Care', 0, 1),
(2079, 2079, 2015, 'Personal Care', 'Health & Beauty', 15, 1),
(2080, 2080, 2079, 'Back Care', 'Health & Beauty > Personal Care', 0, 1),
(2081, 2081, 2079, 'Cosmetics', 'Health & Beauty > Personal Care', 6, 1),
(2082, 2082, 2081, 'Bath & Body', 'Health & Beauty > Personal Care > Cosmetics', 10, 1),
(2083, 2083, 2082, 'Adult Wipes', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2084, 2084, 2082, 'Bar Soap', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2085, 2085, 2082, 'Bath & Body Gift Baskets', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2086, 2086, 2082, 'Bath Brushes', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2087, 2087, 2082, 'Body Wash', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2088, 2088, 2082, 'Bubble Bath & Bath Salts', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2089, 2089, 2082, 'Hand Sanitizers', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2090, 2090, 2082, 'Liquid Hand Soap', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2091, 2091, 2082, 'Loofahs & Shower Scrubs', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2092, 2092, 2082, 'Shower Caps', 'Health & Beauty > Personal Care > Cosmetics > Bath & Body', 0, 1),
(2093, 2093, 2081, 'Cosmetic Tools', 'Health & Beauty > Personal Care > Cosmetics', 4, 1),
(2094, 2094, 2093, 'Makeup Tools', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools', 5, 1),
(2095, 2095, 2094, 'Eyelash Curlers', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Makeup Tools', 0, 1),
(2096, 2096, 2094, 'Facial Blotting Paper', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Makeup Tools', 0, 1),
(2097, 2097, 2094, 'Makeup Brushes', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Makeup Tools', 0, 1),
(2098, 2098, 2094, 'Makeup Mirrors', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Makeup Tools', 0, 1),
(2099, 2099, 2094, 'Makeup Sponges', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Makeup Tools', 0, 1),
(2100, 2100, 2093, 'Nail Tools', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools', 4, 1),
(2101, 2101, 2100, 'Cuticle Pushers', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Nail Tools', 0, 1),
(2102, 2102, 2100, 'Cuticle Scissors', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Nail Tools', 0, 1),
(2103, 2103, 2100, 'Nail Clippers', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Nail Tools', 0, 1),
(2104, 2104, 2100, 'Nail Files & Emery Boards', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Nail Tools', 0, 1),
(2105, 2105, 2093, 'Skin Care Tools', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools', 1, 1),
(2106, 2106, 2105, 'Pumice Stones', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools > Skin Care Tools', 0, 1),
(2107, 2107, 2093, 'Tweezers', 'Health & Beauty > Personal Care > Cosmetics > Cosmetic Tools', 0, 1),
(2108, 2108, 2081, 'Makeup', 'Health & Beauty > Personal Care > Cosmetics', 4, 1),
(2109, 2109, 2108, 'Costume & Stage Makeup', 'Health & Beauty > Personal Care > Cosmetics > Makeup', 0, 1),
(2110, 2110, 2108, 'Eye Makeup', 'Health & Beauty > Personal Care > Cosmetics > Makeup', 5, 1),
(2111, 2111, 2110, 'Eye Liner', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Eye Makeup', 0, 1),
(2112, 2112, 2110, 'Eye Shadow', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Eye Makeup', 0, 1),
(2113, 2113, 2110, 'Eyebrow Pencils', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Eye Makeup', 0, 1),
(2114, 2114, 2110, 'False Eyelashes', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Eye Makeup', 0, 1),
(2115, 2115, 2110, 'Mascara', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Eye Makeup', 0, 1),
(2116, 2116, 2108, 'Face & Cheek Makeup', 'Health & Beauty > Personal Care > Cosmetics > Makeup', 4, 1),
(2117, 2117, 2116, 'Bronzers', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Face & Cheek Makeup', 0, 1),
(2118, 2118, 2116, 'Foundations & Concealers', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Face & Cheek Makeup', 0, 1),
(2119, 2119, 2116, 'Powders', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Face & Cheek Makeup', 0, 1),
(2120, 2120, 2116, 'Rouge & Blushes', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Face & Cheek Makeup', 0, 1),
(2121, 2121, 2108, 'Lip Makeup', 'Health & Beauty > Personal Care > Cosmetics > Makeup', 3, 1),
(2122, 2122, 2121, 'Lip Gloss', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Lip Makeup', 0, 1),
(2123, 2123, 2121, 'Lip Liner', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Lip Makeup', 0, 1),
(2124, 2124, 2121, 'Lipstick', 'Health & Beauty > Personal Care > Cosmetics > Makeup > Lip Makeup', 0, 1),
(2125, 2125, 2081, 'Nail Care', 'Health & Beauty > Personal Care > Cosmetics', 4, 1),
(2126, 2126, 2125, 'Cuticle Creams & Oils', 'Health & Beauty > Personal Care > Cosmetics > Nail Care', 0, 1),
(2127, 2127, 2125, 'False Nails', 'Health & Beauty > Personal Care > Cosmetics > Nail Care', 0, 1),
(2128, 2128, 2125, 'Nail Polish Removers', 'Health & Beauty > Personal Care > Cosmetics > Nail Care', 0, 1),
(2129, 2129, 2125, 'Nail Polishes', 'Health & Beauty > Personal Care > Cosmetics > Nail Care', 0, 1),
(2130, 2130, 2081, 'Perfume & Cologne', 'Health & Beauty > Personal Care > Cosmetics', 0, 1),
(2131, 2131, 2081, 'Skin Care', 'Health & Beauty > Personal Care > Cosmetics', 7, 1),
(2132, 2132, 2131, 'Acne Treatments', 'Health & Beauty > Personal Care > Cosmetics > Skin Care', 0, 1),
(2133, 2133, 2131, 'Exfoliants', 'Health & Beauty > Personal Care > Cosmetics > Skin Care', 0, 1),
(2134, 2134, 2131, 'Facial Cleansers', 'Health & Beauty > Personal Care > Cosmetics > Skin Care', 0, 1),
(2135, 2135, 2131, 'Lip Care', 'Health & Beauty > Personal Care > Cosmetics > Skin Care', 0, 1),
(2136, 2136, 2131, 'Lotion', 'Health & Beauty > Personal Care > Cosmetics > Skin Care', 1, 1),
(2137, 2137, 2136, 'Face Moisturizers', 'Health & Beauty > Personal Care > Cosmetics > Skin Care > Lotion', 0, 1),
(2138, 2138, 2131, 'Sunscreen', 'Health & Beauty > Personal Care > Cosmetics > Skin Care', 0, 1),
(2139, 2139, 2131, 'Tanning Products', 'Health & Beauty > Personal Care > Cosmetics > Skin Care', 2, 1),
(2140, 2140, 2139, 'Self Tanner', 'Health & Beauty > Personal Care > Cosmetics > Skin Care > Tanning Products', 0, 1),
(2141, 2141, 2139, 'Tanning Oil', 'Health & Beauty > Personal Care > Cosmetics > Skin Care > Tanning Products', 0, 1),
(2142, 2142, 2079, 'Cotton Balls', 'Health & Beauty > Personal Care', 0, 1),
(2143, 2143, 2079, 'Cotton Swabs', 'Health & Beauty > Personal Care', 0, 1),
(2144, 2144, 2079, 'Deodorant & Anti-Perspirant', 'Health & Beauty > Personal Care', 0, 1),
(2145, 2145, 2079, 'Ear Care', 'Health & Beauty > Personal Care', 1, 1),
(2146, 2146, 2145, 'Earplugs', 'Health & Beauty > Personal Care > Ear Care', 0, 1),
(2147, 2147, 2079, 'Feminine Sanitary Supplies', 'Health & Beauty > Personal Care', 2, 1),
(2148, 2148, 2147, 'Feminine Pads & Protectors', 'Health & Beauty > Personal Care > Feminine Sanitary Supplies', 0, 1),
(2149, 2149, 2147, 'Tampons', 'Health & Beauty > Personal Care > Feminine Sanitary Supplies', 0, 1),
(2150, 2150, 2079, 'Foot Care', 'Health & Beauty > Personal Care', 5, 1),
(2151, 2151, 2150, 'Antifungal Treatments', 'Health & Beauty > Personal Care > Foot Care', 0, 1),
(2152, 2152, 2150, 'Bunion Care', 'Health & Beauty > Personal Care > Foot Care', 0, 1),
(2153, 2153, 2150, 'Corn & Callus Care', 'Health & Beauty > Personal Care > Foot Care', 0, 1),
(2154, 2154, 2150, 'Foot Odor Removers', 'Health & Beauty > Personal Care > Foot Care', 0, 1),
(2155, 2155, 2150, 'Insoles & Inserts', 'Health & Beauty > Personal Care > Foot Care', 0, 1),
(2156, 2156, 2079, 'Hair Care', 'Health & Beauty > Personal Care', 12, 1),
(2157, 2157, 2156, 'Combs & Brushes', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2158, 2158, 2156, 'Hair Coloring', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2159, 2159, 2156, 'Hair Curler Clips & Pins', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2160, 2160, 2156, 'Hair Curlers', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2161, 2161, 2156, 'Hair Dryer Accessories', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2162, 2162, 2156, 'Hair Dryers', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2163, 2163, 2156, 'Hair Iron Accessories', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2164, 2164, 2156, 'Hair Irons', 'Health & Beauty > Personal Care > Hair Care', 2, 1),
(2165, 2165, 2164, 'Curling Irons', 'Health & Beauty > Personal Care > Hair Care > Hair Irons', 0, 1),
(2166, 2166, 2164, 'Flat Irons', 'Health & Beauty > Personal Care > Hair Care > Hair Irons', 0, 1),
(2167, 2167, 2156, 'Hair Loss Treatments', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2168, 2168, 2156, 'Hair Shears', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2169, 2169, 2156, 'Shampoo & Conditioner', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2170, 2170, 2156, 'Styling Gel, Spray & Mousse', 'Health & Beauty > Personal Care > Hair Care', 0, 1),
(2171, 2171, 2079, 'Massagers', 'Health & Beauty > Personal Care', 0, 1),
(2172, 2172, 2079, 'Oral Care', 'Health & Beauty > Personal Care', 12, 1),
(2173, 2173, 2172, 'Dental Water Jets', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2174, 2174, 2172, 'Denture Adhesives', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2175, 2175, 2172, 'Dentures', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2176, 2176, 2172, 'Floss', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2177, 2177, 2172, 'Gum Stimulators', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2178, 2178, 2172, 'Mouthwash', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2179, 2179, 2172, 'Teeth Whitening', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2180, 2180, 2172, 'Toothbrush Accessories', 'Health & Beauty > Personal Care > Oral Care', 2, 1),
(2181, 2181, 2180, 'Toothbrush Replacement Heads', 'Health & Beauty > Personal Care > Oral Care > Toothbrush Accessories', 0, 1),
(2182, 2182, 2180, 'Toothbrush Sanitizers', 'Health & Beauty > Personal Care > Oral Care > Toothbrush Accessories', 0, 1),
(2183, 2183, 2172, 'Toothbrushes', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2184, 2184, 2172, 'Toothpaste', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2185, 2185, 2172, 'Toothpaste Squeezers & Dispensers', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2186, 2186, 2172, 'Toothpicks', 'Health & Beauty > Personal Care > Oral Care', 0, 1),
(2187, 2187, 2079, 'Shaving & Grooming', 'Health & Beauty > Personal Care', 10, 1),
(2188, 2188, 2187, 'Aftershave', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2189, 2189, 2187, 'Electric Razor Accessories', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2190, 2190, 2187, 'Electric Razors', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2191, 2191, 2187, 'Grooming Trimmers', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2192, 2192, 2187, 'Hair Removal', 'Health & Beauty > Personal Care > Shaving & Grooming', 4, 1),
(2193, 2193, 2192, 'Depilatories', 'Health & Beauty > Personal Care > Shaving & Grooming > Hair Removal', 0, 1),
(2194, 2194, 2192, 'Electrolysis Devices', 'Health & Beauty > Personal Care > Shaving & Grooming > Hair Removal', 0, 1),
(2195, 2195, 2192, 'Epilators', 'Health & Beauty > Personal Care > Shaving & Grooming > Hair Removal', 0, 1),
(2196, 2196, 2192, 'Waxing Kits', 'Health & Beauty > Personal Care > Shaving & Grooming > Hair Removal', 0, 1),
(2197, 2197, 2187, 'Razors & Razor Blades', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2198, 2198, 2187, 'Shaving Brushes', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2199, 2199, 2187, 'Shaving Cream', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2200, 2200, 2187, 'Shaving Kits', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2201, 2201, 2187, 'Styptic Pencils', 'Health & Beauty > Personal Care > Shaving & Grooming', 0, 1),
(2202, 2202, 2079, 'Sleeping Aids', 'Health & Beauty > Personal Care', 4, 1),
(2203, 2203, 2202, 'Sleep Masks', 'Health & Beauty > Personal Care > Sleeping Aids', 0, 1),
(2204, 2204, 2202, 'Snoring Aids', 'Health & Beauty > Personal Care > Sleeping Aids', 0, 1),
(2205, 2205, 2202, 'Travel Pillows', 'Health & Beauty > Personal Care > Sleeping Aids', 0, 1),
(2206, 2206, 2202, 'White Noise Machines', 'Health & Beauty > Personal Care > Sleeping Aids', 0, 1),
(2207, 2207, 2079, 'Tanning Beds', 'Health & Beauty > Personal Care', 0, 1),
(2208, 2208, 2079, 'Vision Care', 'Health & Beauty > Personal Care', 7, 1),
(2209, 2209, 2208, 'Contact Lens Care', 'Health & Beauty > Personal Care > Vision Care', 0, 1),
(2210, 2210, 2208, 'Contact Lenses', 'Health & Beauty > Personal Care > Vision Care', 0, 1),
(2211, 2211, 2208, 'Eye Drops', 'Health & Beauty > Personal Care > Vision Care', 0, 1),
(2212, 2212, 2208, 'Eye Glass Accessories', 'Health & Beauty > Personal Care > Vision Care', 0, 1),
(2213, 2213, 2208, 'Eye Glass Frames', 'Health & Beauty > Personal Care > Vision Care', 0, 1),
(2214, 2214, 2208, 'Eye Glass Lenses', 'Health & Beauty > Personal Care > Vision Care', 0, 1),
(2215, 2215, 2208, 'Eye Glasses', 'Health & Beauty > Personal Care > Vision Care', 0, 1),
(2216, 2216, 0, 'Home & Garden', '', 18, 1),
(2217, 2217, 2216, 'Bathroom Accessories', 'Home & Garden', 14, 1),
(2218, 2218, 2217, 'Bath Caddies', 'Home & Garden > Bathroom Accessories', 0, 1),
(2219, 2219, 2217, 'Bath Mats & Rugs', 'Home & Garden > Bathroom Accessories', 0, 1),
(2220, 2220, 2217, 'Bath Pillows', 'Home & Garden > Bathroom Accessories', 0, 1),
(2221, 2221, 2217, 'Facial Tissue Holders', 'Home & Garden > Bathroom Accessories', 0, 1),
(2222, 2222, 2217, 'Hand Dryers', 'Home & Garden > Bathroom Accessories', 0, 1),
(2223, 2223, 2217, 'Medicine Cabinets', 'Home & Garden > Bathroom Accessories', 0, 1),
(2224, 2224, 2217, 'Shower Curtain Rings', 'Home & Garden > Bathroom Accessories', 0, 1),
(2225, 2225, 2217, 'Shower Curtains', 'Home & Garden > Bathroom Accessories', 0, 1),
(2226, 2226, 2217, 'Soap & Lotion Dispensers', 'Home & Garden > Bathroom Accessories', 0, 1),
(2227, 2227, 2217, 'Soap Dishes', 'Home & Garden > Bathroom Accessories', 0, 1),
(2228, 2228, 2217, 'Toilet Brushes', 'Home & Garden > Bathroom Accessories', 0, 1),
(2229, 2229, 2217, 'Toilet Paper Holders', 'Home & Garden > Bathroom Accessories', 0, 1),
(2230, 2230, 2217, 'Toothbrush Holders', 'Home & Garden > Bathroom Accessories', 0, 1),
(2231, 2231, 2217, 'Towel Racks & Holders', 'Home & Garden > Bathroom Accessories', 0, 1),
(2232, 2232, 2216, 'Decor', 'Home & Garden', 36, 1),
(2233, 2233, 2232, 'Address Signs', 'Home & Garden > Decor', 0, 1),
(2234, 2234, 2232, 'Artificial Plants & Flowers', 'Home & Garden > Decor', 0, 1),
(2235, 2235, 2232, 'Bird Baths', 'Home & Garden > Decor', 0, 1),
(2236, 2236, 2232, 'Bird Feeders', 'Home & Garden > Decor', 0, 1),
(2237, 2237, 2232, 'Birdhouses', 'Home & Garden > Decor', 0, 1),
(2238, 2238, 2232, 'Bookends', 'Home & Garden > Decor', 0, 1),
(2239, 2239, 2232, 'Candle Holders', 'Home & Garden > Decor', 0, 1),
(2240, 2240, 2232, 'Candles', 'Home & Garden > Decor', 0, 1),
(2241, 2241, 2232, 'Clocks', 'Home & Garden > Decor', 3, 1),
(2242, 2242, 2241, 'Alarm Clocks', 'Home & Garden > Decor > Clocks', 1, 1),
(2243, 2243, 2241, 'Grandfather Clocks', 'Home & Garden > Decor > Clocks', 0, 1),
(2244, 2244, 2241, 'Wall Clocks', 'Home & Garden > Decor > Clocks', 1, 1),
(2245, 2245, 2244, 'Cuckoo Clocks', 'Home & Garden > Decor > Clocks > Wall Clocks', 0, 1),
(2246, 2246, 2232, 'Doors & Windows', 'Home & Garden > Decor', 5, 1),
(2247, 2247, 2246, 'Door Bells', 'Home & Garden > Decor > Doors & Windows', 0, 1),
(2248, 2248, 2246, 'Door Knockers', 'Home & Garden > Decor > Doors & Windows', 0, 1),
(2249, 2249, 2246, 'Door Mats', 'Home & Garden > Decor > Doors & Windows', 0, 1),
(2250, 2250, 2246, 'Door Stops', 'Home & Garden > Decor > Doors & Windows', 0, 1),
(2251, 2251, 2246, 'Window Treatments', 'Home & Garden > Decor > Doors & Windows', 4, 1),
(2252, 2252, 2251, 'Curtains & Drapes', 'Home & Garden > Decor > Doors & Windows > Window Treatments', 0, 1),
(2253, 2253, 2251, 'Valances', 'Home & Garden > Decor > Doors & Windows > Window Treatments', 0, 1),
(2254, 2254, 2251, 'Window Blinds & Shades', 'Home & Garden > Decor > Doors & Windows > Window Treatments', 0, 1),
(2255, 2255, 2251, 'Window Screens', 'Home & Garden > Decor > Doors & Windows > Window Treatments', 0, 1),
(2256, 2256, 2232, 'Flags & Windsocks', 'Home & Garden > Decor', 0, 1),
(2257, 2257, 2232, 'Flameless Candles', 'Home & Garden > Decor', 0, 1),
(2258, 2258, 2232, 'Fountains & Ponds', 'Home & Garden > Decor', 4, 1),
(2259, 2259, 2258, 'Fountain & Pond Accessories', 'Home & Garden > Decor > Fountains & Ponds', 0, 1),
(2260, 2260, 2258, 'Indoor Fountains', 'Home & Garden > Decor > Fountains & Ponds', 0, 1),
(2261, 2261, 2258, 'Outdoor Fountains', 'Home & Garden > Decor > Fountains & Ponds', 0, 1),
(2262, 2262, 2258, 'Ponds', 'Home & Garden > Decor > Fountains & Ponds', 0, 1),
(2263, 2263, 2232, 'Garden & Stepping Stones', 'Home & Garden > Decor', 0, 1),
(2264, 2264, 2232, 'Gazing Globes', 'Home & Garden > Decor', 0, 1),
(2265, 2265, 2232, 'Home Fragrances', 'Home & Garden > Decor', 4, 1),
(2266, 2266, 2265, 'Air Fresheners', 'Home & Garden > Decor > Home Fragrances', 0, 1),
(2267, 2267, 2265, 'Incense', 'Home & Garden > Decor > Home Fragrances', 0, 1),
(2268, 2268, 2265, 'Incense Holders', 'Home & Garden > Decor > Home Fragrances', 0, 1),
(2269, 2269, 2265, 'Potpourri', 'Home & Garden > Decor > Home Fragrances', 0, 1),
(2270, 2270, 2232, 'Mailboxes', 'Home & Garden > Decor', 0, 1),
(2271, 2271, 2232, 'Mirrors', 'Home & Garden > Decor', 0, 1),
(2272, 2272, 2232, 'Music Boxes', 'Home & Garden > Decor', 0, 1),
(2273, 2273, 2232, 'Photo Storage & Display', 'Home & Garden > Decor', 3, 1),
(2274, 2274, 2273, 'Photo Albums', 'Home & Garden > Decor > Photo Storage & Display', 0, 1),
(2275, 2275, 2273, 'Photo Storage Boxes', 'Home & Garden > Decor > Photo Storage & Display', 0, 1),
(2276, 2276, 2273, 'Picture Frames', 'Home & Garden > Decor > Photo Storage & Display', 2, 1),
(2277, 2277, 2276, 'Digital Picture Frames', 'Home & Garden > Decor > Photo Storage & Display > Picture Frames', 0, 1),
(2278, 2278, 2276, 'Poster Frames', 'Home & Garden > Decor > Photo Storage & Display > Picture Frames', 0, 1),
(2279, 2279, 2232, 'Piggy Banks & Money Jars', 'Home & Garden > Decor', 0, 1),
(2280, 2280, 2232, 'Plaques', 'Home & Garden > Decor', 0, 1),
(2281, 2281, 2232, 'Rain Chains', 'Home & Garden > Decor', 0, 1),
(2282, 2282, 2232, 'Rain Gauges', 'Home & Garden > Decor', 0, 1),
(2283, 2283, 2232, 'Rugs', 'Home & Garden > Decor', 1, 1),
(2284, 2284, 2283, 'Electric Rugs', 'Home & Garden > Decor > Rugs', 0, 1),
(2285, 2285, 2232, 'Seasonal & Holiday Decorations', 'Home & Garden > Decor', 5, 1),
(2286, 2286, 2285, 'Advent Calendars', 'Home & Garden > Decor > Seasonal & Holiday Decorations', 0, 1),
(2287, 2287, 2285, 'Advent Wreaths', 'Home & Garden > Decor > Seasonal & Holiday Decorations', 0, 1),
(2288, 2288, 2285, 'Holiday Candles', 'Home & Garden > Decor > Seasonal & Holiday Decorations', 0, 1),
(2289, 2289, 2285, 'Holiday Ornaments', 'Home & Garden > Decor > Seasonal & Holiday Decorations', 0, 1),
(2290, 2290, 2232, 'Seat & Sofa Cushions', 'Home & Garden > Decor', 0, 1),
(2291, 2291, 2232, 'Slipcovers', 'Home & Garden > Decor', 0, 1),
(2292, 2292, 2232, 'Sundials', 'Home & Garden > Decor', 0, 1),
(2293, 2293, 2232, 'Throw Pillows', 'Home & Garden > Decor', 1, 1),
(2294, 2294, 2293, 'Backrest Pillows', 'Home & Garden > Decor > Throw Pillows', 0, 1),
(2295, 2295, 2232, 'Vases', 'Home & Garden > Decor', 0, 1),
(2296, 2296, 2232, 'Weather Vanes & Roof Decor', 'Home & Garden > Decor', 0, 1),
(2297, 2297, 2232, 'Wind Chimes', 'Home & Garden > Decor', 0, 1),
(2298, 2298, 2232, 'Windwheels', 'Home & Garden > Decor', 0, 1),
(2299, 2299, 2232, 'World Globes', 'Home & Garden > Decor', 0, 1),
(2300, 2300, 2216, 'Earthquake Safety', 'Home & Garden', 2, 1),
(2301, 2301, 2300, 'Earthquake Alarms', 'Home & Garden > Earthquake Safety', 0, 1),
(2302, 2302, 2300, 'Furniture Anchors', 'Home & Garden > Earthquake Safety', 0, 1),
(2303, 2303, 2216, 'Fire & Gas Safety', 'Home & Garden', 7, 1),
(2304, 2304, 2303, 'Carbon Monoxide Detectors', 'Home & Garden > Fire & Gas Safety', 0, 1),
(2305, 2305, 2303, 'Fire Alarms', 'Home & Garden > Fire & Gas Safety', 0, 1),
(2306, 2306, 2303, 'Fire Extinguisher Cabinets', 'Home & Garden > Fire & Gas Safety', 0, 1),
(2307, 2307, 2303, 'Fire Extinguishers', 'Home & Garden > Fire & Gas Safety', 0, 1),
(2308, 2308, 2303, 'Fire Sprinklers', 'Home & Garden > Fire & Gas Safety', 0, 1),
(2309, 2309, 2303, 'Radon Detectors', 'Home & Garden > Fire & Gas Safety', 0, 1),
(2310, 2310, 2303, 'Smoke Detectors', 'Home & Garden > Fire & Gas Safety', 0, 1),
(2311, 2311, 2216, 'Fireplace & Wood Stove Accessories', 'Home & Garden', 6, 1),
(2312, 2312, 2311, 'Bellows', 'Home & Garden > Fireplace & Wood Stove Accessories', 0, 1),
(2313, 2313, 2311, 'Fireplace Screens', 'Home & Garden > Fireplace & Wood Stove Accessories', 0, 1),
(2314, 2314, 2311, 'Fireplace Tools', 'Home & Garden > Fireplace & Wood Stove Accessories', 0, 1),
(2315, 2315, 2311, 'Firewood & Fuel', 'Home & Garden > Fireplace & Wood Stove Accessories', 0, 1),
(2316, 2316, 2311, 'Log & Wood Racks', 'Home & Garden > Fireplace & Wood Stove Accessories', 0, 1),
(2317, 2317, 2311, 'Wood Stove Fans & Blowers', 'Home & Garden > Fireplace & Wood Stove Accessories', 0, 1),
(2318, 2318, 2216, 'Fireplaces & Wood Stoves', 'Home & Garden', 3, 1),
(2319, 2319, 2318, 'Indoor Fireplaces', 'Home & Garden > Fireplaces & Wood Stoves', 0, 1),
(2320, 2320, 2318, 'Outdoor Fireplaces', 'Home & Garden > Fireplaces & Wood Stoves', 0, 1),
(2321, 2321, 2318, 'Wood Stoves', 'Home & Garden > Fireplaces & Wood Stoves', 0, 1),
(2322, 2322, 2216, 'Home Security', 'Home & Garden', 7, 1),
(2323, 2323, 2322, 'Home Alarm Systems', 'Home & Garden > Home Security', 0, 1),
(2324, 2324, 2322, 'Motion Sensors', 'Home & Garden > Home Security', 0, 1),
(2325, 2325, 2322, 'Safes', 'Home & Garden > Home Security', 0, 1),
(2326, 2326, 2322, 'Security Lights', 'Home & Garden > Home Security', 0, 1),
(2327, 2327, 2322, 'Security Monitors & Recorders', 'Home & Garden > Home Security', 0, 1),
(2328, 2328, 2322, 'Security System Sensors', 'Home & Garden > Home Security', 0, 1),
(2329, 2329, 2216, 'Household Appliance Accessories', 'Home & Garden', 11, 1),
(2330, 2330, 2329, 'Air Conditioner Accessories', 'Home & Garden > Household Appliance Accessories', 1, 1),
(2331, 2331, 2330, 'Air Conditioner Filters', 'Home & Garden > Household Appliance Accessories > Air Conditioner Accessories', 0, 1),
(2332, 2332, 2329, 'Air Purifier Accessories', 'Home & Garden > Household Appliance Accessories', 1, 1),
(2333, 2333, 2332, 'Air Purifier Filters', 'Home & Garden > Household Appliance Accessories > Air Purifier Accessories', 0, 1),
(2334, 2334, 2329, 'Carpet & Steam Cleaner Accessories', 'Home & Garden > Household Appliance Accessories', 0, 1),
(2335, 2335, 2329, 'Dehumidifier Accessories', 'Home & Garden > Household Appliance Accessories', 1, 1),
(2336, 2336, 2335, 'Dehumidifier Filters', 'Home & Garden > Household Appliance Accessories > Dehumidifier Accessories', 0, 1),
(2337, 2337, 2329, 'Fan Accessories', 'Home & Garden > Household Appliance Accessories', 0, 1),
(2338, 2338, 2329, 'Humidifier Accessories', 'Home & Garden > Household Appliance Accessories', 1, 1),
(2339, 2339, 2338, 'Humidifier Filters', 'Home & Garden > Household Appliance Accessories > Humidifier Accessories', 0, 1),
(2340, 2340, 2329, 'Laundry Appliance Accessories', 'Home & Garden > Household Appliance Accessories', 5, 1),
(2341, 2341, 2340, 'Garment Steamer Accessories', 'Home & Garden > Household Appliance Accessories > Laundry Appliance Accessories', 0, 1),
(2342, 2342, 2340, 'Iron Accessories', 'Home & Garden > Household Appliance Accessories > Laundry Appliance Accessories', 0, 1),
(2343, 2343, 2340, 'Laundry Dryer Accessories', 'Home & Garden > Household Appliance Accessories > Laundry Appliance Accessories', 0, 1),
(2344, 2344, 2340, 'Laundry Washer Accessories', 'Home & Garden > Household Appliance Accessories > Laundry Appliance Accessories', 2, 1),
(2345, 2345, 2344, 'Laundry Washer Hoses', 'Home & Garden > Household Appliance Accessories > Laundry Appliance Accessories > Laundry Washer Accessories', 0, 1),
(2346, 2346, 2344, 'Laundry Washer Valves', 'Home & Garden > Household Appliance Accessories > Laundry Appliance Accessories > Laundry Washer Accessories', 0, 1),
(2347, 2347, 2340, 'Steam Press Accessories', 'Home & Garden > Household Appliance Accessories > Laundry Appliance Accessories', 0, 1),
(2348, 2348, 2329, 'Patio Heater Accessories', 'Home & Garden > Household Appliance Accessories', 1, 1),
(2349, 2349, 2348, 'Patio Heater Covers', 'Home & Garden > Household Appliance Accessories > Patio Heater Accessories', 0, 1),
(2350, 2350, 2329, 'Sewing Machine Accessories', 'Home & Garden > Household Appliance Accessories', 4, 1),
(2351, 2351, 2350, 'Bobbins & Bobbin Cases', 'Home & Garden > Household Appliance Accessories > Sewing Machine Accessories', 0, 1),
(2352, 2352, 2350, 'Sewing Machine Cases & Covers', 'Home & Garden > Household Appliance Accessories > Sewing Machine Accessories', 0, 1),
(2353, 2353, 2350, 'Sewing Machine Feet', 'Home & Garden > Household Appliance Accessories > Sewing Machine Accessories', 0, 1),
(2354, 2354, 2350, 'Sewing Machine Needles', 'Home & Garden > Household Appliance Accessories > Sewing Machine Accessories', 0, 1),
(2355, 2355, 2329, 'Vacuum Accessories', 'Home & Garden > Household Appliance Accessories', 5, 1),
(2356, 2356, 2355, 'Vacuum Attachments', 'Home & Garden > Household Appliance Accessories > Vacuum Accessories', 0, 1),
(2357, 2357, 2355, 'Vacuum Bags', 'Home & Garden > Household Appliance Accessories > Vacuum Accessories', 0, 1),
(2358, 2358, 2355, 'Vacuum Belts', 'Home & Garden > Household Appliance Accessories > Vacuum Accessories', 0, 1),
(2359, 2359, 2355, 'Vacuum Filters', 'Home & Garden > Household Appliance Accessories > Vacuum Accessories', 0, 1),
(2360, 2360, 2355, 'Vacuum Hoses', 'Home & Garden > Household Appliance Accessories > Vacuum Accessories', 0, 1),
(2361, 2361, 2329, 'Water Heater Accessories', 'Home & Garden > Household Appliance Accessories', 6, 1),
(2362, 2362, 2361, 'Anode Rods', 'Home & Garden > Household Appliance Accessories > Water Heater Accessories', 0, 1),
(2363, 2363, 2361, 'Heater Elements', 'Home & Garden > Household Appliance Accessories > Water Heater Accessories', 0, 1),
(2364, 2364, 2361, 'Heater Pans', 'Home & Garden > Household Appliance Accessories > Water Heater Accessories', 0, 1),
(2365, 2365, 2361, 'Heater Stacks', 'Home & Garden > Household Appliance Accessories > Water Heater Accessories', 0, 1),
(2366, 2366, 2361, 'Heater Vents', 'Home & Garden > Household Appliance Accessories > Water Heater Accessories', 0, 1),
(2367, 2367, 2361, 'Hot Water Cylinders', 'Home & Garden > Household Appliance Accessories > Water Heater Accessories', 0, 1),
(2368, 2368, 2216, 'Household Appliances', 'Home & Garden', 11, 1),
(2369, 2369, 2368, 'Carpet & Steam Cleaners', 'Home & Garden > Household Appliances', 0, 1),
(2370, 2370, 2368, 'Climate Control', 'Home & Garden > Household Appliances', 11, 1),
(2371, 2371, 2370, 'Air Conditioners', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2372, 2372, 2370, 'Air Purifiers', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2373, 2373, 2370, 'Dehumidifiers', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2374, 2374, 2370, 'Fans', 'Home & Garden > Household Appliances > Climate Control', 3, 1),
(2375, 2375, 2374, 'Ceiling Fans', 'Home & Garden > Household Appliances > Climate Control > Fans', 0, 1),
(2376, 2376, 2374, 'Desk & Pedestal Fans', 'Home & Garden > Household Appliances > Climate Control > Fans', 0, 1),
(2377, 2377, 2374, 'Ventilation Fans', 'Home & Garden > Household Appliances > Climate Control > Fans', 0, 1),
(2378, 2378, 2370, 'Furnaces & Boilers', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2379, 2379, 2370, 'Humidifiers', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2380, 2380, 2370, 'Kotatsu', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2381, 2381, 2370, 'Patio Heaters', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2383, 2383, 2370, 'Space Heaters', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(2384, 2384, 2368, 'Floor Polishers & Buffers', 'Home & Garden > Household Appliances', 0, 1),
(2385, 2385, 2368, 'Futon Dryers', 'Home & Garden > Household Appliances', 0, 1),
(2386, 2386, 2368, 'Garage Door Openers', 'Home & Garden > Household Appliances', 0, 1),
(2387, 2387, 2368, 'Garage Parking Sensors', 'Home & Garden > Household Appliances', 0, 1),
(2388, 2388, 2368, 'Home Automation', 'Home & Garden > Household Appliances', 0, 1),
(2389, 2389, 2368, 'Laundry Appliances', 'Home & Garden > Household Appliances', 6, 1),
(2390, 2390, 2389, 'Garment Steamers', 'Home & Garden > Household Appliances > Laundry Appliances', 0, 1),
(2391, 2391, 2389, 'Irons', 'Home & Garden > Household Appliances > Laundry Appliances', 0, 1),
(2392, 2392, 2389, 'Laundry Combo Units', 'Home & Garden > Household Appliances > Laundry Appliances', 0, 1),
(2393, 2393, 2389, 'Laundry Dryers', 'Home & Garden > Household Appliances > Laundry Appliances', 0, 1),
(2394, 2394, 2389, 'Laundry Washers', 'Home & Garden > Household Appliances > Laundry Appliances', 0, 1),
(2395, 2395, 2389, 'Steam Presses', 'Home & Garden > Household Appliances > Laundry Appliances', 0, 1),
(2396, 2396, 2368, 'Sewing Machines', 'Home & Garden > Household Appliances', 0, 1),
(2397, 2397, 2368, 'Vacuums', 'Home & Garden > Household Appliances', 0, 1),
(2398, 2398, 2368, 'Water Heaters', 'Home & Garden > Household Appliances', 1, 1),
(2399, 2399, 2398, 'Immersion Heaters', 'Home & Garden > Household Appliances > Water Heaters', 0, 1),
(2400, 2400, 2216, 'Household Supplies', 'Home & Garden', 11, 1),
(2401, 2401, 2400, 'Garbage Bags', 'Home & Garden > Household Supplies', 0, 1),
(2402, 2402, 2400, 'Household Cleaning Supplies', 'Home & Garden > Household Supplies', 11, 1),
(2403, 2403, 2402, 'Broom & Mop Handles', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2404, 2404, 2402, 'Brooms', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2405, 2405, 2402, 'Carpet Sweepers', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2406, 2406, 2402, 'Cleaning Gloves', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2407, 2407, 2402, 'Dusters', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2408, 2408, 2402, 'Dustpans', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2409, 2409, 2402, 'Household Cleaning Products', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 8, 1),
(2410, 2410, 2409, 'Carpet Cleaners', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2411, 2411, 2409, 'Dish Detergent & Soap', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2412, 2412, 2409, 'Glass & Surface Cleaners', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2413, 2413, 2409, 'Hardwood Floor Cleaners', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2414, 2414, 2409, 'Oven Cleaners', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2415, 2415, 2409, 'Pet Odor & Stain Removers', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2416, 2416, 2409, 'Toilet Bowl Cleaners', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2417, 2417, 2409, 'Tub & Tile Cleaners', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Household Cleaning Products', 0, 1),
(2418, 2418, 2402, 'Mops', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2419, 2419, 2402, 'Scrub Brushes', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 1, 1),
(2420, 2420, 2419, 'Baby Bottle Brushes', 'Home & Garden > Household Supplies > Household Cleaning Supplies > Scrub Brushes', 0, 1),
(2421, 2421, 2402, 'Sponges & Scouring Pads', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2422, 2422, 2402, 'Squeegees', 'Home & Garden > Household Supplies > Household Cleaning Supplies', 0, 1),
(2423, 2423, 2400, 'Household Paper Products', 'Home & Garden > Household Supplies', 4, 1),
(2424, 2424, 2423, 'Facial Tissues', 'Home & Garden > Household Supplies > Household Paper Products', 0, 1),
(2425, 2425, 2423, 'Paper Napkins', 'Home & Garden > Household Supplies > Household Paper Products', 0, 1),
(2426, 2426, 2423, 'Paper Towels', 'Home & Garden > Household Supplies > Household Paper Products', 0, 1),
(2427, 2427, 2423, 'Toilet Paper', 'Home & Garden > Household Supplies > Household Paper Products', 0, 1),
(2428, 2428, 2400, 'Household Thermometers', 'Home & Garden > Household Supplies', 0, 1),
(2429, 2429, 2400, 'Laundry Supplies', 'Home & Garden > Household Supplies', 11, 1),
(2430, 2430, 2429, 'Bleach', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2431, 2431, 2429, 'Drying Racks', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2432, 2432, 2429, 'Fabric Softeners & Dryer Sheets', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2433, 2433, 2429, 'Fabric Stain Removers', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2434, 2434, 2429, 'Ironing Board Pads & Covers', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2435, 2435, 2429, 'Ironing Boards', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2436, 2436, 2429, 'Laundry Balls', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2437, 2437, 2429, 'Laundry Baskets', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2438, 2438, 2429, 'Laundry Detergent', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2439, 2439, 2429, 'Lint Rollers', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2440, 2440, 2429, 'Washing Bags & Baskets', 'Home & Garden > Household Supplies > Laundry Supplies', 0, 1),
(2441, 2441, 2400, 'Pest Control', 'Home & Garden > Household Supplies', 4, 1),
(2442, 2442, 2441, 'Fly Swatters', 'Home & Garden > Household Supplies > Pest Control', 0, 1),
(2443, 2443, 2441, 'Pest Control Traps', 'Home & Garden > Household Supplies > Pest Control', 0, 1),
(2444, 2444, 2441, 'Pesticides', 'Home & Garden > Household Supplies > Pest Control', 0, 1),
(2445, 2445, 2441, 'Repellents', 'Home & Garden > Household Supplies > Pest Control', 1, 1),
(2446, 2446, 2445, 'Insect Repellents', 'Home & Garden > Household Supplies > Pest Control > Repellents', 0, 1),
(2447, 2447, 2400, 'Rug Pads', 'Home & Garden > Household Supplies', 0, 1),
(2448, 2448, 2400, 'Shoe Care', 'Home & Garden > Household Supplies', 5, 1),
(2449, 2449, 2448, 'Shoe Bags', 'Home & Garden > Household Supplies > Shoe Care', 0, 1),
(2450, 2450, 2448, 'Shoe Brushes', 'Home & Garden > Household Supplies > Shoe Care', 0, 1),
(2451, 2451, 2448, 'Shoe Dryers', 'Home & Garden > Household Supplies > Shoe Care', 0, 1),
(2452, 2452, 2448, 'Shoe Polishes & Waxes', 'Home & Garden > Household Supplies > Shoe Care', 0, 1),
(2453, 2453, 2448, 'Shoe Trees', 'Home & Garden > Household Supplies > Shoe Care', 0, 1),
(2454, 2454, 2400, 'Storage & Organization', 'Home & Garden > Household Supplies', 9, 1),
(2455, 2455, 2454, 'Charging Valets', 'Home & Garden > Household Supplies > Storage & Organization', 0, 1),
(2456, 2456, 2454, 'Dresser Valets', 'Home & Garden > Household Supplies > Storage & Organization', 0, 1),
(2457, 2457, 2454, 'Flatware Chests', 'Home & Garden > Household Supplies > Storage & Organization', 0, 1),
(2458, 2458, 2454, 'Hangers', 'Home & Garden > Household Supplies > Storage & Organization', 0, 1),
(2459, 2459, 2454, 'Household Storage Bags', 'Home & Garden > Household Supplies > Storage & Organization', 0, 1),
(2460, 2460, 2454, 'Pillboxes', 'Home & Garden > Household Supplies > Storage & Organization', 0, 1),
(2462, 2462, 2454, 'Storage Hooks & Racks', 'Home & Garden > Household Supplies > Storage & Organization', 1, 1),
(2463, 2463, 2462, 'Robe Hooks', 'Home & Garden > Household Supplies > Storage & Organization > Storage Hooks & Racks', 0, 1),
(2464, 2464, 2400, 'Trash Compactor Accessories', 'Home & Garden > Household Supplies', 0, 1),
(2465, 2465, 2400, 'Waste Containment', 'Home & Garden > Household Supplies', 4, 1),
(2466, 2466, 2465, 'Hazardous Waste Containers', 'Home & Garden > Household Supplies > Waste Containment', 0, 1),
(2467, 2467, 2465, 'Recycling Containers', 'Home & Garden > Household Supplies > Waste Containment', 0, 1),
(2468, 2468, 2465, 'Trash Cans & Wastebaskets', 'Home & Garden > Household Supplies > Waste Containment', 0, 1),
(2469, 2469, 2465, 'Waste Container Lids', 'Home & Garden > Household Supplies > Waste Containment', 0, 1),
(2470, 2470, 2216, 'Kitchen & Dining', 'Home & Garden', 11, 1),
(2471, 2471, 2470, 'Bakeware', 'Home & Garden > Kitchen & Dining', 11, 1),
(2472, 2472, 2471, 'Bakeware Sets', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2473, 2473, 2471, 'Baking & Cookie Sheets', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2474, 2474, 2471, 'Baking Molds', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2475, 2475, 2471, 'Bread Pans', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2476, 2476, 2471, 'Cake Pans', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2477, 2477, 2471, 'Muffin & Cupcake Pans', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2478, 2478, 2471, 'Pie & Quiche Pans', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2479, 2479, 2471, 'Pizza Pans', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2480, 2480, 2471, 'Pizza Stones', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2481, 2481, 2471, 'Ramekins & Souffle Dishes', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2482, 2482, 2471, 'Roasting Pans', 'Home & Garden > Kitchen & Dining > Bakeware', 0, 1),
(2483, 2483, 2470, 'Bakeware Accessories', 'Home & Garden > Kitchen & Dining', 3, 1),
(2484, 2484, 2483, 'Baking Cups', 'Home & Garden > Kitchen & Dining > Bakeware Accessories', 0, 1),
(2485, 2485, 2483, 'Baking Mats & Liners', 'Home & Garden > Kitchen & Dining > Bakeware Accessories', 0, 1),
(2486, 2486, 2483, 'Roasting Pan Racks', 'Home & Garden > Kitchen & Dining > Bakeware Accessories', 0, 1),
(2487, 2487, 2470, 'Barware', 'Home & Garden > Kitchen & Dining', 7, 1),
(2488, 2488, 2487, 'Beer Taps', 'Home & Garden > Kitchen & Dining > Barware', 0, 1),
(2489, 2489, 2487, 'Bottle Stoppers & Savers', 'Home & Garden > Kitchen & Dining > Barware', 0, 1),
(2490, 2490, 2487, 'Coasters', 'Home & Garden > Kitchen & Dining > Barware', 0, 1),
(2491, 2491, 2487, 'Corkscrews', 'Home & Garden > Kitchen & Dining > Barware', 0, 1),
(2492, 2492, 2487, 'Decanters', 'Home & Garden > Kitchen & Dining > Barware', 0, 1),
(2493, 2493, 2487, 'Drink Shakers & Tools', 'Home & Garden > Kitchen & Dining > Barware', 2, 1),
(2494, 2494, 2493, 'Bar Ice Picks', 'Home & Garden > Kitchen & Dining > Barware > Drink Shakers & Tools', 0, 1),
(2495, 2495, 2493, 'Bottle Openers', 'Home & Garden > Kitchen & Dining > Barware > Drink Shakers & Tools', 0, 1),
(2496, 2496, 2487, 'Wine Aerators', 'Home & Garden > Kitchen & Dining > Barware', 0, 1),
(2497, 2497, 2470, 'Cookware', 'Home & Garden > Kitchen & Dining', 16, 1),
(2498, 2498, 2497, 'Casseroles', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2499, 2499, 2497, 'Cookware Sets', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2500, 2500, 2497, 'Double Boilers', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2501, 2501, 2497, 'Dutch Ovens', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2502, 2502, 2497, 'Griddles & Grill Pans', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2503, 2503, 2497, 'Grill Presses', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2504, 2504, 2497, 'Paella Pans', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2505, 2505, 2497, 'Pressure Cookers', 'Home & Garden > Kitchen & Dining > Cookware', 1, 1),
(2506, 2506, 2505, 'Electric Pressure Cookers', 'Home & Garden > Kitchen & Dining > Cookware > Pressure Cookers', 0, 1),
(2507, 2507, 2497, 'Saucepans', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2509, 2509, 2497, 'Skillets & Frying Pans', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2510, 2510, 2497, 'Stock Pots', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2511, 2511, 2497, 'Stovetop Kettles', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2512, 2512, 2497, 'Tajines', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2513, 2513, 2497, 'Woks', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(2514, 2514, 2470, 'Cookware Accessories', 'Home & Garden > Kitchen & Dining', 5, 1),
(2515, 2515, 2514, 'Pot & Pan Handles', 'Home & Garden > Kitchen & Dining > Cookware Accessories', 0, 1),
(2516, 2516, 2514, 'Pot & Pan Lids', 'Home & Garden > Kitchen & Dining > Cookware Accessories', 0, 1),
(2517, 2517, 2514, 'Pressure Cooker Accessories', 'Home & Garden > Kitchen & Dining > Cookware Accessories', 0, 1),
(2518, 2518, 2514, 'Steamer Baskets', 'Home & Garden > Kitchen & Dining > Cookware Accessories', 0, 1),
(2519, 2519, 2514, 'Wok Accessories', 'Home & Garden > Kitchen & Dining > Cookware Accessories', 2, 1),
(2520, 2520, 2519, 'Wok Brushes', 'Home & Garden > Kitchen & Dining > Cookware Accessories > Wok Accessories', 0, 1),
(2521, 2521, 2519, 'Wok Rings', 'Home & Garden > Kitchen & Dining > Cookware Accessories > Wok Accessories', 0, 1),
(2522, 2522, 2470, 'Food & Beverage Carriers', 'Home & Garden > Kitchen & Dining', 12, 1),
(2523, 2523, 2522, 'Airpots', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2524, 2524, 2522, 'Canteens', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2525, 2525, 2522, 'Coolers', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2526, 2526, 2522, 'Drink Lids', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2527, 2527, 2522, 'Drink Sleeves', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 2, 1),
(2528, 2528, 2527, 'Can & Bottle Sleeves', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers > Drink Sleeves', 0, 1),
(2529, 2529, 2527, 'Cup Sleeves', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers > Drink Sleeves', 0, 1),
(2530, 2530, 2522, 'Flasks', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2531, 2531, 2522, 'Insulated Bags', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2532, 2532, 2522, 'Lunch Boxes & Totes', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2533, 2533, 2522, 'Picnic Baskets', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2534, 2534, 2522, 'Thermoses', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2535, 2535, 2522, 'Water Bottles', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2536, 2536, 2522, 'Wine Buckets & Chillers', 'Home & Garden > Kitchen & Dining > Food & Beverage Carriers', 0, 1),
(2537, 2537, 2470, 'Food Storage', 'Home & Garden > Kitchen & Dining', 6, 1),
(2538, 2538, 2537, 'Bread Boxes', 'Home & Garden > Kitchen & Dining > Food Storage', 0, 1),
(2539, 2539, 2537, 'Cookie Jars', 'Home & Garden > Kitchen & Dining > Food Storage', 0, 1),
(2540, 2540, 2537, 'Food Storage Bags', 'Home & Garden > Kitchen & Dining > Food Storage', 0, 1),
(2541, 2541, 2537, 'Food Storage Containers', 'Home & Garden > Kitchen & Dining > Food Storage', 0, 1),
(2542, 2542, 2537, 'Food Wraps', 'Home & Garden > Kitchen & Dining > Food Storage', 3, 1),
(2543, 2543, 2542, 'Foil', 'Home & Garden > Kitchen & Dining > Food Storage > Food Wraps', 0, 1),
(2544, 2544, 2542, 'Plastic Wraps', 'Home & Garden > Kitchen & Dining > Food Storage > Food Wraps', 0, 1),
(2545, 2545, 2542, 'Wax Paper', 'Home & Garden > Kitchen & Dining > Food Storage > Food Wraps', 0, 1),
(2546, 2546, 2537, 'Honey Jars', 'Home & Garden > Kitchen & Dining > Food Storage', 0, 1),
(2547, 2547, 2470, 'Kitchen Appliance Accessories', 'Home & Garden > Kitchen & Dining', 21, 1),
(2548, 2548, 2547, 'Blender Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 2, 1),
(2549, 2549, 2548, 'Blender Jars', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Blender Accessories', 0, 1),
(2550, 2550, 2548, 'Blender Lids', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Blender Accessories', 0, 1),
(2551, 2551, 2547, 'Breadmaker Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2552, 2552, 2547, 'Coffee Maker & Espresso Machine Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 6, 1),
(2553, 2553, 2552, 'Coffee Decanters', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Coffee Maker & Espresso Machine Accessories', 0, 1),
(2554, 2554, 2552, 'Coffee Filter Baskets', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Coffee Maker & Espresso Machine Accessories', 0, 1),
(2555, 2555, 2552, 'Coffee Filters', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Coffee Maker & Espresso Machine Accessories', 0, 1),
(2556, 2556, 2552, 'Coffee Maker Water Filters', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Coffee Maker & Espresso Machine Accessories', 0, 1),
(2557, 2557, 2552, 'Frothing Pitchers', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Coffee Maker & Espresso Machine Accessories', 0, 1),
(2558, 2558, 2552, 'Portafilters', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Coffee Maker & Espresso Machine Accessories', 0, 1),
(2559, 2559, 2547, 'Cotton Candy Machine Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2560, 2560, 2547, 'Deep Fryer Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 1, 1),
(2561, 2561, 2560, 'Fryer Baskets', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Deep Fryer Accessories', 0, 1),
(2562, 2562, 2547, 'Dishwasher Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 1, 1),
(2563, 2563, 2562, 'Dishwasher Glass Racks', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Dishwasher Accessories', 0, 1),
(2564, 2564, 2547, 'Food Dehydrator Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 2, 1),
(2565, 2565, 2564, 'Food Dehydrator Sheets', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Dehydrator Accessories', 0, 1),
(2566, 2566, 2564, 'Food Dehydrator Trays', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Dehydrator Accessories', 0, 1),
(2567, 2567, 2547, 'Food Grinder Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 3, 1),
(2568, 2568, 2567, 'Coffee Grinder Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Grinder Accessories', 0, 1),
(2569, 2569, 2567, 'Meat Grinder Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Grinder Accessories', 0, 1),
(2570, 2570, 2567, 'Spice Grinder Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Grinder Accessories', 0, 1),
(2571, 2571, 2547, 'Food Mixer Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 4, 1),
(2572, 2572, 2571, 'Food Mixer Attachments', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Mixer Accessories', 3, 1),
(2573, 2573, 2572, 'Juicer Attachments', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Mixer Accessories > Food Mixer Attachments', 0, 1),
(2574, 2574, 2572, 'Meat Grinder Attachments', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Mixer Accessories > Food Mixer Attachments', 0, 1),
(2575, 2575, 2572, 'Pasta Maker Attachments', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Mixer Accessories > Food Mixer Attachments', 0, 1),
(2576, 2576, 2571, 'Food Mixer Beaters', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Mixer Accessories', 0, 1),
(2577, 2577, 2571, 'Food Mixer Bowls', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Mixer Accessories', 0, 1),
(2578, 2578, 2571, 'Food Mixer Hooks', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Food Mixer Accessories', 0, 1),
(2579, 2579, 2547, 'Food Processor Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2580, 2580, 2547, 'Ice Cream Maker Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 1, 1),
(2581, 2581, 2580, 'Ice Cream Maker Freezer Bowls', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Ice Cream Maker Accessories', 0, 1),
(2582, 2582, 2547, 'Ice Shaver Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2583, 2583, 2547, 'Juicer Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2584, 2584, 2547, 'Microwave Oven Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 2, 1),
(2585, 2585, 2584, 'Microwave Drawers', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Microwave Oven Accessories', 0, 1),
(2586, 2586, 2584, 'Microwave Trim Kits', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Microwave Oven Accessories', 0, 1),
(2587, 2587, 2547, 'Outdoor Grill Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 3, 1),
(2588, 2588, 2587, 'Outdoor Grill Covers', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Outdoor Grill Accessories', 0, 1),
(2589, 2589, 2587, 'Outdoor Grill Racks & Toppers', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Outdoor Grill Accessories', 0, 1),
(2590, 2590, 2587, 'Outdoor Grill Spits & Baskets', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Outdoor Grill Accessories', 0, 1),
(2591, 2591, 2547, 'Oven Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 3, 1),
(2592, 2592, 2591, 'Oven Liners', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Oven Accessories', 0, 1),
(2593, 2593, 2591, 'Oven Rack Guards', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Oven Accessories', 0, 1),
(2594, 2594, 2591, 'Oven Racks', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Oven Accessories', 0, 1),
(2595, 2595, 2547, 'Pasta Maker Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2596, 2596, 2547, 'Popcorn Maker Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2597, 2597, 2547, 'Range Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 2, 1),
(2598, 2598, 2597, 'Range Burner Covers', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Range Accessories', 0, 1),
(2599, 2599, 2597, 'Range Drip Pans', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Range Accessories', 0, 1),
(2600, 2600, 2547, 'Refrigerator Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 0, 1),
(2601, 2601, 2547, 'Vacuum Sealer Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories', 1, 1),
(2602, 2602, 2601, 'Vacuum Sealer Bags', 'Home & Garden > Kitchen & Dining > Kitchen Appliance Accessories > Vacuum Sealer Accessories', 0, 1),
(2603, 2603, 2470, 'Kitchen Appliances', 'Home & Garden > Kitchen & Dining', 51, 1),
(2604, 2604, 2603, 'Beverage Warmers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2605, 2605, 2603, 'Blenders', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2606, 2606, 2603, 'Breadmakers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2607, 2607, 2603, 'Chocolate Tempering Machines', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2608, 2608, 2603, 'Coffee Makers & Espresso Machines', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 6, 1),
(2609, 2609, 2608, 'Drip Coffee Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Coffee Makers & Espresso Machines', 0, 1),
(2610, 2610, 2608, 'Espresso Machines', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Coffee Makers & Espresso Machines', 0, 1),
(2611, 2611, 2608, 'French Presses', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Coffee Makers & Espresso Machines', 0, 1),
(2612, 2612, 2608, 'Percolators', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Coffee Makers & Espresso Machines', 0, 1),
(2613, 2613, 2608, 'Stovetop Espresso Pots', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Coffee Makers & Espresso Machines', 0, 1),
(2614, 2614, 2608, 'Vacuum Coffee Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Coffee Makers & Espresso Machines', 0, 1),
(2615, 2615, 2603, 'Cooktops', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2616, 2616, 2603, 'Cotton Candy Machines', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2617, 2617, 2603, 'Crepe Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2618, 2618, 2603, 'Deep Fryers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2619, 2619, 2603, 'Dishwashers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2620, 2620, 2603, 'Electric Griddles', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2621, 2621, 2603, 'Electric Kettles', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2622, 2622, 2603, 'Electric Skillets & Woks', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2623, 2623, 2603, 'Fondue Sets', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2624, 2624, 2603, 'Food Cookers & Steamers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 4, 1),
(2625, 2625, 2624, 'Egg Cookers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Cookers & Steamers', 0, 1),
(2626, 2626, 2624, 'Food Steamers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Cookers & Steamers', 0, 1),
(2627, 2627, 2624, 'Rice Cookers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Cookers & Steamers', 0, 1),
(2628, 2628, 2624, 'Slow Cookers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Cookers & Steamers', 0, 1),
(2629, 2629, 2603, 'Food Dehydrators', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2630, 2630, 2603, 'Food Grinders & Mills', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 3, 1),
(2631, 2631, 2630, 'Coffee Grinders', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Grinders & Mills', 0, 1),
(2632, 2632, 2630, 'Meat Grinders', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Grinders & Mills', 0, 1),
(2633, 2633, 2630, 'Spice Grinders', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Grinders & Mills', 0, 1),
(2634, 2634, 2603, 'Food Mixers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2635, 2635, 2603, 'Food Processors', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2636, 2636, 2603, 'Food Slicers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 1, 1),
(2637, 2637, 2636, 'Meat Slicers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Slicers', 0, 1),
(2638, 2638, 2603, 'Food Warmers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 2, 1),
(2639, 2639, 2638, 'Food Heat Lamps', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Warmers', 0, 1),
(2640, 2640, 2638, 'Steam Tables', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Food Warmers', 0, 1),
(2641, 2641, 2603, 'Freezers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2642, 2642, 2603, 'Garbage Disposals', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2643, 2643, 2603, 'Hot Plates', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2644, 2644, 2603, 'Ice Cream Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2645, 2645, 2603, 'Ice Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2646, 2646, 2603, 'Ice Shavers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2647, 2647, 2603, 'Juicers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 1, 1),
(2648, 2648, 2647, 'Hand Juicers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Juicers', 0, 1),
(2649, 2649, 2603, 'Knife Sharpeners', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2650, 2650, 2603, 'Microwave Ovens', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2651, 2651, 2603, 'Milk Frothers & Steamers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2652, 2652, 2603, 'Mochi Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2653, 2653, 2603, 'Outdoor Grills', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 2, 1),
(2654, 2654, 2653, 'Charcoal Grills', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Outdoor Grills', 0, 1),
(2655, 2655, 2653, 'Gas Grills', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Outdoor Grills', 0, 1),
(2656, 2656, 2603, 'Ovens', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 3, 1),
(2657, 2657, 2656, 'Conveyor Ovens', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Ovens', 0, 1),
(2658, 2658, 2656, 'Deck Ovens', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Ovens', 0, 1),
(2659, 2659, 2656, 'Wall Ovens', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Ovens', 0, 1),
(2660, 2660, 2603, 'Pasta Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2661, 2661, 2603, 'Popcorn Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2662, 2662, 2603, 'Portable Gas Stoves', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2663, 2663, 2603, 'Range Hoods', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2664, 2664, 2603, 'Ranges', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2665, 2665, 2603, 'Refrigerators', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2666, 2666, 2603, 'Roaster Ovens & Rotisseries', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2667, 2667, 2603, 'Slush Machines', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2668, 2668, 2603, 'Smokers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2669, 2669, 2603, 'Soy Milk Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2670, 2670, 2603, 'Tea Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2671, 2671, 2603, 'Toasters & Grills', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 8, 1),
(2672, 2672, 2671, 'Electric Grills', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2673, 2673, 2671, 'Muffin & Cupcake Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2674, 2674, 2671, 'Pizzelle Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2675, 2675, 2671, 'Quesadilla & Tortilla Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2676, 2676, 2671, 'Sandwich Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2677, 2677, 2671, 'Toaster Ovens', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2678, 2678, 2671, 'Toasters', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2679, 2679, 2671, 'Waffle Irons', 'Home & Garden > Kitchen & Dining > Kitchen Appliances > Toasters & Grills', 0, 1),
(2680, 2680, 2603, 'Trash Compactors', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2681, 2681, 2603, 'Vacuum Sealers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2682, 2682, 2603, 'Water Coolers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2683, 2683, 2603, 'Water Filters', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2684, 2684, 2603, 'Yogurt Makers', 'Home & Garden > Kitchen & Dining > Kitchen Appliances', 0, 1),
(2685, 2685, 2470, 'Kitchen Tools & Utensils', 'Home & Garden > Kitchen & Dining', 56, 1),
(2686, 2686, 2685, 'Baking Peels', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2687, 2687, 2685, 'Basters', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2688, 2688, 2685, 'Basting Brushes', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2689, 2689, 2685, 'Cake Decorating Supplies', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2690, 2690, 2685, 'Can Crushers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2691, 2691, 2685, 'Can Openers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2692, 2692, 2685, 'Candy & Chocolate Molds', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2693, 2693, 2685, 'Carving Forks', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2694, 2694, 2685, 'Colanders & Strainers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2695, 2695, 2685, 'Condiment Dispensers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2696, 2696, 2685, 'Cookie Cutters', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2697, 2697, 2685, 'Cooking Thermometers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2698, 2698, 2685, 'Cooking Timers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2699, 2699, 2685, 'Cooling Racks', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2700, 2700, 2685, 'Cutting Boards', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2701, 2701, 2685, 'Dicers & Choppers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2702, 2702, 2685, 'Dish Racks & Drain Boards', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2703, 2703, 2685, 'Electric Knives', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2704, 2704, 2685, 'Flour Sifters', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2705, 2705, 2685, 'Food Crackers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 2, 1),
(2706, 2706, 2705, 'Lobster & Crab Crackers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Food Crackers', 0, 1),
(2707, 2707, 2705, 'Nutcrackers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Food Crackers', 1, 1),
(2708, 2708, 2707, 'Decorative Nutcrackers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Food Crackers > Nutcrackers', 0, 1),
(2709, 2709, 2685, 'Food Dispensers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2710, 2710, 2685, 'Food Graters & Zesters', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2711, 2711, 2685, 'Food Peelers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2712, 2712, 2685, 'Food Reamers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2713, 2713, 2685, 'Garlic Presses', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2714, 2714, 2685, 'Ice Cube Trays', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2715, 2715, 2685, 'Ice Pop Molds', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2716, 2716, 2685, 'Kitchen Knives', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2717, 2717, 2685, 'Kitchen Organizers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 10, 1),
(2718, 2718, 2717, 'Drinkware Racks', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2719, 2719, 2717, 'Kitchen Storage Carousels', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2720, 2720, 2717, 'Knife Blocks & Holders', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2721, 2721, 2717, 'Napkin Holders & Dispensers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2722, 2722, 2717, 'Paper Towel Holders & Dispensers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2723, 2723, 2717, 'Pot Racks', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2724, 2724, 2717, 'Spice Racks', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2725, 2725, 2717, 'Straw Holders & Dispensers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2726, 2726, 2717, 'Toothpick Holders & Dispensers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2727, 2727, 2717, 'Utensil & Flatware Trays', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Organizers', 0, 1),
(2728, 2728, 2685, 'Kitchen Scales', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2729, 2729, 2685, 'Kitchen Scrapers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 3, 1),
(2730, 2730, 2729, 'Bench Scrapers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Scrapers', 0, 1),
(2731, 2731, 2729, 'Bowl Scrapers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Scrapers', 0, 1),
(2732, 2732, 2729, 'Grill Scrapers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Scrapers', 0, 1),
(2733, 2733, 2685, 'Kitchen Shears', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2734, 2734, 2685, 'Kitchen Slicers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 4, 1),
(2735, 2735, 2734, 'Bread Slicers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Slicers', 0, 1),
(2736, 2736, 2734, 'Cheese Slicers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Slicers', 0, 1),
(2737, 2737, 2734, 'Egg Slicers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Slicers', 0, 1),
(2738, 2738, 2734, 'Mandoline Slicers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Kitchen Slicers', 0, 1),
(2739, 2739, 2685, 'Kitchen Utensil Sets', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2740, 2740, 2685, 'Ladles', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2741, 2741, 2685, 'Mashers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2742, 2742, 2685, 'Measuring Cups & Spoons', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2743, 2743, 2685, 'Meat Tenderizers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2744, 2744, 2685, 'Mixing Bowls', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2745, 2745, 2685, 'Mortars & Pestles', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2746, 2746, 2685, 'Oven Bags', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2747, 2747, 2685, 'Oven Mitts & Pot Holders', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2748, 2748, 2685, 'Pastry Blenders', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2749, 2749, 2685, 'Pastry Cloths', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2750, 2750, 2685, 'Pizza Cutters', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2751, 2751, 2685, 'Ricers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2752, 2752, 2685, 'Rolling Pin Accessories', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 2, 1),
(2753, 2753, 2752, 'Rolling Pin Covers & Sleeves', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Rolling Pin Accessories', 0, 1),
(2754, 2754, 2752, 'Rolling Pin Rings', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Rolling Pin Accessories', 0, 1),
(2755, 2755, 2685, 'Rolling Pins', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2756, 2756, 2685, 'Salad Spinners', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2757, 2757, 2685, 'Scoops', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 3, 1),
(2758, 2758, 2757, 'Ice Cream Scoops', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Scoops', 0, 1),
(2759, 2759, 2757, 'Ice Scoops', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Scoops', 0, 1),
(2760, 2760, 2757, 'Melon Ballers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils > Scoops', 0, 1),
(2761, 2761, 2685, 'Sink Mats', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2762, 2762, 2685, 'Spatulas', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2763, 2763, 2685, 'Spoon Rests', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2764, 2764, 2685, 'Tea Strainers', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2765, 2765, 2685, 'Tongs', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2766, 2766, 2685, 'Whisks', 'Home & Garden > Kitchen & Dining > Kitchen Tools & Utensils', 0, 1),
(2767, 2767, 2470, 'Tableware', 'Home & Garden > Kitchen & Dining', 7, 1),
(2768, 2768, 2767, 'Coffee & Tea Pots', 'Home & Garden > Kitchen & Dining > Tableware', 0, 1),
(2769, 2769, 2767, 'Dinnerware', 'Home & Garden > Kitchen & Dining > Tableware', 2, 1),
(2770, 2770, 2769, 'Bowls', 'Home & Garden > Kitchen & Dining > Tableware > Dinnerware', 0, 1),
(2771, 2771, 2769, 'Plates', 'Home & Garden > Kitchen & Dining > Tableware > Dinnerware', 0, 1),
(2772, 2772, 2767, 'Drinkware', 'Home & Garden > Kitchen & Dining > Tableware', 3, 1),
(2773, 2773, 2772, 'Glassware', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware', 7, 1),
(2774, 2774, 2773, 'Highball Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware', 0, 1),
(2775, 2775, 2773, 'Lowball Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware', 0, 1),
(2776, 2776, 2773, 'Pint Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware', 0, 1),
(2777, 2777, 2773, 'Shot Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware', 0, 1),
(2778, 2778, 2773, 'Stemware', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware', 5, 1),
(2779, 2779, 2778, 'Brandy Snifters', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware > Stemware', 0, 1),
(2780, 2780, 2778, 'Champagne Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware > Stemware', 0, 1),
(2781, 2781, 2778, 'Margarita Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware > Stemware', 0, 1),
(2782, 2782, 2778, 'Martini Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware > Stemware', 0, 1),
(2783, 2783, 2778, 'Wine Glasses', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware > Stemware', 0, 1),
(2784, 2784, 2773, 'Tankards & Beer Steins', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware', 0, 1),
(2785, 2785, 2773, 'Tumblers', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware > Glassware', 0, 1),
(2786, 2786, 2772, 'Mugs', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware', 0, 1),
(2787, 2787, 2772, 'Tea Cups & Saucers', 'Home & Garden > Kitchen & Dining > Tableware > Drinkware', 0, 1),
(2788, 2788, 2767, 'Flatware', 'Home & Garden > Kitchen & Dining > Tableware', 4, 1),
(2789, 2789, 2788, 'Chopsticks', 'Home & Garden > Kitchen & Dining > Tableware > Flatware', 0, 1),
(2790, 2790, 2788, 'Forks', 'Home & Garden > Kitchen & Dining > Tableware > Flatware', 0, 1),
(2791, 2791, 2788, 'Spoons', 'Home & Garden > Kitchen & Dining > Tableware > Flatware', 0, 1),
(2792, 2792, 2788, 'Table Knives', 'Home & Garden > Kitchen & Dining > Tableware > Flatware', 0, 1),
(2793, 2793, 2767, 'Serveware', 'Home & Garden > Kitchen & Dining > Tableware', 9, 1),
(2794, 2794, 2793, 'Cake Boards', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2795, 2795, 2793, 'Cake Stands', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2796, 2796, 2793, 'Gravy Boats', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2797, 2797, 2793, 'Punch Bowls', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2798, 2798, 2793, 'Serving Pitchers & Carafes', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2799, 2799, 2793, 'Serving Platters', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2800, 2800, 2793, 'Serving Trays', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2801, 2801, 2793, 'Sugar Bowls & Creamers', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2802, 2802, 2793, 'Tureens', 'Home & Garden > Kitchen & Dining > Tableware > Serveware', 0, 1),
(2803, 2803, 2767, 'Shakers & Mills', 'Home & Garden > Kitchen & Dining > Tableware', 0, 1),
(2804, 2804, 2767, 'Trivets', 'Home & Garden > Kitchen & Dining > Tableware', 0, 1),
(2805, 2805, 2216, 'Lawn & Garden', 'Home & Garden', 6, 1),
(2806, 2806, 2805, 'Gardening', 'Home & Garden > Lawn & Garden', 10, 1),
(2807, 2807, 2806, 'Composting', 'Home & Garden > Lawn & Garden > Gardening', 2, 1),
(2808, 2808, 2807, 'Compost', 'Home & Garden > Lawn & Garden > Gardening > Composting', 0, 1),
(2809, 2809, 2807, 'Composting Supplies', 'Home & Garden > Lawn & Garden > Gardening > Composting', 0, 1),
(2810, 2810, 2806, 'Disease Control', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2811, 2811, 2806, 'Fertilizers', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2812, 2812, 2806, 'Gardening Tools', 'Home & Garden > Lawn & Garden > Gardening', 15, 1),
(2813, 2813, 2812, 'Cultivating Tools', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 1, 1),
(2814, 2814, 2813, 'Garden Hoes', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools > Cultivating Tools', 0, 1),
(2815, 2815, 2812, 'Digging Bars', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2816, 2816, 2812, 'Gardening Trowels', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2817, 2817, 2812, 'Grass Edgers', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2818, 2818, 2812, 'Lawn & Garden Sprayers', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2819, 2819, 2812, 'Lawn Aerators', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2820, 2820, 2812, 'Machetes', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2821, 2821, 2812, 'Mattocks & Pickaxes', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2822, 2822, 2812, 'Pitchforks', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2823, 2823, 2812, 'Pruning Shears', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2824, 2824, 2812, 'Rakes', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2825, 2825, 2812, 'Shovels & Spades', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2826, 2826, 2812, 'Spreaders', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2827, 2827, 2812, 'Wheelbarrow Parts', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2828, 2828, 2812, 'Wheelbarrows', 'Home & Garden > Lawn & Garden > Gardening > Gardening Tools', 0, 1),
(2829, 2829, 2806, 'Greenhouses', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2830, 2830, 2806, 'Herbicides', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2831, 2831, 2806, 'Mulch', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2832, 2832, 2806, 'Plant Cages', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2833, 2833, 2806, 'Pots & Planters', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2834, 2834, 2806, 'Sands & Soils', 'Home & Garden > Lawn & Garden > Gardening', 0, 1),
(2835, 2835, 2805, 'Irrigation Systems', 'Home & Garden > Lawn & Garden', 5, 1),
(2836, 2836, 2835, 'Garden Hose Fittings & Valves', 'Home & Garden > Lawn & Garden > Irrigation Systems', 0, 1),
(2837, 2837, 2835, 'Garden Hose Spray Nozzles', 'Home & Garden > Lawn & Garden > Irrigation Systems', 0, 1),
(2838, 2838, 2835, 'Garden Hoses', 'Home & Garden > Lawn & Garden > Irrigation Systems', 0, 1),
(2839, 2839, 2835, 'Sprinkler Systems', 'Home & Garden > Lawn & Garden > Irrigation Systems', 3, 1),
(2840, 2840, 2839, 'Sprinkler Controls', 'Home & Garden > Lawn & Garden > Irrigation Systems > Sprinkler Systems', 0, 1),
(2841, 2841, 2839, 'Sprinkler Heads', 'Home & Garden > Lawn & Garden > Irrigation Systems > Sprinkler Systems', 0, 1),
(2842, 2842, 2839, 'Sprinkler Valves', 'Home & Garden > Lawn & Garden > Irrigation Systems > Sprinkler Systems', 0, 1),
(2843, 2843, 2835, 'Sprinklers', 'Home & Garden > Lawn & Garden > Irrigation Systems', 0, 1),
(2844, 2844, 2805, 'Outdoor Living', 'Home & Garden > Lawn & Garden', 6, 1),
(2845, 2845, 2844, 'Hammocks', 'Home & Garden > Lawn & Garden > Outdoor Living', 0, 1),
(2846, 2846, 2844, 'Outdoor Structures', 'Home & Garden > Lawn & Garden > Outdoor Living', 4, 1),
(2847, 2847, 2846, 'Canopies & Gazebos', 'Home & Garden > Lawn & Garden > Outdoor Living > Outdoor Structures', 0, 1),
(2848, 2848, 2846, 'Garden Arches, Trellises, Arbors & Pergolas', 'Home & Garden > Lawn & Garden > Outdoor Living > Outdoor Structures', 0, 1),
(2849, 2849, 2846, 'Garden Bridges', 'Home & Garden > Lawn & Garden > Outdoor Living > Outdoor Structures', 0, 1),
(2850, 2850, 2846, 'Sheds & Storage', 'Home & Garden > Lawn & Garden > Outdoor Living > Outdoor Structures', 0, 1),
(2852, 2852, 2844, 'Porch Swings', 'Home & Garden > Lawn & Garden > Outdoor Living', 0, 1),
(2853, 2853, 2805, 'Outdoor Power Equipment', 'Home & Garden > Lawn & Garden', 8, 1),
(2854, 2854, 2853, 'Chainsaws', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 0, 1),
(2855, 2855, 2853, 'Hedge Trimmers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 0, 1),
(2856, 2856, 2853, 'Lawn Mowers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 2, 1),
(2857, 2857, 2856, 'Riding Mowers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment > Lawn Mowers', 0, 1),
(2858, 2858, 2856, 'Walk-Behind Mowers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment > Lawn Mowers', 0, 1),
(2859, 2859, 2853, 'Leaf Blowers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 0, 1),
(2860, 2860, 2853, 'Power Tillers & Cultivators', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 0, 1),
(2861, 2861, 2853, 'Pressure Washers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 0, 1),
(2862, 2862, 2853, 'Snow Blowers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 0, 1),
(2863, 2863, 2853, 'Weed Trimmers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment', 0, 1),
(2864, 2864, 2805, 'Outdoor Power Equipment Accessories', 'Home & Garden > Lawn & Garden', 3, 1),
(2865, 2865, 2864, 'Chainsaw Accessories', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories', 2, 1),
(2866, 2866, 2865, 'Chainsaw Bars', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories > Chainsaw Accessories', 0, 1),
(2867, 2867, 2865, 'Chainsaw Chains', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories > Chainsaw Accessories', 0, 1),
(2868, 2868, 2864, 'Lawn Mower Accessories', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories', 5, 1),
(2869, 2869, 2868, 'Lawn Mower Bags', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories > Lawn Mower Accessories', 0, 1),
(2870, 2870, 2868, 'Lawn Mower Belts', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories > Lawn Mower Accessories', 0, 1),
(2871, 2871, 2868, 'Lawn Mower Blades', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories > Lawn Mower Accessories', 0, 1),
(2872, 2872, 2868, 'Lawn Mower Covers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories > Lawn Mower Accessories', 0, 1),
(2873, 2873, 2868, 'Lawn Mower Pulleys & Idlers', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories > Lawn Mower Accessories', 0, 1),
(2874, 2874, 2864, 'Snow Blower Accessories', 'Home & Garden > Lawn & Garden > Outdoor Power Equipment Accessories', 0, 1),
(2875, 2875, 2805, 'Snow Removal', 'Home & Garden > Lawn & Garden', 2, 1),
(2876, 2876, 2875, 'Ice Scrapers', 'Home & Garden > Lawn & Garden > Snow Removal', 0, 1),
(2877, 2877, 2875, 'Snow Shovels', 'Home & Garden > Lawn & Garden > Snow Removal', 0, 1),
(2878, 2878, 2216, 'Lighting', 'Home & Garden', 11, 1),
(2879, 2879, 2878, 'Book Lights', 'Home & Garden > Lighting', 0, 1),
(2880, 2880, 2878, 'Emergency Lighting', 'Home & Garden > Lighting', 0, 1),
(2881, 2881, 2878, 'Flood Lights', 'Home & Garden > Lighting', 0, 1),
(2882, 2882, 2878, 'Lamps', 'Home & Garden > Lighting', 2, 1),
(2883, 2883, 2882, 'Floor Lamps', 'Home & Garden > Lighting > Lamps', 0, 1),
(2884, 2884, 2882, 'Table Lamps', 'Home & Garden > Lighting > Lamps', 0, 1),
(2885, 2885, 2878, 'Landscape Lighting', 'Home & Garden > Lighting', 0, 1),
(2886, 2886, 2878, 'Light Bulbs', 'Home & Garden > Lighting', 4, 1),
(2887, 2887, 2886, 'Compact Fluorescent Lamps', 'Home & Garden > Lighting > Light Bulbs', 0, 1),
(2888, 2888, 2886, 'Fluorescent Tubes', 'Home & Garden > Lighting > Light Bulbs', 0, 1),
(2889, 2889, 2886, 'Incandescent Light Bulbs', 'Home & Garden > Lighting > Light Bulbs', 0, 1),
(2890, 2890, 2886, 'LED Light Bulbs', 'Home & Garden > Lighting > Light Bulbs', 0, 1),
(2891, 2891, 2878, 'Light Ropes & Strings', 'Home & Garden > Lighting', 0, 1),
(2892, 2892, 2878, 'Lighting Fixtures', 'Home & Garden > Lighting', 5, 1),
(2893, 2893, 2892, 'Ceiling Fixtures', 'Home & Garden > Lighting > Lighting Fixtures', 0, 1),
(2894, 2894, 2892, 'Chandeliers', 'Home & Garden > Lighting > Lighting Fixtures', 0, 1),
(2895, 2895, 2892, 'Track Lighting', 'Home & Garden > Lighting > Lighting Fixtures', 0, 1),
(2896, 2896, 2892, 'Under Cabinet Fixtures', 'Home & Garden > Lighting > Lighting Fixtures', 0, 1),
(2897, 2897, 2892, 'Wall Sconces', 'Home & Garden > Lighting > Lighting Fixtures', 0, 1),
(2898, 2898, 2878, 'Night Lights', 'Home & Garden > Lighting', 0, 1),
(2899, 2899, 2878, 'Picture Lights', 'Home & Garden > Lighting', 0, 1),
(2900, 2900, 2878, 'Walkway Lighting', 'Home & Garden > Lighting', 0, 1),
(2901, 2901, 2216, 'Lighting Accessories', 'Home & Garden', 2, 1),
(2902, 2902, 2901, 'Lamp Shades', 'Home & Garden > Lighting Accessories', 0, 1),
(2903, 2903, 2901, 'Lighting Timers', 'Home & Garden > Lighting Accessories', 0, 1),
(2904, 2904, 2216, 'Linens', 'Home & Garden', 4, 1),
(2905, 2905, 2904, 'Bedding', 'Home & Garden > Linens', 9, 1),
(2906, 2906, 2905, 'Bed Sheets', 'Home & Garden > Linens > Bedding', 0, 1),
(2907, 2907, 2905, 'Bedskirts', 'Home & Garden > Linens > Bedding', 0, 1),
(2908, 2908, 2905, 'Blankets', 'Home & Garden > Linens > Bedding', 3, 1),
(2909, 2909, 2908, 'Electric Blankets', 'Home & Garden > Linens > Bedding > Blankets', 0, 1),
(2910, 2910, 2908, 'Quilts', 'Home & Garden > Linens > Bedding > Blankets', 0, 1),
(2911, 2911, 2908, 'Throws', 'Home & Garden > Linens > Bedding > Blankets', 0, 1),
(2912, 2912, 2905, 'Comforters & Comforter Sets', 'Home & Garden > Linens > Bedding', 0, 1),
(2913, 2913, 2905, 'Duvet Covers', 'Home & Garden > Linens > Bedding', 0, 1),
(2914, 2914, 2905, 'Mattress Protectors', 'Home & Garden > Linens > Bedding', 2, 1),
(2915, 2915, 2914, 'Mattress Encasements', 'Home & Garden > Linens > Bedding > Mattress Protectors', 0, 1),
(2916, 2916, 2914, 'Mattress Pads', 'Home & Garden > Linens > Bedding > Mattress Protectors', 0, 1),
(2917, 2917, 2905, 'Nap Mats', 'Home & Garden > Linens > Bedding', 0, 1),
(2918, 2918, 2905, 'Pillowcases & Shams', 'Home & Garden > Linens > Bedding', 0, 1),
(2919, 2919, 2905, 'Pillows', 'Home & Garden > Linens > Bedding', 1, 1),
(2920, 2920, 2919, 'Body Pillows', 'Home & Garden > Linens > Bedding > Pillows', 0, 1),
(2921, 2921, 2904, 'Doilies', 'Home & Garden > Linens', 0, 1),
(2922, 2922, 2904, 'Table Linens', 'Home & Garden > Linens', 3, 1),
(2923, 2923, 2922, 'Cloth Napkins', 'Home & Garden > Linens > Table Linens', 0, 1),
(2924, 2924, 2922, 'Placemats', 'Home & Garden > Linens > Table Linens', 0, 1),
(2925, 2925, 2922, 'Tablecloths', 'Home & Garden > Linens > Table Linens', 0, 1),
(2926, 2926, 2904, 'Towels', 'Home & Garden > Linens', 3, 1),
(2927, 2927, 2926, 'Bath Towels & Washcloths', 'Home & Garden > Linens > Towels', 0, 1),
(2928, 2928, 2926, 'Beach Towels', 'Home & Garden > Linens > Towels', 0, 1),
(2929, 2929, 2926, 'Kitchen Towels', 'Home & Garden > Linens > Towels', 0, 1),
(2930, 2930, 2216, 'Plants', 'Home & Garden', 5, 1),
(2931, 2931, 2930, 'Flowers', 'Home & Garden > Plants', 0, 1),
(2932, 2932, 2930, 'Indoor Plants', 'Home & Garden > Plants', 0, 1),
(2933, 2933, 2930, 'Outdoor Plants', 'Home & Garden > Plants', 0, 1),
(2934, 2934, 2930, 'Seeds', 'Home & Garden > Plants', 0, 1),
(2935, 2935, 2930, 'Trees', 'Home & Garden > Plants', 0, 1),
(2936, 2936, 2216, 'Pool & Spa', 'Home & Garden', 4, 1),
(2937, 2937, 2936, 'Pool & Spa Accessories', 'Home & Garden > Pool & Spa', 8, 1),
(2938, 2938, 2937, 'Diving Boards', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2939, 2939, 2937, 'Pool & Spa Filters', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2940, 2940, 2937, 'Pool Cleaners & Chemicals', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2941, 2941, 2937, 'Pool Covers', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2942, 2942, 2937, 'Pool Floats & Lounges', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2943, 2943, 2937, 'Pool Skimmers', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2944, 2944, 2937, 'Pool Sweeps', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2945, 2945, 2937, 'Pool Toys', 'Home & Garden > Pool & Spa > Pool & Spa Accessories', 0, 1),
(2946, 2946, 2936, 'Saunas', 'Home & Garden > Pool & Spa', 0, 1),
(2947, 2947, 2936, 'Spas', 'Home & Garden > Pool & Spa', 0, 1),
(2948, 2948, 2936, 'Swimming Pools', 'Home & Garden > Pool & Spa', 0, 1),
(2949, 2949, 2216, 'Smoking Accessories', 'Home & Garden', 2, 1),
(2950, 2950, 2949, 'Ashtrays', 'Home & Garden > Smoking Accessories', 0, 1),
(2951, 2951, 2949, 'Lighters', 'Home & Garden > Smoking Accessories', 0, 1),
(2952, 2952, 0, 'Luggage & Bags', '', 4, 1),
(2953, 2953, 2952, 'Business Bags', 'Luggage & Bags', 3, 1),
(2954, 2954, 2953, 'Briefcases', 'Luggage & Bags > Business Bags', 0, 1),
(2955, 2955, 2953, 'Electronics Bags & Cases', 'Luggage & Bags > Business Bags', 4, 1),
(2958, 2958, 2953, 'Garment Bags', 'Luggage & Bags > Business Bags', 0, 1),
(2959, 2959, 2952, 'Diaper Bags', 'Luggage & Bags', 0, 1),
(2973, 2973, 2952, 'Luggage', 'Luggage & Bags', 9, 1),
(2974, 2974, 2973, 'Backpacks', 'Luggage & Bags > Luggage', 0, 1),
(2975, 2975, 2973, 'Cosmetic Bags & Cases', 'Luggage & Bags > Luggage', 0, 1),
(2976, 2976, 2973, 'Duffel Bags', 'Luggage & Bags > Luggage', 0, 1),
(2977, 2977, 2973, 'Fanny Packs', 'Luggage & Bags > Luggage', 0, 1),
(2978, 2978, 2973, 'Luggage Accessories', 'Luggage & Bags > Luggage', 2, 1),
(2979, 2979, 2978, 'Keychains', 'Luggage & Bags > Luggage > Luggage Accessories', 0, 1),
(2980, 2980, 2978, 'Rain Umbrellas & Parasols', 'Luggage & Bags > Luggage > Luggage Accessories', 0, 1),
(2981, 2981, 2973, 'Messenger Bags', 'Luggage & Bags > Luggage', 0, 1),
(2982, 2982, 2973, 'Suitcases', 'Luggage & Bags > Luggage', 0, 1),
(2983, 2983, 2973, 'Toiletry Bags', 'Luggage & Bags > Luggage', 0, 1),
(2984, 2984, 2973, 'Trunks', 'Luggage & Bags > Luggage', 0, 1),
(2985, 2985, 0, 'Mature', '', 2, 1),
(2986, 2986, 2985, 'Erotic', 'Mature', 8, 1),
(2987, 2987, 2986, 'Erotic Books', 'Mature > Erotic', 1, 1),
(2988, 2988, 2987, 'Erotic Comics', 'Mature > Erotic > Erotic Books', 0, 1),
(2989, 2989, 2986, 'Erotic Clothing', 'Mature > Erotic', 0, 1),
(2990, 2990, 2986, 'Erotic DVDs & Videos', 'Mature > Erotic', 0, 1),
(2991, 2991, 2986, 'Erotic Food & Edibles', 'Mature > Erotic', 0, 1),
(2992, 2992, 2986, 'Erotic Magazines', 'Mature > Erotic', 0, 1),
(2993, 2993, 2986, 'Erotic Shoes', 'Mature > Erotic', 0, 1),
(2994, 2994, 2986, 'Personal Lubricants', 'Mature > Erotic', 0, 1),
(2995, 2995, 2986, 'Sex Toys', 'Mature > Erotic', 0, 1),
(2996, 2996, 2985, 'Weapons', 'Mature', 10, 1),
(2997, 2997, 2996, 'Brass Knuckles', 'Mature > Weapons', 0, 1),
(2998, 2998, 2996, 'Gun Accessories', 'Mature > Weapons', 7, 1),
(2999, 2999, 2998, 'Ammunition', 'Mature > Weapons > Gun Accessories', 0, 1),
(3000, 3000, 2998, 'Ammunition Boxes', 'Mature > Weapons > Gun Accessories', 0, 1),
(3001, 3001, 2998, 'Gun Grips', 'Mature > Weapons > Gun Accessories', 0, 1),
(3002, 3002, 2998, 'Gun Holsters', 'Mature > Weapons > Gun Accessories', 0, 1),
(3003, 3003, 2998, 'Gun Lights', 'Mature > Weapons > Gun Accessories', 0, 1),
(3004, 3004, 2998, 'Gun Rails', 'Mature > Weapons > Gun Accessories', 0, 1),
(3005, 3005, 2996, 'Guns', 'Mature > Weapons', 0, 1),
(3006, 3006, 2996, 'Mace & Pepper Spray', 'Mature > Weapons', 0, 1),
(3007, 3007, 2996, 'Nunchucks', 'Mature > Weapons', 0, 1),
(3008, 3008, 2996, 'Staff & Stick Weapons', 'Mature > Weapons', 0, 1),
(3009, 3009, 2996, 'Stun Guns & Tasers', 'Mature > Weapons', 0, 1),
(3010, 3010, 2996, 'Swords', 'Mature > Weapons', 0, 1),
(3011, 3011, 2996, 'Throwing Stars', 'Mature > Weapons', 0, 1),
(3012, 3012, 2996, 'Whips', 'Mature > Weapons', 0, 1),
(3013, 3013, 0, 'Media', '', 6, 1),
(3014, 3014, 3013, 'Books', 'Media', 2, 1),
(3015, 3015, 3014, 'Fiction', 'Media > Books', 7, 1),
(3016, 3016, 3015, 'Children\'s Books', 'Media > Books > Fiction', 0, 1),
(3017, 3017, 3015, 'Comics', 'Media > Books > Fiction', 0, 1),
(3018, 3018, 3015, 'Horror Novels', 'Media > Books > Fiction', 0, 1),
(3019, 3019, 3015, 'Literature', 'Media > Books > Fiction', 0, 1),
(3020, 3020, 3015, 'Mystery Novels', 'Media > Books > Fiction', 0, 1),
(3021, 3021, 3015, 'Romance Novels', 'Media > Books > Fiction', 0, 1),
(3022, 3022, 3015, 'Science Fiction & Fantasy Novels', 'Media > Books > Fiction', 0, 1),
(3023, 3023, 3014, 'Non-Fiction', 'Media > Books', 43, 1),
(3024, 3024, 3023, 'Animal & Nature Books', 'Media > Books > Non-Fiction', 0, 1),
(3025, 3025, 3023, 'Architecture Books', 'Media > Books > Non-Fiction', 0, 1),
(3026, 3026, 3023, 'Art Books', 'Media > Books > Non-Fiction', 0, 1),
(3027, 3027, 3023, 'Biographies', 'Media > Books > Non-Fiction', 0, 1),
(3028, 3028, 3023, 'Body, Mind & Spirit Books', 'Media > Books > Non-Fiction', 0, 1),
(3029, 3029, 3023, 'Business & Economics Books', 'Media > Books > Non-Fiction', 0, 1),
(3030, 3030, 3023, 'Computer Books', 'Media > Books > Non-Fiction', 0, 1),
(3031, 3031, 3023, 'Cooking Books', 'Media > Books > Non-Fiction', 0, 1),
(3032, 3032, 3023, 'Craft, Hobby & Activity Books', 'Media > Books > Non-Fiction', 0, 1),
(3033, 3033, 3023, 'Drama Books', 'Media > Books > Non-Fiction', 0, 1),
(3034, 3034, 3023, 'Education Books', 'Media > Books > Non-Fiction', 2, 1),
(3035, 3035, 3034, 'Foreign Language Books', 'Media > Books > Non-Fiction > Education Books', 0, 1),
(3036, 3036, 3034, 'Study Aids', 'Media > Books > Non-Fiction > Education Books', 0, 1),
(3037, 3037, 3023, 'Family Relationship Books', 'Media > Books > Non-Fiction', 0, 1),
(3038, 3038, 3023, 'Game Books', 'Media > Books > Non-Fiction', 0, 1),
(3039, 3039, 3023, 'Gardening Books', 'Media > Books > Non-Fiction', 0, 1),
(3040, 3040, 3023, 'Health & Fitness Books', 'Media > Books > Non-Fiction', 0, 1),
(3041, 3041, 3023, 'History Books', 'Media > Books > Non-Fiction', 0, 1),
(3042, 3042, 3023, 'Home Improvement Books', 'Media > Books > Non-Fiction', 0, 1),
(3043, 3043, 3023, 'Humor Books', 'Media > Books > Non-Fiction', 0, 1),
(3044, 3044, 3023, 'Juvenile Non-Fiction', 'Media > Books > Non-Fiction', 0, 1),
(3045, 3045, 3023, 'Language Arts Books', 'Media > Books > Non-Fiction', 0, 1),
(3046, 3046, 3023, 'Law Books', 'Media > Books > Non-Fiction', 0, 1),
(3047, 3047, 3023, 'Literary Books', 'Media > Books > Non-Fiction', 0, 1),
(3048, 3048, 3023, 'Math Books', 'Media > Books > Non-Fiction', 0, 1),
(3049, 3049, 3023, 'Medical Books', 'Media > Books > Non-Fiction', 0, 1),
(3050, 3050, 3023, 'Music Books', 'Media > Books > Non-Fiction', 0, 1),
(3051, 3051, 3023, 'Performing Arts Books', 'Media > Books > Non-Fiction', 0, 1),
(3052, 3052, 3023, 'Pet Books', 'Media > Books > Non-Fiction', 0, 1),
(3053, 3053, 3023, 'Philosophy Books', 'Media > Books > Non-Fiction', 0, 1),
(3054, 3054, 3023, 'Photography Books', 'Media > Books > Non-Fiction', 0, 1),
(3055, 3055, 3023, 'Poetry', 'Media > Books > Non-Fiction', 0, 1),
(3056, 3056, 3023, 'Political Science Books', 'Media > Books > Non-Fiction', 0, 1),
(3057, 3057, 3023, 'Psychology Books', 'Media > Books > Non-Fiction', 0, 1),
(3058, 3058, 3023, 'Puzzle Books', 'Media > Books > Non-Fiction', 0, 1),
(3059, 3059, 3023, 'Reference Books', 'Media > Books > Non-Fiction', 0, 1),
(3060, 3060, 3023, 'Religion Books', 'Media > Books > Non-Fiction', 0, 1),
(3061, 3061, 3023, 'Science Books', 'Media > Books > Non-Fiction', 0, 1),
(3062, 3062, 3023, 'Self Help Books', 'Media > Books > Non-Fiction', 0, 1),
(3063, 3063, 3023, 'Social Science Books', 'Media > Books > Non-Fiction', 0, 1),
(3064, 3064, 3023, 'Sports Books', 'Media > Books > Non-Fiction', 0, 1),
(3065, 3065, 3023, 'Technology Books', 'Media > Books > Non-Fiction', 0, 1),
(3066, 3066, 3023, 'Transportation Books', 'Media > Books > Non-Fiction', 0, 1),
(3067, 3067, 3023, 'Travel Books', 'Media > Books > Non-Fiction', 0, 1),
(3068, 3068, 3023, 'True Crime Books', 'Media > Books > Non-Fiction', 0, 1),
(3069, 3069, 3013, 'DVDs & Videos', 'Media', 12, 1),
(3070, 3070, 3069, 'Action Movies', 'Media > DVDs & Videos', 0, 1),
(3071, 3071, 3069, 'Children\'s Movies', 'Media > DVDs & Videos', 0, 1),
(3072, 3072, 3069, 'Comedy Movies', 'Media > DVDs & Videos', 0, 1),
(3073, 3073, 3069, 'Drama Films', 'Media > DVDs & Videos', 0, 1),
(3074, 3074, 3069, 'Foreign Films', 'Media > DVDs & Videos', 0, 1),
(3075, 3075, 3069, 'Horror Movies', 'Media > DVDs & Videos', 0, 1),
(3076, 3076, 3069, 'Performing Arts Videos', 'Media > DVDs & Videos', 0, 1),
(3077, 3077, 3069, 'Religious Videos', 'Media > DVDs & Videos', 0, 1),
(3078, 3078, 3069, 'Science Fiction Movies', 'Media > DVDs & Videos', 0, 1),
(3079, 3079, 3069, 'Sports Videos', 'Media > DVDs & Videos', 0, 1),
(3080, 3080, 3069, 'Television Shows', 'Media > DVDs & Videos', 0, 1),
(3081, 3081, 3069, 'Western Movies', 'Media > DVDs & Videos', 0, 1),
(3082, 3082, 3013, 'Magazines & Newspapers', 'Media', 0, 1),
(3083, 3083, 3013, 'Music', 'Media', 22, 1),
(3084, 3084, 3083, 'Avant-Garde Music', 'Media > Music', 1, 1),
(3085, 3085, 3084, 'Experimental Avant-Garde', 'Media > Music > Avant-Garde Music', 0, 1),
(3086, 3086, 3083, 'Blues Music', 'Media > Music', 25, 1),
(3087, 3087, 3086, 'Acoustic Blues', 'Media > Music > Blues Music', 0, 1),
(3088, 3088, 3086, 'Acoustic Chicago Blues', 'Media > Music > Blues Music', 0, 1),
(3089, 3089, 3086, 'Blues Revival', 'Media > Music > Blues Music', 0, 1),
(3090, 3090, 3086, 'Blues-Rock', 'Media > Music > Blues Music', 0, 1),
(3091, 3091, 3086, 'Chicago Blues', 'Media > Music > Blues Music', 0, 1),
(3092, 3092, 3086, 'Contemporary Blues', 'Media > Music > Blues Music', 0, 1),
(3093, 3093, 3086, 'Country Blues', 'Media > Music > Blues Music', 0, 1),
(3094, 3094, 3086, 'Delta Blues', 'Media > Music > Blues Music', 0, 1),
(3095, 3095, 3086, 'East Coast Blues', 'Media > Music > Blues Music', 1, 1),
(3096, 3096, 3095, 'Piedmont Blues', 'Media > Music > Blues Music > East Coast Blues', 0, 1),
(3097, 3097, 3086, 'Electric Blues', 'Media > Music > Blues Music', 0, 1),
(3098, 3098, 3086, 'Electric Chicago Blues', 'Media > Music > Blues Music', 0, 1),
(3099, 3099, 3086, 'Electric Delta Blues', 'Media > Music > Blues Music', 0, 1),
(3100, 3100, 3086, 'Electric Harmonica Blues', 'Media > Music > Blues Music', 0, 1),
(3101, 3101, 3086, 'Electric Texas Blues', 'Media > Music > Blues Music', 0, 1),
(3102, 3102, 3086, 'Folk-Blues', 'Media > Music > Blues Music', 0, 1),
(3103, 3103, 3086, 'Harmonica Blues', 'Media > Music > Blues Music', 0, 1),
(3104, 3104, 3086, 'Jump Blues', 'Media > Music > Blues Music', 0, 1),
(3105, 3105, 3086, 'Louisiana Blues', 'Media > Music > Blues Music', 0, 1),
(3106, 3106, 3086, 'Modern Electric Blues', 'Media > Music > Blues Music', 0, 1),
(3107, 3107, 3086, 'Modern Electric Chicago Blues', 'Media > Music > Blues Music', 0, 1),
(3108, 3108, 3086, 'Piano Blues', 'Media > Music > Blues Music', 0, 1),
(3109, 3109, 3086, 'Slide Guitar Blues', 'Media > Music > Blues Music', 0, 1),
(3110, 3110, 3086, 'Soul-Blues', 'Media > Music > Blues Music', 0, 1),
(3111, 3111, 3086, 'Texas Blues', 'Media > Music > Blues Music', 0, 1),
(3112, 3112, 3086, 'West Coast Blues', 'Media > Music > Blues Music', 0, 1),
(3113, 3113, 3083, 'Cajun Music', 'Media > Music', 1, 1),
(3114, 3114, 3113, 'Zydeco Music', 'Media > Music > Cajun Music', 0, 1),
(3115, 3115, 3083, 'Children\'s Music', 'Media > Music', 1, 1),
(3116, 3116, 3115, 'Sing-Along Music', 'Media > Music > Children\'s Music', 0, 1),
(3117, 3117, 3083, 'Classical Music', 'Media > Music', 9, 1),
(3118, 3118, 3117, 'Avant-Garde Classical', 'Media > Music > Classical Music', 0, 1),
(3119, 3119, 3117, 'Ballet Music', 'Media > Music > Classical Music', 0, 1),
(3120, 3120, 3117, 'Chamber Music', 'Media > Music > Classical Music', 0, 1),
(3121, 3121, 3117, 'Choral Music', 'Media > Music > Classical Music', 0, 1),
(3122, 3122, 3117, 'Concerto', 'Media > Music > Classical Music', 0, 1),
(3123, 3123, 3117, 'Musical Theater', 'Media > Music > Classical Music', 0, 1),
(3124, 3124, 3117, 'Opera Music', 'Media > Music > Classical Music', 0, 1),
(3125, 3125, 3117, 'Orchestral Music', 'Media > Music > Classical Music', 0, 1),
(3126, 3126, 3117, 'Symphony', 'Media > Music > Classical Music', 0, 1),
(3127, 3127, 3083, 'Comedy Recordings', 'Media > Music', 0, 1),
(3128, 3128, 3083, 'Country Music', 'Media > Music', 14, 1),
(3129, 3129, 3128, 'Alternative Country-Rock', 'Media > Music > Country Music', 0, 1),
(3130, 3130, 3128, 'Americana', 'Media > Music > Country Music', 0, 1),
(3131, 3131, 3128, 'Bakersfield Sound', 'Media > Music > Country Music', 0, 1),
(3132, 3132, 3128, 'Bluegrass', 'Media > Music > Country Music', 0, 1),
(3133, 3133, 3128, 'Country Gospel', 'Media > Music > Country Music', 0, 1),
(3134, 3134, 3128, 'Country-Folk', 'Media > Music > Country Music', 0, 1),
(3135, 3135, 3128, 'Country-Pop', 'Media > Music > Country Music', 0, 1),
(3136, 3136, 3128, 'Country-Rock', 'Media > Music > Country Music', 0, 1),
(3137, 3137, 3128, 'Honky Tonk', 'Media > Music > Country Music', 0, 1),
(3138, 3138, 3128, 'Nashville Sound & Countrypolitan', 'Media > Music > Country Music', 0, 1),
(3139, 3139, 3128, 'Neotraditional Country', 'Media > Music > Country Music', 0, 1),
(3140, 3140, 3128, 'Outlaw Country', 'Media > Music > Country Music', 0, 1),
(3141, 3141, 3128, 'Rockabilly', 'Media > Music > Country Music', 0, 1),
(3142, 3142, 3128, 'Western Swing', 'Media > Music > Country Music', 0, 1),
(3143, 3143, 3083, 'Easy Listening', 'Media > Music', 2, 1),
(3144, 3144, 3143, 'Lounge Music', 'Media > Music > Easy Listening', 0, 1),
(3145, 3145, 3143, 'Mood Music', 'Media > Music > Easy Listening', 0, 1),
(3146, 3146, 3083, 'Electronic Music', 'Media > Music', 11, 1),
(3147, 3147, 3146, 'Acid House Music', 'Media > Music > Electronic Music', 0, 1),
(3148, 3148, 3146, 'Ambient Music', 'Media > Music > Electronic Music', 0, 1),
(3149, 3149, 3146, 'Downbeat', 'Media > Music > Electronic Music', 0, 1),
(3150, 3150, 3146, 'Drill\'n\'bass', 'Media > Music > Electronic Music', 0, 1),
(3151, 3151, 3146, 'Gabba Music', 'Media > Music > Electronic Music', 0, 1),
(3152, 3152, 3146, 'Happy Hardcore Music', 'Media > Music > Electronic Music', 0, 1),
(3153, 3153, 3146, 'House Music', 'Media > Music > Electronic Music', 0, 1),
(3154, 3154, 3146, 'Jungle & Drum\'n\'bass', 'Media > Music > Electronic Music', 0, 1),
(3155, 3155, 3146, 'Rave Music', 'Media > Music > Electronic Music', 0, 1),
(3156, 3156, 3146, 'Trance Music', 'Media > Music > Electronic Music', 0, 1),
(3157, 3157, 3146, 'Trip-Hop', 'Media > Music > Electronic Music', 0, 1),
(3158, 3158, 3083, 'Folk Music', 'Media > Music', 3, 1),
(3159, 3159, 3158, 'Contemporary Folk Music', 'Media > Music > Folk Music', 0, 1),
(3160, 3160, 3158, 'Folk-Rock', 'Media > Music > Folk Music', 0, 1),
(3161, 3161, 3158, 'Traditional Folk Music', 'Media > Music > Folk Music', 0, 1),
(3162, 3162, 3083, 'Gospel Music', 'Media > Music', 8, 1),
(3163, 3163, 3162, 'Black Gospel', 'Media > Music > Gospel Music', 0, 1),
(3164, 3164, 3162, 'Christian Rock', 'Media > Music > Gospel Music', 0, 1),
(3165, 3165, 3162, 'Contemporary Gospel Music', 'Media > Music > Gospel Music', 0, 1),
(3166, 3166, 3162, 'Gospel Choir', 'Media > Music > Gospel Music', 0, 1),
(3167, 3167, 3162, 'Inspirational Music', 'Media > Music > Gospel Music', 0, 1),
(3168, 3168, 3162, 'Praise & Worship Music', 'Media > Music > Gospel Music', 0, 1),
(3169, 3169, 3162, 'Southern Gospel Music', 'Media > Music > Gospel Music', 0, 1),
(3170, 3170, 3162, 'Traditional Gospel Music', 'Media > Music > Gospel Music', 0, 1),
(3171, 3171, 3083, 'Hip-Hop & Rap', 'Media > Music', 12, 1),
(3172, 3172, 3171, 'Alternative Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3173, 3173, 3171, 'Dirty South', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3174, 3174, 3171, 'East Coast Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3175, 3175, 3171, 'G-Funk', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3176, 3176, 3171, 'Gangsta Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3177, 3177, 3171, 'Hardcore Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3178, 3178, 3171, 'Hip-Hop', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3179, 3179, 3171, 'Old-School Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3180, 3180, 3171, 'Southern Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3181, 3181, 3171, 'Turntablism', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3182, 3182, 3171, 'Underground Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3183, 3183, 3171, 'West Coast Rap', 'Media > Music > Hip-Hop & Rap', 0, 1),
(3184, 3184, 3083, 'Holiday Music', 'Media > Music', 1, 1),
(3185, 3185, 3184, 'Christmas Music', 'Media > Music > Holiday Music', 0, 1),
(3186, 3186, 3083, 'Jazz', 'Media > Music', 25, 1),
(3187, 3187, 3186, 'Avant-Garde Jazz', 'Media > Music > Jazz', 0, 1),
(3188, 3188, 3186, 'Big Band & Swing', 'Media > Music > Jazz', 3, 1),
(3189, 3189, 3188, 'Ballroom Dance', 'Media > Music > Jazz > Big Band & Swing', 0, 1),
(3190, 3190, 3188, 'Big Band', 'Media > Music > Jazz > Big Band & Swing', 0, 1),
(3191, 3191, 3188, 'Swing Music', 'Media > Music > Jazz > Big Band & Swing', 0, 1),
(3192, 3192, 3186, 'Bop Music', 'Media > Music > Jazz', 0, 1),
(3193, 3193, 3186, 'Cool Jazz', 'Media > Music > Jazz', 0, 1),
(3194, 3194, 3186, 'Crossover Jazz', 'Media > Music > Jazz', 0, 1),
(3195, 3195, 3186, 'Cuban & Afro-Cuban Jazz', 'Media > Music > Jazz', 0, 1),
(3196, 3196, 3186, 'Free Improvisation', 'Media > Music > Jazz', 0, 1),
(3197, 3197, 3186, 'Free Jazz', 'Media > Music > Jazz', 0, 1),
(3198, 3198, 3186, 'Hard Bop', 'Media > Music > Jazz', 0, 1),
(3199, 3199, 3186, 'Jazz Ballads', 'Media > Music > Jazz', 0, 1),
(3200, 3200, 3186, 'Jazz Blues', 'Media > Music > Jazz', 0, 1),
(3201, 3201, 3186, 'Jazz Fusion', 'Media > Music > Jazz', 0, 1),
(3202, 3202, 3186, 'Jazz Standards', 'Media > Music > Jazz', 0, 1),
(3203, 3203, 3186, 'Jazz-Funk', 'Media > Music > Jazz', 0, 1),
(3204, 3204, 3186, 'Jazz-Pop', 'Media > Music > Jazz', 0, 1),
(3205, 3205, 3186, 'Modal Jazz', 'Media > Music > Jazz', 0, 1),
(3206, 3206, 3186, 'New Orleans Jazz', 'Media > Music > Jazz', 0, 1),
(3207, 3207, 3186, 'Post-Bop', 'Media > Music > Jazz', 0, 1),
(3208, 3208, 3186, 'Progressive Jazz', 'Media > Music > Jazz', 0, 1),
(3209, 3209, 3186, 'Smooth Jazz', 'Media > Music > Jazz', 0, 1),
(3210, 3210, 3186, 'Soul Jazz & Groove', 'Media > Music > Jazz', 0, 1),
(3211, 3211, 3186, 'Stride Piano', 'Media > Music > Jazz', 0, 1),
(3212, 3212, 3186, 'Trad Jazz', 'Media > Music > Jazz', 0, 1),
(3213, 3213, 3186, 'Vocal Jazz', 'Media > Music > Jazz', 0, 1),
(3214, 3214, 3186, 'West Coast Jazz', 'Media > Music > Jazz', 0, 1),
(3215, 3215, 3083, 'New Age Music', 'Media > Music', 3, 1),
(3216, 3216, 3215, 'Meditation Music', 'Media > Music > New Age Music', 0, 1),
(3217, 3217, 3215, 'Relaxation Music', 'Media > Music > New Age Music', 0, 1),
(3218, 3218, 3215, 'Spiritual Music', 'Media > Music > New Age Music', 0, 1),
(3219, 3219, 3083, 'R&B & Soul', 'Media > Music', 7, 1),
(3220, 3220, 3219, 'Disco', 'Media > Music > R&B & Soul', 0, 1),
(3221, 3221, 3219, 'Doo Wop', 'Media > Music > R&B & Soul', 0, 1),
(3222, 3222, 3219, 'Funk Music', 'Media > Music > R&B & Soul', 0, 1),
(3223, 3223, 3219, 'Motown', 'Media > Music > R&B & Soul', 0, 1),
(3224, 3224, 3219, 'New Jack Swing', 'Media > Music > R&B & Soul', 0, 1),
(3225, 3225, 3219, 'R&B', 'Media > Music > R&B & Soul', 0, 1),
(3226, 3226, 3219, 'Soul Music', 'Media > Music > R&B & Soul', 0, 1),
(3227, 3227, 3083, 'Reggae', 'Media > Music', 7, 1),
(3228, 3228, 3227, 'Dancehall Music', 'Media > Music > Reggae', 0, 1),
(3229, 3229, 3227, 'Dub Music', 'Media > Music > Reggae', 0, 1),
(3230, 3230, 3227, 'Lovers Rock', 'Media > Music > Reggae', 0, 1),
(3231, 3231, 3227, 'Ragga Music', 'Media > Music > Reggae', 0, 1),
(3232, 3232, 3227, 'Rocksteady', 'Media > Music > Reggae', 0, 1),
(3233, 3233, 3227, 'Roots Reggae', 'Media > Music > Reggae', 0, 1),
(3234, 3234, 3227, 'Ska Music', 'Media > Music > Reggae', 0, 1),
(3235, 3235, 3083, 'Rock & Pop', 'Media > Music', 9, 1),
(3236, 3236, 3235, 'Alternative & Indie Rock', 'Media > Music > Rock & Pop', 13, 1),
(3237, 3237, 3236, 'Alternative Folk Music', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3238, 3238, 3236, 'Emo Music', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3239, 3239, 3236, 'Grunge Music', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3240, 3240, 3236, 'Indie Pop', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3241, 3241, 3236, 'Indie Rock', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3242, 3242, 3236, 'Industrial Music', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3243, 3243, 3236, 'Lo-Fi Rock', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3244, 3244, 3236, 'Math Rock', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3245, 3245, 3236, 'Noise Pop', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3246, 3246, 3236, 'Punk-Pop', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3247, 3247, 3236, 'Shoegaze Music', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3248, 3248, 3236, 'Singer/Songwriter Music', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3249, 3249, 3236, 'Twee Pop', 'Media > Music > Rock & Pop > Alternative & Indie Rock', 0, 1),
(3250, 3250, 3235, 'Art Rock & Experimental', 'Media > Music > Rock & Pop', 0, 1),
(3251, 3251, 3235, 'British Invasion', 'Media > Music > Rock & Pop', 0, 1),
(3252, 3252, 3235, 'Hard Rock & Metal', 'Media > Music > Rock & Pop', 6, 1),
(3253, 3253, 3252, 'Arena Rock', 'Media > Music > Rock & Pop > Hard Rock & Metal', 0, 1),
(3254, 3254, 3252, 'Death Metal & Black Metal', 'Media > Music > Rock & Pop > Hard Rock & Metal', 0, 1),
(3255, 3255, 3252, 'Glam Rock', 'Media > Music > Rock & Pop > Hard Rock & Metal', 0, 1),
(3256, 3256, 3252, 'Hard Rock', 'Media > Music > Rock & Pop > Hard Rock & Metal', 0, 1),
(3257, 3257, 3252, 'Heavy Metal', 'Media > Music > Rock & Pop > Hard Rock & Metal', 0, 1),
(3258, 3258, 3252, 'Speed Metal', 'Media > Music > Rock & Pop > Hard Rock & Metal', 0, 1),
(3259, 3259, 3235, 'Pop Music', 'Media > Music > Rock & Pop', 2, 1),
(3260, 3260, 3259, 'Europop', 'Media > Music > Rock & Pop > Pop Music', 0, 1),
(3261, 3261, 3259, 'Synth Pop', 'Media > Music > Rock & Pop > Pop Music', 0, 1),
(3262, 3262, 3235, 'Psychedelic & Garage', 'Media > Music > Rock & Pop', 1, 1),
(3263, 3263, 3262, 'Psychedelic Music', 'Media > Music > Rock & Pop > Psychedelic & Garage', 0, 1),
(3264, 3264, 3235, 'Punk & New Wave', 'Media > Music > Rock & Pop', 5, 1),
(3265, 3265, 3264, 'Hardcore Punk', 'Media > Music > Rock & Pop > Punk & New Wave', 0, 1),
(3266, 3266, 3264, 'New Wave', 'Media > Music > Rock & Pop > Punk & New Wave', 0, 1),
(3267, 3267, 3264, 'Post-Punk', 'Media > Music > Rock & Pop > Punk & New Wave', 0, 1),
(3268, 3268, 3264, 'Punk', 'Media > Music > Rock & Pop > Punk & New Wave', 0, 1),
(3269, 3269, 3264, 'Punk Revival', 'Media > Music > Rock & Pop > Punk & New Wave', 0, 1),
(3270, 3270, 3235, 'Rock And Roll & Roots', 'Media > Music > Rock & Pop', 5, 1),
(3271, 3271, 3270, 'Instrumental Rock', 'Media > Music > Rock & Pop > Rock And Roll & Roots', 0, 1),
(3272, 3272, 3270, 'Jam Bands', 'Media > Music > Rock & Pop > Rock And Roll & Roots', 0, 1),
(3273, 3273, 3270, 'Rock & Roll', 'Media > Music > Rock & Pop > Rock And Roll & Roots', 0, 1),
(3274, 3274, 3270, 'Roots Rock', 'Media > Music > Rock & Pop > Rock And Roll & Roots', 0, 1),
(3275, 3275, 3270, 'Surf', 'Media > Music > Rock & Pop > Rock And Roll & Roots', 0, 1),
(3276, 3276, 3235, 'Soft Rock', 'Media > Music > Rock & Pop', 1, 1),
(3277, 3277, 3276, 'Adult Contemporary', 'Media > Music > Rock & Pop > Soft Rock', 0, 1),
(3278, 3278, 3083, 'Soundtracks', 'Media > Music', 4, 1),
(3279, 3279, 3278, 'Cast Recordings', 'Media > Music > Soundtracks', 0, 1),
(3280, 3280, 3278, 'Film Music', 'Media > Music > Soundtracks', 0, 1),
(3281, 3281, 3278, 'Musical Theater Soundtracks', 'Media > Music > Soundtracks', 0, 1),
(3282, 3282, 3278, 'Show Tunes', 'Media > Music > Soundtracks', 0, 1),
(3283, 3283, 3083, 'Spoken Word Recordings', 'Media > Music', 0, 1),
(3284, 3284, 3083, 'Vocal Music', 'Media > Music', 0, 1),
(3285, 3285, 3083, 'World Music', 'Media > Music', 36, 1),
(3286, 3286, 3285, 'African Folk Music', 'Media > Music > World Music', 0, 1),
(3287, 3287, 3285, 'Afro-Beat', 'Media > Music > World Music', 0, 1),
(3288, 3288, 3285, 'Afro-Pop', 'Media > Music > World Music', 0, 1),
(3289, 3289, 3285, 'Asian Folk Music', 'Media > Music > World Music', 0, 1),
(3290, 3290, 3285, 'Belly Dancing Music', 'Media > Music > World Music', 0, 1),
(3291, 3291, 3285, 'Bollywood Music', 'Media > Music > World Music', 0, 1),
(3292, 3292, 3285, 'Calypso', 'Media > Music > World Music', 0, 1),
(3293, 3293, 3285, 'Carnatic Music', 'Media > Music > World Music', 0, 1),
(3294, 3294, 3285, 'Celtic Music', 'Media > Music > World Music', 4, 1),
(3295, 3295, 3294, 'Celtic Folk Music', 'Media > Music > World Music > Celtic Music', 0, 1),
(3296, 3296, 3294, 'Contemporary Celtic', 'Media > Music > World Music > Celtic Music', 0, 1),
(3297, 3297, 3294, 'Irish Folk Music', 'Media > Music > World Music > Celtic Music', 0, 1),
(3298, 3298, 3294, 'Traditional Celtic', 'Media > Music > World Music > Celtic Music', 0, 1),
(3299, 3299, 3285, 'Eastern European Music', 'Media > Music > World Music', 0, 1),
(3300, 3300, 3285, 'Euro-Pop', 'Media > Music > World Music', 0, 1),
(3301, 3301, 3285, 'European Folk Music', 'Media > Music > World Music', 0, 1),
(3302, 3302, 3285, 'Fado Music', 'Media > Music > World Music', 0, 1),
(3303, 3303, 3285, 'Flamenco Music', 'Media > Music > World Music', 0, 1),
(3304, 3304, 3285, 'French Pop', 'Media > Music > World Music', 0, 1),
(3305, 3305, 3285, 'Highlife Music', 'Media > Music > World Music', 0, 1),
(3306, 3306, 3285, 'Indian Classical Music', 'Media > Music > World Music', 0, 1),
(3307, 3307, 3285, 'Indian Folk Music', 'Media > Music > World Music', 0, 1),
(3308, 3308, 3285, 'Indian Pop', 'Media > Music > World Music', 0, 1),
(3309, 3309, 3285, 'Italian Pop', 'Media > Music > World Music', 0, 1),
(3310, 3310, 3285, 'Jewish Music', 'Media > Music > World Music', 0, 1),
(3311, 3311, 3285, 'Klezmer', 'Media > Music > World Music', 0, 1),
(3312, 3312, 3285, 'Latin Music', 'Media > Music > World Music', 23, 1),
(3313, 3313, 3312, 'Banda Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3314, 3314, 3312, 'Bolero Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3315, 3315, 3312, 'Bossa Nova', 'Media > Music > World Music > Latin Music', 0, 1),
(3316, 3316, 3312, 'Brazilian Jazz', 'Media > Music > World Music > Latin Music', 0, 1),
(3317, 3317, 3312, 'Brazilian Pop', 'Media > Music > World Music > Latin Music', 0, 1),
(3318, 3318, 3312, 'Corrido Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3319, 3319, 3312, 'Cuban Son Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3320, 3320, 3312, 'Cumbia Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3321, 3321, 3312, 'Latin Big Band', 'Media > Music > World Music > Latin Music', 0, 1),
(3322, 3322, 3312, 'Latin Jazz', 'Media > Music > World Music > Latin Music', 0, 1),
(3323, 3323, 3312, 'Latin Pop', 'Media > Music > World Music > Latin Music', 0, 1),
(3324, 3324, 3312, 'Latin Rock', 'Media > Music > World Music > Latin Music', 0, 1),
(3325, 3325, 3312, 'Mambo Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3326, 3326, 3312, 'Mariachi Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3327, 3327, 3312, 'Merengue Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3329, 3329, 3312, 'Ranchera Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3330, 3330, 3312, 'Salsa Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3331, 3331, 3312, 'Samba Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3332, 3332, 3312, 'Tango Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3333, 3333, 3312, 'Tejano Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3334, 3334, 3312, 'Tropical Music', 'Media > Music > World Music > Latin Music', 0, 1),
(3335, 3335, 3285, 'Mbaqanga Music', 'Media > Music > World Music', 0, 1),
(3336, 3336, 3285, 'Middle Eastern Folk Music', 'Media > Music > World Music', 0, 1),
(3337, 3337, 3285, 'Middle Eastern Pop', 'Media > Music > World Music', 0, 1),
(3338, 3338, 3285, 'Qawwali Music', 'Media > Music > World Music', 0, 1),
(3340, 3340, 3285, 'Scandinavian Folk Music', 'Media > Music > World Music', 0, 1),
(3341, 3341, 3285, 'Slack-Key Guitar', 'Media > Music > World Music', 0, 1),
(3342, 3342, 3285, 'Soca Music', 'Media > Music > World Music', 0, 1),
(3343, 3343, 3285, 'Soukous Music', 'Media > Music > World Music', 0, 1),
(3344, 3344, 3285, 'South African Pop', 'Media > Music > World Music', 0, 1),
(3345, 3345, 3285, 'Worldbeat', 'Media > Music > World Music', 1, 1),
(3346, 3346, 3345, 'Ethnic', 'Media > Music > World Music > Worldbeat', 0, 1),
(3347, 3347, 3285, 'Zouk Music', 'Media > Music > World Music', 0, 1),
(3348, 3348, 3013, 'Product Manuals', 'Media', 4, 1),
(3349, 3349, 3348, 'Electronics Manuals', 'Media > Product Manuals', 0, 1),
(3350, 3350, 3348, 'Household Appliance Manuals', 'Media > Product Manuals', 0, 1),
(3351, 3351, 3348, 'Kitchen Appliance Manuals', 'Media > Product Manuals', 0, 1),
(3352, 3352, 3348, 'Vehicle Service Manuals', 'Media > Product Manuals', 0, 1),
(3353, 3353, 3013, 'Sheet Music', 'Media', 0, 1),
(3354, 3354, 0, 'Office Supplies', '', 9, 1),
(3355, 3355, 3354, 'Filing & Organization', 'Office Supplies', 11, 1),
(3356, 3356, 3355, 'Binding Supplies', 'Office Supplies > Filing & Organization', 4, 1),
(3357, 3357, 3356, 'Binder Accessories', 'Office Supplies > Filing & Organization > Binding Supplies', 3, 1),
(3358, 3358, 3357, 'Binder Rings', 'Office Supplies > Filing & Organization > Binding Supplies > Binder Accessories', 0, 1),
(3359, 3359, 3357, 'Index Dividers', 'Office Supplies > Filing & Organization > Binding Supplies > Binder Accessories', 0, 1),
(3360, 3360, 3357, 'Sheet Protectors', 'Office Supplies > Filing & Organization > Binding Supplies > Binder Accessories', 0, 1),
(3361, 3361, 3356, 'Binders', 'Office Supplies > Filing & Organization > Binding Supplies', 0, 1),
(3362, 3362, 3356, 'Binding Combs & Spines', 'Office Supplies > Filing & Organization > Binding Supplies', 0, 1),
(3363, 3363, 3356, 'Report Covers', 'Office Supplies > Filing & Organization > Binding Supplies', 0, 1),
(3364, 3364, 3355, 'CD/DVD Organizers', 'Office Supplies > Filing & Organization', 2, 1),
(3365, 3365, 3364, 'CD/DVD Pouches & Visors', 'Office Supplies > Filing & Organization > CD/DVD Organizers', 0, 1),
(3366, 3366, 3364, 'Jewel Cases', 'Office Supplies > Filing & Organization > CD/DVD Organizers', 0, 1),
(3367, 3367, 3355, 'Calendars, Organizers & Planners', 'Office Supplies > Filing & Organization', 0, 1),
(3368, 3368, 3355, 'Cash Boxes', 'Office Supplies > Filing & Organization', 0, 1),
(3369, 3369, 3355, 'Desk Organizers', 'Office Supplies > Filing & Organization', 1, 1),
(3370, 3370, 3369, 'Desk Trays', 'Office Supplies > Filing & Organization > Desk Organizers', 0, 1),
(3371, 3371, 3355, 'File Cabinets', 'Office Supplies > Filing & Organization', 0, 1),
(3372, 3372, 3355, 'File Folders', 'Office Supplies > Filing & Organization', 0, 1),
(3373, 3373, 3355, 'Filing Boxes', 'Office Supplies > Filing & Organization', 0, 1),
(3374, 3374, 3355, 'Greeting Card Organizers', 'Office Supplies > Filing & Organization', 0, 1),
(3375, 3375, 3355, 'Laminating', 'Office Supplies > Filing & Organization', 1, 1),
(3376, 3376, 3375, 'Laminators', 'Office Supplies > Filing & Organization > Laminating', 0, 1),
(3377, 3377, 3355, 'Pen & Pencil Cases', 'Office Supplies > Filing & Organization', 0, 1),
(3378, 3378, 3354, 'General Supplies', 'Office Supplies', 9, 1),
(3379, 3379, 3378, 'Adhesives', 'Office Supplies > General Supplies', 1, 1),
(3380, 3380, 3379, 'Office Tape', 'Office Supplies > General Supplies > Adhesives', 0, 1),
(3381, 3381, 3378, 'Correction', 'Office Supplies > General Supplies', 2, 1),
(3382, 3382, 3381, 'Correction Fluids, Pens & Tapes', 'Office Supplies > General Supplies > Correction', 0, 1),
(3383, 3383, 3381, 'Erasers', 'Office Supplies > General Supplies > Correction', 0, 1),
(3384, 3384, 3378, 'Labels & Tags', 'Office Supplies > General Supplies', 6, 1),
(3385, 3385, 3384, 'Address Labels', 'Office Supplies > General Supplies > Labels & Tags', 0, 1),
(3386, 3386, 3384, 'Folder Tabs', 'Office Supplies > General Supplies > Labels & Tags', 0, 1),
(3387, 3387, 3384, 'Label Clips', 'Office Supplies > General Supplies > Labels & Tags', 0, 1),
(3388, 3388, 3384, 'Shipping Labels', 'Office Supplies > General Supplies > Labels & Tags', 0, 1),
(3389, 3389, 3384, 'Shipping Tags', 'Office Supplies > General Supplies > Labels & Tags', 0, 1),
(3390, 3390, 3378, 'Paper Clips & Clamps', 'Office Supplies > General Supplies', 0, 1),
(3391, 3391, 3378, 'Paper Products', 'Office Supplies > General Supplies', 12, 1),
(3392, 3392, 3391, 'Binder Paper', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3393, 3393, 3391, 'Blank ID Cards', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3394, 3394, 3391, 'Bookmarks', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3395, 3395, 3391, 'Business Cards', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3396, 3396, 3391, 'Cover Paper', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3397, 3397, 3391, 'Envelopes', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3398, 3398, 3391, 'Index Cards', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3399, 3399, 3391, 'Notebooks & Notepads', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3400, 3400, 3391, 'Post Cards', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3401, 3401, 3391, 'Printer & Copier Paper', 'Office Supplies > General Supplies > Paper Products', 1, 1),
(3402, 3402, 3401, 'Photo Printer Paper', 'Office Supplies > General Supplies > Paper Products > Printer & Copier Paper', 0, 1),
(3403, 3403, 3391, 'Stationery', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3404, 3404, 3391, 'Sticky Notes', 'Office Supplies > General Supplies > Paper Products', 0, 1),
(3405, 3405, 3378, 'Rubber Bands', 'Office Supplies > General Supplies', 0, 1),
(3406, 3406, 3378, 'Stamp Pads & Inks', 'Office Supplies > General Supplies', 0, 1),
(3407, 3407, 3378, 'Staples', 'Office Supplies > General Supplies', 0, 1),
(3408, 3408, 3378, 'Tacks & Pushpins', 'Office Supplies > General Supplies', 0, 1),
(3409, 3409, 3354, 'Name Plates', 'Office Supplies', 0, 1),
(3410, 3410, 3354, 'Office Equipment', 'Office Supplies', 7, 1),
(3411, 3411, 3410, 'Calculators', 'Office Supplies > Office Equipment', 0, 1),
(3412, 3412, 3410, 'Electronic Dictionaries & Translators', 'Office Supplies > Office Equipment', 0, 1),
(3413, 3413, 3410, 'Label Makers', 'Office Supplies > Office Equipment', 0, 1),
(3414, 3414, 3410, 'Postage Meters', 'Office Supplies > Office Equipment', 0, 1),
(3415, 3415, 3410, 'Shredders', 'Office Supplies > Office Equipment', 0, 1),
(3416, 3416, 3410, 'Transcribers & Dictation Systems', 'Office Supplies > Office Equipment', 0, 1),
(3417, 3417, 3410, 'Typewriters', 'Office Supplies > Office Equipment', 0, 1),
(3418, 3418, 3354, 'Office Instruments', 'Office Supplies', 11, 1),
(3419, 3419, 3418, 'Call Bells', 'Office Supplies > Office Instruments', 0, 1),
(3420, 3420, 3418, 'Clipboards', 'Office Supplies > Office Instruments', 0, 1),
(3421, 3421, 3418, 'Magnifiers', 'Office Supplies > Office Instruments', 0, 1),
(3422, 3422, 3418, 'Office Rulers', 'Office Supplies > Office Instruments', 0, 1),
(3423, 3423, 3418, 'Pencil Sharpeners', 'Office Supplies > Office Instruments', 0, 1),
(3424, 3424, 3418, 'Rubber Stamps', 'Office Supplies > Office Instruments', 2, 1),
(3425, 3425, 3424, 'Decorative Rubber Stamps', 'Office Supplies > Office Instruments > Rubber Stamps', 0, 1),
(3426, 3426, 3424, 'Office Rubber Stamps', 'Office Supplies > Office Instruments > Rubber Stamps', 0, 1),
(3427, 3427, 3418, 'Scissors', 'Office Supplies > Office Instruments', 0, 1),
(3428, 3428, 3418, 'Staple Removers', 'Office Supplies > Office Instruments', 0, 1),
(3429, 3429, 3418, 'Staplers', 'Office Supplies > Office Instruments', 0, 1),
(3430, 3430, 3418, 'Writing Instrument Accessories', 'Office Supplies > Office Instruments', 2, 1),
(3431, 3431, 3430, 'Pen Ink & Refills', 'Office Supplies > Office Instruments > Writing Instrument Accessories', 0, 1),
(3432, 3432, 3430, 'Pencil Lead & Refills', 'Office Supplies > Office Instruments > Writing Instrument Accessories', 0, 1),
(3433, 3433, 3418, 'Writing Instruments', 'Office Supplies > Office Instruments', 5, 1),
(3434, 3434, 3433, 'Crayons', 'Office Supplies > Office Instruments > Writing Instruments', 0, 1),
(3435, 3435, 3433, 'Markers & Highlighters', 'Office Supplies > Office Instruments > Writing Instruments', 0, 1),
(3436, 3436, 3433, 'Pencils', 'Office Supplies > Office Instruments > Writing Instruments', 0, 1),
(3437, 3437, 3433, 'Pens', 'Office Supplies > Office Instruments > Writing Instruments', 0, 1),
(3438, 3438, 3433, 'Writing Chalk', 'Office Supplies > Office Instruments > Writing Instruments', 0, 1),
(3439, 3439, 3354, 'Paper Handling', 'Office Supplies', 8, 1),
(3440, 3440, 3439, 'Craft Knives', 'Office Supplies > Paper Handling', 0, 1),
(3441, 3441, 3439, 'Cutting Mats', 'Office Supplies > Paper Handling', 0, 1),
(3442, 3442, 3439, 'Hole Punches', 'Office Supplies > Paper Handling', 0, 1),
(3443, 3443, 3439, 'Paper Cutter Accessories', 'Office Supplies > Paper Handling', 1, 1),
(3444, 3444, 3443, 'Paper Cutter Stands', 'Office Supplies > Paper Handling > Paper Cutter Accessories', 0, 1),
(3445, 3445, 3439, 'Paper Cutters', 'Office Supplies > Paper Handling', 0, 1),
(3446, 3446, 3439, 'Paper Folding Machines', 'Office Supplies > Paper Handling', 0, 1),
(3447, 3447, 3439, 'Paper Joggers', 'Office Supplies > Paper Handling', 0, 1),
(3448, 3448, 3439, 'Paperweights', 'Office Supplies > Paper Handling', 0, 1),
(3449, 3449, 3354, 'Presentation Supplies', 'Office Supplies', 10, 1),
(3450, 3450, 3449, 'Chalkboards', 'Office Supplies > Presentation Supplies', 0, 1),
(3451, 3451, 3449, 'Display Boards', 'Office Supplies > Presentation Supplies', 4, 1),
(3452, 3452, 3451, 'Bulletin Boards', 'Office Supplies > Presentation Supplies > Display Boards', 0, 1),
(3453, 3453, 3451, 'Foam Boards', 'Office Supplies > Presentation Supplies > Display Boards', 0, 1),
(3454, 3454, 3451, 'Mounting Boards', 'Office Supplies > Presentation Supplies > Display Boards', 0, 1),
(3455, 3455, 3451, 'Poster Boards', 'Office Supplies > Presentation Supplies > Display Boards', 0, 1),
(3456, 3456, 3449, 'Document Cameras', 'Office Supplies > Presentation Supplies', 0, 1),
(3457, 3457, 3449, 'Easel Pads', 'Office Supplies > Presentation Supplies', 0, 1),
(3458, 3458, 3449, 'Easels', 'Office Supplies > Presentation Supplies', 0, 1),
(3459, 3459, 3449, 'Laser Pointers', 'Office Supplies > Presentation Supplies', 0, 1),
(3460, 3460, 3449, 'Lecterns', 'Office Supplies > Presentation Supplies', 0, 1),
(3461, 3461, 3449, 'Transparencies', 'Office Supplies > Presentation Supplies', 0, 1),
(3462, 3462, 3449, 'Whiteboards', 'Office Supplies > Presentation Supplies', 0, 1),
(3463, 3463, 3449, 'Wireless Presenters', 'Office Supplies > Presentation Supplies', 0, 1),
(3464, 3464, 3354, 'Shipping Supplies', 'Office Supplies', 4, 1),
(3465, 3465, 3464, 'Packing Materials', 'Office Supplies > Shipping Supplies', 0, 1),
(3466, 3466, 3464, 'Packing Tape', 'Office Supplies > Shipping Supplies', 0, 1),
(3467, 3467, 3464, 'Postal Scales', 'Office Supplies > Shipping Supplies', 0, 1),
(3468, 3468, 3464, 'Shipping Boxes', 'Office Supplies > Shipping Supplies', 0, 1),
(3469, 3469, 3354, 'Signs', 'Office Supplies', 1, 1),
(3470, 3470, 3469, 'Electronic Signs', 'Office Supplies > Signs', 2, 1),
(3471, 3471, 3470, 'LED Signs', 'Office Supplies > Signs > Electronic Signs', 0, 1),
(3472, 3472, 3470, 'Neon Signs', 'Office Supplies > Signs > Electronic Signs', 0, 1),
(3473, 3473, 0, 'Software', '', 3, 1),
(3474, 3474, 3473, 'Computer Software', 'Software', 13, 1),
(3475, 3475, 3474, 'Antivirus & Security Software', 'Software > Computer Software', 0, 1),
(3476, 3476, 3474, 'Business & Productivity Software', 'Software > Computer Software', 0, 1),
(3477, 3477, 3474, 'Children\'s Software', 'Software > Computer Software', 0, 1),
(3478, 3478, 3474, 'Compilers & Programming Tools', 'Software > Computer Software', 0, 1),
(3479, 3479, 3474, 'Computer Utilities & Maintenance', 'Software > Computer Software', 0, 1),
(3480, 3480, 3474, 'Educational Software', 'Software > Computer Software', 0, 1),
(3481, 3481, 3474, 'Handheld & PDA Software', 'Software > Computer Software', 0, 1),
(3482, 3482, 3474, 'Multimedia & Design Software', 'Software > Computer Software', 7, 1),
(3483, 3483, 3482, 'Animation Editing Software', 'Software > Computer Software > Multimedia & Design Software', 0, 1),
(3484, 3484, 3482, 'Graphic Design Software', 'Software > Computer Software > Multimedia & Design Software', 0, 1),
(3485, 3485, 3482, 'Home Publishing Software', 'Software > Computer Software > Multimedia & Design Software', 0, 1),
(3486, 3486, 3482, 'Music Composition Software', 'Software > Computer Software > Multimedia & Design Software', 0, 1),
(3487, 3487, 3482, 'Sound Editing Software', 'Software > Computer Software > Multimedia & Design Software', 0, 1),
(3488, 3488, 3482, 'Video Editing Software', 'Software > Computer Software > Multimedia & Design Software', 0, 1),
(3489, 3489, 3482, 'Web Design Software', 'Software > Computer Software > Multimedia & Design Software', 0, 1),
(3490, 3490, 3474, 'Network Software', 'Software > Computer Software', 0, 1),
(3491, 3491, 3474, 'Office Application Software', 'Software > Computer Software', 0, 1),
(3492, 3492, 3474, 'Operating Systems', 'Software > Computer Software', 0, 1),
(3493, 3493, 3474, 'Reference Software', 'Software > Computer Software', 2, 1),
(3494, 3494, 3493, 'Dictionary & Translation Software', 'Software > Computer Software > Reference Software', 0, 1),
(3495, 3495, 3493, 'GPS Map Data & Software', 'Software > Computer Software > Reference Software', 0, 1),
(3496, 3496, 3474, 'Tax & Accounting Software', 'Software > Computer Software', 0, 1),
(3497, 3497, 3473, 'Digital Content Software', 'Software', 4, 1),
(3498, 3498, 3497, 'Clip Art', 'Software > Digital Content Software', 0, 1),
(3499, 3499, 3497, 'Computer Icons', 'Software > Digital Content Software', 0, 1),
(3500, 3500, 3497, 'Desktop Wallpaper', 'Software > Digital Content Software', 0, 1),
(3501, 3501, 3497, 'Fonts', 'Software > Digital Content Software', 0, 1),
(3502, 3502, 3473, 'Video Game Software', 'Software', 27, 1),
(3503, 3503, 3502, 'All Game Boy Games', 'Software > Video Game Software', 2, 1),
(3504, 3504, 3503, 'Game Boy Advance Games', 'Software > Video Game Software > All Game Boy Games', 0, 1),
(3505, 3505, 3503, 'Game Boy Games', 'Software > Video Game Software > All Game Boy Games', 0, 1),
(3506, 3506, 3502, 'All PlayStation Games', 'Software > Video Game Software', 3, 1),
(3507, 3507, 3506, 'PlayStation (original) Games', 'Software > Video Game Software > All PlayStation Games', 0, 1),
(3508, 3508, 3506, 'PlayStation 2 Games', 'Software > Video Game Software > All PlayStation Games', 0, 1),
(3509, 3509, 3506, 'PlayStation 3 Games', 'Software > Video Game Software > All PlayStation Games', 0, 1),
(3510, 3510, 3502, 'All XBox Games', 'Software > Video Game Software', 2, 1),
(3511, 3511, 3510, 'XBox (original) Games', 'Software > Video Game Software > All XBox Games', 0, 1),
(3512, 3512, 3510, 'XBox 360 Games', 'Software > Video Game Software > All XBox Games', 0, 1),
(3513, 3513, 3502, 'Atari 2600 Games', 'Software > Video Game Software', 0, 1),
(3514, 3514, 3502, 'Atari 5200 Games', 'Software > Video Game Software', 0, 1),
(3515, 3515, 3502, 'Atari Lynx Games', 'Software > Video Game Software', 0, 1),
(3516, 3516, 3502, 'ColecoVision Games', 'Software > Video Game Software', 0, 1),
(3517, 3517, 3502, 'Computer Games', 'Software > Video Game Software', 2, 1),
(3518, 3518, 3517, 'Mac Games', 'Software > Video Game Software > Computer Games', 0, 1),
(3519, 3519, 3517, 'PC Games', 'Software > Video Game Software > Computer Games', 0, 1),
(3520, 3520, 3502, 'Dreamcast Games', 'Software > Video Game Software', 0, 1),
(3521, 3521, 3502, 'Game Gear Games', 'Software > Video Game Software', 0, 1),
(3522, 3522, 3502, 'GameCube Games', 'Software > Video Game Software', 0, 1),
(3523, 3523, 3502, 'Intellivision Games', 'Software > Video Game Software', 0, 1),
(3524, 3524, 3502, 'Jaguar Games', 'Software > Video Game Software', 0, 1),
(3525, 3525, 3502, 'N-Gage Games', 'Software > Video Game Software', 0, 1),
(3526, 3526, 3502, 'Neo Geo Games', 'Software > Video Game Software', 0, 1),
(3527, 3527, 3502, 'Neo Geo Pocket Games', 'Software > Video Game Software', 0, 1),
(3528, 3528, 3502, 'Nintendo 64 Games', 'Software > Video Game Software', 0, 1),
(3529, 3529, 3502, 'Nintendo DS Games', 'Software > Video Game Software', 0, 1),
(3530, 3530, 3502, 'Nintendo Entertainment System Games', 'Software > Video Game Software', 0, 1),
(3531, 3531, 3502, 'PlayStation Portable Games', 'Software > Video Game Software', 0, 1),
(3532, 3532, 3502, 'PlayStation Vita Games', 'Software > Video Game Software', 0, 1),
(3533, 3533, 3502, 'Sega Genesis Games', 'Software > Video Game Software', 0, 1),
(3534, 3534, 3502, 'Sega Master System Games', 'Software > Video Game Software', 0, 1),
(3535, 3535, 3502, 'Super Nintendo Games', 'Software > Video Game Software', 0, 1),
(3536, 3536, 3502, 'Turbografx 16 Games', 'Software > Video Game Software', 0, 1),
(3537, 3537, 3502, 'Wii Games', 'Software > Video Game Software', 0, 1),
(3538, 3538, 3502, 'Wii U Games', 'Software > Video Game Software', 0, 1),
(3539, 3539, 0, 'Sporting Goods', '', 14, 1),
(3540, 3540, 3539, 'Air Sports', 'Sporting Goods', 2, 1),
(3541, 3541, 3540, 'Hang Gliding', 'Sporting Goods > Air Sports', 1, 1),
(3542, 3542, 3541, 'Hang Gliders', 'Sporting Goods > Air Sports > Hang Gliding', 0, 1),
(3543, 3543, 3540, 'Parachutes', 'Sporting Goods > Air Sports', 0, 1),
(3544, 3544, 3539, 'Combat Sports', 'Sporting Goods', 4, 1),
(3545, 3545, 3544, 'Boxing', 'Sporting Goods > Combat Sports', 6, 1),
(3546, 3546, 3545, 'Boxing Gloves & Mitts', 'Sporting Goods > Combat Sports > Boxing', 0, 1),
(3547, 3547, 3545, 'Boxing Protective Gear', 'Sporting Goods > Combat Sports > Boxing', 0, 1),
(3548, 3548, 3545, 'Boxing Ring Parts', 'Sporting Goods > Combat Sports > Boxing', 0, 1),
(3549, 3549, 3545, 'Boxing Rings', 'Sporting Goods > Combat Sports > Boxing', 0, 1),
(3550, 3550, 3545, 'Punching Bag Accessories', 'Sporting Goods > Combat Sports > Boxing', 0, 1),
(3551, 3551, 3545, 'Punching Bags', 'Sporting Goods > Combat Sports > Boxing', 0, 1),
(3552, 3552, 3544, 'Fencing', 'Sporting Goods > Combat Sports', 2, 1),
(3553, 3553, 3552, 'Fencing Protective Gear', 'Sporting Goods > Combat Sports > Fencing', 2, 1),
(3554, 3554, 3553, 'Fencing Gloves', 'Sporting Goods > Combat Sports > Fencing > Fencing Protective Gear', 0, 1),
(3555, 3555, 3553, 'Fencing Masks', 'Sporting Goods > Combat Sports > Fencing > Fencing Protective Gear', 0, 1),
(3556, 3556, 3552, 'Fencing Weapons', 'Sporting Goods > Combat Sports > Fencing', 0, 1),
(3557, 3557, 3544, 'Martial Arts', 'Sporting Goods > Combat Sports', 2, 1),
(3558, 3558, 3557, 'Martial Arts Belts', 'Sporting Goods > Combat Sports > Martial Arts', 0, 1),
(3559, 3559, 3557, 'Martial Arts Weapons', 'Sporting Goods > Combat Sports > Martial Arts', 0, 1),
(3560, 3560, 3544, 'Wrestling', 'Sporting Goods > Combat Sports', 2, 1),
(3561, 3561, 3560, 'Wrestling Mats', 'Sporting Goods > Combat Sports > Wrestling', 0, 1),
(3562, 3562, 3560, 'Wrestling Protective Gear', 'Sporting Goods > Combat Sports > Wrestling', 0, 1),
(3563, 3563, 3539, 'Dancing', 'Sporting Goods', 1, 1),
(3564, 3564, 3563, 'Ballet Bars', 'Sporting Goods > Dancing', 0, 1),
(3565, 3565, 3539, 'Exercise & Fitness', 'Sporting Goods', 16, 1),
(3566, 3566, 3565, 'Abdominal Equipment', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3567, 3567, 3565, 'Cardio Machine Accessories', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3568, 3568, 3565, 'Cardio Machines', 'Sporting Goods > Exercise & Fitness', 5, 1),
(3569, 3569, 3568, 'Elliptical Trainers', 'Sporting Goods > Exercise & Fitness > Cardio Machines', 0, 1),
(3570, 3570, 3568, 'Exercise Bikes', 'Sporting Goods > Exercise & Fitness > Cardio Machines', 0, 1),
(3571, 3571, 3568, 'Rowing Machines', 'Sporting Goods > Exercise & Fitness > Cardio Machines', 0, 1),
(3572, 3572, 3568, 'Stair Climbers', 'Sporting Goods > Exercise & Fitness > Cardio Machines', 0, 1),
(3573, 3573, 3568, 'Treadmills', 'Sporting Goods > Exercise & Fitness > Cardio Machines', 0, 1),
(3574, 3574, 3565, 'Exercise Balls', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3575, 3575, 3565, 'Foam Rollers', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3576, 3576, 3565, 'Free Weight Bars', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3577, 3577, 3565, 'Free Weights', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3578, 3578, 3565, 'Gym Mats', 'Sporting Goods > Exercise & Fitness', 1, 1),
(3579, 3579, 3578, 'Exercise Equipment Mats', 'Sporting Goods > Exercise & Fitness > Gym Mats', 0, 1),
(3580, 3580, 3565, 'Jump Ropes', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3581, 3581, 3565, 'Medicine Balls', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3582, 3582, 3565, 'Weight Benches', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3583, 3583, 3565, 'Weightlifting Belts', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3584, 3584, 3565, 'Weightlifting Gloves', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3585, 3585, 3565, 'Weightlifting Machine Accessories', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3586, 3586, 3565, 'Weightlifting Machines', 'Sporting Goods > Exercise & Fitness', 0, 1),
(3587, 3587, 3565, 'Yoga & Pilates', 'Sporting Goods > Exercise & Fitness', 3, 1),
(3588, 3588, 3587, 'Pilates Machines', 'Sporting Goods > Exercise & Fitness > Yoga & Pilates', 0, 1),
(3589, 3589, 3587, 'Yoga & Pilates Mats', 'Sporting Goods > Exercise & Fitness > Yoga & Pilates', 0, 1),
(3590, 3590, 3587, 'Yoga Mat Bags', 'Sporting Goods > Exercise & Fitness > Yoga & Pilates', 0, 1),
(3591, 3591, 3539, 'Gymnastics', 'Sporting Goods', 8, 1),
(3592, 3592, 3591, 'Balance Beams', 'Sporting Goods > Gymnastics', 0, 1),
(3593, 3593, 3591, 'Gymnastics Bars', 'Sporting Goods > Gymnastics', 0, 1),
(3594, 3594, 3591, 'Gymnastics Mats', 'Sporting Goods > Gymnastics', 0, 1),
(3595, 3595, 3591, 'Gymnastics Protective Equipment', 'Sporting Goods > Gymnastics', 0, 1),
(3596, 3596, 3591, 'Gymnastics Rings', 'Sporting Goods > Gymnastics', 0, 1),
(3597, 3597, 3591, 'Pommel Horses', 'Sporting Goods > Gymnastics', 0, 1),
(3598, 3598, 3591, 'Springboards', 'Sporting Goods > Gymnastics', 0, 1),
(3599, 3599, 3591, 'Vaulting Horses', 'Sporting Goods > Gymnastics', 0, 1),
(3600, 3600, 3539, 'Indoor Games', 'Sporting Goods', 7, 1),
(3601, 3601, 3600, 'Air Hockey', 'Sporting Goods > Indoor Games', 4, 1),
(3602, 3602, 3601, 'Air Hockey Pucks', 'Sporting Goods > Indoor Games > Air Hockey', 0, 1),
(3603, 3603, 3601, 'Air Hockey Strikers', 'Sporting Goods > Indoor Games > Air Hockey', 0, 1),
(3604, 3604, 3601, 'Air Hockey Table Parts', 'Sporting Goods > Indoor Games > Air Hockey', 0, 1),
(3605, 3605, 3601, 'Air Hockey Tables', 'Sporting Goods > Indoor Games > Air Hockey', 0, 1),
(3606, 3606, 3600, 'Billiards', 'Sporting Goods > Indoor Games', 8, 1),
(3607, 3607, 3606, 'Billiard Ball Racks', 'Sporting Goods > Indoor Games > Billiards', 0, 1),
(3608, 3608, 3606, 'Billiard Balls', 'Sporting Goods > Indoor Games > Billiards', 0, 1),
(3609, 3609, 3606, 'Billiard Cue Accessories', 'Sporting Goods > Indoor Games > Billiards', 1, 1),
(3610, 3610, 3609, 'Billiard Cue Racks', 'Sporting Goods > Indoor Games > Billiards > Billiard Cue Accessories', 0, 1),
(3611, 3611, 3606, 'Billiard Cues & Bridges', 'Sporting Goods > Indoor Games > Billiards', 0, 1),
(3612, 3612, 3606, 'Billiard Gloves', 'Sporting Goods > Indoor Games > Billiards', 0, 1),
(3613, 3613, 3606, 'Billiard Table Lights', 'Sporting Goods > Indoor Games > Billiards', 0, 1),
(3614, 3614, 3606, 'Billiard Table Parts & Accessories', 'Sporting Goods > Indoor Games > Billiards', 3, 1),
(3615, 3615, 3614, 'Billiard Cloth', 'Sporting Goods > Indoor Games > Billiards > Billiard Table Parts & Accessories', 0, 1),
(3616, 3616, 3614, 'Billiard Pockets', 'Sporting Goods > Indoor Games > Billiards > Billiard Table Parts & Accessories', 0, 1),
(3617, 3617, 3614, 'Billiard Table Brushes', 'Sporting Goods > Indoor Games > Billiards > Billiard Table Parts & Accessories', 0, 1),
(3618, 3618, 3606, 'Billiard Tables', 'Sporting Goods > Indoor Games > Billiards', 0, 1),
(3619, 3619, 3600, 'Bowling', 'Sporting Goods > Indoor Games', 5, 1),
(3620, 3620, 3619, 'Bowling Ball Bags', 'Sporting Goods > Indoor Games > Bowling', 0, 1),
(3621, 3621, 3619, 'Bowling Balls', 'Sporting Goods > Indoor Games > Bowling', 0, 1),
(3622, 3622, 3619, 'Bowling Gloves', 'Sporting Goods > Indoor Games > Bowling', 0, 1),
(3623, 3623, 3619, 'Bowling Pins', 'Sporting Goods > Indoor Games > Bowling', 0, 1),
(3624, 3624, 3619, 'Bowling Wrist Supports', 'Sporting Goods > Indoor Games > Bowling', 0, 1),
(3625, 3625, 3600, 'Darts', 'Sporting Goods > Indoor Games', 4, 1),
(3626, 3626, 3625, 'Dart Backboards', 'Sporting Goods > Indoor Games > Darts', 0, 1),
(3627, 3627, 3625, 'Dart Parts', 'Sporting Goods > Indoor Games > Darts', 3, 1),
(3628, 3628, 3627, 'Dart Flights', 'Sporting Goods > Indoor Games > Darts > Dart Parts', 0, 1),
(3629, 3629, 3627, 'Dart Shafts', 'Sporting Goods > Indoor Games > Darts > Dart Parts', 0, 1),
(3630, 3630, 3627, 'Dart Tips', 'Sporting Goods > Indoor Games > Darts > Dart Parts', 0, 1),
(3631, 3631, 3625, 'Dartboards', 'Sporting Goods > Indoor Games > Darts', 0, 1),
(3632, 3632, 3625, 'Single Darts & Sets', 'Sporting Goods > Indoor Games > Darts', 0, 1),
(3633, 3633, 3600, 'Foosball', 'Sporting Goods > Indoor Games', 3, 1),
(3634, 3634, 3633, 'Foosball Balls', 'Sporting Goods > Indoor Games > Foosball', 0, 1),
(3635, 3635, 3633, 'Foosball Table Parts', 'Sporting Goods > Indoor Games > Foosball', 0, 1),
(3636, 3636, 3633, 'Foosball Tables', 'Sporting Goods > Indoor Games > Foosball', 0, 1),
(3637, 3637, 3600, 'Ping Pong', 'Sporting Goods > Indoor Games', 7, 1),
(3638, 3638, 3637, 'Ping Pong Balls', 'Sporting Goods > Indoor Games > Ping Pong', 0, 1),
(3639, 3639, 3637, 'Ping Pong Nets & Posts', 'Sporting Goods > Indoor Games > Ping Pong', 0, 1),
(3640, 3640, 3637, 'Ping Pong Paddle Accessories', 'Sporting Goods > Indoor Games > Ping Pong', 0, 1),
(3641, 3641, 3637, 'Ping Pong Paddles', 'Sporting Goods > Indoor Games > Ping Pong', 0, 1),
(3642, 3642, 3637, 'Ping Pong Robot Accessories', 'Sporting Goods > Indoor Games > Ping Pong', 0, 1),
(3643, 3643, 3637, 'Ping Pong Robots', 'Sporting Goods > Indoor Games > Ping Pong', 0, 1),
(3644, 3644, 3637, 'Ping Pong Tables', 'Sporting Goods > Indoor Games > Ping Pong', 0, 1),
(3645, 3645, 3600, 'Table Shuffleboard', 'Sporting Goods > Indoor Games', 3, 1),
(3646, 3646, 3645, 'Shuffleboard Tables', 'Sporting Goods > Indoor Games > Table Shuffleboard', 0, 1),
(3647, 3647, 3645, 'Table Shuffleboard Powder', 'Sporting Goods > Indoor Games > Table Shuffleboard', 0, 1),
(3648, 3648, 3645, 'Table Shuffleboard Pucks', 'Sporting Goods > Indoor Games > Table Shuffleboard', 0, 1),
(3649, 3649, 3539, 'Jumping', 'Sporting Goods', 4, 1),
(3650, 3650, 3649, 'Bungee Jumping', 'Sporting Goods > Jumping', 0, 1),
(3651, 3651, 3649, 'Jumping Stilts', 'Sporting Goods > Jumping', 0, 1),
(3652, 3652, 3649, 'Pogo Sticks', 'Sporting Goods > Jumping', 0, 1),
(3653, 3653, 3649, 'Trampolines', 'Sporting Goods > Jumping', 0, 1),
(3654, 3654, 3539, 'Outdoor Recreation', 'Sporting Goods', 20, 1),
(3655, 3655, 3654, 'Archery', 'Sporting Goods > Outdoor Recreation', 9, 1),
(3656, 3656, 3655, 'Archery Armguards', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3657, 3657, 3655, 'Archery Targets', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3658, 3658, 3655, 'Arrow Parts & Accessories', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3659, 3659, 3655, 'Arrows', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3660, 3660, 3655, 'Bow Cases', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3661, 3661, 3655, 'Compound Bows', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3662, 3662, 3655, 'Crossbows', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3663, 3663, 3655, 'Long Bows', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3664, 3664, 3655, 'Quivers', 'Sporting Goods > Outdoor Recreation > Archery', 0, 1),
(3665, 3665, 3654, 'Camping, Backpacking & Hiking', 'Sporting Goods > Outdoor Recreation', 16, 1),
(3666, 3666, 3665, 'Camp Furniture', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 5, 1),
(3667, 3667, 3666, 'Air Mattress Accessories', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camp Furniture', 0, 1),
(3668, 3668, 3666, 'Air Mattresses', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camp Furniture', 0, 1),
(3669, 3669, 3666, 'Camping Tables', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camp Furniture', 0, 1),
(3670, 3670, 3666, 'Cots', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camp Furniture', 0, 1),
(3671, 3671, 3666, 'Folding Chairs & Stools', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camp Furniture', 0, 1),
(3672, 3672, 3665, 'Camping Cookware & Dinnerware', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3673, 3673, 3665, 'Camping Lights & Lanterns', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3674, 3674, 3665, 'Camping Stoves', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3675, 3675, 3665, 'Camping Tools', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 2, 1),
(3676, 3676, 3675, 'Knives & Blades', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camping Tools', 1, 1),
(3677, 3677, 3676, 'Combat & Tactical Knives', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camping Tools > Knives & Blades', 0, 1),
(3678, 3678, 3675, 'Multifunction Tools & Knives', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking > Camping Tools', 0, 1),
(3679, 3679, 3665, 'Chemical Hand Warmers', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3680, 3680, 3665, 'Crampons', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3681, 3681, 3665, 'Freeze-Dried Food', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3682, 3682, 3665, 'Hiking Poles', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3683, 3683, 3665, 'Mosquito Nets', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3684, 3684, 3665, 'Navigational Compasses', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3685, 3685, 3665, 'Portable Toilets', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3686, 3686, 3665, 'Portable Water Filters & Purifiers', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3687, 3687, 3665, 'Sleeping Bags', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3688, 3688, 3665, 'Sleeping Pads', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3689, 3689, 3665, 'Tents', 'Sporting Goods > Outdoor Recreation > Camping, Backpacking & Hiking', 0, 1),
(3690, 3690, 3654, 'Cycling', 'Sporting Goods > Outdoor Recreation', 8, 1),
(3691, 3691, 3690, 'Bicycle Accessories', 'Sporting Goods > Outdoor Recreation > Cycling', 19, 1),
(3692, 3692, 3691, 'Bicycle Bags & Panniers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3693, 3693, 3691, 'Bicycle Baskets', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3694, 3694, 3691, 'Bicycle Bells & Horns', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3695, 3695, 3691, 'Bicycle Cages', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3696, 3696, 3691, 'Bicycle Computers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3697, 3697, 3691, 'Bicycle Fenders', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3698, 3698, 3691, 'Bicycle Front & Rear Racks', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3699, 3699, 3691, 'Bicycle Helmets', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3700, 3700, 3691, 'Bicycle Lights & Reflectors', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3701, 3701, 3691, 'Bicycle Locks', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3702, 3702, 3691, 'Bicycle Mirrors', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3703, 3703, 3691, 'Bicycle Pumps', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3704, 3704, 3691, 'Bicycle Stands & Storage', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3705, 3705, 3691, 'Bicycle Tools, Cleaners & Lubricants', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 1, 1),
(3706, 3706, 3705, 'Bicycle Lubrication', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories > Bicycle Tools, Cleaners & Lubricants', 0, 1),
(3707, 3707, 3691, 'Bicycle Trailers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3708, 3708, 3691, 'Bicycle Trainers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3709, 3709, 3691, 'Bicycle Training Wheels', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3710, 3710, 3691, 'Bicycle Transport Bags & Cases', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3711, 3711, 3691, 'Bicycle Water Bottles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Accessories', 0, 1),
(3712, 3712, 3690, 'Bicycle Clothing', 'Sporting Goods > Outdoor Recreation > Cycling', 2, 1),
(3713, 3713, 3712, 'Bicycle Gloves', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Clothing', 0, 1),
(3714, 3714, 3712, 'Bicycle Shoe Covers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Clothing', 0, 1),
(3715, 3715, 3690, 'Bicycle Parts', 'Sporting Goods > Outdoor Recreation > Cycling', 15, 1),
(3716, 3716, 3715, 'Bicycle Brake Parts', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 4, 1),
(3717, 3717, 3716, 'Bicycle Brake Calipers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Brake Parts', 0, 1),
(3718, 3718, 3716, 'Bicycle Brake Levers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Brake Parts', 0, 1),
(3719, 3719, 3716, 'Bicycle Brake Rotors', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Brake Parts', 0, 1),
(3720, 3720, 3716, 'Bicycle Brake Sets', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Brake Parts', 0, 1),
(3721, 3721, 3715, 'Bicycle Drivetrain Parts', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 8, 1),
(3722, 3722, 3721, 'Bicycle Bottom Brackets', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3723, 3723, 3721, 'Bicycle Cassettes', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3724, 3724, 3721, 'Bicycle Chainrings', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3725, 3725, 3721, 'Bicycle Chains', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3726, 3726, 3721, 'Bicycle Cranks', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3727, 3727, 3721, 'Bicycle Derailleurs', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3728, 3728, 3721, 'Bicycle Pedals', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3729, 3729, 3721, 'Bicycle Shifters', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Drivetrain Parts', 0, 1),
(3730, 3730, 3715, 'Bicycle Forks', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3731, 3731, 3715, 'Bicycle Frames', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3732, 3732, 3715, 'Bicycle Grips and Handlebar Tape', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3733, 3733, 3715, 'Bicycle Handlebars', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3734, 3734, 3715, 'Bicycle Saddles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3735, 3735, 3715, 'Bicycle Seatpost Clamps', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3736, 3736, 3715, 'Bicycle Seatposts', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3737, 3737, 3715, 'Bicycle Small Parts', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 1, 1),
(3738, 3738, 3737, 'Bicycle Shims', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Small Parts', 0, 1),
(3739, 3739, 3715, 'Bicycle Stems', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3740, 3740, 3715, 'Bicycle Tires', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3741, 3741, 3715, 'Bicycle Tubes', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3742, 3742, 3715, 'Bicycle Wheel Parts', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 4, 1),
(3743, 3743, 3742, 'Bicycle Hubs', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Wheel Parts', 0, 1),
(3744, 3744, 3742, 'Bicycle Spokes', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Wheel Parts', 0, 1),
(3745, 3745, 3742, 'Bicycle Wheel Nipples', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Wheel Parts', 0, 1),
(3746, 3746, 3742, 'Bicycle Wheel Rims', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts > Bicycle Wheel Parts', 0, 1),
(3747, 3747, 3715, 'Bicycle Wheels', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycle Parts', 0, 1),
(3748, 3748, 3690, 'Bicycles', 'Sporting Goods > Outdoor Recreation > Cycling', 7, 1),
(3749, 3749, 3748, 'Cruisers', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycles', 0, 1),
(3750, 3750, 3748, 'Electric Bicycles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycles', 0, 1),
(3751, 3751, 3748, 'Hybrid Bicycles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycles', 0, 1),
(3752, 3752, 3748, 'Mountain Bicycles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycles', 0, 1),
(3753, 3753, 3748, 'Recumbent Bicycles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycles', 0, 1),
(3754, 3754, 3748, 'Road Bicycles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycles', 0, 1),
(3755, 3755, 3748, 'Triathlon Bicycles', 'Sporting Goods > Outdoor Recreation > Cycling > Bicycles', 0, 1),
(3756, 3756, 3690, 'Tricycle Accessories', 'Sporting Goods > Outdoor Recreation > Cycling', 0, 1),
(3757, 3757, 3690, 'Tricycles', 'Sporting Goods > Outdoor Recreation > Cycling', 0, 1),
(3758, 3758, 3690, 'Unicycle Accessories', 'Sporting Goods > Outdoor Recreation > Cycling', 0, 1),
(3759, 3759, 3690, 'Unicycles', 'Sporting Goods > Outdoor Recreation > Cycling', 0, 1),
(3760, 3760, 3654, 'Deck Shuffleboard', 'Sporting Goods > Outdoor Recreation', 2, 1),
(3761, 3761, 3760, 'Deck Shuffleboard Cues', 'Sporting Goods > Outdoor Recreation > Deck Shuffleboard', 0, 1),
(3762, 3762, 3760, 'Deck Shuffleboard Pucks', 'Sporting Goods > Outdoor Recreation > Deck Shuffleboard', 0, 1),
(3763, 3763, 3654, 'Disc Golf', 'Sporting Goods > Outdoor Recreation', 3, 1),
(3764, 3764, 3763, 'Disc Golf Bags', 'Sporting Goods > Outdoor Recreation > Disc Golf', 0, 1),
(3765, 3765, 3763, 'Disc Golf Baskets', 'Sporting Goods > Outdoor Recreation > Disc Golf', 0, 1),
(3766, 3766, 3763, 'Disc Golf Discs', 'Sporting Goods > Outdoor Recreation > Disc Golf', 0, 1),
(3767, 3767, 3654, 'Equestrian', 'Sporting Goods > Outdoor Recreation', 12, 1),
(3768, 3768, 3767, 'Bell Boots', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3769, 3769, 3767, 'Bridles', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3770, 3770, 3767, 'Cinches', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3771, 3771, 3767, 'Equestrian Gloves', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3772, 3772, 3767, 'Equestrian Helmets', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3773, 3773, 3767, 'Horse Bits', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3774, 3774, 3767, 'Horse Harnesses', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3775, 3775, 3767, 'Horse Supplies', 'Sporting Goods > Outdoor Recreation > Equestrian', 1, 1),
(3776, 3776, 3775, 'Horse Grooming', 'Sporting Goods > Outdoor Recreation > Equestrian > Horse Supplies', 0, 1),
(3777, 3777, 3767, 'Reins', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3778, 3778, 3767, 'Riding Crops', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3779, 3779, 3767, 'Saddles', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3780, 3780, 3767, 'Splint Boots', 'Sporting Goods > Outdoor Recreation > Equestrian', 0, 1),
(3781, 3781, 3654, 'Fishing', 'Sporting Goods > Outdoor Recreation', 11, 1),
(3782, 3782, 3781, 'Fishing Floats', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3783, 3783, 3781, 'Fishing Hooks', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3784, 3784, 3781, 'Fishing Lines & Leaders', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3785, 3785, 3781, 'Fishing Lures', 'Sporting Goods > Outdoor Recreation > Fishing', 1, 1),
(3786, 3786, 3785, 'Flies', 'Sporting Goods > Outdoor Recreation > Fishing > Fishing Lures', 0, 1),
(3787, 3787, 3781, 'Fishing Nets', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3788, 3788, 3781, 'Fishing Reels', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3789, 3789, 3781, 'Fishing Rods', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3790, 3790, 3781, 'Fishing Sinkers', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3791, 3791, 3781, 'Live Bait', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3792, 3792, 3781, 'Tackle Boxes', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(3793, 3793, 3654, 'Golf', 'Sporting Goods > Outdoor Recreation', 10, 1),
(3794, 3794, 3793, 'Golf Bag Accessories', 'Sporting Goods > Outdoor Recreation > Golf', 2, 1),
(3795, 3795, 3794, 'Golf Bag Carts', 'Sporting Goods > Outdoor Recreation > Golf > Golf Bag Accessories', 0, 1),
(3796, 3796, 3794, 'Golf Bag Covers & Cases', 'Sporting Goods > Outdoor Recreation > Golf > Golf Bag Accessories', 0, 1),
(3797, 3797, 3793, 'Golf Bags', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3798, 3798, 3793, 'Golf Balls', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3799, 3799, 3793, 'Golf Club Parts & Accessories', 'Sporting Goods > Outdoor Recreation > Golf', 2, 1),
(3800, 3800, 3799, 'Golf Club Grips', 'Sporting Goods > Outdoor Recreation > Golf > Golf Club Parts & Accessories', 0, 1),
(3801, 3801, 3799, 'Golf Club Head Covers', 'Sporting Goods > Outdoor Recreation > Golf > Golf Club Parts & Accessories', 0, 1),
(3802, 3802, 3793, 'Golf Clubs', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3803, 3803, 3793, 'Golf Flags', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3804, 3804, 3793, 'Golf Gloves', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3805, 3805, 3793, 'Golf Tees', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3806, 3806, 3793, 'Golf Towels', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3807, 3807, 3793, 'Golf Training Aids', 'Sporting Goods > Outdoor Recreation > Golf', 0, 1),
(3808, 3808, 3654, 'Hunting', 'Sporting Goods > Outdoor Recreation', 7, 1),
(3809, 3809, 3808, 'Animal Traps', 'Sporting Goods > Outdoor Recreation > Hunting', 0, 1),
(3810, 3810, 3808, 'Hunting Blinds & Screens', 'Sporting Goods > Outdoor Recreation > Hunting', 0, 1),
(3811, 3811, 3808, 'Hunting Calls', 'Sporting Goods > Outdoor Recreation > Hunting', 0, 1),
(3812, 3812, 3808, 'Hunting Decoys', 'Sporting Goods > Outdoor Recreation > Hunting', 0, 1),
(3813, 3813, 3808, 'Hunting Knives', 'Sporting Goods > Outdoor Recreation > Hunting', 0, 1),
(3814, 3814, 3808, 'Hunting Shelters', 'Sporting Goods > Outdoor Recreation > Hunting', 0, 1),
(3815, 3815, 3808, 'Tree Stands', 'Sporting Goods > Outdoor Recreation > Hunting', 0, 1),
(3816, 3816, 3654, 'Ice Climbing', 'Sporting Goods > Outdoor Recreation', 0, 1),
(3817, 3817, 3654, 'Kick Scooters', 'Sporting Goods > Outdoor Recreation', 0, 1),
(3818, 3818, 3654, 'Lawn Games', 'Sporting Goods > Outdoor Recreation', 9, 1),
(3819, 3819, 3818, 'Bean Bag Toss', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3820, 3820, 3818, 'Bocce', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3821, 3821, 3818, 'Croquet', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3822, 3822, 3818, 'Horseshoe Toss', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3823, 3823, 3818, 'Ladder Golf', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3824, 3824, 3818, 'Lawn Bowling', 'Sporting Goods > Outdoor Recreation > Lawn Games', 2, 1),
(3825, 3825, 3824, 'Lawn Bowling Bowls', 'Sporting Goods > Outdoor Recreation > Lawn Games > Lawn Bowling', 0, 1),
(3826, 3826, 3824, 'Lawn Bowling Jacks', 'Sporting Goods > Outdoor Recreation > Lawn Games > Lawn Bowling', 0, 1),
(3827, 3827, 3818, 'Lawn Darts', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3828, 3828, 3818, 'Ring Toss', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3829, 3829, 3818, 'Washer Pitching', 'Sporting Goods > Outdoor Recreation > Lawn Games', 0, 1),
(3830, 3830, 3654, 'Motorsports', 'Sporting Goods > Outdoor Recreation', 1, 1),
(3831, 3831, 3830, 'Auto Racing', 'Sporting Goods > Outdoor Recreation > Motorsports', 0, 1),
(3832, 3832, 3654, 'Rock Climbing', 'Sporting Goods > Outdoor Recreation', 14, 1),
(3833, 3833, 3832, 'Ascenders & Descenders', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3834, 3834, 3832, 'Belay Devices', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3835, 3835, 3832, 'Carabiners', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3836, 3836, 3832, 'Climbing Chalk', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3837, 3837, 3832, 'Climbing Chalk Bags', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3838, 3838, 3832, 'Climbing Harnesses', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3839, 3839, 3832, 'Climbing Helmets', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3840, 3840, 3832, 'Climbing Protection Devices', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3841, 3841, 3832, 'Climbing Rope', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3842, 3842, 3832, 'Climbing Rope Bags', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3843, 3843, 3832, 'Climbing Webbing', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3844, 3844, 3832, 'Crash Pads', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3845, 3845, 3832, 'Indoor Climbing Holds', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3846, 3846, 3832, 'Quickdraws', 'Sporting Goods > Outdoor Recreation > Rock Climbing', 0, 1),
(3847, 3847, 3654, 'Running', 'Sporting Goods > Outdoor Recreation', 0, 1),
(3848, 3848, 3654, 'Shooting Games', 'Sporting Goods > Outdoor Recreation', 4, 1),
(3849, 3849, 3848, 'Airsoft', 'Sporting Goods > Outdoor Recreation > Shooting Games', 4, 1),
(3850, 3850, 3849, 'Airsoft Gun Parts', 'Sporting Goods > Outdoor Recreation > Shooting Games > Airsoft', 0, 1),
(3851, 3851, 3849, 'Airsoft Guns', 'Sporting Goods > Outdoor Recreation > Shooting Games > Airsoft', 0, 1),
(3852, 3852, 3849, 'Airsoft Pellets', 'Sporting Goods > Outdoor Recreation > Shooting Games > Airsoft', 0, 1),
(3853, 3853, 3849, 'Airsoft Protective Equipment', 'Sporting Goods > Outdoor Recreation > Shooting Games > Airsoft', 0, 1),
(3854, 3854, 3848, 'Clay Pigeon Shooting', 'Sporting Goods > Outdoor Recreation > Shooting Games', 2, 1),
(3855, 3855, 3854, 'Clay Pigeon Throwers', 'Sporting Goods > Outdoor Recreation > Shooting Games > Clay Pigeon Shooting', 0, 1),
(3856, 3856, 3854, 'Clay Pigeons', 'Sporting Goods > Outdoor Recreation > Shooting Games > Clay Pigeon Shooting', 0, 1),
(3857, 3857, 3848, 'Paintball', 'Sporting Goods > Outdoor Recreation > Shooting Games', 6, 1),
(3858, 3858, 3857, 'Paintball CO2 Tanks', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball', 0, 1),
(3859, 3859, 3857, 'Paintball Grenades', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball', 0, 1),
(3860, 3860, 3857, 'Paintball Gun Parts', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball', 2, 1),
(3861, 3861, 3860, 'Paintball Gun Barrels', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball > Paintball Gun Parts', 0, 1),
(3862, 3862, 3860, 'Paintball Hoppers', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball > Paintball Gun Parts', 0, 1),
(3863, 3863, 3857, 'Paintball Guns', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball', 0, 1),
(3864, 3864, 3857, 'Paintball Protective Equipment', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball', 4, 1),
(3865, 3865, 3864, 'Paintball Goggles & Masks', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball > Paintball Protective Equipment', 0, 1),
(3866, 3866, 3864, 'Paintball Pads', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball > Paintball Protective Equipment', 0, 1),
(3867, 3867, 3864, 'Paintball Pants', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball > Paintball Protective Equipment', 0, 1),
(3868, 3868, 3864, 'Paintball Vests', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball > Paintball Protective Equipment', 0, 1),
(3869, 3869, 3857, 'Paintballs', 'Sporting Goods > Outdoor Recreation > Shooting Games > Paintball', 0, 1),
(3870, 3870, 3848, 'Shooting Targets', 'Sporting Goods > Outdoor Recreation > Shooting Games', 0, 1),
(3871, 3871, 3654, 'Skateboarding', 'Sporting Goods > Outdoor Recreation', 5, 1),
(3872, 3872, 3871, 'Skate Rails', 'Sporting Goods > Outdoor Recreation > Skateboarding', 0, 1),
(3873, 3873, 3871, 'Skate Ramps', 'Sporting Goods > Outdoor Recreation > Skateboarding', 0, 1),
(3874, 3874, 3871, 'Skateboard Parts', 'Sporting Goods > Outdoor Recreation > Skateboarding', 4, 1),
(3875, 3875, 3874, 'Skateboard Bearings', 'Sporting Goods > Outdoor Recreation > Skateboarding > Skateboard Parts', 0, 1),
(3876, 3876, 3874, 'Skateboard Decks', 'Sporting Goods > Outdoor Recreation > Skateboarding > Skateboard Parts', 0, 1),
(3877, 3877, 3874, 'Skateboard Trucks', 'Sporting Goods > Outdoor Recreation > Skateboarding > Skateboard Parts', 0, 1),
(3878, 3878, 3874, 'Skateboard Wheels', 'Sporting Goods > Outdoor Recreation > Skateboarding > Skateboard Parts', 0, 1),
(3879, 3879, 3871, 'Skateboard Protective Equipment', 'Sporting Goods > Outdoor Recreation > Skateboarding', 2, 1),
(3880, 3880, 3879, 'Skateboard Helmets', 'Sporting Goods > Outdoor Recreation > Skateboarding > Skateboard Protective Equipment', 0, 1),
(3881, 3881, 3879, 'Skateboard Pads', 'Sporting Goods > Outdoor Recreation > Skateboarding > Skateboard Protective Equipment', 0, 1),
(3882, 3882, 3871, 'Skateboards', 'Sporting Goods > Outdoor Recreation > Skateboarding', 0, 1),
(3883, 3883, 3654, 'Skating', 'Sporting Goods > Outdoor Recreation', 4, 1),
(3884, 3884, 3883, 'Ice Skate Accessories', 'Sporting Goods > Outdoor Recreation > Skating', 3, 1),
(3885, 3885, 3884, 'Ice Skate Sharpeners', 'Sporting Goods > Outdoor Recreation > Skating > Ice Skate Accessories', 0, 1),
(3886, 3886, 3884, 'Lace Tighteners', 'Sporting Goods > Outdoor Recreation > Skating > Ice Skate Accessories', 0, 1),
(3887, 3887, 3884, 'Skate Blade Guards', 'Sporting Goods > Outdoor Recreation > Skating > Ice Skate Accessories', 0, 1),
(3888, 3888, 3883, 'Ice Skates', 'Sporting Goods > Outdoor Recreation > Skating', 1, 1),
(3889, 3889, 3888, 'Figure Skates', 'Sporting Goods > Outdoor Recreation > Skating > Ice Skates', 0, 1),
(3890, 3890, 3883, 'Roller Skates', 'Sporting Goods > Outdoor Recreation > Skating', 2, 1),
(3891, 3891, 3890, 'Inline Skates', 'Sporting Goods > Outdoor Recreation > Skating > Roller Skates', 0, 1),
(3892, 3892, 3890, 'Quad Skates', 'Sporting Goods > Outdoor Recreation > Skating > Roller Skates', 0, 1),
(3893, 3893, 3883, 'Skating Helmets & Pads', 'Sporting Goods > Outdoor Recreation > Skating', 0, 1),
(3894, 3894, 3654, 'Tetherball', 'Sporting Goods > Outdoor Recreation', 0, 1),
(3895, 3895, 3654, 'Track & Field', 'Sporting Goods > Outdoor Recreation', 12, 1),
(3896, 3896, 3895, 'Discuses', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3897, 3897, 3895, 'High Jump Bars', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3898, 3898, 3895, 'High Jump Pits', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3899, 3899, 3895, 'Hurdles', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3900, 3900, 3895, 'Javelins', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3901, 3901, 3895, 'Pole Vault Pits', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3902, 3902, 3895, 'Relay Batons', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3903, 3903, 3895, 'Shot Puts', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3904, 3904, 3895, 'Starter Pistols', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3905, 3905, 3895, 'Throwing Hammers', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3906, 3906, 3895, 'Track Spikes', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3907, 3907, 3895, 'Vaulting Poles', 'Sporting Goods > Outdoor Recreation > Track & Field', 0, 1),
(3908, 3908, 3539, 'Paddle Tennis', 'Sporting Goods', 0, 1),
(3909, 3909, 3539, 'Pickleball', 'Sporting Goods', 0, 1),
(3910, 3910, 3539, 'Racquet Sports', 'Sporting Goods', 4, 1),
(3911, 3911, 3910, 'Badminton', 'Sporting Goods > Racquet Sports', 3, 1),
(3912, 3912, 3911, 'Badminton Nets', 'Sporting Goods > Racquet Sports > Badminton', 0, 1),
(3913, 3913, 3911, 'Badminton Rackets', 'Sporting Goods > Racquet Sports > Badminton', 0, 1),
(3914, 3914, 3911, 'Shuttlecocks', 'Sporting Goods > Racquet Sports > Badminton', 0, 1),
(3915, 3915, 3910, 'Racquetball', 'Sporting Goods > Racquet Sports', 3, 1),
(3916, 3916, 3915, 'Racquetball Protective Equipment', 'Sporting Goods > Racquet Sports > Racquetball', 1, 1),
(3917, 3917, 3916, 'Squash & Racquetball Goggles', 'Sporting Goods > Racquet Sports > Racquetball > Racquetball Protective Equipment', 0, 1),
(3918, 3918, 3915, 'Racquetball Rackets', 'Sporting Goods > Racquet Sports > Racquetball', 0, 1),
(3919, 3919, 3915, 'Racquetballs', 'Sporting Goods > Racquet Sports > Racquetball', 0, 1),
(3920, 3920, 3910, 'Squash', 'Sporting Goods > Racquet Sports', 3, 1),
(3921, 3921, 3920, 'Squash Balls', 'Sporting Goods > Racquet Sports > Squash', 0, 1),
(3922, 3922, 3920, 'Squash Protective Equipment', 'Sporting Goods > Racquet Sports > Squash', 0, 1),
(3923, 3923, 3920, 'Squash Rackets', 'Sporting Goods > Racquet Sports > Squash', 0, 1),
(3924, 3924, 3910, 'Tennis', 'Sporting Goods > Racquet Sports', 7, 1),
(3925, 3925, 3924, 'Tennis Ball Hoppers', 'Sporting Goods > Racquet Sports > Tennis', 0, 1),
(3926, 3926, 3924, 'Tennis Ball Launchers', 'Sporting Goods > Racquet Sports > Tennis', 0, 1),
(3927, 3927, 3924, 'Tennis Ball Savers', 'Sporting Goods > Racquet Sports > Tennis', 0, 1),
(3928, 3928, 3924, 'Tennis Balls', 'Sporting Goods > Racquet Sports > Tennis', 0, 1),
(3929, 3929, 3924, 'Tennis Nets', 'Sporting Goods > Racquet Sports > Tennis', 0, 1),
(3930, 3930, 3924, 'Tennis Racket Accessories', 'Sporting Goods > Racquet Sports > Tennis', 5, 1),
(3931, 3931, 3930, 'Racket Grip Tape', 'Sporting Goods > Racquet Sports > Tennis > Tennis Racket Accessories', 0, 1),
(3932, 3932, 3930, 'Racket Vibration Dampeners', 'Sporting Goods > Racquet Sports > Tennis > Tennis Racket Accessories', 0, 1),
(3933, 3933, 3930, 'Tennis Racket Bags', 'Sporting Goods > Racquet Sports > Tennis > Tennis Racket Accessories', 0, 1),
(3934, 3934, 3930, 'Tennis Racket Grommets', 'Sporting Goods > Racquet Sports > Tennis > Tennis Racket Accessories', 0, 1),
(3935, 3935, 3930, 'Tennis Racket String', 'Sporting Goods > Racquet Sports > Tennis > Tennis Racket Accessories', 0, 1),
(3936, 3936, 3924, 'Tennis Rackets', 'Sporting Goods > Racquet Sports > Tennis', 0, 1),
(3937, 3937, 3539, 'Team Sports', 'Sporting Goods', 15, 1),
(3938, 3938, 3937, 'Baseball', 'Sporting Goods > Team Sports', 8, 1),
(3940, 3940, 3938, 'Baseball Bats', 'Sporting Goods > Team Sports > Baseball', 0, 1),
(3941, 3941, 3938, 'Baseball Diamond Bases', 'Sporting Goods > Team Sports > Baseball', 0, 1),
(3942, 3942, 3938, 'Baseball Gloves & Mitts', 'Sporting Goods > Team Sports > Baseball', 0, 1),
(3943, 3943, 3938, 'Baseball Protective Gear', 'Sporting Goods > Team Sports > Baseball', 1, 1),
(3944, 3944, 3943, 'Batting Helmets', 'Sporting Goods > Team Sports > Baseball > Baseball Protective Gear', 0, 1),
(3945, 3945, 3938, 'Baseballs', 'Sporting Goods > Team Sports > Baseball', 0, 1),
(3946, 3946, 3938, 'Batting Gloves', 'Sporting Goods > Team Sports > Baseball', 0, 1),
(3947, 3947, 3938, 'Pitching Machines', 'Sporting Goods > Team Sports > Baseball', 0, 1),
(3948, 3948, 3937, 'Basketball', 'Sporting Goods > Team Sports', 3, 1),
(3949, 3949, 3948, 'Basketball Hoop Parts & Accessories', 'Sporting Goods > Team Sports > Basketball', 4, 1),
(3950, 3950, 3949, 'Basketball Backboards', 'Sporting Goods > Team Sports > Basketball > Basketball Hoop Parts & Accessories', 0, 1),
(3951, 3951, 3949, 'Basketball Nets', 'Sporting Goods > Team Sports > Basketball > Basketball Hoop Parts & Accessories', 0, 1),
(3952, 3952, 3949, 'Basketball Poles', 'Sporting Goods > Team Sports > Basketball > Basketball Hoop Parts & Accessories', 0, 1),
(3953, 3953, 3949, 'Basketball Rims', 'Sporting Goods > Team Sports > Basketball > Basketball Hoop Parts & Accessories', 0, 1),
(3954, 3954, 3948, 'Basketball Hoops', 'Sporting Goods > Team Sports > Basketball', 0, 1),
(3955, 3955, 3948, 'Basketballs', 'Sporting Goods > Team Sports > Basketball', 0, 1),
(3956, 3956, 3937, 'Beach Volleyball', 'Sporting Goods > Team Sports', 2, 1),
(3957, 3957, 3956, 'Beach Volleyball Balls', 'Sporting Goods > Team Sports > Beach Volleyball', 0, 1),
(3958, 3958, 3956, 'Beach Volleyball Nets', 'Sporting Goods > Team Sports > Beach Volleyball', 0, 1),
(3959, 3959, 3937, 'Cheerleading', 'Sporting Goods > Team Sports', 2, 1),
(3960, 3960, 3959, 'Cheerleading Megaphones', 'Sporting Goods > Team Sports > Cheerleading', 0, 1),
(3961, 3961, 3959, 'Pom-Poms', 'Sporting Goods > Team Sports > Cheerleading', 0, 1),
(3962, 3962, 3937, 'Cricket', 'Sporting Goods > Team Sports', 4, 1),
(3963, 3963, 3962, 'Cricket Balls', 'Sporting Goods > Team Sports > Cricket', 0, 1),
(3964, 3964, 3962, 'Cricket Bats', 'Sporting Goods > Team Sports > Cricket', 0, 1),
(3965, 3965, 3962, 'Cricket Gloves', 'Sporting Goods > Team Sports > Cricket', 0, 1),
(3966, 3966, 3962, 'Cricket Helmets', 'Sporting Goods > Team Sports > Cricket', 0, 1),
(3967, 3967, 3937, 'Curling', 'Sporting Goods > Team Sports', 0, 1),
(3968, 3968, 3937, 'Field Hockey', 'Sporting Goods > Team Sports', 4, 1),
(3969, 3969, 3968, 'Field Hockey Balls', 'Sporting Goods > Team Sports > Field Hockey', 0, 1),
(3970, 3970, 3968, 'Field Hockey Gloves', 'Sporting Goods > Team Sports > Field Hockey', 0, 1),
(3971, 3971, 3968, 'Field Hockey Goals', 'Sporting Goods > Team Sports > Field Hockey', 0, 1),
(3972, 3972, 3968, 'Field Hockey Sticks', 'Sporting Goods > Team Sports > Field Hockey', 0, 1),
(3973, 3973, 3937, 'Football', 'Sporting Goods > Team Sports', 6, 1),
(3974, 3974, 3973, 'Football Gloves', 'Sporting Goods > Team Sports > Football', 0, 1),
(3975, 3975, 3973, 'Football Goal Posts', 'Sporting Goods > Team Sports > Football', 0, 1),
(3976, 3976, 3973, 'Football Kicking Tees', 'Sporting Goods > Team Sports > Football', 0, 1),
(3977, 3977, 3973, 'Football Protective Gear', 'Sporting Goods > Team Sports > Football', 5, 1),
(3978, 3978, 3977, 'Football Girdles', 'Sporting Goods > Team Sports > Football > Football Protective Gear', 0, 1),
(3979, 3979, 3977, 'Football Helmet Accessories', 'Sporting Goods > Team Sports > Football > Football Protective Gear', 4, 1),
(3980, 3980, 3979, 'Football Chin Straps', 'Sporting Goods > Team Sports > Football > Football Protective Gear > Football Helmet Accessories', 0, 1),
(3981, 3981, 3979, 'Football Face Masks', 'Sporting Goods > Team Sports > Football > Football Protective Gear > Football Helmet Accessories', 0, 1),
(3982, 3982, 3979, 'Football Helmet Padding', 'Sporting Goods > Team Sports > Football > Football Protective Gear > Football Helmet Accessories', 0, 1),
(3983, 3983, 3979, 'Football Helmet Visors', 'Sporting Goods > Team Sports > Football > Football Protective Gear > Football Helmet Accessories', 0, 1),
(3984, 3984, 3977, 'Football Helmets', 'Sporting Goods > Team Sports > Football > Football Protective Gear', 0, 1),
(3985, 3985, 3977, 'Football Neck Rolls', 'Sporting Goods > Team Sports > Football > Football Protective Gear', 0, 1),
(3986, 3986, 3977, 'Football Shoulder Pads', 'Sporting Goods > Team Sports > Football > Football Protective Gear', 0, 1),
(3987, 3987, 3973, 'Football Training Equipment', 'Sporting Goods > Team Sports > Football', 0, 1),
(3988, 3988, 3973, 'Footballs', 'Sporting Goods > Team Sports > Football', 0, 1),
(3989, 3989, 3937, 'Hockey', 'Sporting Goods > Team Sports', 7, 1),
(3990, 3990, 3989, 'Hockey Goals', 'Sporting Goods > Team Sports > Hockey', 0, 1),
(3991, 3991, 3989, 'Hockey Protective Equipment', 'Sporting Goods > Team Sports > Hockey', 3, 1),
(3992, 3992, 3991, 'Hockey Gloves', 'Sporting Goods > Team Sports > Hockey > Hockey Protective Equipment', 0, 1),
(3993, 3993, 3991, 'Hockey Helmets', 'Sporting Goods > Team Sports > Hockey > Hockey Protective Equipment', 0, 1),
(3994, 3994, 3991, 'Hockey Pants', 'Sporting Goods > Team Sports > Hockey > Hockey Protective Equipment', 0, 1),
(3995, 3995, 3989, 'Hockey Pucks', 'Sporting Goods > Team Sports > Hockey', 0, 1),
(3996, 3996, 3989, 'Hockey Sticks', 'Sporting Goods > Team Sports > Hockey', 0, 1),
(3997, 3997, 3989, 'Ice Hockey Skates', 'Sporting Goods > Team Sports > Hockey', 0, 1),
(3998, 3998, 3989, 'Roller Hockey Balls', 'Sporting Goods > Team Sports > Hockey', 0, 1),
(3999, 3999, 3989, 'Roller Hockey Skates', 'Sporting Goods > Team Sports > Hockey', 0, 1),
(4000, 4000, 3937, 'Indoor Volleyball', 'Sporting Goods > Team Sports', 3, 1),
(4001, 4001, 4000, 'Indoor Volleyball Balls', 'Sporting Goods > Team Sports > Indoor Volleyball', 0, 1),
(4002, 4002, 4000, 'Indoor Volleyball Nets', 'Sporting Goods > Team Sports > Indoor Volleyball', 0, 1),
(4003, 4003, 4000, 'Volleyball Bags', 'Sporting Goods > Team Sports > Indoor Volleyball', 0, 1),
(4004, 4004, 3937, 'Lacrosse', 'Sporting Goods > Team Sports', 7, 1),
(4005, 4005, 4004, 'Lacrosse Balls', 'Sporting Goods > Team Sports > Lacrosse', 0, 1),
(4007, 4007, 4004, 'Lacrosse Goals', 'Sporting Goods > Team Sports > Lacrosse', 0, 1),
(4008, 4008, 4004, 'Lacrosse Protective Gear', 'Sporting Goods > Team Sports > Lacrosse', 5, 1),
(4009, 4009, 4008, 'Lacrosse Arm Guards', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Protective Gear', 0, 1),
(4010, 4010, 4008, 'Lacrosse Gloves', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Protective Gear', 0, 1),
(4011, 4011, 4008, 'Lacrosse Helmets', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Protective Gear', 0, 1),
(4012, 4012, 4008, 'Lacrosse Masks & Goggles', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Protective Gear', 0, 1),
(4013, 4013, 4008, 'Lacrosse Shoulder Pads', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Protective Gear', 0, 1),
(4014, 4014, 4004, 'Lacrosse Stick Parts', 'Sporting Goods > Team Sports > Lacrosse', 3, 1),
(4015, 4015, 4014, 'Lacrosse Mesh & String', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Stick Parts', 0, 1),
(4016, 4016, 4014, 'Lacrosse Stick Heads', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Stick Parts', 0, 1),
(4017, 4017, 4014, 'Lacrosse Stick Shafts', 'Sporting Goods > Team Sports > Lacrosse > Lacrosse Stick Parts', 0, 1),
(4018, 4018, 4004, 'Lacrosse Sticks', 'Sporting Goods > Team Sports > Lacrosse', 0, 1),
(4019, 4019, 4004, 'Lacrosse Training Equipment', 'Sporting Goods > Team Sports > Lacrosse', 0, 1),
(4020, 4020, 3937, 'Rugby', 'Sporting Goods > Team Sports', 5, 1),
(4021, 4021, 4020, 'Rugby Balls', 'Sporting Goods > Team Sports > Rugby', 0, 1),
(4022, 4022, 4020, 'Rugby Gloves', 'Sporting Goods > Team Sports > Rugby', 0, 1),
(4023, 4023, 4020, 'Rugby Helmets', 'Sporting Goods > Team Sports > Rugby', 0, 1),
(4024, 4024, 4020, 'Rugby Posts', 'Sporting Goods > Team Sports > Rugby', 0, 1),
(4025, 4025, 4020, 'Rugby Training Equipment', 'Sporting Goods > Team Sports > Rugby', 0, 1),
(4026, 4026, 3937, 'Soccer', 'Sporting Goods > Team Sports', 6, 1),
(4027, 4027, 4026, 'Corner Flags', 'Sporting Goods > Team Sports > Soccer', 0, 1),
(4028, 4028, 4026, 'Soccer Balls', 'Sporting Goods > Team Sports > Soccer', 1, 1),
(4029, 4029, 4028, 'Futsal Balls', 'Sporting Goods > Team Sports > Soccer > Soccer Balls', 0, 1),
(4031, 4031, 4026, 'Soccer Goalie Gloves', 'Sporting Goods > Team Sports > Soccer', 0, 1),
(4032, 4032, 4026, 'Soccer Goals & Nets', 'Sporting Goods > Team Sports > Soccer', 0, 1),
(4033, 4033, 4026, 'Soccer Shin Guards', 'Sporting Goods > Team Sports > Soccer', 0, 1),
(4034, 4034, 3937, 'Softball', 'Sporting Goods > Team Sports', 4, 1),
(4035, 4035, 4034, 'Softball Bats', 'Sporting Goods > Team Sports > Softball', 0, 1),
(4036, 4036, 4034, 'Softball Gloves & Mitts', 'Sporting Goods > Team Sports > Softball', 0, 1),
(4037, 4037, 4034, 'Softball Protective Gear', 'Sporting Goods > Team Sports > Softball', 0, 1),
(4038, 4038, 4034, 'Softballs', 'Sporting Goods > Team Sports > Softball', 0, 1),
(4039, 4039, 3937, 'Team Handball', 'Sporting Goods > Team Sports', 0, 1),
(4040, 4040, 3539, 'Water Sports', 'Sporting Goods', 12, 1),
(4041, 4041, 4040, 'Boating', 'Sporting Goods > Water Sports', 4, 1),
(4042, 4042, 4041, 'Canoeing', 'Sporting Goods > Water Sports > Boating', 1, 1),
(4043, 4043, 4042, 'Canoes', 'Sporting Goods > Water Sports > Boating > Canoeing', 0, 1),
(4044, 4044, 4041, 'Kayaking', 'Sporting Goods > Water Sports > Boating', 1, 1),
(4045, 4045, 4044, 'Kayaks', 'Sporting Goods > Water Sports > Boating > Kayaking', 0, 1),
(4046, 4046, 4041, 'Rafts', 'Sporting Goods > Water Sports > Boating', 0, 1),
(4047, 4047, 4041, 'Rowing', 'Sporting Goods > Water Sports > Boating', 3, 1),
(4048, 4048, 4047, 'Rowing Boats', 'Sporting Goods > Water Sports > Boating > Rowing', 0, 1),
(4049, 4049, 4047, 'Rowing Oars', 'Sporting Goods > Water Sports > Boating > Rowing', 0, 1),
(4050, 4050, 4047, 'Rowing Seat Pads', 'Sporting Goods > Water Sports > Boating > Rowing', 0, 1),
(4051, 4051, 4040, 'Bodyboarding', 'Sporting Goods > Water Sports', 0, 1),
(4052, 4052, 4040, 'Life Jackets', 'Sporting Goods > Water Sports', 0, 1),
(4053, 4053, 4040, 'Scuba Diving & Snorkeling', 'Sporting Goods > Water Sports', 8, 1),
(4054, 4054, 4053, 'Buoyancy Compensators', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4055, 4055, 4053, 'Dive Computers', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4056, 4056, 4053, 'Diving & Snorkeling Fins', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4057, 4057, 4053, 'Diving & Snorkeling Masks', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4058, 4058, 4053, 'Diving Knives & Shears', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4059, 4059, 4053, 'Drysuits', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4060, 4060, 4053, 'Regulators', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4061, 4061, 4053, 'Snorkels', 'Sporting Goods > Water Sports > Scuba Diving & Snorkeling', 0, 1),
(4062, 4062, 4040, 'Surfing', 'Sporting Goods > Water Sports', 7, 1),
(4063, 4063, 4062, 'Rash Guards', 'Sporting Goods > Water Sports > Surfing', 0, 1),
(4064, 4064, 4062, 'Surfboard Cases', 'Sporting Goods > Water Sports > Surfing', 0, 1),
(4065, 4065, 4062, 'Surfboard Fins', 'Sporting Goods > Water Sports > Surfing', 0, 1),
(4066, 4066, 4062, 'Surfboard Leashes', 'Sporting Goods > Water Sports > Surfing', 0, 1),
(4067, 4067, 4062, 'Surfboard Wax', 'Sporting Goods > Water Sports > Surfing', 0, 1),
(4068, 4068, 4062, 'Surfboards', 'Sporting Goods > Water Sports > Surfing', 0, 1),
(4069, 4069, 4062, 'Surfing Tail Pads', 'Sporting Goods > Water Sports > Surfing', 0, 1),
(4070, 4070, 4040, 'Swimming', 'Sporting Goods > Water Sports', 9, 1),
(4071, 4071, 4070, 'Baby Floats', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4072, 4072, 4070, 'Kickboards', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4073, 4073, 4070, 'Pull Buoys', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4074, 4074, 4070, 'Swim Caps', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4075, 4075, 4070, 'Swim Gloves', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4076, 4076, 4070, 'Swim Goggles', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4077, 4077, 4070, 'Swim Plugs', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4078, 4078, 4070, 'Swimming Machines', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4079, 4079, 4070, 'Training Fins', 'Sporting Goods > Water Sports > Swimming', 0, 1),
(4080, 4080, 4040, 'Towed Water Sports', 'Sporting Goods > Water Sports', 5, 1),
(4081, 4081, 4080, 'Kneeboarding', 'Sporting Goods > Water Sports > Towed Water Sports', 1, 1),
(4082, 4082, 4081, 'Kneeboards', 'Sporting Goods > Water Sports > Towed Water Sports > Kneeboarding', 0, 1),
(4083, 4083, 4080, 'Parasailing', 'Sporting Goods > Water Sports > Towed Water Sports', 0, 1),
(4084, 4084, 4080, 'Tow Cables', 'Sporting Goods > Water Sports > Towed Water Sports', 0, 1),
(4085, 4085, 4080, 'Wakeboarding', 'Sporting Goods > Water Sports > Towed Water Sports', 2, 1),
(4086, 4086, 4085, 'Wakeboard Bindings', 'Sporting Goods > Water Sports > Towed Water Sports > Wakeboarding', 0, 1),
(4087, 4087, 4085, 'Wakeboards', 'Sporting Goods > Water Sports > Towed Water Sports > Wakeboarding', 0, 1),
(4088, 4088, 4080, 'Water Skiing', 'Sporting Goods > Water Sports > Towed Water Sports', 2, 1),
(4089, 4089, 4088, 'Sit-Down Hydrofoils', 'Sporting Goods > Water Sports > Towed Water Sports > Water Skiing', 0, 1),
(4090, 4090, 4088, 'Water Skis', 'Sporting Goods > Water Sports > Towed Water Sports > Water Skiing', 0, 1),
(4091, 4091, 4040, 'Water Polo', 'Sporting Goods > Water Sports', 3, 1),
(4092, 4092, 4091, 'Water Polo Balls', 'Sporting Goods > Water Sports > Water Polo', 0, 1),
(4093, 4093, 4091, 'Water Polo Caps', 'Sporting Goods > Water Sports > Water Polo', 0, 1),
(4094, 4094, 4091, 'Water Polo Goals', 'Sporting Goods > Water Sports > Water Polo', 0, 1),
(4095, 4095, 4040, 'Water Tubing', 'Sporting Goods > Water Sports', 0, 1),
(4096, 4096, 4040, 'Wetsuits', 'Sporting Goods > Water Sports', 3, 1),
(4097, 4097, 4096, 'Wetsuit Accessories', 'Sporting Goods > Water Sports > Wetsuits', 0, 1),
(4098, 4098, 4096, 'Wetsuit Bottoms', 'Sporting Goods > Water Sports > Wetsuits', 0, 1),
(4099, 4099, 4096, 'Wetsuit Tops', 'Sporting Goods > Water Sports > Wetsuits', 0, 1),
(4100, 4100, 4040, 'Whitewater Rafting', 'Sporting Goods > Water Sports', 2, 1),
(4101, 4101, 4100, 'Whitewater Rafting Helmets', 'Sporting Goods > Water Sports > Whitewater Rafting', 0, 1),
(4102, 4102, 4100, 'Whitewater Rafts', 'Sporting Goods > Water Sports > Whitewater Rafting', 0, 1),
(4103, 4103, 4040, 'Windsurfing', 'Sporting Goods > Water Sports', 2, 1),
(4104, 4104, 4103, 'Windsurfing Board Parts', 'Sporting Goods > Water Sports > Windsurfing', 0, 1),
(4105, 4105, 4103, 'Windsurfing Boards', 'Sporting Goods > Water Sports > Windsurfing', 3, 1),
(4106, 4106, 4105, 'Windsurfing Board Fins', 'Sporting Goods > Water Sports > Windsurfing > Windsurfing Boards', 0, 1),
(4107, 4107, 4105, 'Windsurfing Board Masts', 'Sporting Goods > Water Sports > Windsurfing > Windsurfing Boards', 0, 1),
(4108, 4108, 4105, 'Windsurfing Sails', 'Sporting Goods > Water Sports > Windsurfing > Windsurfing Boards', 0, 1),
(4109, 4109, 3539, 'Winter Sports', 'Sporting Goods', 8, 1),
(4110, 4110, 4109, 'Bobsledding', 'Sporting Goods > Winter Sports', 0, 1),
(4111, 4111, 4109, 'Cross-Country Skiing', 'Sporting Goods > Winter Sports', 3, 1),
(4112, 4112, 4111, 'Cross-Country Ski Bindings', 'Sporting Goods > Winter Sports > Cross-Country Skiing', 0, 1),
(4113, 4113, 4111, 'Cross-Country Ski Boots', 'Sporting Goods > Winter Sports > Cross-Country Skiing', 0, 1),
(4114, 4114, 4111, 'Cross-Country Skis', 'Sporting Goods > Winter Sports > Cross-Country Skiing', 0, 1),
(4115, 4115, 4109, 'Downhill Skiing', 'Sporting Goods > Winter Sports', 5, 1),
(4116, 4116, 4115, 'Downhill Ski Bindings', 'Sporting Goods > Winter Sports > Downhill Skiing', 0, 1),
(4117, 4117, 4115, 'Downhill Ski Boots', 'Sporting Goods > Winter Sports > Downhill Skiing', 0, 1),
(4118, 4118, 4115, 'Downhill Skis', 'Sporting Goods > Winter Sports > Downhill Skiing', 0, 1),
(4119, 4119, 4115, 'Ski Bags', 'Sporting Goods > Winter Sports > Downhill Skiing', 0, 1),
(4120, 4120, 4115, 'Ski Poles', 'Sporting Goods > Winter Sports > Downhill Skiing', 0, 1),
(4121, 4121, 4109, 'Luge', 'Sporting Goods > Winter Sports', 0, 1),
(4122, 4122, 4109, 'Sledding', 'Sporting Goods > Winter Sports', 3, 1),
(4123, 4123, 4122, 'Saucer Sleds', 'Sporting Goods > Winter Sports > Sledding', 0, 1),
(4124, 4124, 4122, 'Snow Tubes', 'Sporting Goods > Winter Sports > Sledding', 0, 1),
(4125, 4125, 4122, 'Toboggans', 'Sporting Goods > Winter Sports > Sledding', 0, 1),
(4126, 4126, 4109, 'Snowboarding', 'Sporting Goods > Winter Sports', 8, 1),
(4127, 4127, 4126, 'Ski & Snowboard Goggle Lenses', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4128, 4128, 4126, 'Ski & Snowboard Goggles', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4129, 4129, 4126, 'Ski & Snowboard Helmets', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4130, 4130, 4126, 'Snowboard Bags', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4131, 4131, 4126, 'Snowboard Binding Parts', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4132, 4132, 4126, 'Snowboard Bindings', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4133, 4133, 4126, 'Snowboard Boots', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4134, 4134, 4126, 'Snowboards', 'Sporting Goods > Winter Sports > Snowboarding', 0, 1),
(4135, 4135, 4109, 'Snowmobiling', 'Sporting Goods > Winter Sports', 0, 1),
(4136, 4136, 4109, 'Snowshoeing', 'Sporting Goods > Winter Sports', 2, 1),
(4137, 4137, 4136, 'Snowshoe Bindings', 'Sporting Goods > Winter Sports > Snowshoeing', 0, 1),
(4138, 4138, 4136, 'Snowshoes', 'Sporting Goods > Winter Sports > Snowshoeing', 0, 1),
(4139, 4139, 0, 'Toys & Games', '', 5, 1),
(4140, 4140, 4139, 'Game Timers', 'Toys & Games', 0, 1),
(4141, 4141, 4139, 'Games', 'Toys & Games', 9, 1),
(4142, 4142, 4141, 'Bingo Sets', 'Toys & Games > Games', 0, 1),
(4143, 4143, 4141, 'Board Games', 'Toys & Games > Games', 4, 1),
(4144, 4144, 4143, 'Backgammon Sets', 'Toys & Games > Games > Board Games', 0, 1),
(4145, 4145, 4143, 'Checkers Sets', 'Toys & Games > Games > Board Games', 0, 1),
(4146, 4146, 4143, 'Chess Sets', 'Toys & Games > Games > Board Games', 0, 1),
(4147, 4147, 4143, 'Parcheesi', 'Toys & Games > Games > Board Games', 0, 1),
(4148, 4148, 4141, 'Card Games', 'Toys & Games > Games', 1, 1),
(4149, 4149, 4148, 'Collectible Card Games', 'Toys & Games > Games > Card Games', 0, 1),
(4150, 4150, 4141, 'Dice & Dice Sets', 'Toys & Games > Games', 0, 1),
(4151, 4151, 4141, 'Dice Games', 'Toys & Games > Games', 0, 1),
(4152, 4152, 4141, 'Dominoes', 'Toys & Games > Games', 0, 1),
(4153, 4153, 4141, 'Mahjong', 'Toys & Games > Games', 0, 1),
(4154, 4154, 4141, 'Poker Chips & Sets', 'Toys & Games > Games', 0, 1),
(4155, 4155, 4141, 'Portable Electronic Games', 'Toys & Games > Games', 0, 1),
(4156, 4156, 4139, 'Outdoor Play Equipment', 'Toys & Games', 7, 1),
(4157, 4157, 4156, 'Lawn Water Slides', 'Toys & Games > Outdoor Play Equipment', 0, 1),
(4158, 4158, 4156, 'Outdoor Playsets', 'Toys & Games > Outdoor Play Equipment', 0, 1),
(4159, 4159, 4156, 'Playhouses', 'Toys & Games > Outdoor Play Equipment', 0, 1),
(4160, 4160, 4156, 'Sandboxes', 'Toys & Games > Outdoor Play Equipment', 0, 1),
(4161, 4161, 4156, 'Slides', 'Toys & Games > Outdoor Play Equipment', 0, 1),
(4162, 4162, 4156, 'Swing Sets', 'Toys & Games > Outdoor Play Equipment', 0, 1),
(4163, 4163, 4156, 'Water Tables', 'Toys & Games > Outdoor Play Equipment', 0, 1),
(4164, 4164, 4139, 'Puzzles', 'Toys & Games', 2, 1),
(4165, 4165, 4164, 'Jigsaw Puzzles', 'Toys & Games > Puzzles', 0, 1),
(4166, 4166, 4164, 'Mechanical Puzzles', 'Toys & Games > Puzzles', 3, 1),
(4167, 4167, 4166, 'Assembly & Disassembly Puzzles', 'Toys & Games > Puzzles > Mechanical Puzzles', 0, 1),
(4168, 4168, 4166, 'Dexterity Puzzles', 'Toys & Games > Puzzles > Mechanical Puzzles', 0, 1),
(4169, 4169, 4166, 'Tavern Puzzles', 'Toys & Games > Puzzles > Mechanical Puzzles', 0, 1),
(4170, 4170, 4139, 'Toys', 'Toys & Games', 20, 1),
(4171, 4171, 4170, 'Activity Toys', 'Toys & Games > Toys', 8, 1),
(4172, 4172, 4171, 'Bouncy Balls', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4173, 4173, 4171, 'Bubble Blowing Solution', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4174, 4174, 4171, 'Bubble Blowing Toys', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4175, 4175, 4171, 'Coiled Spring Toys', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4176, 4176, 4171, 'Marbles', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4177, 4177, 4171, 'Spinning Tops', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4178, 4178, 4171, 'Toy Jacks', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4179, 4179, 4171, 'Yo-Yos', 'Toys & Games > Toys > Activity Toys', 0, 1),
(4180, 4180, 4170, 'Art & Drawing Toys', 'Toys & Games > Toys', 2, 1),
(4181, 4181, 4180, 'Toy Craft Kits', 'Toys & Games > Toys > Art & Drawing Toys', 0, 1),
(4182, 4182, 4180, 'Toy Drawing Tablets', 'Toys & Games > Toys > Art & Drawing Toys', 0, 1),
(4183, 4183, 4170, 'Ball Pits', 'Toys & Games > Toys', 0, 1),
(4184, 4184, 4170, 'Bath Toys', 'Toys & Games > Toys', 0, 1),
(4185, 4185, 4170, 'Beach & Sand Toys', 'Toys & Games > Toys', 1, 1),
(4186, 4186, 4185, 'Sand Pails', 'Toys & Games > Toys > Beach & Sand Toys', 0, 1),
(4187, 4187, 4170, 'Building Toys', 'Toys & Games > Toys', 5, 1),
(4188, 4188, 4187, 'Construction Set Toys', 'Toys & Games > Toys > Building Toys', 0, 1),
(4189, 4189, 4187, 'Foam Blocks', 'Toys & Games > Toys > Building Toys', 0, 1),
(4190, 4190, 4187, 'Interlocking Blocks', 'Toys & Games > Toys > Building Toys', 0, 1),
(4191, 4191, 4187, 'Marble Track Sets', 'Toys & Games > Toys > Building Toys', 0, 1),
(4192, 4192, 4187, 'Wooden Blocks', 'Toys & Games > Toys > Building Toys', 0, 1),
(4193, 4193, 4170, 'Dolls, Playsets & Toy Figures', 'Toys & Games > Toys', 10, 1),
(4194, 4194, 4193, 'Action Figures', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4195, 4195, 4193, 'Animal Figures', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 2, 1),
(4196, 4196, 4195, 'Dinosaur Figures', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures > Animal Figures', 0, 1),
(4197, 4197, 4195, 'Horse & Pony Figures', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures > Animal Figures', 0, 1),
(4198, 4198, 4193, 'Army Men', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4199, 4199, 4193, 'Dollhouse Accessories', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4200, 4200, 4193, 'Dollhouses', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4201, 4201, 4193, 'Dolls', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4202, 4202, 4193, 'Dolls & Action Figure Accessories', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4203, 4203, 4193, 'Playsets', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4204, 4204, 4193, 'Puppets', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4205, 4205, 4193, 'Stuffed Toys', 'Toys & Games > Toys > Dolls, Playsets & Toy Figures', 0, 1),
(4206, 4206, 4170, 'Electronic Toys', 'Toys & Games > Toys', 1, 1),
(4207, 4207, 4206, 'Robotic Toys', 'Toys & Games > Toys > Electronic Toys', 0, 1),
(4208, 4208, 4170, 'Executive Toys', 'Toys & Games > Toys', 0, 1),
(4209, 4209, 4170, 'Flying Toys', 'Toys & Games > Toys', 4, 1),
(4210, 4210, 4209, 'Air & Water Rockets', 'Toys & Games > Toys > Flying Toys', 0, 1),
(4211, 4211, 4209, 'Kites', 'Toys & Games > Toys > Flying Toys', 0, 1),
(4212, 4212, 4209, 'Toy Gliders', 'Toys & Games > Toys > Flying Toys', 0, 1),
(4213, 4213, 4209, 'Toy Parachutes', 'Toys & Games > Toys > Flying Toys', 0, 1),
(4214, 4214, 4170, 'Learning Toys', 'Toys & Games > Toys', 3, 1),
(4215, 4215, 4214, 'Ant Farms', 'Toys & Games > Toys > Learning Toys', 0, 1),
(4216, 4216, 4214, 'Bug Collecting Kits', 'Toys & Games > Toys > Learning Toys', 0, 1),
(4217, 4217, 4214, 'Science Sets', 'Toys & Games > Toys > Learning Toys', 0, 1),
(4218, 4218, 4170, 'Musical Toys', 'Toys & Games > Toys', 1, 1),
(4219, 4219, 4218, 'Toy Instruments', 'Toys & Games > Toys > Musical Toys', 0, 1),
(4220, 4220, 4170, 'Play Vehicles', 'Toys & Games > Toys', 10, 1),
(4221, 4221, 4220, 'Toy Airplanes', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4222, 4222, 4220, 'Toy Boats', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4223, 4223, 4220, 'Toy Cars', 'Toys & Games > Toys > Play Vehicles', 1, 1),
(4224, 4224, 4223, 'Die-Cast Cars', 'Toys & Games > Toys > Play Vehicles > Toy Cars', 0, 1),
(4225, 4225, 4220, 'Toy Helicopters', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4226, 4226, 4220, 'Toy Motorcycles', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4227, 4227, 4220, 'Toy Race Car Sets', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4228, 4228, 4220, 'Toy Spaceships', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4229, 4229, 4220, 'Toy Train Accessories', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4230, 4230, 4220, 'Toy Trains & Train Sets', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4231, 4231, 4220, 'Toy Trucks & Construction Vehicles', 'Toys & Games > Toys > Play Vehicles', 0, 1),
(4232, 4232, 4170, 'Pretend Play', 'Toys & Games > Toys', 7, 1),
(4233, 4233, 4232, 'Play Money & Banking', 'Toys & Games > Toys > Pretend Play', 0, 1),
(4234, 4234, 4232, 'Pretend Electronics', 'Toys & Games > Toys > Pretend Play', 0, 1),
(4235, 4235, 4232, 'Pretend Housekeeping', 'Toys & Games > Toys > Pretend Play', 0, 1),
(4236, 4236, 4232, 'Pretend Lawn & Garden', 'Toys & Games > Toys > Pretend Play', 0, 1),
(4237, 4237, 4232, 'Pretend Professions & Role Playing', 'Toys & Games > Toys > Pretend Play', 0, 1),
(4238, 4238, 4232, 'Toy Kitchens & Play Food', 'Toys & Games > Toys > Pretend Play', 0, 1),
(4239, 4239, 4232, 'Toy Tools', 'Toys & Games > Toys > Pretend Play', 0, 1),
(4240, 4240, 4170, 'Radio Control Toys', 'Toys & Games > Toys', 5, 1),
(4241, 4241, 4240, 'Radio Control Boats', 'Toys & Games > Toys > Radio Control Toys', 0, 1),
(4242, 4242, 4240, 'Radio Control Cars', 'Toys & Games > Toys > Radio Control Toys', 0, 1),
(4243, 4243, 4240, 'Radio Control Helicopters', 'Toys & Games > Toys > Radio Control Toys', 0, 1),
(4244, 4244, 4240, 'Radio Control Planes', 'Toys & Games > Toys > Radio Control Toys', 0, 1),
(4245, 4245, 4240, 'Radio Control Vehicle Accessories', 'Toys & Games > Toys > Radio Control Toys', 0, 1),
(4246, 4246, 4170, 'Riding Toys', 'Toys & Games > Toys', 3, 1),
(4247, 4247, 4246, 'Electric Riding Vehicles', 'Toys & Games > Toys > Riding Toys', 0, 1),
(4248, 4248, 4246, 'Push & Pedal Riding Vehicles', 'Toys & Games > Toys > Riding Toys', 0, 1),
(4249, 4249, 4246, 'Rocking & Spring Riding Toys', 'Toys & Games > Toys > Riding Toys', 0, 1),
(4250, 4250, 4170, 'Sports Toys', 'Toys & Games > Toys', 10, 1),
(4251, 4251, 4250, 'Boomerangs', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4252, 4252, 4250, 'Fitness Toys', 'Toys & Games > Toys > Sports Toys', 1, 1),
(4253, 4253, 4252, 'Hula Hoops', 'Toys & Games > Toys > Sports Toys > Fitness Toys', 0, 1),
(4254, 4254, 4250, 'Flying Discs', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4255, 4255, 4250, 'Footbags', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4256, 4256, 4250, 'Toy Baseball', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4257, 4257, 4250, 'Toy Basketball', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4258, 4258, 4250, 'Toy Bowling', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4259, 4259, 4250, 'Toy Football', 'Toys & Games > Toys > Sports Toys', 1, 1),
(4260, 4260, 4259, 'Foam Footballs', 'Toys & Games > Toys > Sports Toys > Toy Football', 0, 1),
(4261, 4261, 4250, 'Toy Golf', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4262, 4262, 4250, 'Toy Hockey', 'Toys & Games > Toys > Sports Toys', 0, 1),
(4263, 4263, 4170, 'Toy Weapons', 'Toys & Games > Toys', 1, 1),
(4264, 4264, 4263, 'Water Guns', 'Toys & Games > Toys > Toy Weapons', 0, 1),
(4265, 4265, 4170, 'Visual Toys', 'Toys & Games > Toys', 2, 1),
(4266, 4266, 4265, 'Kaleidoscopes', 'Toys & Games > Toys > Visual Toys', 0, 1),
(4267, 4267, 4265, 'Prisms', 'Toys & Games > Toys > Visual Toys', 0, 1),
(4268, 4268, 4170, 'Wind-Up Toys', 'Toys & Games > Toys', 0, 1),
(4269, 4269, 0, 'Vehicles & Parts', '', 13, 1),
(4270, 4270, 4269, 'Aircraft', 'Vehicles & Parts', 0, 1),
(4271, 4271, 4269, 'Aircraft Parts', 'Vehicles & Parts', 0, 1),
(4272, 4272, 4269, 'Automotive Audio & Video', 'Vehicles & Parts', 11, 1),
(4274, 4274, 4272, 'Car Audio & Video Cables', 'Vehicles & Parts > Automotive Audio & Video', 0, 1),
(4280, 4280, 4272, 'Car Surge Protection', 'Vehicles & Parts > Automotive Audio & Video', 0, 1),
(4282, 4282, 4269, 'Automotive Care', 'Vehicles & Parts', 9, 1),
(4283, 4283, 4282, 'Automotive Cleaning', 'Vehicles & Parts > Automotive Care', 8, 1),
(4284, 4284, 4283, 'Car Wash Brushes', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4285, 4285, 4283, 'Car Wash Solutions', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4286, 4286, 4283, 'Tire Wash & Shine', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4287, 4287, 4283, 'Vehicle Aerosol Cleaners', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4288, 4288, 4283, 'Vehicle Carpet Cleaners', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4289, 4289, 4283, 'Vehicle Glass Cleaners', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4290, 4290, 4283, 'Vehicle Upholstery Cleaners', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4291, 4291, 4283, 'Vehicle Waxes, Polishes & Protectants', 'Vehicles & Parts > Automotive Care > Automotive Cleaning', 0, 1),
(4292, 4292, 4282, 'Automotive Decor', 'Vehicles & Parts > Automotive Care', 7, 1),
(4293, 4293, 4292, 'Antenna Balls', 'Vehicles & Parts > Automotive Care > Automotive Decor', 0, 1),
(4294, 4294, 4292, 'Automotive Air Fresheners', 'Vehicles & Parts > Automotive Care > Automotive Decor', 0, 1),
(4295, 4295, 4292, 'Automotive Decals', 'Vehicles & Parts > Automotive Care > Automotive Decor', 0, 1),
(4296, 4296, 4292, 'Automotive Display Flags', 'Vehicles & Parts > Automotive Care > Automotive Decor', 0, 1),
(4297, 4297, 4292, 'Bumper Stickers', 'Vehicles & Parts > Automotive Care > Automotive Decor', 0, 1),
(4298, 4298, 4292, 'Car Seat Covers', 'Vehicles & Parts > Automotive Care > Automotive Decor', 0, 1),
(4299, 4299, 4292, 'Car Seat Organizers', 'Vehicles & Parts > Automotive Care > Automotive Decor', 0, 1),
(4300, 4300, 4282, 'Automotive Fluids', 'Vehicles & Parts > Automotive Care', 12, 1),
(4301, 4301, 4300, 'Antifreeze', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4302, 4302, 4300, 'Automotive Greases', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4303, 4303, 4300, 'Automotive Performance Additives', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4304, 4304, 4300, 'Brake Fluid', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4305, 4305, 4300, 'Cooling System Additives', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4306, 4306, 4300, 'Engine Degreasers', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4307, 4307, 4300, 'Fuel System Cleaners', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4308, 4308, 4300, 'Hydraulic Clutch Fluid', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4309, 4309, 4300, 'Motor Oil', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4310, 4310, 4300, 'Power Steering Fluid', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4311, 4311, 4300, 'Transmission Fluid', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4312, 4312, 4300, 'Windshield Fluid', 'Vehicles & Parts > Automotive Care > Automotive Fluids', 0, 1),
(4313, 4313, 4282, 'Automotive Paint', 'Vehicles & Parts > Automotive Care', 0, 1),
(4314, 4314, 4282, 'Jump Starters', 'Vehicles & Parts > Automotive Care', 0, 1),
(4315, 4315, 4282, 'Jumper Cables', 'Vehicles & Parts > Automotive Care', 0, 1),
(4316, 4316, 4282, 'Tire Care', 'Vehicles & Parts > Automotive Care', 5, 1),
(4317, 4317, 4316, 'Hubcaps', 'Vehicles & Parts > Automotive Care > Tire Care', 0, 1),
(4318, 4318, 4316, 'Tire Covers', 'Vehicles & Parts > Automotive Care > Tire Care', 0, 1),
(4319, 4319, 4316, 'Tire Markers', 'Vehicles & Parts > Automotive Care > Tire Care', 0, 1),
(4320, 4320, 4316, 'Tire Pressure Sensors & Gauges', 'Vehicles & Parts > Automotive Care > Tire Care', 0, 1),
(4321, 4321, 4316, 'Tire Valve Caps', 'Vehicles & Parts > Automotive Care > Tire Care', 0, 1),
(4322, 4322, 4282, 'Vehicle Covers', 'Vehicles & Parts > Automotive Care', 0, 1),
(4323, 4323, 4282, 'Windshield Repair Kits', 'Vehicles & Parts > Automotive Care', 0, 1),
(4324, 4324, 4269, 'Automotive Exterior', 'Vehicles & Parts', 16, 1),
(4325, 4325, 4324, 'Automotive Body Kits', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4326, 4326, 4324, 'Automotive Carrying Racks', 'Vehicles & Parts > Automotive Exterior', 2, 1),
(4327, 4327, 4326, 'Automotive Bicycle Racks', 'Vehicles & Parts > Automotive Exterior > Automotive Carrying Racks', 0, 1),
(4328, 4328, 4326, 'Automotive Luggage Racks', 'Vehicles & Parts > Automotive Exterior > Automotive Carrying Racks', 0, 1),
(4329, 4329, 4324, 'Automotive Diffusers & Splitters', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4330, 4330, 4324, 'Automotive Door Parts', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4331, 4331, 4324, 'Automotive Doors', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4332, 4332, 4324, 'Automotive Trailers', 'Vehicles & Parts > Automotive Exterior', 4, 1),
(4333, 4333, 4332, 'Boat Trailers', 'Vehicles & Parts > Automotive Exterior > Automotive Trailers', 0, 1),
(4334, 4334, 4332, 'Horse Trailers', 'Vehicles & Parts > Automotive Exterior > Automotive Trailers', 0, 1),
(4335, 4335, 4332, 'Travel Trailers', 'Vehicles & Parts > Automotive Exterior > Automotive Trailers', 0, 1),
(4336, 4336, 4332, 'Utility & Cargo Trailers', 'Vehicles & Parts > Automotive Exterior > Automotive Trailers', 0, 1),
(4337, 4337, 4324, 'Bumper Parts', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4338, 4338, 4324, 'Bumpers', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4339, 4339, 4324, 'Grilles', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4340, 4340, 4324, 'Hardtops', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4341, 4341, 4324, 'License Plates', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4342, 4342, 4324, 'Spoilers', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4343, 4343, 4324, 'Sunroofs', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4344, 4344, 4324, 'Truck Bed Parts', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4345, 4345, 4324, 'Truck Beds', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4346, 4346, 4324, 'Winch Parts', 'Vehicles & Parts > Automotive Exterior', 0, 1),
(4347, 4347, 4269, 'Automotive Interior', 'Vehicles & Parts', 13, 1),
(4348, 4348, 4347, 'Automotive Armrests', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4349, 4349, 4347, 'Automotive Backrests', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4350, 4350, 4347, 'Automotive Carpets', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4351, 4351, 4347, 'Automotive Fuses', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4352, 4352, 4347, 'Car Seat Cushions', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4353, 4353, 4347, 'Car Seats', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4354, 4354, 4347, 'Cigar Lighter Receptacles', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4355, 4355, 4347, 'Cup Holders', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4356, 4356, 4347, 'Dashboard Accessories', 'Vehicles & Parts > Automotive Interior', 1, 1),
(4357, 4357, 4356, 'Vehicle GPS Mounts', 'Vehicles & Parts > Automotive Interior > Dashboard Accessories', 0, 1),
(4358, 4358, 4347, 'Headliners', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4359, 4359, 4347, 'Power Seats', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4360, 4360, 4347, 'Sun Shields', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4361, 4361, 4347, 'Vehicle Floor Mats', 'Vehicles & Parts > Automotive Interior', 0, 1),
(4362, 4362, 4269, 'Automotive Locking Systems', 'Vehicles & Parts', 6, 1),
(4363, 4363, 4362, 'Child Safety Locks', 'Vehicles & Parts > Automotive Locking Systems', 0, 1),
(4364, 4364, 4362, 'Immobilizers', 'Vehicles & Parts > Automotive Locking Systems', 0, 1),
(4365, 4365, 4362, 'Locking Hubs', 'Vehicles & Parts > Automotive Locking Systems', 0, 1),
(4366, 4366, 4362, 'Power Door Locks', 'Vehicles & Parts > Automotive Locking Systems', 0, 1),
(4367, 4367, 4362, 'Remote Keyless Systems', 'Vehicles & Parts > Automotive Locking Systems', 0, 1),
(4368, 4368, 4362, 'Steering Wheel Locks', 'Vehicles & Parts > Automotive Locking Systems', 0, 1),
(4369, 4369, 4269, 'Automotive Monitoring', 'Vehicles & Parts', 9, 1),
(4370, 4370, 4369, 'Automotive Trip Computers', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4371, 4371, 4369, 'Car Alarms', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4372, 4372, 4369, 'Engine Control Unit Parts', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4373, 4373, 4369, 'Fuel Meters', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4374, 4374, 4369, 'Odometers', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4375, 4375, 4369, 'Radar Detectors & Jammers', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4376, 4376, 4369, 'Speedometers', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4377, 4377, 4369, 'Tachometers', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4378, 4378, 4369, 'Vehicle Tracking Systems', 'Vehicles & Parts > Automotive Monitoring', 0, 1),
(4379, 4379, 4269, 'Automotive Parts', 'Vehicles & Parts', 19, 1),
(4380, 4380, 4379, 'Air Intake Parts', 'Vehicles & Parts > Automotive Parts', 4, 1),
(4381, 4381, 4380, 'Automotive Air Filters', 'Vehicles & Parts > Automotive Parts > Air Intake Parts', 0, 1),
(4382, 4382, 4380, 'Automotive Air Manifolds', 'Vehicles & Parts > Automotive Parts > Air Intake Parts', 0, 1),
(4383, 4383, 4380, 'Automotive Air Pump Parts', 'Vehicles & Parts > Automotive Parts > Air Intake Parts', 0, 1),
(4384, 4384, 4380, 'Automotive Air Pumps', 'Vehicles & Parts > Automotive Parts > Air Intake Parts', 0, 1),
(4385, 4385, 4379, 'Automotive Batteries', 'Vehicles & Parts > Automotive Parts', 3, 1),
(4386, 4386, 4385, 'Automotive Battery Parts', 'Vehicles & Parts > Automotive Parts > Automotive Batteries', 0, 1),
(4387, 4387, 4385, 'Fuel Cells', 'Vehicles & Parts > Automotive Parts > Automotive Batteries', 0, 1),
(4388, 4388, 4385, 'Hybrid Batteries', 'Vehicles & Parts > Automotive Parts > Automotive Batteries', 0, 1),
(4389, 4389, 4379, 'Automotive Belts', 'Vehicles & Parts > Automotive Parts', 0, 1),
(4390, 4390, 4379, 'Automotive Braking', 'Vehicles & Parts > Automotive Parts', 3, 1),
(4391, 4391, 4390, 'Automotive Brake Parts', 'Vehicles & Parts > Automotive Parts > Automotive Braking', 0, 1),
(4392, 4392, 4390, 'Automotive Manual Brake Parts', 'Vehicles & Parts > Automotive Parts > Automotive Braking', 0, 1),
(4393, 4393, 4390, 'Parking Brake Parts', 'Vehicles & Parts > Automotive Parts > Automotive Braking', 0, 1),
(4394, 4394, 4379, 'Automotive Climate Control', 'Vehicles & Parts > Automotive Parts', 5, 1),
(4395, 4395, 4394, 'Automotive Air Conditioner Parts', 'Vehicles & Parts > Automotive Parts > Automotive Climate Control', 0, 1),
(4396, 4396, 4394, 'Automotive Blower Parts', 'Vehicles & Parts > Automotive Parts > Automotive Climate Control', 0, 1),
(4397, 4397, 4394, 'Automotive Defroster Parts', 'Vehicles & Parts > Automotive Parts > Automotive Climate Control', 0, 1),
(4398, 4398, 4394, 'Automotive Heater Parts', 'Vehicles & Parts > Automotive Parts > Automotive Climate Control', 0, 1),
(4399, 4399, 4394, 'Automotive Temperature Controllers', 'Vehicles & Parts > Automotive Parts > Automotive Climate Control', 0, 1),
(4400, 4400, 4379, 'Automotive Engine Parts', 'Vehicles & Parts > Automotive Parts', 24, 1),
(4401, 4401, 4400, 'Automotive Alternator Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4402, 4402, 4400, 'Automotive Alternators', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4403, 4403, 4400, 'Automotive Camshaft Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4404, 4404, 4400, 'Automotive Camshafts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4405, 4405, 4400, 'Automotive Carburetor Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4406, 4406, 4400, 'Automotive Carburetors', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4407, 4407, 4400, 'Automotive Compressor Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4408, 4408, 4400, 'Automotive Compressors', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4409, 4409, 4400, 'Automotive Crankshaft Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4410, 4410, 4400, 'Automotive Crankshafts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4411, 4411, 4400, 'Automotive Cylinder Heads & Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4412, 4412, 4400, 'Automotive Engine Gaskets', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4413, 4413, 4400, 'Automotive Engine Timing Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 1, 1),
(4414, 4414, 4413, 'Automotive Engine Timing Belts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts > Automotive Engine Timing Parts', 0, 1),
(4415, 4415, 4400, 'Automotive Flywheels & Flywheel Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4416, 4416, 4400, 'Automotive Generator Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4417, 4417, 4400, 'Automotive Ignition Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 4, 1),
(4418, 4418, 4417, 'Capacitor Discharge Ignition Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts > Automotive Ignition Parts', 0, 1),
(4419, 4419, 4417, 'Distributor Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts > Automotive Ignition Parts', 0, 1),
(4420, 4420, 4417, 'Ignition Coils', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts > Automotive Ignition Parts', 0, 1),
(4421, 4421, 4417, 'Spark Plugs', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts > Automotive Ignition Parts', 0, 1),
(4422, 4422, 4400, 'Automotive Piston Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 2, 1),
(4423, 4423, 4422, 'Gudgeon Pins', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts > Automotive Piston Parts', 0, 1),
(4424, 4424, 4422, 'Piston Rings', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts > Automotive Piston Parts', 0, 1),
(4425, 4425, 4400, 'Automotive Pistons', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4426, 4426, 4400, 'Automotive Radiator Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4427, 4427, 4400, 'Automotive Radiators', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4428, 4428, 4400, 'Automotive Starter Motor Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4429, 4429, 4400, 'Automotive Starter Motors', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4430, 4430, 4400, 'Automotive Super Charger Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4431, 4431, 4400, 'Automotive Vacuum Pump Parts', 'Vehicles & Parts > Automotive Parts > Automotive Engine Parts', 0, 1),
(4432, 4432, 4379, 'Automotive Exhaust', 'Vehicles & Parts > Automotive Parts', 6, 1),
(4433, 4433, 4432, 'Catalytic Converters', 'Vehicles & Parts > Automotive Parts > Automotive Exhaust', 0, 1),
(4434, 4434, 4432, 'Exhaust Gas Recirculation Parts', 'Vehicles & Parts > Automotive Parts > Automotive Exhaust', 0, 1),
(4435, 4435, 4432, 'Exhaust Manifolds', 'Vehicles & Parts > Automotive Parts > Automotive Exhaust', 0, 1),
(4436, 4436, 4432, 'Mufflers & Muffler Parts', 'Vehicles & Parts > Automotive Parts > Automotive Exhaust', 0, 1),
(4437, 4437, 4432, 'Oxygen Sensors & Parts', 'Vehicles & Parts > Automotive Parts > Automotive Exhaust', 0, 1),
(4438, 4438, 4432, 'Tailpipes & Tailpipe Parts', 'Vehicles & Parts > Automotive Parts > Automotive Exhaust', 0, 1),
(4439, 4439, 4379, 'Automotive Fuel Systems', 'Vehicles & Parts > Automotive Parts', 9, 1),
(4440, 4440, 4439, 'Fuel Injection Parts', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4441, 4441, 4439, 'Fuel Injectors', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4442, 4442, 4439, 'Fuel Lines & Parts', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4443, 4443, 4439, 'Fuel Pump Parts', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4444, 4444, 4439, 'Fuel Pumps', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4445, 4445, 4439, 'Fuel Screens & Filters', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4446, 4446, 4439, 'Fuel Tank Parts', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4447, 4447, 4439, 'Fuel Tanks', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4448, 4448, 4439, 'Nitrous Systems', 'Vehicles & Parts > Automotive Parts > Automotive Fuel Systems', 0, 1),
(4449, 4449, 4379, 'Automotive Lighting', 'Vehicles & Parts > Automotive Parts', 8, 1),
(4450, 4450, 4449, 'Automotive Fog Lights', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4451, 4451, 4449, 'Automotive Headlights', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4452, 4452, 4449, 'Automotive Interior Lighting', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4453, 4453, 4449, 'Automotive Parking Lights', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4454, 4454, 4449, 'Automotive Reverse Lights', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4455, 4455, 4449, 'Automotive Side Marker Lights', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4456, 4456, 4449, 'Automotive Tail & Brake Lights', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4457, 4457, 4449, 'Automotive Turn Signal Lights', 'Vehicles & Parts > Automotive Parts > Automotive Lighting', 0, 1),
(4458, 4458, 4379, 'Automotive Mirrors', 'Vehicles & Parts > Automotive Parts', 3, 1),
(4459, 4459, 4458, 'Automotive Rear-View Mirrors', 'Vehicles & Parts > Automotive Parts > Automotive Mirrors', 0, 1),
(4460, 4460, 4458, 'Automotive Side-View Mirrors', 'Vehicles & Parts > Automotive Parts > Automotive Mirrors', 0, 1),
(4461, 4461, 4458, 'Automotive Towing Mirrors', 'Vehicles & Parts > Automotive Parts > Automotive Mirrors', 0, 1),
(4462, 4462, 4379, 'Automotive Valves & Valve Parts', 'Vehicles & Parts > Automotive Parts', 0, 1),
(4463, 4463, 4379, 'Automotive Wheel Systems', 'Vehicles & Parts > Automotive Parts', 4, 1),
(4464, 4464, 4463, 'Automotive Rims & Wheels', 'Vehicles & Parts > Automotive Parts > Automotive Wheel Systems', 0, 1),
(4465, 4465, 4463, 'Automotive Tires', 'Vehicles & Parts > Automotive Parts > Automotive Wheel Systems', 0, 1),
(4466, 4466, 4463, 'Automotive Wheel Parts', 'Vehicles & Parts > Automotive Parts > Automotive Wheel Systems', 0, 1),
(4467, 4467, 4463, 'Tire Accessories', 'Vehicles & Parts > Automotive Parts > Automotive Wheel Systems', 1, 1),
(4468, 4468, 4467, 'Tire Chains', 'Vehicles & Parts > Automotive Parts > Automotive Wheel Systems > Tire Accessories', 0, 1),
(4469, 4469, 4379, 'Automotive Window Parts', 'Vehicles & Parts > Automotive Parts', 2, 1),
(4470, 4470, 4469, 'Automotive Window & Windshield Glass', 'Vehicles & Parts > Automotive Parts > Automotive Window Parts', 0, 1),
(4471, 4471, 4469, 'Power Window Parts', 'Vehicles & Parts > Automotive Parts > Automotive Window Parts', 0, 1),
(4472, 4472, 4379, 'Motorcycle Fairings', 'Vehicles & Parts > Automotive Parts', 0, 1),
(4473, 4473, 4379, 'Oil Circulation', 'Vehicles & Parts > Automotive Parts', 4, 1),
(4474, 4474, 4473, 'Oil Filters', 'Vehicles & Parts > Automotive Parts > Oil Circulation', 0, 1),
(4475, 4475, 4473, 'Oil Pump Parts', 'Vehicles & Parts > Automotive Parts > Oil Circulation', 0, 1),
(4476, 4476, 4473, 'Oil Pumps', 'Vehicles & Parts > Automotive Parts > Oil Circulation', 0, 1),
(4477, 4477, 4473, 'Oil Sumps', 'Vehicles & Parts > Automotive Parts > Oil Circulation', 0, 1),
(4478, 4478, 4379, 'Steering Parts', 'Vehicles & Parts > Automotive Parts', 4, 1),
(4479, 4479, 4478, 'King Pins', 'Vehicles & Parts > Automotive Parts > Steering Parts', 0, 1),
(4480, 4480, 4478, 'Power Steering Parts', 'Vehicles & Parts > Automotive Parts > Steering Parts', 0, 1),
(4481, 4481, 4478, 'Steering Wheel Controls', 'Vehicles & Parts > Automotive Parts > Steering Parts', 4, 1),
(4482, 4482, 4481, 'Automotive Light Dimmers', 'Vehicles & Parts > Automotive Parts > Steering Parts > Steering Wheel Controls', 0, 1),
(4483, 4483, 4481, 'Cruise Control Parts', 'Vehicles & Parts > Automotive Parts > Steering Parts > Steering Wheel Controls', 0, 1),
(4484, 4484, 4481, 'Headlight Control Parts', 'Vehicles & Parts > Automotive Parts > Steering Parts > Steering Wheel Controls', 0, 1),
(4485, 4485, 4481, 'Wiper Speed Control Parts', 'Vehicles & Parts > Automotive Parts > Steering Parts > Steering Wheel Controls', 0, 1),
(4486, 4486, 4478, 'Steering Wheels', 'Vehicles & Parts > Automotive Parts > Steering Parts', 0, 1),
(4487, 4487, 4379, 'Suspension Parts', 'Vehicles & Parts > Automotive Parts', 1, 1),
(4488, 4488, 4487, 'Shock Absorbers', 'Vehicles & Parts > Automotive Parts > Suspension Parts', 0, 1),
(4489, 4489, 4379, 'Transmission Parts', 'Vehicles & Parts > Automotive Parts', 13, 1),
(4490, 4490, 4489, 'Axle Parts', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4491, 4491, 4489, 'Ball Bearings', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4492, 4492, 4489, 'Clutch Parts', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4493, 4493, 4489, 'Connecting Rods', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4494, 4494, 4489, 'Differentials', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4495, 4495, 4489, 'Driveshaft Parts', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4496, 4496, 4489, 'Driveshafts', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4497, 4497, 4489, 'Gearbox Parts', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4498, 4498, 4489, 'Gearboxes', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4499, 4499, 4489, 'Rocker Arm Parts', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 1, 1),
(4500, 4500, 4499, 'Rocker Covers', 'Vehicles & Parts > Automotive Parts > Transmission Parts > Rocker Arm Parts', 0, 1),
(4501, 4501, 4489, 'Rocker Arms', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4502, 4502, 4489, 'Transfer Case Parts', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4503, 4503, 4489, 'Transmission Gears', 'Vehicles & Parts > Automotive Parts > Transmission Parts', 0, 1),
(4504, 4504, 4379, 'Windshield Wipers', 'Vehicles & Parts > Automotive Parts', 0, 1),
(4505, 4505, 4269, 'Automotive Safety Equipment', 'Vehicles & Parts', 3, 1),
(4506, 4506, 4505, 'Motorcycle Goggles', 'Vehicles & Parts > Automotive Safety Equipment', 0, 1),
(4507, 4507, 4505, 'Motorcycle Helmets', 'Vehicles & Parts > Automotive Safety Equipment', 0, 1),
(4508, 4508, 4505, 'Vehicle Parking Sensors', 'Vehicles & Parts > Automotive Safety Equipment', 0, 1),
(4509, 4509, 4269, 'Land Vehicles', 'Vehicles & Parts', 8, 1),
(4510, 4510, 4509, 'ATVs', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4511, 4511, 4509, 'Cars, Trucks & Vans', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4512, 4512, 4509, 'Go Karts', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4513, 4513, 4509, 'Golf Carts', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4514, 4514, 4509, 'Motorcycles', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4515, 4515, 4509, 'Powered Scooters', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4516, 4516, 4509, 'Recreational Vehicles', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4517, 4517, 4509, 'Snowmobiles', 'Vehicles & Parts > Land Vehicles', 0, 1),
(4518, 4518, 4269, 'Watercraft', 'Vehicles & Parts', 3, 1),
(4519, 4519, 4518, 'Motor Boats', 'Vehicles & Parts > Watercraft', 0, 1),
(4520, 4520, 4518, 'Personal Watercraft', 'Vehicles & Parts > Watercraft', 0, 1),
(4521, 4521, 4518, 'Sailboats', 'Vehicles & Parts > Watercraft', 0, 1),
(4522, 4522, 4269, 'Watercraft Parts & Accessories', 'Vehicles & Parts', 8, 1),
(4523, 4523, 4522, 'Docking & Anchoring', 'Vehicles & Parts > Watercraft Parts & Accessories', 8, 1),
(4524, 4524, 4523, 'Anchor Chains', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4525, 4525, 4523, 'Anchor Lines & Ropes', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4526, 4526, 4523, 'Anchor Windlasses', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4527, 4527, 4523, 'Anchors', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4528, 4528, 4523, 'Boat Hooks', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4529, 4529, 4523, 'Boat Ladders', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4530, 4530, 4523, 'Dock Cleats', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4531, 4531, 4523, 'Dock Steps', 'Vehicles & Parts > Watercraft Parts & Accessories > Docking & Anchoring', 0, 1),
(4532, 4532, 4522, 'Sailboat Parts', 'Vehicles & Parts > Watercraft Parts & Accessories', 0, 1),
(4533, 4533, 4522, 'Watercraft Care', 'Vehicles & Parts > Watercraft Parts & Accessories', 3, 1),
(4534, 4534, 4533, 'Watercraft Cleaners', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Care', 0, 1),
(4535, 4535, 4533, 'Watercraft Covers', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Care', 0, 1),
(4536, 4536, 4533, 'Watercraft Polishes', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Care', 0, 1),
(4537, 4537, 4522, 'Watercraft Engine Parts', 'Vehicles & Parts > Watercraft Parts & Accessories', 9, 1),
(4538, 4538, 4537, 'Watercraft Alternators', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4539, 4539, 4537, 'Watercraft Carburetors & Parts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4540, 4540, 4537, 'Watercraft Engine Controls', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4541, 4541, 4537, 'Watercraft Ignition Parts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4542, 4542, 4537, 'Watercraft Impellers', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4543, 4543, 4537, 'Watercraft Motor Locks', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4544, 4544, 4537, 'Watercraft Motor Mounts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4545, 4545, 4537, 'Watercraft Pistons & Parts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4546, 4546, 4537, 'Watercraft Propellers', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Engine Parts', 0, 1),
(4547, 4547, 4522, 'Watercraft Engines & Motors', 'Vehicles & Parts > Watercraft Parts & Accessories', 0, 1),
(4548, 4548, 4522, 'Watercraft Exhaust Parts', 'Vehicles & Parts > Watercraft Parts & Accessories', 2, 1),
(4549, 4549, 4548, 'Watercraft Manifolds', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Exhaust Parts', 0, 1),
(4550, 4550, 4548, 'Watercraft Mufflers & Parts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Exhaust Parts', 0, 1),
(4551, 4551, 4522, 'Watercraft Fuel Systems', 'Vehicles & Parts > Watercraft Parts & Accessories', 4, 1),
(4552, 4552, 4551, 'Watercraft Fuel Lines & Parts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Fuel Systems', 0, 1),
(4553, 4553, 4551, 'Watercraft Fuel Meters', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Fuel Systems', 0, 1),
(4554, 4554, 4551, 'Watercraft Fuel Pumps & Parts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Fuel Systems', 0, 1),
(4555, 4555, 4551, 'Watercraft Fuel Tanks & Parts', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Fuel Systems', 0, 1),
(4556, 4556, 4522, 'Watercraft Steering Parts', 'Vehicles & Parts > Watercraft Parts & Accessories', 2, 1),
(4557, 4557, 4556, 'Watercraft Steering Cables', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Steering Parts', 0, 1),
(4558, 4558, 4556, 'Watercraft Steering Wheels', 'Vehicles & Parts > Watercraft Parts & Accessories > Watercraft Steering Parts', 0, 1),
(4559, 4559, 73, 'Active & Dance Leotards', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(4560, 4560, 73, 'Active Dresses', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(4561, 4561, 73, 'Active Skirts', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(4562, 4562, 73, 'Hunting Clothing', 'Apparel & Accessories > Clothing > Activewear', 2, 1),
(4563, 4563, 4562, 'Ghillie Suits', 'Apparel & Accessories > Clothing > Activewear > Hunting Clothing', 0, 1),
(4564, 4564, 4562, 'Hunting & Tactical Vests', 'Apparel & Accessories > Clothing > Activewear > Hunting Clothing', 0, 1),
(4565, 4565, 73, 'Long Johns', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(4566, 4566, 73, 'Motorcycle Suits', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(4567, 4567, 73, 'Sauna Suits', 'Apparel & Accessories > Clothing > Activewear', 0, 1),
(4568, 4568, 96, 'Baby & Toddler Bottoms', 'Apparel & Accessories > Clothing > Baby & Toddler Clothing', 0, 1),
(4569, 4569, 96, 'Baby & Toddler Dresses', 'Apparel & Accessories > Clothing > Baby & Toddler Clothing', 0, 1),
(4570, 4570, 96, 'Baby & Toddler Outerwear', 'Apparel & Accessories > Clothing > Baby & Toddler Clothing', 0, 1),
(4571, 4571, 96, 'Baby & Toddler Swimwear', 'Apparel & Accessories > Clothing > Baby & Toddler Clothing', 0, 1),
(4572, 4572, 96, 'Baby & Toddler Tops', 'Apparel & Accessories > Clothing > Baby & Toddler Clothing', 0, 1),
(4573, 4573, 96, 'Baby Onesies', 'Apparel & Accessories > Clothing > Baby & Toddler Clothing', 0, 1),
(4574, 4574, 96, 'Baby Sleepers & Swaddlers', 'Apparel & Accessories > Clothing > Baby & Toddler Clothing', 0, 1),
(4575, 4575, 72, 'Bridal Clothing', 'Apparel & Accessories > Clothing', 2, 1),
(4576, 4576, 4575, 'Bridal Dresses', 'Apparel & Accessories > Clothing > Bridal Clothing', 0, 1),
(4577, 4577, 4575, 'Bridal Party Dresses', 'Apparel & Accessories > Clothing > Bridal Clothing', 0, 1),
(4578, 4578, 108, 'Leotards & Unitards', 'Apparel & Accessories > Clothing > One-pieces', 0, 1),
(4579, 4579, 111, 'Ponchos', 'Apparel & Accessories > Clothing > Outerwear', 0, 1),
(4580, 4580, 111, 'Rain Suits', 'Apparel & Accessories > Clothing > Outerwear', 0, 1),
(4581, 4581, 111, 'Raincoats', 'Apparel & Accessories > Clothing > Outerwear', 0, 1),
(4582, 4582, 111, 'Trench Coats', 'Apparel & Accessories > Clothing > Outerwear', 0, 1),
(4583, 4583, 119, 'Jeans', 'Apparel & Accessories > Clothing > Pants', 0, 1),
(4584, 4584, 119, 'Leggings', 'Apparel & Accessories > Clothing > Pants', 0, 1),
(4585, 4585, 141, 'Sports Fan Jerseys', 'Apparel & Accessories > Clothing > Tops', 0, 1),
(4586, 4586, 72, 'Traditional & Ceremonial Clothing', 'Apparel & Accessories > Clothing', 2, 1),
(4587, 4587, 4586, 'Asian Traditional Clothing', 'Apparel & Accessories > Clothing > Traditional & Ceremonial Clothing', 1, 1),
(4588, 4588, 4587, 'Kimonos', 'Apparel & Accessories > Clothing > Traditional & Ceremonial Clothing > Asian Traditional Clothing', 0, 1),
(4589, 4589, 4586, 'Religious Ceremonial Clothing', 'Apparel & Accessories > Clothing > Traditional & Ceremonial Clothing', 0, 1),
(4590, 4590, 150, 'Bridal Intimates & Loungewear', 'Apparel & Accessories > Clothing > Underwear & Socks', 0, 1),
(4591, 4591, 161, 'Contractor Pants & Coveralls', 'Apparel & Accessories > Clothing > Uniforms > Professional Uniforms', 0, 1),
(4592, 4592, 177, 'Baby & Toddler Accessories', 'Apparel & Accessories > Clothing Accessories', 1, 1),
(4593, 4593, 4592, 'Baby & Toddler Socks', 'Apparel & Accessories > Clothing Accessories > Baby & Toddler Accessories', 0, 1),
(4594, 4594, 177, 'Bridal Accessories', 'Apparel & Accessories > Clothing Accessories', 1, 1),
(4595, 4595, 4594, 'Bridal Veils', 'Apparel & Accessories > Clothing Accessories > Bridal Accessories', 0, 1),
(4596, 4596, 177, 'Formal Gloves', 'Apparel & Accessories > Clothing Accessories', 0, 1),
(4597, 4597, 187, 'Hair Forks & Sticks', 'Apparel & Accessories > Clothing Accessories > Hair Accessories', 0, 1),
(4598, 4598, 196, 'Baseball Hats', 'Apparel & Accessories > Clothing Accessories > Hats', 0, 1),
(4599, 4599, 196, 'Beanies', 'Apparel & Accessories > Clothing Accessories > Hats', 0, 1),
(4600, 4600, 196, 'Berets', 'Apparel & Accessories > Clothing Accessories > Hats', 0, 1),
(4601, 4601, 196, 'Bowler & Derby Hats', 'Apparel & Accessories > Clothing Accessories > Hats', 0, 1),
(4602, 4602, 196, 'Cowboys Hats', 'Apparel & Accessories > Clothing Accessories > Hats', 0, 1),
(4603, 4603, 196, 'Fedoras', 'Apparel & Accessories > Clothing Accessories > Hats', 0, 1),
(4604, 4604, 196, 'Sun Hats', 'Apparel & Accessories > Clothing Accessories > Hats', 0, 1),
(4605, 4605, 216, 'Costume Hats', 'Apparel & Accessories > Costumes & Accessories > Costume Accessories', 0, 1),
(4606, 4606, 71, 'Handbags', 'Apparel & Accessories', 10, 1),
(4607, 4607, 4606, 'Clutches', 'Apparel & Accessories > Handbags', 0, 1),
(4608, 4608, 4606, 'Cross-Body Handbags', 'Apparel & Accessories > Handbags', 0, 1),
(4609, 4609, 4606, 'Hobo Handbags', 'Apparel & Accessories > Handbags', 0, 1),
(4610, 4610, 4606, 'Mini Handbags', 'Apparel & Accessories > Handbags', 0, 1),
(4611, 4611, 4606, 'Novelty Handbags', 'Apparel & Accessories > Handbags', 0, 1),
(4612, 4612, 4606, 'Oversized Handbags', 'Apparel & Accessories > Handbags', 0, 1),
(4613, 4613, 4606, 'Satchels', 'Apparel & Accessories > Handbags', 0, 1),
(4614, 4614, 4606, 'Special Occasion Handbags', 'Apparel & Accessories > Handbags', 0, 1),
(4615, 4615, 4606, 'Totes', 'Apparel & Accessories > Handbags', 0, 1),
(4616, 4616, 4606, 'Wristlets', 'Apparel & Accessories > Handbags', 0, 1),
(4617, 4617, 221, 'Bridal Jewelry', 'Apparel & Accessories > Jewelry', 0, 1),
(4618, 4618, 241, 'Baseball & Softball Cleats', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(4619, 4619, 241, 'Football Cleats', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(4620, 4620, 241, 'Lacrosse Cleats', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(4621, 4621, 241, 'Soccer Cleats', 'Apparel & Accessories > Shoes > Athletic Shoes', 0, 1),
(4622, 4622, 240, 'Baby & Toddler Shoes', 'Apparel & Accessories > Shoes', 0, 1),
(4623, 4623, 257, 'Short Boots', 'Apparel & Accessories > Shoes > Boots', 0, 1),
(4624, 4624, 240, 'Bridal Shoes', 'Apparel & Accessories > Shoes', 0, 1),
(4625, 4625, 240, 'Oxford Shoes', 'Apparel & Accessories > Shoes', 0, 1),
(4626, 4626, 276, 'Clogs & Mule Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(4627, 4627, 276, 'Mary-Jane Pumps', 'Apparel & Accessories > Shoes > Pumps', 0, 1),
(4628, 4628, 621, 'Melodicas', 'Arts & Entertainment > Musical Instruments > Woodwinds', 0, 1),
(4629, 4629, 630, 'Party Favors', 'Arts & Entertainment > Party Supplies', 1, 1),
(4630, 4630, 4629, 'Wedding Favors', 'Arts & Entertainment > Party Supplies > Party Favors', 0, 1),
(4631, 4631, 630, 'Piñatas', 'Arts & Entertainment > Party Supplies', 0, 1),
(4632, 4632, 630, 'Place Card Holders', 'Arts & Entertainment > Party Supplies', 0, 1),
(4633, 4633, 646, 'Wedding Response Cards', 'Arts & Entertainment > Party Supplies > Response Cards', 0, 1),
(4634, 4634, 630, 'Wedding Ceremony Supplies', 'Arts & Entertainment > Party Supplies', 3, 1),
(4635, 4635, 4634, 'Flower Girl Baskets', 'Arts & Entertainment > Party Supplies > Wedding Ceremony Supplies', 0, 1),
(4636, 4636, 4634, 'Ring Pillows', 'Arts & Entertainment > Party Supplies > Wedding Ceremony Supplies', 0, 1),
(4637, 4637, 4634, 'Unity Candles', 'Arts & Entertainment > Party Supplies > Wedding Ceremony Supplies', 0, 1),
(4638, 4638, 694, 'Baby & Toddler Bibs', 'Baby & Toddler > Nursing & Feeding', 0, 1),
(4639, 4639, 829, 'Camera Flash Accessories', 'Cameras & Optics > Camera & Optic Accessories > Camera Accessories', 0, 1),
(4640, 4640, 829, 'Camera Straps', 'Cameras & Optics > Camera & Optic Accessories > Camera Accessories', 0, 1),
(4641, 4641, 864, 'Binoculars', 'Cameras & Optics > Optics', 1, 1),
(4642, 4642, 4641, 'Opera Glasses', 'Cameras & Optics > Optics > Binoculars', 0, 1),
(4643, 4643, 864, 'Monoculars', 'Cameras & Optics > Optics', 0, 1),
(4644, 4644, 896, 'Flash Reflectors', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(4645, 4645, 896, 'Light Meter Accessories', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(4646, 4646, 896, 'Softboxes', 'Cameras & Optics > Photography > Lighting & Studio', 0, 1),
(4647, 4647, 914, 'Headphone Accessories', 'Electronics > Audio > Audio Accessories', 1, 1),
(4648, 4648, 4647, 'Headphone Cushions', 'Electronics > Audio > Audio Accessories > Headphone Accessories', 0, 1),
(4649, 4649, 920, 'MP3 Player Stickers & Decals', 'Electronics > Audio > Audio Accessories > MP3 Player Accessories', 0, 1),
(4650, 4650, 928, 'Stereo Amplifiers', 'Electronics > Audio > Audio Components > Audio Amplifiers', 0, 1),
(4651, 4651, 927, 'Audio Transmitters', 'Electronics > Audio > Audio Components', 2, 1),
(4652, 4652, 4651, 'Bluetooth Transmitters', 'Electronics > Audio > Audio Components > Audio Transmitters', 0, 1),
(4653, 4653, 4651, 'FM Transmitters', 'Electronics > Audio > Audio Components > Audio Transmitters', 0, 1),
(4654, 4654, 937, 'Crossovers', 'Electronics > Audio > Audio Components > Signal Processors', 0, 1),
(4655, 4655, 942, 'Subwoofers', 'Electronics > Audio > Audio Components > Speakers', 0, 1),
(4656, 4656, 946, 'Multitrack Recorders', 'Electronics > Audio > Audio Players & Recorders > Audio Recorders', 0, 1),
(4657, 4657, 957, 'Wi-Fi Radios', 'Electronics > Audio > Audio Players & Recorders > Radios', 0, 1),
(4658, 4658, 989, 'Communication Radio Accessories', 'Electronics > Communications', 0, 1),
(4659, 4659, 989, 'Intercom Accessories', 'Electronics > Communications', 0, 1),
(4660, 4660, 1030, 'Computer Keyboard Stickers', 'Electronics > Computers > Computer Accessories', 0, 1),
(4661, 4661, 1030, 'Computer Risers', 'Electronics > Computers > Computer Accessories', 0, 1),
(4662, 4662, 1037, 'Laptop Stickers & Decals', 'Electronics > Computers > Computer Accessories > Laptop Accessories', 0, 1),
(4663, 4663, 1042, 'Tablet PC Stands', 'Electronics > Computers > Computer Accessories > Tablet PC Accessories', 0, 1),
(4664, 4664, 1042, 'Tablet PC Stickers & Decals', 'Electronics > Computers > Computer Accessories > Tablet PC Accessories', 0, 1),
(4665, 4665, 1056, 'Smart Card Readers', 'Electronics > Computers > Computer Components > Input Devices', 0, 1),
(4666, 4666, 1028, 'Computer Servers', 'Electronics > Computers', 0, 1),
(4667, 4667, 1112, 'Antenna Accessories', 'Electronics > Electronics Accessories', 2, 1),
(4668, 4668, 4667, 'Antenna Mounts & Brackets', 'Electronics > Electronics Accessories > Antenna Accessories', 0, 1),
(4669, 4669, 4667, 'Antenna Rotators', 'Electronics > Electronics Accessories > Antenna Accessories', 0, 1),
(4670, 4670, 1139, 'Coaxial Cables', 'Electronics > Electronics Accessories > Cables', 0, 1),
(4671, 4671, 1152, 'IDE Cables', 'Electronics > Electronics Accessories > Cables > Storage Cables', 0, 1),
(4672, 4672, 1152, 'SAS Cables', 'Electronics > Electronics Accessories > Cables > Storage Cables', 0, 1),
(4673, 4673, 1152, 'SCSI Cables', 'Electronics > Electronics Accessories > Cables > Storage Cables', 0, 1),
(4674, 4674, 1177, 'Tablet PC Chargers', 'Electronics > Electronics Accessories > Power > Chargers', 0, 1),
(4675, 4675, 1168, 'Power Strips & Surge Suppressors', 'Electronics > Electronics Accessories > Power', 0, 1),
(4676, 4676, 1112, 'Protective Films & Shields', 'Electronics > Electronics Accessories', 3, 1),
(4677, 4677, 4676, 'Keyboard Protectors', 'Electronics > Electronics Accessories > Protective Films & Shields', 0, 1),
(4678, 4678, 4676, 'Privacy Filters', 'Electronics > Electronics Accessories > Protective Films & Shields', 0, 1),
(4679, 4679, 4676, 'Screen Protectors', 'Electronics > Electronics Accessories > Protective Films & Shields', 0, 1),
(4680, 4680, 1112, 'Signal Boosters', 'Electronics > Electronics Accessories', 0, 1),
(4681, 4681, 1203, 'Network Extenders', 'Electronics > Networking > Bridges & Routers', 1, 1),
(4682, 4682, 4681, 'Wireless Network Extenders', 'Electronics > Networking > Bridges & Routers > Network Extenders', 0, 1),
(4683, 4683, 1203, 'VoIP Gateways & Routers', 'Electronics > Networking > Bridges & Routers', 0, 1),
(4684, 4684, 1203, 'Wireless Access Points', 'Electronics > Networking > Bridges & Routers', 0, 1),
(4685, 4685, 1203, 'Wireless Routers', 'Electronics > Networking > Bridges & Routers', 0, 1),
(4686, 4686, 1227, 'Printer Stands', 'Electronics > Print, Copy, Scan & Fax Accessories > Printer Accessories', 0, 1),
(4687, 4687, 1261, 'TV Scan Converters', 'Electronics > Video > Video Accessories > Television Accessories', 0, 1),
(4688, 4688, 1261, 'Television & Monitor Mounts', 'Electronics > Video > Video Accessories > Television Accessories', 0, 1),
(4689, 4689, 1261, 'Television Replacement Lamps', 'Electronics > Video > Video Accessories > Television Accessories', 0, 1),
(4690, 4690, 1241, 'Video Transmitters', 'Electronics > Video', 1, 1),
(4691, 4691, 4690, 'Video Senders', 'Electronics > Video > Video Transmitters', 0, 1),
(4692, 4692, 1329, 'LeapFrog', 'Electronics > Video Game Consoles > Portable Game Consoles', 0, 1),
(4693, 4693, 1912, 'Distance Meters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(4694, 4694, 1912, 'Geiger Counters', 'Hardware > Tools > Measuring Tools & Sensors', 0, 1),
(4695, 4695, 2063, 'Accessibility Furniture & Fixtures', 'Health & Beauty > Health Care > Mobility & Special Needs', 0, 1),
(4696, 4696, 2232, 'Baskets', 'Home & Garden > Decor', 0, 1),
(4697, 4697, 2242, 'Portable Alarm Clocks', 'Home & Garden > Decor > Clocks > Alarm Clocks', 0, 1),
(4698, 4698, 2285, 'Christmas Tree Skirts', 'Home & Garden > Decor > Seasonal & Holiday Decorations', 0, 1),
(4699, 4699, 2322, 'Dummy Surveillance Cameras', 'Home & Garden > Home Security', 0, 1),
(4700, 4700, 2370, 'Heating Radiators', 'Home & Garden > Household Appliances > Climate Control', 0, 1),
(4701, 4701, 2454, 'Umbrella Stands & Racks', 'Home & Garden > Household Supplies > Storage & Organization', 0, 1),
(4702, 4702, 2497, 'Sauté Pans', 'Home & Garden > Kitchen & Dining > Cookware', 0, 1),
(4703, 4703, 2844, 'Outdoor Umbrella Bases', 'Home & Garden > Lawn & Garden > Outdoor Living', 0, 1),
(4704, 4704, 2844, 'Outdoor Umbrellas & Sunshades', 'Home & Garden > Lawn & Garden > Outdoor Living', 0, 1),
(4705, 4705, 2955, 'Laptop Bags & Cases', 'Luggage & Bags > Business Bags > Electronics Bags & Cases', 0, 1),
(4706, 4706, 2955, 'Tablet PC Bags & Cases', 'Luggage & Bags > Business Bags > Electronics Bags & Cases', 0, 1),
(4707, 4707, 2998, 'Ammunition Belts', 'Mature > Weapons > Gun Accessories', 0, 1),
(4708, 4708, 3312, 'Norteño Music', 'Media > Music > World Music > Latin Music', 0, 1),
(4709, 4709, 3285, 'Raï Music', 'Media > Music > World Music', 0, 1),
(4710, 4710, 3384, 'Label Tape', 'Office Supplies > General Supplies > Labels & Tags', 0, 1),
(4711, 4711, 3781, 'Fishing & Hunting Waders', 'Sporting Goods > Outdoor Recreation > Fishing', 0, 1),
(4712, 4712, 4272, 'Car Audio', 'Vehicles & Parts > Automotive Audio & Video', 7, 1),
(4713, 4713, 4712, 'Car Amplifiers', 'Vehicles & Parts > Automotive Audio & Video > Car Audio', 0, 1),
(4714, 4714, 4712, 'Car Audio Receivers', 'Vehicles & Parts > Automotive Audio & Video > Car Audio', 1, 1),
(4715, 4715, 4714, 'Car Satellite Radios', 'Vehicles & Parts > Automotive Audio & Video > Car Audio > Car Audio Receivers', 0, 1),
(4716, 4716, 4712, 'Car CD Changers', 'Vehicles & Parts > Automotive Audio & Video > Car Audio', 0, 1),
(4717, 4717, 4712, 'Car Cassette Players', 'Vehicles & Parts > Automotive Audio & Video > Car Audio', 0, 1),
(4718, 4718, 4712, 'Car Equalizers & Crossovers', 'Vehicles & Parts > Automotive Audio & Video > Car Audio', 0, 1),
(4719, 4719, 4712, 'Car Speakers', 'Vehicles & Parts > Automotive Audio & Video > Car Audio', 0, 1),
(4720, 4720, 4712, 'Car Subwoofers', 'Vehicles & Parts > Automotive Audio & Video > Car Audio', 0, 1),
(4721, 4721, 4272, 'Car Video', 'Vehicles & Parts > Automotive Audio & Video', 2, 1),
(4722, 4722, 4721, 'Car DVD Players', 'Vehicles & Parts > Automotive Audio & Video > Car Video', 0, 1),
(4723, 4723, 4721, 'Car Video Monitors', 'Vehicles & Parts > Automotive Audio & Video > Car Video', 0, 1);

-- -----------------------------------------------------
-- Table `[|PREFIX|]google_ps_category_associations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `[|PREFIX|]google_ps_category_associations` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`google_ps_categories_id` INT(11) UNSIGNED NOT NULL,
	`categoryid` INT(11) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `idx_google_ps_ca_categoryid` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

-- -----------------------------------------------------
-- Table `[|PREFIX|]google_ps_field_mappings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `[|PREFIX|]google_ps_field_mappings` (
	`productid` INT(11) NOT NULL,
	`categoryid` INT(11) NOT NULL,
	`global_trade_item_number` VARCHAR(50) NULL,
	`manufacturer_part_number` VARCHAR(50) NULL,
	`gender` VARCHAR(6) NULL DEFAULT NULL,
	`age_group` VARCHAR(5) NULL DEFAULT NULL,
	`color` VARCHAR(100) NULL DEFAULT NULL,
	`size` VARCHAR(100) NULL DEFAULT NULL,
	`material` VARCHAR(100) NULL DEFAULT NULL,
	`pattern` VARCHAR(100) NULL DEFAULT NULL,
	`item_group_id` VARCHAR(255) NULL DEFAULT NULL,
	UNIQUE INDEX `productid` (`productid`),
	INDEX `idx_google_ps_fm_categoryid` (`categoryid`)
)
COLLATE='utf8_general_ci' ENGINE=InnoDB ROW_FORMAT=DEFAULT;
