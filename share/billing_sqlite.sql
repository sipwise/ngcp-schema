PRAGMA foreign_keys=OFF;
CREATE TABLE "billing"."admins" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "login" varchar(31) NOT NULL,
  "md5pass" char(32) DEFAULT NULL,
  "is_master" integer NOT NULL DEFAULT '0',
  "is_superuser" integer NOT NULL DEFAULT '0',
  "is_active" integer NOT NULL DEFAULT '1',
  "read_only" integer NOT NULL DEFAULT '0',
  "show_passwords" integer NOT NULL DEFAULT '1',
  "call_data" integer NOT NULL DEFAULT '0',
  "lawful_intercept" integer NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
  CONSTRAINT "a_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."admins" VALUES(1,1,'administrator','200ceb26807d6bf99fd6f4f0d1ca54d4',1,1,1,0,1,1,1);
INSERT INTO "billing"."admins" VALUES(2,3,'administrator2','200ceb26807d6bf99fd6f4f0d1ca54d4',0,0,1,0,1,1,0);
INSERT INTO "billing"."admins" VALUES(3,4,'Defaultreseller0133','29b4bf1bff4398e0fabe65c034ff941b',0,0,1,0,1,1,0);
INSERT INTO "billing"."admins" VALUES(4,5,'Defaultreseller0526','29b4bf1bff4398e0fabe65c034ff941b',0,0,1,0,1,1,0);
INSERT INTO "billing"."admins" VALUES(5,6,'Defaultreseller3991','29b4bf1bff4398e0fabe65c034ff941b',0,0,1,0,1,1,0);
CREATE TABLE "billing"."billing_fees" (
  "id" integer  NOT NULL ,
  "billing_profile_id" integer  NOT NULL,
  "billing_zone_id" integer  DEFAULT NULL,
  "source" varchar(255) NOT NULL DEFAULT '.',
  "destination" varchar(255) NOT NULL,
  "direction" text  NOT NULL DEFAULT 'out',
  "type" text  NOT NULL DEFAULT 'call',
  "onpeak_init_rate" double NOT NULL DEFAULT '0',
  "onpeak_init_interval" integer  NOT NULL DEFAULT '0',
  "onpeak_follow_rate" double NOT NULL DEFAULT '0',
  "onpeak_follow_interval" integer  NOT NULL DEFAULT '0',
  "offpeak_init_rate" double NOT NULL DEFAULT '0',
  "offpeak_init_interval" integer  NOT NULL DEFAULT '0',
  "offpeak_follow_rate" double NOT NULL DEFAULT '0',
  "offpeak_follow_interval" integer  NOT NULL DEFAULT '0',
  "use_free_time" integer NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
  CONSTRAINT "b_f_bilprofid_ref" FOREIGN KEY ("billing_profile_id") REFERENCES "billing_profiles" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "b_f_zoneid_ref" FOREIGN KEY ("billing_zone_id") REFERENCES "billing_zones" ("id") ON UPDATE CASCADE
);
INSERT INTO "billing"."billing_fees" VALUES(1,1,1,'.','.*','out','call',0.0,600,0.0,600,0.0,600,0.0,600,0);
CREATE TABLE "billing"."billing_fees_history" (
  "id" integer  NOT NULL ,
  "bf_id" integer  DEFAULT NULL,
  "billing_profile_id" integer  NOT NULL,
  "billing_zones_history_id" integer  DEFAULT NULL,
  "source" varchar(255) NOT NULL DEFAULT '.',
  "destination" varchar(255) NOT NULL,
  "direction" text  NOT NULL DEFAULT 'out',
  "type" text  NOT NULL DEFAULT 'call',
  "onpeak_init_rate" double NOT NULL DEFAULT '0',
  "onpeak_init_interval" integer  NOT NULL DEFAULT '0',
  "onpeak_follow_rate" double NOT NULL DEFAULT '0',
  "onpeak_follow_interval" integer  NOT NULL DEFAULT '0',
  "offpeak_init_rate" double NOT NULL DEFAULT '0',
  "offpeak_init_interval" integer  NOT NULL DEFAULT '0',
  "offpeak_follow_rate" double NOT NULL DEFAULT '0',
  "offpeak_follow_interval" integer  NOT NULL DEFAULT '0',
  "use_free_time" integer NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
  CONSTRAINT "b_f_h_bfid_ref" FOREIGN KEY ("bf_id") REFERENCES "billing_fees" ("id") ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT "b_f_h_bzhid_ref" FOREIGN KEY ("billing_zones_history_id") REFERENCES "billing_zones_history" ("id") ON UPDATE CASCADE
);
INSERT INTO "billing"."billing_fees_history" VALUES(1,1,1,1,'.','.*','out','call',0.0,600,0.0,600,0.0,600,0.0,600,0);
INSERT INTO "billing"."billing_fees_history" VALUES(2,NULL,2,2,'.*','.+','out','call',0.0,60,0.0,60,0.0,60,0.0,60,0);
INSERT INTO "billing"."billing_fees_history" VALUES(3,NULL,2,3,'.*','.+','out','call',0.0,60,0.0,60,0.0,60,0.0,60,0);
CREATE TABLE "billing"."billing_mappings" (
  "id" integer  NOT NULL ,
  "start_date" datetime DEFAULT NULL,
  "end_date" datetime DEFAULT NULL,
  "billing_profile_id" integer  DEFAULT NULL,
  "contract_id" integer  NOT NULL,
  "product_id" integer  DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "b_m_bilprofid_ref" FOREIGN KEY ("billing_profile_id") REFERENCES "billing_profiles" ("id") ON UPDATE CASCADE,
  CONSTRAINT "b_m_contractid_ref" FOREIGN KEY ("contract_id") REFERENCES "contracts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "b_m_productid_ref" FOREIGN KEY ("product_id") REFERENCES "products" ("id") ON UPDATE CASCADE
);
INSERT INTO "billing"."billing_mappings" VALUES(1,NULL,NULL,NULL,1,3);
INSERT INTO "billing"."billing_mappings" VALUES(2,NULL,NULL,1,2,4);
INSERT INTO "billing"."billing_mappings" VALUES(3,NULL,NULL,1,3,2);
INSERT INTO "billing"."billing_mappings" VALUES(4,NULL,NULL,1,4,4);
INSERT INTO "billing"."billing_mappings" VALUES(5,'2013-08-07 17:57:36',NULL,1,5,3);
INSERT INTO "billing"."billing_mappings" VALUES(6,'2013-08-29 12:49:56',NULL,1,6,3);
INSERT INTO "billing"."billing_mappings" VALUES(7,'2013-08-29 12:50:00',NULL,1,7,3);
INSERT INTO "billing"."billing_mappings" VALUES(8,'2013-08-29 12:50:03',NULL,1,8,3);
INSERT INTO "billing"."billing_mappings" VALUES(9,NULL,NULL,1,9,NULL);
INSERT INTO "billing"."billing_mappings" VALUES(13,NULL,NULL,1,13,NULL);
INSERT INTO "billing"."billing_mappings" VALUES(14,NULL,NULL,2,14,2);
INSERT INTO "billing"."billing_mappings" VALUES(15,NULL,NULL,1,15,2);
CREATE TABLE "billing"."billing_peaktime_special" (
  "id" integer  NOT NULL ,
  "billing_profile_id" integer  NOT NULL,
  "start" datetime DEFAULT NULL,
  "end" datetime DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "b_p_s_bilprofid_ref" FOREIGN KEY ("billing_profile_id") REFERENCES "billing_profiles" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."billing_peaktime_special" VALUES(1,1,'2013-06-06 18:00:00','2013-06-06 06:00:00');
CREATE TABLE "billing"."billing_peaktime_weekdays" (
  "id" integer  NOT NULL ,
  "billing_profile_id" integer  NOT NULL,
  "weekday" integer  NOT NULL,
  "start" time DEFAULT NULL,
  "end" time DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "b_p_w_bilprofid_ref" FOREIGN KEY ("billing_profile_id") REFERENCES "billing_profiles" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."billing_profiles" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "handle" varchar(63) NOT NULL,
  "name" varchar(31) NOT NULL,
  "prepaid" integer NOT NULL DEFAULT '0',
  "interval_charge" double NOT NULL DEFAULT '0',
  "interval_free_time" integer NOT NULL DEFAULT '0',
  "interval_free_cash" double NOT NULL DEFAULT '0',
  "interval_unit" text  NOT NULL DEFAULT 'month',
  "interval_count" integer  NOT NULL DEFAULT '1',
  "fraud_interval_limit" integer  DEFAULT NULL,
  "fraud_interval_lock" integer  DEFAULT NULL,
  "fraud_interval_notify" varchar(255) DEFAULT NULL,
  "fraud_daily_limit" integer  DEFAULT NULL,
  "fraud_daily_lock" integer  DEFAULT NULL,
  "fraud_daily_notify" varchar(255) DEFAULT NULL,
  "currency" varchar(31) DEFAULT NULL,
  "vat_rate" integer  DEFAULT NULL,
  "vat_included" integer NOT NULL DEFAULT '1',
  PRIMARY KEY ("id")
  CONSTRAINT "b_p_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."billing_profiles" VALUES(1,1,'default','Default Billing Profile',0,0.0,0,0.0,'month',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
INSERT INTO "billing"."billing_profiles" VALUES(2,1,'mytestprofile','mytestprofile',0,3.2,0,0.0,'month',1,NULL,1,NULL,NULL,0,NULL,NULL,NULL,0);
CREATE TABLE "billing"."billing_zones" (
  "id" integer  NOT NULL ,
  "billing_profile_id" integer  NOT NULL,
  "zone" varchar(127) NOT NULL,
  "detail" varchar(127) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "b_z_profileid_ref" FOREIGN KEY ("billing_profile_id") REFERENCES "billing_profiles" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."billing_zones" VALUES(1,1,'Free Default Zone','All Destinations');
CREATE TABLE "billing"."billing_zones_history" (
  "id" integer  NOT NULL ,
  "bz_id" integer  DEFAULT NULL,
  "billing_profile_id" integer  NOT NULL,
  "zone" varchar(127) NOT NULL,
  "detail" varchar(127) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "b_z_h_bzid_ref" FOREIGN KEY ("bz_id") REFERENCES "billing_zones" ("id") ON DELETE SET NULL ON UPDATE NO ACTION
);
INSERT INTO "billing"."billing_zones_history" VALUES(1,1,1,'Free Default Zone','All Destinations');
INSERT INTO "billing"."billing_zones_history" VALUES(2,NULL,2,'testingzone','testingdetail');
INSERT INTO "billing"."billing_zones_history" VALUES(3,NULL,2,'testingzone','testingdetail');
CREATE TABLE "billing"."contacts" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "gender" text  DEFAULT NULL,
  "firstname" varchar(127) DEFAULT NULL,
  "lastname" varchar(127) DEFAULT NULL,
  "comregnum" varchar(31) DEFAULT NULL,
  "company" varchar(127) DEFAULT NULL,
  "street" varchar(127) DEFAULT NULL,
  "postcode" integer DEFAULT NULL,
  "city" varchar(127) DEFAULT NULL,
  "country" char(2) DEFAULT NULL,
  "phonenumber" varchar(31) DEFAULT NULL,
  "mobilenumber" varchar(31) DEFAULT NULL,
  "email" varchar(255) DEFAULT NULL,
  "newsletter" integer NOT NULL DEFAULT '0',
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "faxnumber" varchar(31) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "ct_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."contacts" VALUES(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-28 12:20:00','2013-06-28 12:20:00',NULL);
INSERT INTO "billing"."contacts" VALUES(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default-customerdefault.invalid',0,'2013-08-07 14:28:48','0000-00-00 00:00:00',NULL);
INSERT INTO "billing"."contacts" VALUES(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'fertertefoo.com',0,'2013-08-07 14:29:42','0000-00-00 00:00:00',NULL);
INSERT INTO "billing"."contacts" VALUES(4,NULL,NULL,'Default','Contact',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default_contactexample.invalid',0,'2013-08-07 17:57:36','2013-08-07 15:57:36',NULL);
INSERT INTO "billing"."contacts" VALUES(5,NULL,NULL,'Default','Contact',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default_contactexample.invalid',0,'2013-08-29 12:49:56','2013-08-29 10:49:56',NULL);
INSERT INTO "billing"."contacts" VALUES(6,NULL,NULL,'Default','Contact',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default_contactexample.invalid',0,'2013-08-29 12:50:00','2013-08-29 10:50:00',NULL);
INSERT INTO "billing"."contacts" VALUES(7,NULL,NULL,'Default','Contact',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default_contactexample.invalid',0,'2013-08-29 12:50:03','2013-08-29 10:50:03',NULL);
INSERT INTO "billing"."contacts" VALUES(8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-09-06 12:50:07','2013-09-06 12:50:07',NULL);
INSERT INTO "billing"."contacts" VALUES(12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-09-06 13:17:42','2013-09-06 13:17:42',NULL);
CREATE TABLE "billing"."contract_balances" (
  "id" integer  NOT NULL ,
  "contract_id" integer  NOT NULL,
  "cash_balance" double DEFAULT NULL,
  "cash_balance_interval" double NOT NULL DEFAULT '0',
  "free_time_balance" integer DEFAULT NULL,
  "free_time_balance_interval" integer NOT NULL DEFAULT '0',
  "start" datetime NOT NULL,
  "end" datetime NOT NULL,
  "invoice_id" integer  DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "cb_invoiceid_ref" FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "c_b_contractid_ref" FOREIGN KEY ("contract_id") REFERENCES "contracts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."contract_balances" VALUES(1,2,0.0,0.0,0,0,'2013-07-01 00:00:00','2013-07-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(2,3,0.0,0.0,0,0,'2013-07-01 00:00:00','2013-07-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(3,4,0.0,0.0,0,0,'2013-08-01 00:00:00','2013-08-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(4,5,0.0,0.0,0,0,'2013-08-01 00:00:00','2013-08-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(5,2,0.0,0.0,0,0,'2013-08-01 00:00:00','2013-08-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(6,6,0.0,0.0,0,0,'2013-08-01 00:00:00','2013-08-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(7,7,0.0,0.0,0,0,'2013-08-01 00:00:00','2013-08-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(8,8,0.0,0.0,0,0,'2013-08-01 00:00:00','2013-08-31 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(9,2,0.0,0.0,0,0,'2013-09-01 00:00:00','2013-09-30 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(10,9,0.0,0.0,0,0,'2013-09-01 00:00:00','2013-09-30 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(14,13,0.0,0.0,0,0,'2013-09-01 00:00:00','2013-09-30 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(15,14,0.0,0.0,0,0,'2013-09-01 00:00:00','2013-09-30 23:59:59',NULL);
INSERT INTO "billing"."contract_balances" VALUES(16,15,0.0,0.0,0,0,'2013-09-01 00:00:00','2013-09-30 23:59:59',NULL);
CREATE TABLE "billing"."contract_credits" (
  "id" integer  NOT NULL ,
  "balance_id" integer  NOT NULL,
  "state" text  NOT NULL DEFAULT 'init',
  "amount" double DEFAULT NULL,
  "reason" text,
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("id")
  CONSTRAINT "cc_balanceid_ref" FOREIGN KEY ("balance_id") REFERENCES "contract_balances" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."contract_fraud_preferences" (
  "id" integer  NOT NULL ,
  "contract_id" integer  NOT NULL,
  "fraud_interval_limit" integer  DEFAULT NULL,
  "fraud_interval_lock" integer  DEFAULT NULL,
  "fraud_interval_notify" varchar(255) DEFAULT NULL,
  "fraud_daily_limit" integer  DEFAULT NULL,
  "fraud_daily_lock" integer  DEFAULT NULL,
  "fraud_daily_notify" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "contract_id_ref" FOREIGN KEY ("contract_id") REFERENCES "contracts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."contract_registers" (
  "id" integer  NOT NULL ,
  "contract_id" integer  NOT NULL,
  "actor" varchar(15) DEFAULT NULL,
  "type" varchar(31) NOT NULL,
  "data" text,
  PRIMARY KEY ("id")
  CONSTRAINT "c_r_contractid_ref" FOREIGN KEY ("contract_id") REFERENCES "contracts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."contracts" (
  "id" integer  NOT NULL ,
  "customer_id" integer  DEFAULT NULL,
  "contact_id" integer  DEFAULT NULL,
  "order_id" integer  DEFAULT NULL,
  "status" text  NOT NULL DEFAULT 'active',
  "external_id" varchar(255) DEFAULT NULL,
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "activate_timestamp" timestamp NULL DEFAULT NULL,
  "terminate_timestamp" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "co_contactid_ref" FOREIGN KEY ("contact_id") REFERENCES "contacts" ("id") ON UPDATE CASCADE,
  CONSTRAINT "co_orderid_ref" FOREIGN KEY ("order_id") REFERENCES "orders" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "c_customerid_ref" FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."contracts" VALUES(1,NULL,1,NULL,'active',NULL,'2013-06-28 12:20:00','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL);
INSERT INTO "billing"."contracts" VALUES(2,NULL,1,NULL,'active',NULL,'2013-07-05 15:13:39','0000-00-00 00:00:00',NULL,NULL);
INSERT INTO "billing"."contracts" VALUES(3,NULL,1,NULL,'active',NULL,'2013-07-05 16:20:26','0000-00-00 00:00:00',NULL,NULL);
INSERT INTO "billing"."contracts" VALUES(4,NULL,3,NULL,'active','','2013-08-07 14:29:48','0000-00-00 00:00:00',NULL,NULL);
INSERT INTO "billing"."contracts" VALUES(5,NULL,4,NULL,'active',NULL,'2013-08-07 17:57:36','2013-08-07 15:57:36','2013-08-07 15:57:36',NULL);
INSERT INTO "billing"."contracts" VALUES(6,NULL,5,NULL,'active',NULL,'2013-08-29 12:49:56','2013-08-29 10:49:56','2013-08-29 10:49:56',NULL);
INSERT INTO "billing"."contracts" VALUES(7,NULL,6,NULL,'active',NULL,'2013-08-29 12:50:00','2013-08-29 10:50:00','2013-08-29 10:50:00',NULL);
INSERT INTO "billing"."contracts" VALUES(8,NULL,7,NULL,'active',NULL,'2013-08-29 12:50:03','2013-08-29 10:50:03','2013-08-29 10:50:03',NULL);
INSERT INTO "billing"."contracts" VALUES(9,NULL,8,NULL,'active',NULL,'2013-09-06 12:50:07','2013-09-06 12:50:07','2013-09-06 12:50:07',NULL);
INSERT INTO "billing"."contracts" VALUES(13,NULL,12,NULL,'active',NULL,'2013-09-06 13:17:42','2013-09-06 13:17:42','2013-09-06 13:17:42',NULL);
INSERT INTO "billing"."contracts" VALUES(14,NULL,1,NULL,'active','','2013-09-09 10:30:45','0000-00-00 00:00:00',NULL,NULL);
INSERT INTO "billing"."contracts" VALUES(15,NULL,1,NULL,'active','','2013-09-09 10:35:33','0000-00-00 00:00:00',NULL,NULL);
CREATE TABLE "billing"."credit_payments" (
  "id" integer  NOT NULL ,
  "credit_id" integer  NOT NULL,
  "payment_id" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "cp_creditid_ref" FOREIGN KEY ("credit_id") REFERENCES "contract_credits" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "cp_paymentid_ref" FOREIGN KEY ("payment_id") REFERENCES "payments" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."customer_registers" (
  "id" integer  NOT NULL ,
  "customer_id" integer  NOT NULL,
  "actor" varchar(15) DEFAULT NULL,
  "type" varchar(31) NOT NULL,
  "data" text,
  PRIMARY KEY ("id")
  CONSTRAINT "c_r_customerid_ref" FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."customers" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "shopuser" varchar(31) DEFAULT NULL,
  "shoppass" varchar(31) DEFAULT NULL,
  "business" integer NOT NULL DEFAULT '0',
  "contact_id" integer  DEFAULT NULL,
  "tech_contact_id" integer  DEFAULT NULL,
  "comm_contact_id" integer  DEFAULT NULL,
  "external_id" varchar(255) DEFAULT NULL,
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("id")
  CONSTRAINT "cu_commcontactid_ref" FOREIGN KEY ("comm_contact_id") REFERENCES "contacts" ("id") ON UPDATE CASCADE,
  CONSTRAINT "cu_contactid_ref" FOREIGN KEY ("contact_id") REFERENCES "contacts" ("id") ON UPDATE CASCADE,
  CONSTRAINT "cu_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON UPDATE CASCADE,
  CONSTRAINT "cu_techcontact_ref" FOREIGN KEY ("tech_contact_id") REFERENCES "contacts" ("id") ON UPDATE CASCADE
);
CREATE TABLE "billing"."domain_resellers" (
  "id" integer  NOT NULL ,
  "domain_id" integer  NOT NULL,
  "reseller_id" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "dr_domainid_ref" FOREIGN KEY ("domain_id") REFERENCES "domains" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "dr_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."domain_resellers" VALUES(1,1,1);
INSERT INTO "billing"."domain_resellers" VALUES(3,3,1);
INSERT INTO "billing"."domain_resellers" VALUES(4,4,3);
INSERT INTO "billing"."domain_resellers" VALUES(5,5,1);
INSERT INTO "billing"."domain_resellers" VALUES(6,6,1);
CREATE TABLE "billing"."domains" (
  "id" integer  NOT NULL ,
  "domain" varchar(127) NOT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "billing"."domains" VALUES(1,'gjungwirth.de');
INSERT INTO "billing"."domains" VALUES(3,'1.2.3.4');
INSERT INTO "billing"."domains" VALUES(4,'reseller.com');
INSERT INTO "billing"."domains" VALUES(5,'192.168.51.45');
INSERT INTO "billing"."domains" VALUES(6,'test.com');
CREATE TABLE "billing"."invoices" (
  "id" integer  NOT NULL ,
  "year" integer  NOT NULL,
  "month" integer  NOT NULL,
  "serial" integer  NOT NULL,
  "data" blob,
  PRIMARY KEY ("id")
);
CREATE TABLE "billing"."lnp_numbers" (
  "id" integer  NOT NULL ,
  "number" varchar(31) NOT NULL,
  "lnp_provider_id" integer  NOT NULL,
  "start" datetime DEFAULT NULL,
  "end" datetime DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "l_n_lnpproid_ref" FOREIGN KEY ("lnp_provider_id") REFERENCES "lnp_providers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."lnp_providers" (
  "id" integer  NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "billing"."ncos_levels" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "level" varchar(31) NOT NULL,
  "mode" text  NOT NULL DEFAULT 'blacklist',
  "local_ac" integer NOT NULL DEFAULT '0',
  "description" text,
  PRIMARY KEY ("id")
  CONSTRAINT "c_l_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."ncos_levels" VALUES(1,NULL,'newadminlevel','whitelist',1,'fsdgj');
INSERT INTO "billing"."ncos_levels" VALUES(2,1,'dasdasbaaa','blacklist',0,'blabla');
INSERT INTO "billing"."ncos_levels" VALUES(3,1,'sadasd','blacklist',0,'fsdgj');
INSERT INTO "billing"."ncos_levels" VALUES(4,3,'sadasd','blacklist',0,'fsdgj');
CREATE TABLE "billing"."ncos_lnp_list" (
  "id" integer  NOT NULL ,
  "ncos_level_id" integer  NOT NULL,
  "lnp_provider_id" integer  NOT NULL,
  "description" text,
  PRIMARY KEY ("id")
  CONSTRAINT "c_l_l_lnpproid_ref" FOREIGN KEY ("lnp_provider_id") REFERENCES "lnp_providers" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "c_l_l_ncoslevid_ref" FOREIGN KEY ("ncos_level_id") REFERENCES "ncos_levels" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."ncos_pattern_list" (
  "id" integer  NOT NULL ,
  "ncos_level_id" integer  NOT NULL,
  "pattern" varchar(255) NOT NULL,
  "description" text,
  PRIMARY KEY ("id")
  CONSTRAINT "c_p_l_ncoslevid_ref" FOREIGN KEY ("ncos_level_id") REFERENCES "ncos_levels" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."ncos_pattern_list" VALUES(2,1,'ünicödßß','fsdfsd');
CREATE TABLE "billing"."order_payments" (
  "id" integer  NOT NULL ,
  "order_id" integer  NOT NULL,
  "payment_id" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "op_orderid_ref" FOREIGN KEY ("order_id") REFERENCES "orders" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "op_paymentid_ref" FOREIGN KEY ("payment_id") REFERENCES "payments" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."orders" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "customer_id" integer  DEFAULT NULL,
  "delivery_contact_id" integer  DEFAULT NULL,
  "type" varchar(31) DEFAULT NULL,
  "state" text  NOT NULL DEFAULT 'init',
  "value" integer DEFAULT NULL,
  "shipping_costs" integer DEFAULT NULL,
  "invoice_id" integer  DEFAULT NULL,
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "complete_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("id")
  CONSTRAINT "o_contactid_ref" FOREIGN KEY ("delivery_contact_id") REFERENCES "contacts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "o_customerid_ref" FOREIGN KEY ("customer_id") REFERENCES "customers" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "o_invoiceid_ref" FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "o_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."payments" (
  "id" integer  NOT NULL ,
  "amount" integer DEFAULT NULL,
  "type" varchar(31) DEFAULT NULL,
  "state" text  DEFAULT NULL,
  "mpaytid" integer  DEFAULT NULL,
  "status" varchar(31) DEFAULT NULL,
  "errno" integer DEFAULT NULL,
  "returncode" varchar(63) DEFAULT NULL,
  "externalstatus" text,
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY ("id")
);
CREATE TABLE "billing"."products" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "class" text  NOT NULL,
  "handle" varchar(63) NOT NULL,
  "name" varchar(127) NOT NULL,
  "on_sale" integer NOT NULL DEFAULT '0',
  "price" double DEFAULT NULL,
  "weight" integer  DEFAULT NULL,
  "billing_profile_id" integer  DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "p_bilprofid_ref" FOREIGN KEY ("billing_profile_id") REFERENCES "billing_profiles" ("id") ON UPDATE CASCADE,
  CONSTRAINT "p_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."products" VALUES(1,NULL,'pstnpeering','PSTN_PEERING','PSTN Peering',1,NULL,NULL,NULL);
INSERT INTO "billing"."products" VALUES(2,NULL,'sippeering','SIP_PEERING','SIP Peering',1,NULL,NULL,NULL);
INSERT INTO "billing"."products" VALUES(3,NULL,'reseller','VOIP_RESELLER','VoIP Reseller',1,NULL,NULL,NULL);
INSERT INTO "billing"."products" VALUES(4,NULL,'sipaccount','SIP_ACCOUNT','Basic SIP Account',1,NULL,NULL,NULL);
INSERT INTO "billing"."products" VALUES(5,NULL,'pbxaccount','PBX_ACCOUNT','Cloud PBX Account',1,NULL,NULL,NULL);
CREATE TABLE "billing"."resellers" (
  "id" integer  NOT NULL ,
  "contract_id" integer  NOT NULL,
  "name" varchar(63) NOT NULL,
  "status" text  NOT NULL DEFAULT 'active',
  PRIMARY KEY ("id")
  CONSTRAINT "r_contractid_ref" FOREIGN KEY ("contract_id") REFERENCES "contracts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "billing"."resellers" VALUES(1,1,'default','active');
INSERT INTO "billing"."resellers" VALUES(2,2,'€€','active');
INSERT INTO "billing"."resellers" VALUES(3,5,'Default reseller6510','active');
INSERT INTO "billing"."resellers" VALUES(4,6,'Default reseller0133','active');
INSERT INTO "billing"."resellers" VALUES(5,7,'Default reseller0526','active');
INSERT INTO "billing"."resellers" VALUES(6,8,'Default reseller3991','active');
CREATE TABLE "billing"."voip_intercept" (
  "id" integer  NOT NULL ,
  "reseller_id" integer  DEFAULT NULL,
  "LIID" integer  DEFAULT NULL,
  "number" varchar(63) DEFAULT NULL,
  "cc_required" integer NOT NULL DEFAULT '0',
  "delivery_host" varchar(15) DEFAULT NULL,
  "delivery_port" integer  DEFAULT NULL,
  "delivery_user" text,
  "delivery_pass" text,
  "modify_timestamp" timestamp NOT NULL ,
  "create_timestamp" timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  "deleted" integer NOT NULL DEFAULT '0',
  "uuid" varchar(255) DEFAULT NULL,
  "sip_username" varchar(255) DEFAULT NULL,
  "sip_domain" varchar(255) DEFAULT NULL,
  "cc_delivery_host" varchar(64) DEFAULT NULL,
  "cc_delivery_port" integer DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "vi_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."voip_number_block_resellers" (
  "id" integer  NOT NULL ,
  "number_block_id" integer  NOT NULL,
  "reseller_id" integer  NOT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "vnbr_numblockid_ref" FOREIGN KEY ("number_block_id") REFERENCES "voip_number_blocks" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "vnbr_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "billing"."voip_number_blocks" (
  "id" integer  NOT NULL ,
  "cc" integer  NOT NULL,
  "ac" varchar(7) NOT NULL,
  "sn_prefix" varchar(31) NOT NULL,
  "sn_length" integer  NOT NULL,
  "allocable" integer NOT NULL DEFAULT '0',
  "authoritative" integer NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE TABLE "billing"."voip_numbers" (
  "id" integer  NOT NULL ,
  "cc" integer  NOT NULL,
  "ac" varchar(7) NOT NULL,
  "sn" varchar(31) NOT NULL,
  "reseller_id" integer  DEFAULT NULL,
  "subscriber_id" integer  DEFAULT NULL,
  "status" text  NOT NULL DEFAULT 'active',
  "ported" integer NOT NULL DEFAULT '0',
  "list_timestamp" timestamp NOT NULL ,
  PRIMARY KEY ("id")
  CONSTRAINT "v_n_resellerid_ref" FOREIGN KEY ("reseller_id") REFERENCES "resellers" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT "v_n_subscriberid_ref" FOREIGN KEY ("subscriber_id") REFERENCES "voip_subscribers" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "billing"."voip_numbers" VALUES(1,44,'55','3333',1,1,'active',0,'2013-08-21 06:48:01');
INSERT INTO "billing"."voip_numbers" VALUES(3,44,'55','6666',1,2,'active',0,'2013-08-21 07:01:14');
INSERT INTO "billing"."voip_numbers" VALUES(4,99,'99','9999',NULL,1,'active',0,'2013-08-29 12:09:08');
INSERT INTO "billing"."voip_numbers" VALUES(5,77,'77','77777',NULL,1,'active',0,'2013-08-29 12:09:08');
INSERT INTO "billing"."voip_numbers" VALUES(6,11,'11','11111',NULL,6,'active',1,'2013-09-06 12:50:07');
INSERT INTO "billing"."voip_numbers" VALUES(7,11,'11','11112',NULL,7,'active',1,'2013-09-06 13:17:42');
CREATE TABLE "billing"."voip_subscribers" (
  "id" integer  NOT NULL ,
  "contract_id" integer  NOT NULL,
  "uuid" char(36) NOT NULL,
  "username" varchar(127) NOT NULL,
  "domain_id" integer  NOT NULL,
  "status" text  NOT NULL DEFAULT 'active',
  "primary_number_id" integer  DEFAULT NULL,
  "external_id" varchar(255) DEFAULT NULL,
  PRIMARY KEY ("id")
  CONSTRAINT "v_s_contractid_ref" FOREIGN KEY ("contract_id") REFERENCES "contracts" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "v_s_domainid_ref" FOREIGN KEY ("domain_id") REFERENCES "domains" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "v_s_pnumid_ref" FOREIGN KEY ("primary_number_id") REFERENCES "voip_numbers" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "billing"."voip_subscribers" VALUES(1,4,'fc5d299b-6940-47f0-ba1e-1ae5e43c339a','cdfdsfdsgf',3,'active',1,NULL);
INSERT INTO "billing"."voip_subscribers" VALUES(2,4,'17de3c68-3fd5-4d7d-aff8-b374c6fe36fe','jklkjljö',3,'active',3,NULL);
INSERT INTO "billing"."voip_subscribers" VALUES(3,4,'278ee25b-27c2-4a7b-82a7-b5769c2be718','alice',5,'active',NULL,NULL);
INSERT INTO "billing"."voip_subscribers" VALUES(4,4,'f1d40d7a-8f44-4cc9-86f6-18f06b89eab8','bob',5,'active',NULL,NULL);
INSERT INTO "billing"."voip_subscribers" VALUES(5,2,'bccdc18a-9a19-49fd-8625-f01e0406b1f9','kjölkjö',1,'terminated',NULL,NULL);
INSERT INTO "billing"."voip_subscribers" VALUES(6,9,'6e41c627-d81f-4451-9c36-4674cb0acdd1','1111111',6,'active',6,NULL);
INSERT INTO "billing"."voip_subscribers" VALUES(7,13,'fe313b72-3028-4c6a-9a69-d3638d25d99f','new',6,'active',7,NULL);
