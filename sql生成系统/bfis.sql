/*
 Navicat Premium Data Transfer

 Source Server         : base_UAT
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : rm-uf6q399xr318op2v8ao.mysql.rds.aliyuncs.com:3306
 Source Schema         : bfis

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 14/05/2025 19:07:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bf_no_order_advance_payment_form_normal_payment
-- ----------------------------
DROP TABLE IF EXISTS `bf_no_order_advance_payment_form_normal_payment`;
CREATE TABLE `bf_no_order_advance_payment_form_normal_payment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `form_pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款单支付方式,1普通支付',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单',
  `detail_no` varchar(100) NOT NULL DEFAULT '' COMMENT '明细单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `amount` decimal(12,2) NOT NULL COMMENT '金额',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消',
  `pay_time` datetime DEFAULT NULL COMMENT '支付状态时间',
  `pay_state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `index_corp_id` (`corp_id`),
  KEY `index_payment_form_id` (`payment_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='无订单垫付-付款单-无订单常规请款缴费-明细';

-- ----------------------------
-- Table structure for bf_no_order_advance_payment_form_payment_apply
-- ----------------------------
DROP TABLE IF EXISTS `bf_no_order_advance_payment_form_payment_apply`;
CREATE TABLE `bf_no_order_advance_payment_form_payment_apply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `form_pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款单支付方式,1普通支付',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单',
  `detail_no` varchar(100) NOT NULL DEFAULT '' COMMENT '明细单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '客户ID',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `amount` decimal(12,2) NOT NULL COMMENT '金额',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消',
  `pay_time` datetime DEFAULT NULL COMMENT '支付状态时间',
  `pay_state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `index_corp_id` (`corp_id`),
  KEY `index_payment_form_id` (`payment_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='无订单垫付-付款单-无订单垫付请款-明细';

-- ----------------------------
-- Table structure for bf_no_order_advance_payment_form_write_off
-- ----------------------------
DROP TABLE IF EXISTS `bf_no_order_advance_payment_form_write_off`;
CREATE TABLE `bf_no_order_advance_payment_form_write_off` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `form_pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款单支付方式,1普通支付',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单',
  `detail_no` varchar(100) NOT NULL DEFAULT '' COMMENT '明细单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `amount` decimal(12,2) NOT NULL COMMENT '金额',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消',
  `pay_time` datetime DEFAULT NULL COMMENT '支付状态时间',
  `pay_state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `index_corp_id` (`corp_id`),
  KEY `index_payment_form_id` (`payment_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='无订单垫付-付款单-无订单垫付核销费-明细';

-- ----------------------------
-- Table structure for bf_offline_advance_black_list
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_black_list`;
CREATE TABLE `bf_offline_advance_black_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_source` tinyint(3) unsigned NOT NULL COMMENT '垫付来源,1第三方垫付,2我司垫付',
  `advance_no` varchar(100) NOT NULL COMMENT '垫付号',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `advance_sys_source` int(11) NOT NULL COMMENT '垫付单系统来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-黑名单';

-- ----------------------------
-- Table structure for bf_offline_advance_company
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_company`;
CREATE TABLE `bf_offline_advance_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `advance_company_no` varchar(100) NOT NULL COMMENT '我司垫付号',
  `advance_company_enabled` tinyint(3) unsigned NOT NULL COMMENT '是否可用,0不可用,1可用',
  `state` tinyint(3) unsigned NOT NULL COMMENT '状态,0未生效,1已生效',
  `advance_type` tinyint(3) unsigned NOT NULL COMMENT '垫付类型/有效期,1一次性,2循环额度',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(2000) DEFAULT NULL COMMENT '客户名称',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(2000) DEFAULT NULL COMMENT '冗余项目名称',
  `advance_company_id` bigint(20) unsigned NOT NULL COMMENT '垫付公司ID',
  `advance_company_name` varchar(100) NOT NULL COMMENT '冗余公司名称',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '垫付合计金额',
  `revoke_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '撤销额度金额',
  `current_used_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '当前已使用额度金额',
  `total_used_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '累计已使用额度金额',
  `return_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已回款金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `audit_batch_no` varchar(100) NOT NULL DEFAULT '' COMMENT '审批单批次号',
  `audit_no` varchar(100) NOT NULL DEFAULT '' COMMENT '审批单号',
  `audit_template_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '审批模版id',
  `audit_terminal` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审批终端,1系统内审批,2钉钉端审批',
  `audit_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款审批状态,1待审批,2审批中,3审批通过,4审批被拒绝,5撤销,6作废',
  `audit_time` datetime DEFAULT NULL COMMENT '状态变更时间',
  `audit_by` varchar(100) DEFAULT NULL COMMENT '状态变更人',
  `audit_by_account` varchar(100) DEFAULT NULL COMMENT '状态变更人账号',
  `audit_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '变更原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `advance_sys_source` int(11) NOT NULL COMMENT '垫付单系统来源',
  `write_off_amount` decimal(12,2) DEFAULT NULL COMMENT '已核销金额',
  `write_off_ing_amount` decimal(12,2) DEFAULT NULL COMMENT '核销中金额',
  `used_ing_amount` decimal(12,2) DEFAULT NULL COMMENT '使用中金额',
  `corp_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  PRIMARY KEY (`id`),
  KEY `bf_offline_advance_company_no_IDX` (`corp_id`,`advance_company_no`),
  KEY `bf_offline_advance_company_corp_id_IDX` (`corp_id`,`audit_no`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-我司垫付';

-- ----------------------------
-- Table structure for bf_offline_advance_company_project_customer
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_company_project_customer`;
CREATE TABLE `bf_offline_advance_company_project_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `advance_company_id` bigint(20) NOT NULL COMMENT '第三方垫付ID',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '冗余项目名称',
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(2000) DEFAULT '' COMMENT '客户名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_advance_three_corp_id_IDX` (`corp_id`,`advance_company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-我司垫付-项目客户';

-- ----------------------------
-- Table structure for bf_offline_advance_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_history`;
CREATE TABLE `bf_offline_advance_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_source` tinyint(3) unsigned NOT NULL COMMENT '垫付来源,1第三方垫付,2我司垫付',
  `advance_no` varchar(100) NOT NULL COMMENT '垫付号',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '客户ID',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '冗余项目名称',
  `advance_company_id` bigint(20) unsigned DEFAULT '0' COMMENT '垫付公司ID',
  `advance_bank_account_name` varchar(100) NOT NULL DEFAULT '' COMMENT '垫付账户名称（企业名称/个人账户名称）',
  `total_amount` decimal(12,2) NOT NULL COMMENT '总额度',
  `advance_bank_no` varchar(100) NOT NULL DEFAULT '' COMMENT '垫付方银行卡号',
  `advance_bank_name` varchar(100) NOT NULL DEFAULT '' COMMENT '垫付方银行卡银行名称',
  `advance_bank_serial_number` varchar(100) NOT NULL DEFAULT '' COMMENT '垫付方银行流水号',
  `operation_type` tinyint(3) unsigned NOT NULL COMMENT '操作类型,1创建,2使用,3回款,4退回,5撤销,6核销',
  `amount` decimal(12,2) NOT NULL COMMENT '本次使用额度',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `advance_sys_source` int(11) NOT NULL COMMENT '垫付单系统来源',
  `corp_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2106 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-操作历史';

-- ----------------------------
-- Table structure for bf_offline_advance_history_back
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_history_back`;
CREATE TABLE `bf_offline_advance_history_back` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_history_id` bigint(20) unsigned NOT NULL COMMENT '操作历史ID',
  `amount` decimal(12,2) NOT NULL COMMENT '退回金额',
  `back_type` tinyint(3) unsigned NOT NULL COMMENT '退回方式,1退回银行账号,2退回未认款余额',
  `payment_form_no` varchar(100) NOT NULL DEFAULT '' COMMENT '付款单号,退回银行账号方式',
  `bill_confirm_number` varchar(100) NOT NULL DEFAULT '' COMMENT '认款编号,退回未认款余额方式',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-操作历史-退回';

-- ----------------------------
-- Table structure for bf_offline_advance_history_return
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_history_return`;
CREATE TABLE `bf_offline_advance_history_return` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_history_id` bigint(20) unsigned NOT NULL COMMENT '操作历史ID',
  `amount` decimal(12,2) NOT NULL COMMENT '回款金额',
  `bank_serial_no` varchar(100) NOT NULL COMMENT '回款银行流水号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-操作历史-回款';

-- ----------------------------
-- Table structure for bf_offline_advance_history_revoke
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_history_revoke`;
CREATE TABLE `bf_offline_advance_history_revoke` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_history_id` bigint(20) unsigned NOT NULL COMMENT '操作历史ID',
  `bill_confirm_number` varchar(100) NOT NULL DEFAULT '' COMMENT 'bill的认款号,confirm_payment_log.confirm_number',
  `amount` decimal(12,2) NOT NULL COMMENT '本次撤销金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `corp_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-操作历史-撤销';

-- ----------------------------
-- Table structure for bf_offline_advance_history_used
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_history_used`;
CREATE TABLE `bf_offline_advance_history_used` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_history_id` bigint(20) unsigned NOT NULL COMMENT '操作历史ID',
  `used_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '使用类型,1正常使用,2退款订单认款,3取消认款',
  `amount` decimal(12,2) NOT NULL COMMENT '使用金额',
  `order_no` varchar(100) NOT NULL COMMENT '大订单编号',
  `order_child_no` varchar(100) NOT NULL COMMENT '子订单',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=951 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-操作历史-使用';

-- ----------------------------
-- Table structure for bf_offline_advance_os_history_used
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_os_history_used`;
CREATE TABLE `bf_offline_advance_os_history_used` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `corp_name` varchar(100) NOT NULL COMMENT '企业名称',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_history_id` bigint(20) unsigned NOT NULL COMMENT '操作历史ID',
  `used_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '使用类型,1垫付请款使用',
  `used_project_provider_id` bigint(20) unsigned DEFAULT NULL COMMENT '使用的项目提供方ID',
  `used_project_provider_name` varchar(100) DEFAULT NULL COMMENT '使用的项目提供方名称',
  `used_customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '使用的客户ID',
  `used_customer_name` varchar(2000) DEFAULT NULL COMMENT '使用的客户名称',
  `used_project_id` bigint(20) unsigned DEFAULT NULL COMMENT '使用的项目ID',
  `used_project_name` varchar(2000) DEFAULT NULL COMMENT '使用的冗余项目名称',
  `used_apply_task_name` varchar(2000) DEFAULT NULL COMMENT '使用的任务名称',
  `used_product_id` bigint(20) unsigned DEFAULT NULL COMMENT '使用的产品ID',
  `used_product_name` varchar(2000) DEFAULT NULL COMMENT '使用的产品名称',
  `business_type` varchar(100) NOT NULL COMMENT '使用的业务类型,社保,残保金,社保滞纳金,社保工会费,公积金',
  `notice_no` varchar(100) NOT NULL COMMENT '通知单号',
  `amount` decimal(12,2) NOT NULL COMMENT '使用垫付额度金额',
  `used_amount` decimal(12,2) NOT NULL COMMENT '已使用金额',
  `use_ing_amount` decimal(12,2) NOT NULL COMMENT '使用中金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_advance_history_id` (`advance_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-外包-垫付-操作历史-使用';

-- ----------------------------
-- Table structure for bf_offline_advance_os_history_writeoff
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_os_history_writeoff`;
CREATE TABLE `bf_offline_advance_os_history_writeoff` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `corp_name` varchar(100) NOT NULL COMMENT '企业名称',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_history_id` bigint(20) unsigned NOT NULL COMMENT '操作历史ID',
  `os_advance_used_history_id` bigint(20) unsigned NOT NULL COMMENT '外包使用历史记录ID',
  `write_off_project_provider_id` bigint(20) unsigned DEFAULT NULL COMMENT '核销的项目提供方ID',
  `write_off_project_provider_name` varchar(100) DEFAULT NULL COMMENT '核销的项目提供方名称',
  `write_off_customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '核销的客户ID',
  `write_off_customer_name` varchar(2000) DEFAULT NULL COMMENT '核销的客户名称',
  `write_off_project_id` bigint(20) unsigned DEFAULT NULL COMMENT '核销的项目ID',
  `write_off_project_name` varchar(2000) DEFAULT NULL COMMENT '核销的冗余项目名称',
  `write_apply_task_name` varchar(2000) DEFAULT NULL COMMENT '核销的任务名称',
  `write_off_product_id` bigint(20) unsigned DEFAULT NULL COMMENT '核销的产品ID',
  `write_off_product_name` varchar(2000) DEFAULT NULL COMMENT '核销的产品名称',
  `business_type` varchar(100) NOT NULL COMMENT '业务类型,社保,残保金,社保滞纳金,社保工会费,公积金',
  `order_batch_no` varchar(100) DEFAULT NULL COMMENT '订单批次号',
  `notice_no` varchar(100) DEFAULT NULL COMMENT '通知单号',
  `amount` decimal(12,2) NOT NULL COMMENT '核销垫付额度金额',
  `write_off_amount` decimal(12,2) NOT NULL COMMENT '已核销金额',
  `write_off_ing_amount` decimal(12,2) NOT NULL COMMENT '核销中金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-外包-垫付-操作历史-核销';

-- ----------------------------
-- Table structure for bf_offline_advance_os_payment_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_os_payment_history`;
CREATE TABLE `bf_offline_advance_os_payment_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `corp_name` varchar(100) NOT NULL COMMENT '企业名称',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_source` tinyint(3) unsigned NOT NULL COMMENT '垫付来源,1第三方垫付,2我司垫付',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_payment_type` tinyint(3) unsigned NOT NULL COMMENT '付款单生成类型,1垫付请款,2核销',
  `os_advance_history_child_id` bigint(20) unsigned NOT NULL COMMENT '外包历史记录子项表ID',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单编号',
  `detail_no` varchar(100) DEFAULT NULL COMMENT '业务单号',
  `item_amount` decimal(12,2) NOT NULL COMMENT '付款单单项金额',
  `total_amount` decimal(12,2) NOT NULL COMMENT '本次付款单总金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-外包-垫付-使用-生成付款单-记录';

-- ----------------------------
-- Table structure for bf_offline_advance_return
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_return`;
CREATE TABLE `bf_offline_advance_return` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_source` tinyint(3) unsigned NOT NULL COMMENT '垫付单源头,1第三方垫付,2我司垫付',
  `input_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '输入的金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `payment_company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '付款公司ID',
  `payment_company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '付款公司名称',
  `amount` decimal(12,2) NOT NULL COMMENT '回款金额',
  `bank_no` varchar(100) NOT NULL COMMENT '银行卡号',
  `bank_name` varchar(100) NOT NULL COMMENT '银行卡银行名称',
  `unfund_amount` decimal(12,2) NOT NULL COMMENT '冗余未认款金额,最新的以bill为准',
  `bank_payment_time` datetime NOT NULL COMMENT '银行到款时间',
  `bank_ps` varchar(100) NOT NULL DEFAULT '' COMMENT '银行汇款附言',
  `bank_serial_number` varchar(100) NOT NULL COMMENT '银行流水号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-客户回款';

-- ----------------------------
-- Table structure for bf_offline_advance_revoke
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_revoke`;
CREATE TABLE `bf_offline_advance_revoke` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_source` tinyint(3) unsigned NOT NULL COMMENT '垫付单源头,1第三方垫付,2我司垫付',
  `amount` decimal(12,2) NOT NULL COMMENT '撤销额度金额',
  `bill_confirm_number` varchar(100) NOT NULL DEFAULT '' COMMENT 'bill的认款号,confirm_payment_log.confirm_number',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-撤销额度';

-- ----------------------------
-- Table structure for bf_offline_advance_three
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_three`;
CREATE TABLE `bf_offline_advance_three` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `advance_three_no` varchar(100) NOT NULL COMMENT '第三方垫付号',
  `advance_three_enabled` tinyint(3) unsigned NOT NULL COMMENT '是否可用,0不可用,1可用',
  `state` tinyint(3) unsigned NOT NULL COMMENT '状态,0未生效,1已生效',
  `advance_type` tinyint(3) unsigned NOT NULL COMMENT '垫付类型/有效期,1一次性,2循环额度',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(2000) DEFAULT NULL COMMENT '客户名称',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(2000) DEFAULT NULL COMMENT '冗余项目名称',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '垫付单备注',
  `advance_bank_no` varchar(100) NOT NULL COMMENT '垫付方银行卡号',
  `advance_bank_name` varchar(100) DEFAULT NULL COMMENT '垫付方银行卡开户行',
  `advance_bank_account_name` varchar(100) NOT NULL COMMENT '垫付方公司/个人账户名称',
  `advance_company_id` bigint(20) DEFAULT NULL COMMENT '垫付方公司id',
  `amount` decimal(12,2) NOT NULL COMMENT '本次垫付额度',
  `bank_no` varchar(100) NOT NULL COMMENT '我方收款银行卡号',
  `bank_name` varchar(100) NOT NULL COMMENT '我方收款银行卡银行名称',
  `unfund_amount` decimal(12,2) NOT NULL COMMENT '我方收款冗余未认款金额,最新的以bill为准',
  `bank_payment_time` datetime NOT NULL COMMENT '我方收款银行到款时间',
  `bank_ps` varchar(100) NOT NULL DEFAULT '' COMMENT '我方收款银行汇款附言',
  `bank_serial_number` varchar(100) NOT NULL COMMENT '我方收款银行流水号',
  `confirm_info_id` bigint(20) unsigned NOT NULL COMMENT 'bill认款id,bill.transaction_confirm_info.id',
  `revoke_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '撤销额度金额',
  `current_used_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '当前已使用额度金额',
  `total_used_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '累计已使用额度金额',
  `return_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '客户已回款金额',
  `back_bank_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '退回到银行卡金额',
  `backing_bank_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '退回中金额',
  `back_bill_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已退回给垫付方未认款余额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `advance_sys_source` int(11) NOT NULL COMMENT '垫付单系统来源',
  `corp_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  PRIMARY KEY (`id`),
  KEY `bf_offline_advance_three_corp_id_IDX` (`corp_id`,`advance_three_no`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-第三方垫付';

-- ----------------------------
-- Table structure for bf_offline_advance_three_back_bank
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_three_back_bank`;
CREATE TABLE `bf_offline_advance_three_back_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `payment_form_state` tinyint(3) unsigned NOT NULL COMMENT '付款单状态,1待审批,2审批中,3审批通过,4审批不通过/撤销,5作废',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `pay_from_bank_name` varchar(100) NOT NULL COMMENT '付款方银行名称',
  `pay_from_bank_no` varchar(100) NOT NULL COMMENT '付款方银行卡号',
  `pay_from_amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `pay_from_bank_ps` varchar(100) NOT NULL DEFAULT '' COMMENT '银行支付附言',
  `pay_to_name` varchar(100) NOT NULL COMMENT '收款方名称',
  `pay_to_bank_name` varchar(100) NOT NULL COMMENT '收款方银行名称',
  `pay_to_bank_no` varchar(100) NOT NULL COMMENT '收款方银行卡号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_advance_three_back_bank_corp_id_IDX` (`corp_id`,`payment_form_no`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-三方垫付-回退到银行卡';

-- ----------------------------
-- Table structure for bf_offline_advance_three_back_bank_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_three_back_bank_detail`;
CREATE TABLE `bf_offline_advance_three_back_bank_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `three_back_bank_id` bigint(20) unsigned NOT NULL COMMENT '退回银行卡ID',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_no` varchar(100) NOT NULL COMMENT '垫付单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目 ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `back_amount` decimal(12,2) NOT NULL COMMENT '本次退回垫付金额',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `pay_state` tinyint(3) unsigned NOT NULL COMMENT '支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_no` varchar(100) DEFAULT NULL COMMENT '支付号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_advance_three_back_bank_detail_corp_id_IDX` (`corp_id`,`three_back_bank_id`,`advance_no`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-三方垫付-回退到银行卡-付款单明细';

-- ----------------------------
-- Table structure for bf_offline_advance_three_back_bill
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_three_back_bill`;
CREATE TABLE `bf_offline_advance_three_back_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_three_id` bigint(20) unsigned NOT NULL COMMENT '三方垫付ID',
  `amount` decimal(12,2) NOT NULL COMMENT '本次退回金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `bill_confirm_number` varchar(100) NOT NULL DEFAULT '' COMMENT 'bill的认款号,confirm_payment_log.confirm_number',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `corp_id_detail_id_IDX` (`corp_id`,`bill_confirm_number`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-回退到垫付方未认款余额';

-- ----------------------------
-- Table structure for bf_offline_advance_three_project_customer
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_three_project_customer`;
CREATE TABLE `bf_offline_advance_three_project_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `advance_three_id` bigint(20) NOT NULL COMMENT '第三方垫付ID',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '冗余项目名称',
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(2000) DEFAULT '' COMMENT '客户名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_advance_three_corp_id_IDX` (`corp_id`,`advance_three_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-第三方垫付-项目客户';

-- ----------------------------
-- Table structure for bf_offline_advance_used
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_advance_used`;
CREATE TABLE `bf_offline_advance_used` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `used_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '使用类型,1正常使用,2退款订单认款,3取消认款',
  `advance_source` tinyint(3) unsigned NOT NULL COMMENT '垫付单源头,1第三方垫付,2我司垫付',
  `pledged_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `pledged_no` varchar(100) NOT NULL COMMENT '认款号',
  `amount` decimal(12,2) NOT NULL COMMENT '使用垫付额度金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=953 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-垫付-使用记录';

-- ----------------------------
-- Table structure for bf_offline_businesstype_recording_rules_config
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_businesstype_recording_rules_config`;
CREATE TABLE `bf_offline_businesstype_recording_rules_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `exist_customer_order_recording_rules` tinyint(3) unsigned NOT NULL COMMENT '有客户订单记账规则,1大订单复核通过,2大订单部分认款,3大订单全部认款',
  `not_exist_customer_order_recording_rules` tinyint(3) unsigned NOT NULL COMMENT '无客户订单记账规则,1大订单复核通过',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `update_by_name` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人名字',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_category_child_id` (`corp_id`,`category_child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-记账规则配置';

-- ----------------------------
-- Table structure for bf_offline_channel_fee_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_channel_fee_order`;
CREATE TABLE `bf_offline_channel_fee_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `bill_date` varchar(100) NOT NULL COMMENT '账单月',
  `bill_order_no` varchar(100) NOT NULL COMMENT '源订单编号',
  `order_no` varchar(100) NOT NULL COMMENT '新创建的订单编号',
  `order_cost_no` varchar(100) NOT NULL COMMENT '新创建的订单成本编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_channel_fee_order_bill_order_no_IDX` (`bill_order_no`),
  KEY `bf_offline_channel_fee_order_corp_id_IDX` (`corp_id`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-渠道费-创建订单';

-- ----------------------------
-- Table structure for bf_offline_config_bank
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_config_bank`;
CREATE TABLE `bf_offline_config_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL COMMENT '银行名称',
  `agent_bank_code` varchar(30) NOT NULL COMMENT '法人行号',
  `inst_out_code` varchar(30) NOT NULL COMMENT '联行号',
  `inst_inner_code` varchar(30) NOT NULL COMMENT '机构内标',
  `direct_bank_code` varchar(30) NOT NULL COMMENT '直参行行号',
  `ccpc_code` varchar(30) NOT NULL COMMENT 'CCPC节点编号',
  `city_code` varchar(10) NOT NULL COMMENT '城市代码',
  `category_code` varchar(20) NOT NULL COMMENT '行别代码',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_config_bank_bank_name_IDX` (`bank_name`)
) ENGINE=InnoDB AUTO_INCREMENT=148506 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-配置字典-银行支行信息,来自core_contract.inst_out_code_setting';

-- ----------------------------
-- Table structure for bf_offline_general_channel_fee_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_general_channel_fee_order`;
CREATE TABLE `bf_offline_general_channel_fee_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `bill_date` varchar(100) NOT NULL COMMENT '账单月',
  `bill_order_no` varchar(100) NOT NULL COMMENT '源订单编号',
  `order_no` varchar(100) NOT NULL COMMENT '新创建的订单编号',
  `order_cost_no` varchar(100) NOT NULL COMMENT '新创建的成本订单编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_channel_fee_order_bill_order_no_IDX` (`bill_order_no`),
  KEY `bf_offline_channel_fee_order_corp_id_IDX` (`corp_id`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-通用渠道费-创建订单';

-- ----------------------------
-- Table structure for bf_offline_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order`;
CREATE TABLE `bf_offline_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) NOT NULL COMMENT '订单编号',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_source_no` varchar(100) NOT NULL COMMENT '订单源编号',
  `order_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父订单ID',
  `order_parent_no` varchar(100) NOT NULL DEFAULT '' COMMENT '父亲订单号',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单,2退款订单,3折扣订单,4退款订单-折扣单',
  `order_flowed` tinyint(3) unsigned NOT NULL COMMENT '是否流转订单,0否,1是',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `customer_included` tinyint(4) NOT NULL COMMENT '是否有客户,0否,1是',
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `project_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '项目备注',
  `belong_date` varchar(100) NOT NULL COMMENT '所属年月',
  `account_date` varchar(100) DEFAULT NULL COMMENT '记账月,创建不能为空,可编辑空',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `city_name` varchar(100) NOT NULL DEFAULT '' COMMENT '城市：自定义输入，不需要下拉选择城市code',
  `ar_amount` decimal(12,2) DEFAULT NULL COMMENT '应收合计(Accounts Receivable),收入子订单，应收金额总计（应收为录单时录的金额），没有就用“—”，为0就是0',
  `ar_gross_amount` decimal(12,2) DEFAULT NULL COMMENT '应收(Accounts Receivable)（全额法）,收入子订单，费用类型属于全额法的，金额小计',
  `ar_net_amount` decimal(12,2) DEFAULT NULL COMMENT '应收(Accounts Receivable)（净额法）,收入子订单，费用类型属于净额法的，金额小计',
  `ap_amount` decimal(12,2) DEFAULT NULL COMMENT '应付(account payable)合计,成本子订单，应付金额总计（应付为录单时录的金额），没有就用“—”，为0就是0',
  `ap_gross_amount` decimal(12,2) DEFAULT NULL COMMENT '应付(account payable)(全额法),成本子订单，费用类型属于全额法的，金额小计',
  `ap_net_amount` decimal(12,2) DEFAULT NULL COMMENT '应付(account payable)(净额法),成本子订单，费用类型属于净额法的，金额小计',
  `order_state` tinyint(3) unsigned NOT NULL COMMENT '订单状态,1待确认,2录单中,3待复核,4复核通过,5复核不通过,6已关闭,7已取消',
  `order_state_time` datetime NOT NULL COMMENT '状态变更时间',
  `order_state_by_id` bigint(20) unsigned NOT NULL COMMENT '订单状态变更人id',
  `order_state_by_name` varchar(100) NOT NULL COMMENT '订单状态变更人姓名',
  `order_state_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '状态变动原因/备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_order_corp_id_IDX` (`corp_id`,`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=23153 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单';

-- ----------------------------
-- Table structure for bf_offline_order_cost
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_cost`;
CREATE TABLE `bf_offline_order_cost` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父订单ID',
  `order_parent_no` varchar(100) NOT NULL DEFAULT '' COMMENT '父亲订单号',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID,bf_offline_order.id',
  `order_no` varchar(100) NOT NULL COMMENT '订单表的订单号',
  `order_child_type` tinyint(4) NOT NULL COMMENT '自订单类型,1对公,2对私',
  `order_cost_no` varchar(100) NOT NULL COMMENT '子订单编号,成本订单号/退款订单号/对冲订单号',
  `order_cost_type` tinyint(3) unsigned NOT NULL COMMENT '成本订单类型,1正常订单,2退回订单,3对冲订单',
  `order_cost_state` tinyint(3) unsigned NOT NULL COMMENT '成本订单状态,1待生效,2未生效,3生效中,4已经取消',
  `parent_cost_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父成本订单ID',
  `parent_cost_no` varchar(100) NOT NULL DEFAULT '' COMMENT '父成本订单号',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `expenses_account_type` tinyint(3) unsigned NOT NULL COMMENT '记账方式 0 全额法 1净额法',
  `amount` decimal(12,2) NOT NULL COMMENT '费用金额,元,小数两位',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '冗余企业名称',
  `receive_invoice_state` tinyint(3) unsigned DEFAULT '1' COMMENT '接收发票状态,1未收票,2部分已收票,3全部已收票',
  `received_invoice_amount` decimal(12,2) DEFAULT NULL COMMENT '已收票金额',
  `receive_invoice_account` varchar(100) DEFAULT NULL COMMENT '收票操作人账号',
  `receive_invoice_time` datetime DEFAULT NULL COMMENT '收票操作时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_order_cost_UN` (`order_cost_no`,`is_deleted`),
  KEY `bf_offline_order_cost_business_corp_id_IDX` (`corp_id`,`order_id`),
  KEY `idx_orderno_expenseschildid_isdeleted` (`order_no`,`expenses_child_id`,`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4088 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-成本订单';

-- ----------------------------
-- Table structure for bf_offline_order_cost_change_account
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_cost_change_account`;
CREATE TABLE `bf_offline_order_cost_change_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID,bf_offline_order.id',
  `order_no` varchar(100) NOT NULL COMMENT '订单表的订单号',
  `parent_order_cost_id` bigint(20) unsigned NOT NULL COMMENT '父成本订单ID,bf_offline_order_cost.id',
  `parent_order_cost_no` varchar(100) NOT NULL COMMENT '父子订单编号,成本订单号',
  `change_type` tinyint(3) unsigned NOT NULL COMMENT '更换类型,1剩余可轻款金额,2更换冻结金额',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '收款公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '首款公司名称',
  `amount` decimal(12,2) NOT NULL COMMENT '费用金额,元,小数两位',
  `order_cost_id` bigint(20) unsigned NOT NULL COMMENT '新生成本订单ID,bf_offline_order_cost.id',
  `order_cost_no` varchar(100) NOT NULL COMMENT '新成本订单号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_order_cost_UN` (`parent_order_cost_no`),
  KEY `bf_offline_order_cost_business_corp_id_IDX` (`corp_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-成本订单-更换首款账号记录';

-- ----------------------------
-- Table structure for bf_offline_order_cost_refund
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_cost_refund`;
CREATE TABLE `bf_offline_order_cost_refund` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '退款订单ID',
  `order_no` varchar(100) NOT NULL COMMENT '退款订单号',
  `order_cost_refund_no` varchar(100) NOT NULL COMMENT '订单成本退款订单号',
  `order_cost_id` bigint(20) unsigned NOT NULL COMMENT '订单成本ID',
  `order_cost_no` varchar(100) NOT NULL COMMENT '订单成本订单号',
  `amount` decimal(12,2) NOT NULL COMMENT '退款金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-成本订单-退款订单-废弃不用';

-- ----------------------------
-- Table structure for bf_offline_order_cost_state_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_cost_state_history`;
CREATE TABLE `bf_offline_order_cost_state_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业 ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `order_cost_id` bigint(20) unsigned NOT NULL COMMENT '成本订单ID',
  `order_cost_state` tinyint(3) unsigned NOT NULL COMMENT '成本订单状态,1生效中,2未生效,3已经取消',
  `state_time` datetime NOT NULL COMMENT '状态变更时间',
  `state_by_id` bigint(20) unsigned NOT NULL COMMENT '状态变更人id',
  `state_by_name` varchar(100) NOT NULL COMMENT '状态变更人姓名',
  `state_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '状态变动原因/备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_order_state_history_corp_id_IDX` (`corp_id`,`order_id`,`order_cost_state`)
) ENGINE=InnoDB AUTO_INCREMENT=11307 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-成本状态变更历史记录';

-- ----------------------------
-- Table structure for bf_offline_order_detail_file
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_detail_file`;
CREATE TABLE `bf_offline_order_detail_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `file_key` varchar(100) NOT NULL COMMENT '订单明细,file key',
  `file_name` varchar(100) NOT NULL COMMENT '订单明细,文件名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-订单详情文件';

-- ----------------------------
-- Table structure for bf_offline_order_detail_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_detail_history`;
CREATE TABLE `bf_offline_order_detail_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `detail_file_key` varchar(100) NOT NULL COMMENT '订单明细,file key',
  `detail_file_name` varchar(100) NOT NULL COMMENT '订单明细附件名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_order_detail_history_corp_id_IDX` (`corp_id`,`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=963 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-订单明细历史记录';

-- ----------------------------
-- Table structure for bf_offline_order_discount
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_discount`;
CREATE TABLE `bf_offline_order_discount` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `order_no` varchar(100) NOT NULL COMMENT '订单号',
  `source_order_no` varchar(100) NOT NULL COMMENT '源头订单号',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '冗余企业名称',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `amount` decimal(12,2) NOT NULL COMMENT '折扣单金额',
  `used_deduction_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已抵扣金额',
  `used_apply_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已请款金额',
  `unused_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '未使用金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-折扣单';

-- ----------------------------
-- Table structure for bf_offline_order_discount_record
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_discount_record`;
CREATE TABLE `bf_offline_order_discount_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '折扣单ID(bf_offline_order.orderId)',
  `order_no` varchar(100) NOT NULL COMMENT '折扣单号(bf_offline_order.order_no)',
  `record_type` tinyint(4) NOT NULL COMMENT '记录类型,1创建折扣单,2折扣单认款,3取消折扣单认款,4折扣单请款,5取消折扣单请款,6折扣单抵扣,7取消折扣单抵扣,8创建折扣单退款订单,9折扣单退款订单认款,10取消折扣单退款订单认款,11折扣单退款订单请款,12取消折扣单退款订单请款,13折扣单退款订单抵扣,14取消折扣单退款订单抵扣',
  `amount` decimal(12,2) NOT NULL COMMENT '金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-折扣单-使用记录';

-- ----------------------------
-- Table structure for bf_offline_order_file
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_file`;
CREATE TABLE `bf_offline_order_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `file_key` varchar(100) NOT NULL COMMENT '管理文件,file key',
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单管理说明文件';

-- ----------------------------
-- Table structure for bf_offline_order_import_batch
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_import_batch`;
CREATE TABLE `bf_offline_order_import_batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `batch_type` tinyint(4) NOT NULL COMMENT '批次类型，1批量导入订单，2批量更新流转订单',
  `import_order_excel_template_id` bigint(20) NOT NULL COMMENT '导入模板ID',
  `import_order_excel_template_json` json NOT NULL COMMENT '导入模版规则',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `template_type` tinyint(4) DEFAULT '1' COMMENT '模板类型 1正常订单、2折扣订单',
  `customer_included` tinyint(4) NOT NULL COMMENT '是否有客户,0否,1是',
  `file_key` varchar(100) NOT NULL COMMENT '管理文件,file key',
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `order_confirmed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否确认创建/更新订单,0否,1是',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `update_by_name` varchar(100) NOT NULL COMMENT '修改人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_corp_id` (`corp_id`),
  KEY `idx_batch_no` (`batch_no`),
  KEY `idx_category_parent_id` (`category_parent_id`),
  KEY `idx_import_order_excel_template_id` (`import_order_excel_template_id`),
  KEY `idx_category_child_id` (`category_child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单导入批';

-- ----------------------------
-- Table structure for bf_offline_order_import_batch_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_import_batch_detail`;
CREATE TABLE `bf_offline_order_import_batch_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `import_order_excel_template_id` bigint(20) NOT NULL COMMENT '导入模板ID',
  `order_source_no` varchar(100) NOT NULL COMMENT '序号/订单源编',
  `check_result` tinyint(4) NOT NULL COMMENT '校验结果,1通过，2不通过，3提醒',
  `check_reason` varchar(300) DEFAULT NULL COMMENT '原因',
  `customer_id` bigint(20) unsigned DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `project_id` bigint(20) unsigned DEFAULT NULL COMMENT '项目ID',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `project_remark` varchar(300) DEFAULT NULL COMMENT '项目备注',
  `ascription_year_month` varchar(20) DEFAULT NULL COMMENT '所属年月',
  `quantity` varchar(20) DEFAULT NULL COMMENT '数量',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `ar_amount` decimal(12,2) DEFAULT NULL COMMENT '应收总金额（收入订单总金额）',
  `ap_amount` decimal(12,2) DEFAULT NULL COMMENT '应付总金额（成本订单总金额）',
  `revenue_json` json NOT NULL COMMENT '收入',
  `cost_json` json NOT NULL COMMENT '成本',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `update_by_name` varchar(100) NOT NULL COMMENT '修改人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_corp_id` (`corp_id`),
  KEY `idx_check_result` (`check_result`),
  KEY `idx_batch_no` (`batch_no`),
  KEY `idx_project_remark` (`project_remark`),
  KEY `idx_order_source_no` (`order_source_no`),
  KEY `idx_customer_name` (`customer_name`),
  KEY `idx_import_order_excel_template_id` (`import_order_excel_template_id`),
  KEY `idx_project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单导入批-明细';

-- ----------------------------
-- Table structure for bf_offline_order_revenue
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_revenue`;
CREATE TABLE `bf_offline_order_revenue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父订单ID',
  `order_parent_no` varchar(100) NOT NULL DEFAULT '' COMMENT '父亲订单号',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID,bf_offline_order.id',
  `order_no` varchar(100) NOT NULL COMMENT '订单号',
  `order_revenue_no` varchar(100) NOT NULL COMMENT '收入订单号/退款订单号/对冲订单号',
  `order_revenue_type` tinyint(3) unsigned NOT NULL COMMENT '收入订单类型,1正常订单,2退回订单,3对冲订单',
  `order_revenue_state` tinyint(3) unsigned NOT NULL COMMENT '收入订单状态,1待生效,2未生效,3生效中,4已经取消',
  `parent_revenue_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父收入订单ID',
  `parent_revenue_no` varchar(100) NOT NULL DEFAULT '' COMMENT '父收入订单号',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `expenses_account_type` tinyint(3) unsigned NOT NULL COMMENT '记账方式 0 全额法 1净额法',
  `amount` decimal(12,2) NOT NULL COMMENT '费用金额,元,小数两位',
  `refund_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额,多次退款总计,元,小数两位',
  `issue_invoice_state` tinyint(3) unsigned DEFAULT '1' COMMENT '开票状态,1未开票,2部分已开票,3全部已开票,4不需要开票',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_order_revenue_UN` (`order_revenue_no`,`is_deleted`),
  KEY `bf_offline_order_revenue_corp_id_IDX` (`corp_id`,`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23408 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-收入订单';

-- ----------------------------
-- Table structure for bf_offline_order_revenue_refund
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_revenue_refund`;
CREATE TABLE `bf_offline_order_revenue_refund` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '退款订单ID',
  `order_no` varchar(100) NOT NULL COMMENT '退款订单号',
  `order_revenue_refund_no` varchar(100) NOT NULL COMMENT '收入退款订单号',
  `order_revenue_id` bigint(20) unsigned NOT NULL COMMENT '订单收入ID',
  `order_revenue_no` varchar(100) NOT NULL COMMENT '订单收入订单号',
  `amount` decimal(12,2) NOT NULL COMMENT '退款金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-收入订单-退款订单-废弃不用';

-- ----------------------------
-- Table structure for bf_offline_order_revenue_state_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_revenue_state_history`;
CREATE TABLE `bf_offline_order_revenue_state_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业 ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `order_revenue_id` bigint(20) unsigned NOT NULL COMMENT '收入订单ID',
  `order_revenue_state` tinyint(3) unsigned NOT NULL COMMENT '收入订单状态,1生效中,2未生效,3已经取消',
  `state_time` datetime NOT NULL COMMENT '状态变更时间',
  `state_by_id` bigint(20) unsigned NOT NULL COMMENT '状态变更人id',
  `state_by_name` varchar(100) NOT NULL COMMENT '状态变更人姓名',
  `state_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '状态变动原因/备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_order_state_history_corp_id_IDX` (`corp_id`,`order_id`,`order_revenue_state`)
) ENGINE=InnoDB AUTO_INCREMENT=26611 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单-收入订单状态变更历史记录';

-- ----------------------------
-- Table structure for bf_offline_order_state_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_order_state_history`;
CREATE TABLE `bf_offline_order_state_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业 ID',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `order_state` tinyint(3) unsigned NOT NULL COMMENT '订单状态,1待确认,2录单中,3待复核,4复核通过,5复核不通过,6已关闭,7已取消',
  `order_state_time` datetime NOT NULL COMMENT '状态变更时间',
  `order_state_by_id` bigint(20) unsigned NOT NULL COMMENT '订单状态变更人id',
  `order_state_by_name` varchar(100) NOT NULL COMMENT '订单状态变更人姓名',
  `order_state_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '状态变动原因/备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_order_state_history_corp_id_IDX` (`corp_id`,`order_id`,`order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=6420 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-订单状态变更历史记录';

-- ----------------------------
-- Table structure for bf_offline_payment_apply
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply`;
CREATE TABLE `bf_offline_payment_apply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_apply_no` varchar(100) NOT NULL COMMENT '请款编号',
  `apply_type` tinyint(3) unsigned NOT NULL COMMENT '请款类型,1常规业务,2折扣单请款',
  `order_source_no` varchar(100) NOT NULL COMMENT '订单源编号',
  `order_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父订单ID',
  `order_parent_no` varchar(100) NOT NULL DEFAULT '' COMMENT '父亲订单号',
  `order_child_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子订单ID',
  `order_child_no` varchar(100) NOT NULL DEFAULT '' COMMENT '子订单号',
  `order_child_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子的父订单ID',
  `order_child_parent_no` varchar(100) NOT NULL DEFAULT '' COMMENT '子的父订单号',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单,2退款订单,3折扣订单,4退款订单-折扣单',
  `order_flowed` tinyint(3) unsigned NOT NULL COMMENT '是否流转订单,0否,1是',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `customer_included` tinyint(4) NOT NULL COMMENT '是否有客户,0否,1是',
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `project_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '项目备注',
  `amount` decimal(12,2) NOT NULL COMMENT '应付金额',
  `frozen_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `pay_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '实付金额',
  `payment_type` tinyint(4) NOT NULL COMMENT '付款类型,1对公,2对私',
  `payment_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '情况状态,1待请款,2已请款',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '冗余企业名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `account_date` varchar(100) DEFAULT NULL COMMENT '记账月,创建不能为空,可编辑空',
  `cost_remark` varchar(600) DEFAULT NULL COMMENT '成本订单备注',
  `no_apply_temp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启暂不请款,0不开启暂不请款,1开启暂不请款',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_order_UN` (`payment_apply_no`),
  KEY `index_order_parent_no` (`order_parent_no`),
  KEY `index_order_child_no` (`order_child_no`),
  KEY `bf_offline_order_corp_id_IDX` (`corp_id`,`payment_apply_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3293 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_condition
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_condition`;
CREATE TABLE `bf_offline_payment_apply_condition` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `condition_code` varchar(100) NOT NULL COMMENT '自定义条件编码',
  `condition_desc` varchar(100) NOT NULL COMMENT '可请款条件',
  `condition_amount` varchar(100) NOT NULL COMMENT '可请款金额',
  `special_enabled` tinyint(4) DEFAULT NULL COMMENT '是否允许跨费用请款,0否,1是',
  `applicable_scope` varchar(100) NOT NULL COMMENT '适用范围',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `edit_enabled` tinyint(3) unsigned NOT NULL COMMENT '是否能编辑,0不可编辑,1可编辑',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_payment_apply_condition_UN` (`corp_id`,`condition_code`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-请款条件配置';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_condition_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_condition_whitelist`;
CREATE TABLE `bf_offline_payment_apply_condition_whitelist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `condition_code` varchar(100) NOT NULL COMMENT '自定义条件编码',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-请款条件配置-白名单';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_history`;
CREATE TABLE `bf_offline_payment_apply_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `history_no` varchar(100) NOT NULL COMMENT '请款记录编号',
  `public_private_id` bigint(20) unsigned NOT NULL COMMENT '对公或对私的ID',
  `apply_type` tinyint(3) unsigned NOT NULL COMMENT '请款类型,1常规业务,2垫付退回,3到款退回',
  `payment_type` tinyint(4) NOT NULL COMMENT '付款类型,1对公,2对私',
  `biz_no` varchar(100) NOT NULL COMMENT '业务编号(业务订单/垫付单/到款流水号)',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `payee_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收款方名称',
  `amount` decimal(12,2) NOT NULL COMMENT '请款金额',
  `payment_form_no` varchar(100) NOT NULL DEFAULT '' COMMENT '付款单号',
  `audit_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款审批状态,1待审批,2审批中,3审批通过,4审批被拒绝,5撤销,6作废',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_order_UN` (`history_no`),
  KEY `bf_offline_order_corp_id_IDX` (`corp_id`,`history_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1771 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-请款记录';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_payee
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_payee`;
CREATE TABLE `bf_offline_payment_apply_payee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '当前登录账号公司ID',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '收款方公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收款方公司名称',
  `bank_account_id` bigint(20) unsigned NOT NULL COMMENT '收款方账户公司ID',
  `bank_account_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收款方银行账户名称',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-收款信息配置';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_payee_bank
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_payee_bank`;
CREATE TABLE `bf_offline_payment_apply_payee_bank` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '当前登录账号的公司ID',
  `payee_id` bigint(20) unsigned NOT NULL COMMENT '收款配置ID,bf_offline_payment_apply_payee.id',
  `default_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认账号,0非默认,1默认',
  `bank_id` bigint(20) unsigned NOT NULL COMMENT '支行ID,bf_offline_config_bank.id',
  `bank_name` varchar(100) NOT NULL COMMENT '开户行',
  `bank_account` varchar(100) NOT NULL COMMENT '卡号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-收款信息配置-银行卡';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_private
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_private`;
CREATE TABLE `bf_offline_payment_apply_private` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `apply_type` tinyint(3) unsigned NOT NULL COMMENT '请款类型,1常规业务,2垫付退回,3到款退回',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '冗余企业名称',
  `apply_date` date NOT NULL COMMENT '申请日期',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `apply_name` varchar(100) NOT NULL COMMENT '申请人',
  `apply_account` varchar(100) NOT NULL COMMENT '申请人账号',
  `payer_bank_id` bigint(20) unsigned DEFAULT NULL COMMENT '付款银行ID',
  `payer_bank_name` varchar(100) NOT NULL COMMENT '付款银行名称',
  `payer_bank_no` varchar(100) NOT NULL COMMENT '付款银行卡号',
  `payer_amount` decimal(12,2) NOT NULL COMMENT '付款金额,元',
  `pay_bank_ps` varchar(100) NOT NULL COMMENT '支付附言',
  `payee_file_key` varchar(100) NOT NULL COMMENT '收款明细文件key',
  `payee_file_name` varchar(100) NOT NULL COMMENT '收款明细文件名',
  `detail_count` int(11) NOT NULL COMMENT '明细数量',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-对私付款';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_private_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_private_detail`;
CREATE TABLE `bf_offline_payment_apply_private_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `apply_private_id` bigint(20) unsigned NOT NULL COMMENT '对私请款ID',
  `source_payment_form_no` varchar(100) NOT NULL DEFAULT '' COMMENT '源头付款单号',
  `detail_no` varchar(100) NOT NULL COMMENT '明细号',
  `name` varchar(100) NOT NULL COMMENT '收款人姓名',
  `card_no` varchar(100) NOT NULL COMMENT '身份证号',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `bank_no` varchar(100) NOT NULL COMMENT '银行卡号',
  `bank_ps` varchar(100) NOT NULL DEFAULT '' COMMENT '附言',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '最新支付备注',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `pay_time` datetime NOT NULL COMMENT '支付时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `institution_code` varchar(100) DEFAULT NULL COMMENT '机构编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11158 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-对私付款-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_private_detail_draft
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_private_detail_draft`;
CREATE TABLE `bf_offline_payment_apply_private_detail_draft` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `draft_no` varchar(100) NOT NULL COMMENT '草稿号',
  `detail_no` varchar(100) DEFAULT NULL COMMENT '明细号',
  `source_payment_form_no` varchar(100) NOT NULL DEFAULT '' COMMENT '源头付款单号',
  `name` varchar(100) NOT NULL COMMENT '收款人姓名',
  `card_no` varchar(100) NOT NULL COMMENT '身份证号',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `bank_no` varchar(100) NOT NULL COMMENT '银行卡号',
  `bank_ps` varchar(100) NOT NULL DEFAULT '' COMMENT '附言',
  `reason` varchar(100) NOT NULL DEFAULT '' COMMENT '不通过原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `institution_code` varchar(100) DEFAULT NULL COMMENT '机构编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11302 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-对私付款-明细-草稿';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_private_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_private_order`;
CREATE TABLE `bf_offline_payment_apply_private_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `apply_private_id` bigint(20) unsigned NOT NULL COMMENT '对私请款ID',
  `apply_id` bigint(20) unsigned NOT NULL COMMENT '请款ID',
  `order_child_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子订单ID',
  `order_child_no` varchar(100) NOT NULL DEFAULT '' COMMENT '子订单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-对私付款-请款明细';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_public
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_public`;
CREATE TABLE `bf_offline_payment_apply_public` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `apply_type` tinyint(3) unsigned NOT NULL COMMENT '请款类型,1常规业务,2垫付退回,3到款退回',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '冗余企业名称',
  `apply_date` date NOT NULL COMMENT '申请日期',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `apply_name` varchar(100) NOT NULL COMMENT '申请人',
  `payer_bank_id` bigint(20) unsigned DEFAULT '0' COMMENT '付款银行ID',
  `apply_account` varchar(100) NOT NULL COMMENT '申请人账号',
  `payer_bank_name` varchar(100) NOT NULL COMMENT '付款银行名称',
  `payer_bank_no` varchar(100) NOT NULL COMMENT '付款银行卡号',
  `pay_amount` decimal(12,2) NOT NULL COMMENT '付款金额,元',
  `payer_bank_ps` varchar(100) NOT NULL COMMENT '支付附言',
  `payee_company_id` bigint(20) unsigned NOT NULL COMMENT '收款方公司ID',
  `payee_company_name` varchar(100) NOT NULL COMMENT '收款方公司名',
  `payee_bank_account_name` varchar(100) DEFAULT NULL COMMENT '收款方账户名称',
  `payee_bank_id` bigint(20) unsigned DEFAULT '0' COMMENT '收款银行ID',
  `payee_bank_name` varchar(100) NOT NULL COMMENT '收款银行名称',
  `payee_bank_no` varchar(100) NOT NULL COMMENT '收款银行卡号',
  `detail_count` int(11) NOT NULL COMMENT '明细数量',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=634 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-对公付款';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_public_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_public_detail`;
CREATE TABLE `bf_offline_payment_apply_public_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `apply_id` bigint(20) unsigned NOT NULL COMMENT '请款ID',
  `apply_public_id` bigint(20) unsigned NOT NULL COMMENT '对公请款ID',
  `order_child_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子订单ID',
  `order_child_no` varchar(100) NOT NULL DEFAULT '' COMMENT '子订单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '最新支付备注',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1094 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-对公付款-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_apply_sf_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_apply_sf_whitelist`;
CREATE TABLE `bf_offline_payment_apply_sf_whitelist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `update_by_name` varchar(100) NOT NULL DEFAULT '' COMMENT '修改人名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1154 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-请款-顺丰白名单项目名';

-- ----------------------------
-- Table structure for bf_offline_payment_form
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form`;
CREATE TABLE `bf_offline_payment_form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单编号',
  `payment_type` tinyint(4) NOT NULL COMMENT '付款类型,1对公,2对私',
  `apply_type` tinyint(3) unsigned NOT NULL COMMENT '申请类型,1常规业务,2垫付退回,3到款退回,4折扣单',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `amount` decimal(12,2) NOT NULL COMMENT '请款金额',
  `payer_bank_name` varchar(100) NOT NULL COMMENT '付款银行名称',
  `payer_bank_no` varchar(100) NOT NULL COMMENT '付款银行卡号',
  `payer_bank_ps` varchar(100) NOT NULL COMMENT '支付附言',
  `payee_bank_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收款银行名称',
  `payee_bank_no` varchar(100) NOT NULL DEFAULT '' COMMENT '收款银行卡号',
  `payee_company_id` bigint(20) unsigned DEFAULT NULL COMMENT '收款方公司ID',
  `payee_bank_account_name` varchar(100) NOT NULL DEFAULT '' COMMENT '收款账户名',
  `payee_company_name` varchar(100) DEFAULT NULL COMMENT '收款方公司名称',
  `detail_count` int(11) NOT NULL COMMENT '明细数量',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '付款单备注',
  `audit_no` varchar(100) NOT NULL DEFAULT '' COMMENT '审批单号',
  `apply_audit_by` varchar(100) NOT NULL DEFAULT '' COMMENT '提交审批人',
  `apply_audit_account` varchar(100) NOT NULL DEFAULT '' COMMENT '提交审批人账号',
  `audit_template_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '审批模版id',
  `audit_terminal` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '审批终端,1系统内审批,2钉钉端审批',
  `audit_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款审批状态,1待审批,2审批中,3审批通过,4审批被拒绝,5撤销,6作废',
  `audit_time` datetime DEFAULT NULL COMMENT '状态变更时间',
  `audit_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '审批备注',
  `audit_by` varchar(100) DEFAULT NULL COMMENT '状态变更人',
  `audit_by_account` varchar(100) DEFAULT NULL COMMENT '状态变更人账号',
  `audit_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '变更原因',
  `adjust_enabled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要调整,0否,1是',
  `adjust_by_account` varchar(100) NOT NULL DEFAULT '' COMMENT '调整人账号',
  `adjust_by` varchar(100) NOT NULL DEFAULT '' COMMENT '调整人姓名',
  `adjust_suggest` varchar(100) NOT NULL DEFAULT '' COMMENT '调整建议',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '最新支付备注',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回',
  `paying_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '支付中金额',
  `pay_unback_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '实付(未退回)',
  `pay_back_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '实付(被退回)',
  `pay_remain_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '剩余可支付',
  `pay_negative_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已负冲金额',
  `pay_canceled_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已取消金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_form_corp_id_IDX` (`corp_id`,`audit_no`),
  KEY `bf_offline_order_corp_id_IDX` (`corp_id`,`payment_form_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1408 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单';

-- ----------------------------
-- Table structure for bf_offline_payment_form_advance_back_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_advance_back_detail`;
CREATE TABLE `bf_offline_payment_form_advance_back_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `form_pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款单支付方式,1普通支付,2被负冲,3负冲',
  `advance_no` varchar(100) NOT NULL COMMENT '垫款单编号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `amount` decimal(12,2) NOT NULL COMMENT '垫款退回金额',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '最新支付备注',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回',
  `pay_state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `pay_time` datetime DEFAULT NULL COMMENT '支付状态时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_form_advance_back_detail_corp_id_IDX` (`corp_id`,`payment_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-垫款退回-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_form_auditor
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_auditor`;
CREATE TABLE `bf_offline_payment_form_auditor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单编号',
  `audit_no` varchar(100) NOT NULL DEFAULT '' COMMENT '审批单号',
  `audit_by_id` bigint(20) unsigned NOT NULL COMMENT '当前审批人ID',
  `audit_by` varchar(100) NOT NULL COMMENT '当前审批人',
  `audit_by_account` varchar(100) NOT NULL COMMENT '当前审批人账号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_form_auditor_corp_id_IDX` (`corp_id`,`payment_form_id`),
  KEY `bf_offline_order_corp_id_IDX` (`corp_id`,`payment_form_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1725 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-审批单的当前审批人';

-- ----------------------------
-- Table structure for bf_offline_payment_form_hedging
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_hedging`;
CREATE TABLE `bf_offline_payment_form_hedging` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `hedging_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '对冲状态,1待对冲,2已对冲',
  `payment_type` tinyint(4) NOT NULL COMMENT '付款类型,1对公,2对私',
  `source_payment_form_no` varchar(100) NOT NULL COMMENT '原始付款单编号',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单编号',
  `source_biz_no` varchar(100) NOT NULL DEFAULT '' COMMENT '原始业务号',
  `biz_no` varchar(100) NOT NULL DEFAULT '' COMMENT '业务号',
  `amount` decimal(12,2) NOT NULL COMMENT '金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_form_hedging_corp_id_IDX` (`corp_id`,`source_payment_form_no`),
  KEY `bf_offline_order_corp_id_IDX` (`corp_id`,`payment_form_no`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对冲记录表';

-- ----------------------------
-- Table structure for bf_offline_payment_form_pay_back_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_pay_back_detail`;
CREATE TABLE `bf_offline_payment_form_pay_back_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `form_pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款单支付方式,1普通支付,2被负冲,3负冲',
  `back_time` datetime NOT NULL COMMENT '到款时间',
  `back_serial_no` varchar(100) NOT NULL COMMENT '到款交易流水号',
  `amount` decimal(12,2) NOT NULL COMMENT '到款退回金额',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回',
  `pay_time` datetime DEFAULT NULL COMMENT '支付状态时间',
  `pay_state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_form_pay_back_detail_corp_id_IDX` (`corp_id`,`payment_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-到款退回-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_form_pay_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_pay_detail`;
CREATE TABLE `bf_offline_payment_form_pay_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `pay_no` varchar(100) DEFAULT NULL COMMENT '支付单号',
  `detail_type` tinyint(3) unsigned NOT NULL COMMENT '记录类型,1申请支付,2被退回,3被负冲-负冲',
  `data_json` json DEFAULT NULL COMMENT '数据json格式',
  `data_json_version` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '数据json格式版本号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-付款记录';

-- ----------------------------
-- Table structure for bf_offline_payment_form_private_confirm
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_private_confirm`;
CREATE TABLE `bf_offline_payment_form_private_confirm` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `name` varchar(100) NOT NULL COMMENT '退款方姓名',
  `card_no` varchar(100) NOT NULL COMMENT '退款方身份证',
  `total_amount` decimal(12,2) NOT NULL COMMENT '总金额',
  `reason` varchar(100) NOT NULL DEFAULT '' COMMENT '被退回原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对私人付款-确认收到退款';

-- ----------------------------
-- Table structure for bf_offline_payment_form_private_confirm_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_private_confirm_detail`;
CREATE TABLE `bf_offline_payment_form_private_confirm_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `private_confirm_id` bigint(20) unsigned NOT NULL COMMENT '付款单-确认收到退款ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `bill_confirm_number` varchar(100) NOT NULL COMMENT 'core_bill确认号',
  `bank_serial_no` varchar(100) NOT NULL COMMENT '流水号',
  `amount` decimal(12,2) NOT NULL COMMENT '付款单金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对私付款-确认收到退款-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_form_private_confirm_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_private_confirm_order`;
CREATE TABLE `bf_offline_payment_form_private_confirm_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `private_confirm_id` bigint(20) unsigned NOT NULL COMMENT '对私退款ID',
  `private_detail_id` bigint(20) unsigned NOT NULL COMMENT '对私明细ID',
  `detail_no` varchar(100) NOT NULL COMMENT '明细单号',
  `detail_parent_no` varchar(100) NOT NULL DEFAULT '' COMMENT '明细父单号',
  `detail_child_no` varchar(100) NOT NULL COMMENT '拆封出来的最小单号',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `order_no` varchar(100) NOT NULL COMMENT '子订单号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对私付款-确认收到退款-退款所关联的明细';

-- ----------------------------
-- Table structure for bf_offline_payment_form_private_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_private_detail`;
CREATE TABLE `bf_offline_payment_form_private_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `source_detail_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '最原始明细ID',
  `source_detail_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最原始明细号',
  `parent_detail_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父明细ID',
  `parent_detail_no` varchar(100) NOT NULL DEFAULT '' COMMENT '父明细号',
  `detail_no` varchar(100) NOT NULL COMMENT '明细号mx',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `name` varchar(100) NOT NULL COMMENT '收款人姓名',
  `card_no` varchar(100) NOT NULL COMMENT '身份证号',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `bank_no` varchar(100) NOT NULL COMMENT '银行卡号',
  `bank_ps` varchar(100) NOT NULL DEFAULT '' COMMENT '附言',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_start_time` datetime DEFAULT NULL COMMENT '发起支付的时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_serial_no` varchar(100) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付方式 0初始值 1普通支付 2被负冲 3负冲',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回',
  `pay_state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `order_child_no` text NOT NULL COMMENT '冗余展示子订单号',
  `project_name` text NOT NULL COMMENT '冗余展示项目名称',
  `customer_name` text NOT NULL COMMENT '冗余展示客户名称',
  `category_child` varchar(100) NOT NULL COMMENT '冗余展示业务小类',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `institution_code` varchar(100) DEFAULT NULL COMMENT '机构编号',
  `bank_location` varchar(600) DEFAULT NULL COMMENT '开户地',
  `receive_refund` smallint(1) NOT NULL DEFAULT '0' COMMENT '确认收到退款标识 0默认值  1确认收到退款 2重新支付成功',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11251 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对私付款-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_form_private_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_private_order`;
CREATE TABLE `bf_offline_payment_form_private_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `order_child_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子订单ID',
  `order_child_no` varchar(100) NOT NULL DEFAULT '' COMMENT '子订单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1903 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对私付款-请款明细';

-- ----------------------------
-- Table structure for bf_offline_payment_form_public_confirm
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_public_confirm`;
CREATE TABLE `bf_offline_payment_form_public_confirm` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `total_amount` decimal(12,2) NOT NULL COMMENT '总金额',
  `reason` varchar(100) NOT NULL DEFAULT '' COMMENT '被退回原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对公付款-确认收到退款';

-- ----------------------------
-- Table structure for bf_offline_payment_form_public_confirm_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_public_confirm_detail`;
CREATE TABLE `bf_offline_payment_form_public_confirm_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `public_confirm_id` bigint(20) unsigned NOT NULL COMMENT '付款单-确认收到退款ID',
  `amount` decimal(12,2) NOT NULL COMMENT '确认金额',
  `bill_confirm_number` varchar(100) NOT NULL COMMENT 'core_bill确认号',
  `bank_serial_no` varchar(100) NOT NULL COMMENT '流水号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对公付款-确认收到退款-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_form_public_confirm_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_public_confirm_order`;
CREATE TABLE `bf_offline_payment_form_public_confirm_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `public_confirm_id` bigint(20) unsigned NOT NULL COMMENT '对公退款ID',
  `apply_type` tinyint(3) unsigned NOT NULL COMMENT '申请类型,1常规业务,2垫付退回,3到款退回',
  `public_detail_id` bigint(20) unsigned NOT NULL COMMENT '对公明细ID',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `detail_no` varchar(100) NOT NULL DEFAULT '' COMMENT '明细单号(子订单号)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对公付款-确认收到退款-退款所关联订单';

-- ----------------------------
-- Table structure for bf_offline_payment_form_public_order
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_form_public_order`;
CREATE TABLE `bf_offline_payment_form_public_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `payment_form_id` bigint(20) unsigned NOT NULL COMMENT '付款单ID',
  `form_pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '付款单支付方式,1普通支付,2被负冲,3负冲',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单,2退款订单',
  `order_child_parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子订单的父亲订单ID',
  `order_child_parent_no` varchar(100) NOT NULL DEFAULT '' COMMENT '子订单的父子订单号',
  `order_child_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子订单ID',
  `order_child_no` varchar(100) NOT NULL DEFAULT '' COMMENT '子订单号',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `amount` decimal(12,2) NOT NULL COMMENT '本次付款金额',
  `pay_no` varchar(100) NOT NULL DEFAULT '' COMMENT '最新支付号',
  `pay_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '最新支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回,7支付成功后被退回,8已取消',
  `pay_time` datetime DEFAULT NULL COMMENT '支付状态时间',
  `pay_state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_form_public_order_corp_id_IDX` (`corp_id`,`payment_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1125 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-付款单-对公付款-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_bank_account_default
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_bank_account_default`;
CREATE TABLE `bf_offline_payment_pay_bank_account_default` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `pay_channel` tinyint(3) unsigned NOT NULL COMMENT '支付渠道,1招商,2网商,3中信银行,4支付宝,5第三方支付',
  `bill_bank_id` bigint(20) unsigned NOT NULL COMMENT 'bill银行卡ID',
  `bank_name` varchar(100) NOT NULL COMMENT '开户行',
  `bank_account` varchar(100) NOT NULL COMMENT '银行卡账号',
  `bank_account_name` varchar(100) NOT NULL COMMENT '银行卡账号主体',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-默认支付卡号配置';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_private
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_private`;
CREATE TABLE `bf_offline_payment_pay_private` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pay_no` varchar(100) NOT NULL COMMENT '支付号',
  `pay_center_no` varchar(100) DEFAULT NULL COMMENT '支付中心号',
  `pay_serial_no` varchar(100) DEFAULT NULL COMMENT '支付流水号',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型,1未知(待支付状态),2线上支付,3线下支付',
  `pay_state` tinyint(3) unsigned NOT NULL COMMENT '支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `state_by` varchar(100) NOT NULL COMMENT '状态变更人',
  `state_by_account` varchar(100) NOT NULL COMMENT '变更账号',
  `state_time` datetime NOT NULL COMMENT '状态变更时间',
  `state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '状态原因',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `pay_amount` decimal(12,2) NOT NULL COMMENT '支付金额',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `payer_account` varchar(100) NOT NULL COMMENT '支付账号',
  `payer_name` varchar(100) NOT NULL COMMENT '付款方名称',
  `payer_bank` varchar(100) NOT NULL COMMENT '付款方银行',
  `payer_ps` varchar(100) DEFAULT NULL COMMENT '支付备注,银行附言',
  `apply_by` varchar(100) NOT NULL COMMENT '申请人名称',
  `apply_account` varchar(100) NOT NULL COMMENT '申请人账号',
  `pay_channel` varchar(100) NOT NULL COMMENT '支付渠道,1招商,2网商,3中信银行,4支付宝,5民生银行,6第三方支付',
  `start_pay_time` datetime DEFAULT NULL COMMENT '发起支付时间',
  `start_pay_by` varchar(100) NOT NULL DEFAULT '' COMMENT '发起支付人',
  `start_pay_by_account` varchar(100) NOT NULL DEFAULT '' COMMENT '发起支付人账号',
  `payment_form_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '付款单的备注',
  `apply_audit_remark` varchar(100) NOT NULL DEFAULT '' COMMENT '请款审批备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_payment_pay_private_UN` (`pay_no`),
  KEY `bf_offline_payment_pay_public_corp_id_IDX` (`corp_id`,`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对私支付';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_private_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_private_detail`;
CREATE TABLE `bf_offline_payment_pay_private_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `private_id` bigint(20) unsigned NOT NULL COMMENT '对私支付ID',
  `pay_no` varchar(100) NOT NULL COMMENT '支付号',
  `biz_no` varchar(100) NOT NULL COMMENT '业务号;发起方业务唯一标识',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `card_no` varchar(100) NOT NULL COMMENT '身份证号',
  `bank_no` varchar(100) NOT NULL COMMENT '银行卡号',
  `amount` decimal(12,2) NOT NULL COMMENT '实付金额',
  `bank_ps` varchar(100) DEFAULT NULL COMMENT '银行附言',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `bank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型,1未知(待支付状态),2线上支付,3线下支付',
  `pay_state` tinyint(3) unsigned NOT NULL COMMENT '支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `pay_channel` varchar(100) NOT NULL DEFAULT '0' COMMENT '支付渠道,1招商,2网商,3中信银行,4支付宝,5民生银行,6第三方支付',
  `trx_seq` varchar(100) DEFAULT NULL COMMENT 'corePay交易序号',
  `pay_serial_no` varchar(100) DEFAULT NULL COMMENT '支付流水号',
  `pay_state_by` varchar(100) NOT NULL COMMENT '支付状态变更人',
  `pay_state_by_account` varchar(100) NOT NULL COMMENT '支付状态变更账号',
  `pay_state_time` datetime NOT NULL COMMENT '支付状态变更时间',
  `pay_state_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `institution_code` varchar(100) DEFAULT NULL COMMENT '机构编号',
  `bank_location` varchar(600) DEFAULT NULL COMMENT '开户地',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_pay_private_detail_corp_id_IDX` (`corp_id`,`private_id`),
  KEY `bf_offline_payment_pay_public_corp_id_IDX` (`corp_id`,`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9066 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对私支付-明细';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_private_detail_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_private_detail_history`;
CREATE TABLE `bf_offline_payment_pay_private_detail_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `private_id` bigint(20) unsigned NOT NULL COMMENT '对私支付ID',
  `pay_no` varchar(100) NOT NULL COMMENT '支付号',
  `biz_no` varchar(100) NOT NULL COMMENT '业务号;发起方业务唯一标识',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `card_no` varchar(100) NOT NULL COMMENT '身份证号',
  `bank_no` varchar(100) NOT NULL COMMENT '银行卡号',
  `amount` decimal(12,2) NOT NULL COMMENT '实付金额',
  `bank_ps` varchar(100) DEFAULT NULL COMMENT '银行附言',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `bank` varchar(100) DEFAULT NULL COMMENT '开户行',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型,1未知(待支付状态),2线上支付,3线下支付',
  `pay_state` tinyint(3) unsigned NOT NULL COMMENT '支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `pay_channel` varchar(100) NOT NULL DEFAULT '0' COMMENT '支付渠道,1招商,2网商,3中信银行,4支付宝,5民生银行,6第三方支付',
  `pay_serial_no` varchar(100) DEFAULT NULL COMMENT '支付流水号',
  `pay_state_by` varchar(100) NOT NULL COMMENT '支付状态变更人',
  `pay_state_by_account` varchar(100) NOT NULL COMMENT '支付状态变更账号',
  `pay_state_time` datetime NOT NULL COMMENT '支付状态变更时间',
  `pay_state_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '支付状态原因',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_pay_private_detail_corp_id_IDX` (`corp_id`,`private_id`),
  KEY `bf_offline_payment_pay_public_corp_id_IDX` (`corp_id`,`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6403 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对私支付-明细-操作记录';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_private_offline_result
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_private_offline_result`;
CREATE TABLE `bf_offline_payment_pay_private_offline_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pay_private_id` bigint(20) unsigned NOT NULL COMMENT '对私支付ID',
  `file_key` varchar(100) NOT NULL COMMENT '文件key',
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对私支付-线下支付-发放结果';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_private_offline_tick
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_private_offline_tick`;
CREATE TABLE `bf_offline_payment_pay_private_offline_tick` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pay_private_id` bigint(20) unsigned NOT NULL COMMENT '对私支付ID',
  `file_key` varchar(100) NOT NULL COMMENT '文件key',
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对私支付-线下支付-支付凭证';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_public
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_public`;
CREATE TABLE `bf_offline_payment_pay_public` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pay_no` varchar(100) NOT NULL COMMENT '支付号',
  `pay_center_no` varchar(100) DEFAULT NULL COMMENT '支付中心号',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型,1未知(待支付状态),2线上支付,3线下支付',
  `pay_state` tinyint(3) unsigned NOT NULL COMMENT '支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `state_by` varchar(100) NOT NULL COMMENT '状态变更人',
  `state_by_account` varchar(100) NOT NULL COMMENT '变更账号',
  `state_time` datetime NOT NULL COMMENT '状态变更时间',
  `state_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '状态原因',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `payment_form_no` varchar(100) NOT NULL COMMENT '付款单号',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `pay_channel` tinyint(3) unsigned NOT NULL COMMENT '支付渠道,1招商,2网商,3中信银行,4支付宝,5第三方支付',
  `payer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '付款方银行账户名',
  `payer_account` varchar(100) NOT NULL COMMENT '支付账号',
  `pay_amount` decimal(12,2) NOT NULL COMMENT '支付金额',
  `payer_ps` varchar(100) DEFAULT NULL COMMENT '支付备注,银行附言',
  `payee_name` varchar(100) NOT NULL COMMENT '收款方名称',
  `payee_company_name` varchar(100) DEFAULT NULL COMMENT '收款方公司名',
  `payee_bank` varchar(100) NOT NULL COMMENT '收款方银行',
  `payee_account` varchar(100) NOT NULL COMMENT '收款方账号',
  `apply_by` varchar(100) NOT NULL COMMENT '申请人名称',
  `apply_account` varchar(100) NOT NULL COMMENT '申请人账号',
  `start_pay_time` datetime DEFAULT NULL COMMENT '发起支付时间',
  `start_pay_by` varchar(100) NOT NULL DEFAULT '' COMMENT '发起支付人',
  `start_pay_by_account` varchar(100) NOT NULL DEFAULT '' COMMENT '发起支付人账号',
  `payment_form_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '付款单的备注',
  `apply_audit_remark` varchar(100) NOT NULL DEFAULT '' COMMENT '请款审批备注',
  `pay_serial_no` varchar(100) DEFAULT NULL COMMENT '支付流水号',
  `call_back_param` json DEFAULT NULL COMMENT '回调的参数',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_payment_pay_public_UN` (`pay_no`),
  KEY `bf_offline_payment_pay_public_corp_id_IDX` (`corp_id`,`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=644 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对公支付';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_public_biz
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_public_biz`;
CREATE TABLE `bf_offline_payment_pay_public_biz` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pay_public_id` bigint(20) unsigned NOT NULL COMMENT '对公支付 ID',
  `pay_no` varchar(100) NOT NULL COMMENT '支付号',
  `biz_no` varchar(100) NOT NULL COMMENT '业务号;发起方业务唯一标识',
  `pay_state` tinyint(3) unsigned NOT NULL COMMENT '支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_pay_public_corp_id_IDX` (`corp_id`,`pay_no`),
  KEY `bf_offline_payment_pay_public_biz_corp_id_IDX` (`corp_id`,`pay_public_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对公支付-业务号关系';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_public_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_public_history`;
CREATE TABLE `bf_offline_payment_pay_public_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pay_public_id` bigint(20) unsigned NOT NULL COMMENT '对公支付ID',
  `pay_no` varchar(100) NOT NULL COMMENT '支付号',
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '支付类型,1未知(待支付状态),2线上支付,3线下支付',
  `pay_state` tinyint(3) unsigned NOT NULL COMMENT '支付状态,1待支付,2支付中,3已支付(部分成功),4已经支付(全部成功),5已支付(全部失败),6未支付被驳回',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_pay_public_corp_id_IDX` (`corp_id`,`pay_no`)
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对公支付-操作记录';

-- ----------------------------
-- Table structure for bf_offline_payment_pay_public_offline_tick
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_payment_pay_public_offline_tick`;
CREATE TABLE `bf_offline_payment_pay_public_offline_tick` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pay_public_id` bigint(20) unsigned NOT NULL COMMENT '对公支付ID',
  `file_key` varchar(100) NOT NULL COMMENT '文件key',
  `file_name` varchar(100) NOT NULL COMMENT '文件名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_by` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL DEFAULT '' COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_payment_pay_public_offline_tick_corp_id_IDX` (`corp_id`,`pay_public_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-支付-对公支付-线下支付-支付凭证';

-- ----------------------------
-- Table structure for bf_offline_pledge
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge`;
CREATE TABLE `bf_offline_pledge` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `order_no` varchar(100) NOT NULL COMMENT '订单编号',
  `order_source_no` varchar(100) NOT NULL COMMENT '订单源编号',
  `order_child_no` varchar(100) NOT NULL COMMENT '子订单号',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单,2退款订单,3折扣订单,4退款订单-折扣单',
  `pledge_state` tinyint(3) unsigned NOT NULL COMMENT '认款状态,1认款中,2认款成功,3认款失败,4取消中,5已取消',
  `cancel_reason` varchar(100) NOT NULL DEFAULT '' COMMENT '取消原因',
  `pledge_finished` tinyint(3) unsigned NOT NULL COMMENT '是否认款完成,0未全额认款,1已全额认款',
  `finish_time` datetime DEFAULT NULL COMMENT '认款完成时间',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `project_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '项目备注',
  `expenses_parent_id` bigint(20) unsigned NOT NULL COMMENT '费用大类ID',
  `expenses_parent` varchar(100) NOT NULL COMMENT '冗余费用大类名称',
  `expenses_child_id` bigint(20) unsigned NOT NULL COMMENT '费用小类ID',
  `expenses_child` varchar(100) NOT NULL COMMENT '冗余费用小类名称',
  `customer_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `customer_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `amount` decimal(12,2) NOT NULL COMMENT '应认款金额',
  `pledging_amount` decimal(12,2) NOT NULL COMMENT '认款中的金额',
  `pledged_amount` decimal(12,2) NOT NULL COMMENT '已认款金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '收款公司ID',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '冗余收款公司名称',
  `account_date` varchar(100) DEFAULT NULL COMMENT '记账月,与order保持同步',
  `no_pledge_temp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否暂不认款,0不开启暂不认款,1开启暂不认款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1869 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理';

-- ----------------------------
-- Table structure for bf_offline_pledge_back
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_back`;
CREATE TABLE `bf_offline_pledge_back` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pledged_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `total_amount` decimal(12,2) NOT NULL COMMENT '本次总共释放金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '本次认款备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-退款订单认款';

-- ----------------------------
-- Table structure for bf_offline_pledge_back_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_back_detail`;
CREATE TABLE `bf_offline_pledge_back_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pledged_back_id` bigint(20) unsigned NOT NULL COMMENT '退款订单认款ID',
  `amount` decimal(12,2) NOT NULL COMMENT '本次释放金额',
  `order_child_no` varchar(100) NOT NULL COMMENT '原子订单编号',
  `pledge_no` varchar(100) NOT NULL COMMENT '认款编号',
  `pledge_amount` decimal(12,2) NOT NULL COMMENT '原认款金额',
  `pledge_datetime` datetime NOT NULL COMMENT '认款时间',
  `pledge_way` tinyint(3) unsigned NOT NULL COMMENT '认款方式,1客户来款,2第三方垫付,3我司垫付',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-退款订单认款-释放明细';

-- ----------------------------
-- Table structure for bf_offline_pledge_company
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_company`;
CREATE TABLE `bf_offline_pledge_company` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `pledged_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `total_amount` decimal(12,2) NOT NULL COMMENT '本次总共认款金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '本次认款备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-我司垫付认款';

-- ----------------------------
-- Table structure for bf_offline_pledge_company_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_company_detail`;
CREATE TABLE `bf_offline_pledge_company_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pledged_company_id` bigint(20) unsigned NOT NULL COMMENT '我司垫付认款ID',
  `amount` decimal(12,2) NOT NULL COMMENT '本次认款金额',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_no` varchar(100) NOT NULL COMMENT '垫付号',
  `advance_amount` decimal(12,2) NOT NULL COMMENT '垫款单当时的可用额度',
  `advance_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '垫付单说明',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-我司垫付认款-明细';

-- ----------------------------
-- Table structure for bf_offline_pledge_customer
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_customer`;
CREATE TABLE `bf_offline_pledge_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `pledged_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `total_amount` decimal(12,2) NOT NULL COMMENT '本次共认款金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '本次认款备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-客户认款';

-- ----------------------------
-- Table structure for bf_offline_pledge_customer_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_customer_detail`;
CREATE TABLE `bf_offline_pledge_customer_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pledge_customer_id` bigint(20) unsigned NOT NULL COMMENT '客户认款表ID',
  `amount` decimal(12,2) NOT NULL COMMENT '本次认款金额',
  `bank_no` varchar(100) NOT NULL COMMENT '银行卡号',
  `bank_name` varchar(100) NOT NULL COMMENT '银行卡银行名称',
  `unfund_amount` decimal(12,2) NOT NULL COMMENT '冗余未认款金额,最新的以bill为准',
  `bank_payment_time` datetime NOT NULL COMMENT '银行到款时间',
  `bank_ps` varchar(100) NOT NULL DEFAULT '' COMMENT '银行汇款附言',
  `bank_serial_number` varchar(100) NOT NULL COMMENT '银行流水号',
  `payment_company_id` bigint(20) unsigned NOT NULL COMMENT '支付公司ID',
  `payment_company_name` varchar(100) NOT NULL COMMENT '支付公司名称',
  `bill_confirm_number` varchar(100) NOT NULL COMMENT 'bill的认款号,confirm_payment_log',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-客户认款-明细';

-- ----------------------------
-- Table structure for bf_offline_pledge_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_detail`;
CREATE TABLE `bf_offline_pledge_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `pledge_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `all_way_id` bigint(20) unsigned NOT NULL COMMENT '存放客户、三方、垫款的ID,pledge_company.id,pledge_customer.id,pledge_three.id',
  `pledging_way` tinyint(3) unsigned NOT NULL COMMENT '认款方式,1客户认款,2第三方垫付,3我司垫付',
  `amount` decimal(12,2) NOT NULL COMMENT '应认款金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1594 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-明细';

-- ----------------------------
-- Table structure for bf_offline_pledge_discount
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_discount`;
CREATE TABLE `bf_offline_pledge_discount` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `pledged_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `total_amount` decimal(12,2) NOT NULL COMMENT '本次抵扣金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '本次抵扣备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-折扣单认款';

-- ----------------------------
-- Table structure for bf_offline_pledge_discount_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_discount_detail`;
CREATE TABLE `bf_offline_pledge_discount_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pledged_discount_id` bigint(20) unsigned NOT NULL COMMENT '折扣单认款ID',
  `amount` decimal(12,2) NOT NULL COMMENT '本次认款金额',
  `discount_no` varchar(100) NOT NULL COMMENT '折扣单号',
  `discount_amount` decimal(12,2) NOT NULL COMMENT '垫款单当时的可用额度',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-折扣单认款-明细';

-- ----------------------------
-- Table structure for bf_offline_pledge_history
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_history`;
CREATE TABLE `bf_offline_pledge_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pledge_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `pledged_no` varchar(100) NOT NULL COMMENT '认款号',
  `order_no` varchar(100) NOT NULL COMMENT '订单编号',
  `order_source_no` varchar(100) NOT NULL COMMENT '订单源编号',
  `order_child_no` varchar(100) NOT NULL COMMENT '子订单号',
  `order_type` tinyint(3) unsigned NOT NULL COMMENT '订单类型,1正常订单,2退款订单,3折扣订单,4退款订单-折扣单',
  `pledge_state` tinyint(3) unsigned NOT NULL COMMENT '认款状态,1认款中,2认款成功,3认款失败,4取消中,5已取消',
  `state_result` varchar(100) NOT NULL DEFAULT '' COMMENT '状态变更时的原因',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `amount` decimal(12,2) NOT NULL COMMENT '认款金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '认款备注',
  `pledging_way` tinyint(3) unsigned NOT NULL COMMENT '认款方式,1客户认款,2第三方垫付,3我司垫付,4折扣单',
  `record_no` varchar(2000) NOT NULL COMMENT '单号,银行流水号/垫付单号',
  `record_detail_no` varchar(100) NOT NULL DEFAULT '' COMMENT '客户认款时存认款编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1759 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-认款记录';

-- ----------------------------
-- Table structure for bf_offline_pledge_three
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_three`;
CREATE TABLE `bf_offline_pledge_three` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `batch_no` varchar(100) NOT NULL COMMENT '批次号',
  `pledged_id` bigint(20) unsigned NOT NULL COMMENT '认款ID',
  `total_amount` decimal(12,2) NOT NULL COMMENT '本次共认款金额',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '本次认款备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-第三方垫付认款';

-- ----------------------------
-- Table structure for bf_offline_pledge_three_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_pledge_three_detail`;
CREATE TABLE `bf_offline_pledge_three_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `pledged_three_id` bigint(20) unsigned NOT NULL COMMENT '第三方垫付认款ID',
  `amount` decimal(12,2) NOT NULL COMMENT '本次认款金额',
  `advance_id` bigint(20) unsigned NOT NULL COMMENT '垫付ID',
  `advance_no` varchar(100) NOT NULL COMMENT '垫付号',
  `advance_company_id` bigint(20) unsigned DEFAULT NULL COMMENT '垫付公司ID',
  `advance_company_name` varchar(100) NOT NULL COMMENT '垫付方公司名称',
  `advance_amount` decimal(12,2) NOT NULL COMMENT '垫款单当时的可用额度',
  `advance_remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '垫付单说明',
  `advance_bank_serial_no` varchar(100) NOT NULL COMMENT '垫付方到款的交易流水号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-认款管理-第三方垫付认款-明细';

-- ----------------------------
-- Table structure for bf_offline_project
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_project`;
CREATE TABLE `bf_offline_project` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `name` varchar(100) NOT NULL COMMENT '项目名称,系统内唯一,可修改',
  `project_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '项目状态,0已停用,1使用中',
  `category_parent_id` bigint(20) unsigned NOT NULL COMMENT '业务大类ID',
  `category_parent` varchar(100) NOT NULL COMMENT '冗余业务大类',
  `category_child_id` bigint(20) unsigned NOT NULL COMMENT '业务小类ID',
  `category_child` varchar(100) NOT NULL COMMENT '冗余业务小类',
  `customer_included` tinyint(4) NOT NULL COMMENT '项目类型,0无客户项目,1有客户项目',
  `owner` varchar(100) DEFAULT '' COMMENT '所属业务员账号',
  `recommender` varchar(100) DEFAULT '' COMMENT '推荐人账号',
  `channel_id` bigint(20) unsigned DEFAULT NULL COMMENT '所属渠道,公司 ID',
  `channel_name` varchar(100) DEFAULT NULL COMMENT '所属渠道,系统内公司',
  `yongyou_id` varchar(100) DEFAULT '' COMMENT '用友ID,全数字,唯一',
  `remark` varchar(1000) DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bf_offline_project_UN` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-项目';

-- ----------------------------
-- Table structure for bf_offline_project_customer
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_project_customer`;
CREATE TABLE `bf_offline_project_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '客户 ID',
  `customer_name` varchar(100) NOT NULL COMMENT '客户名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `bf_offline_project_customer_corp_id_IDX` (`corp_id`,`project_id`,`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-项目客户关系';

-- ----------------------------
-- Table structure for bf_offline_project_customer_draft
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_project_customer_draft`;
CREATE TABLE `bf_offline_project_customer_draft` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `draft_no` varchar(100) NOT NULL COMMENT '草稿号',
  `project_id` bigint(20) unsigned DEFAULT NULL COMMENT '项目ID',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '客户 ID',
  `customer_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `check_state` tinyint(4) NOT NULL COMMENT '校验结果,0失败,1成功',
  `failure_reason` varchar(100) DEFAULT '' COMMENT '失败原因',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-项目客户关系-草稿箱';

-- ----------------------------
-- Table structure for bf_offline_project_discount
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_project_discount`;
CREATE TABLE `bf_offline_project_discount` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `apply_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可请款,0否,1是',
  `deduction_enabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否可抵扣,0否,1是',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='线下业务-项目-折扣单用途配置';

-- ----------------------------
-- Table structure for bf_offline_project_return_fee_rate_rule
-- ----------------------------
DROP TABLE IF EXISTS `bf_offline_project_return_fee_rate_rule`;
CREATE TABLE `bf_offline_project_return_fee_rate_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL COMMENT '公司ID',
  `corp_project_id` bigint(20) NOT NULL COMMENT '公司项目ID',
  `channel_fee_ground_pay_sign` tinyint(4) NOT NULL COMMENT '渠道费-落地是否支付签约 1是 0否',
  `channel_fee_gps_alg_cfg` json DEFAULT NULL COMMENT '渠道费-落地是否支付签约的算法配置',
  `channel_fee_gps_alg_cfg_label` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '下拉框展示label',
  `channel_fee_sign_pay_channel` tinyint(4) NOT NULL COMMENT '渠道费-签约是否支付渠道 1是 0否',
  `channel_fee_spc_alg_cfg` json DEFAULT NULL COMMENT '渠道费-签约是否支付渠道的算法配置',
  `channel_fee_spc_alg_cfg_label` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '下拉框展示label',
  `service_fee_ground_pay_sign` tinyint(4) NOT NULL COMMENT '服务费-落地是否支付签约 1是 0否',
  `service_fee_gps_alg_cfg` json DEFAULT NULL COMMENT '服务费-落地是否支付签约的算法配置',
  `service_fee_gps_alg_cfg_label` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '下拉框展示label',
  `service_fee_sign_pay_channel` tinyint(4) NOT NULL COMMENT '服务费-签约是否支付渠道 1是 0否',
  `service_fee_spc_alg_cfg` json DEFAULT NULL COMMENT '服务费-签约是否支付渠道的算法配置',
  `service_fee_spc_alg_cfg_label` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '下拉框展示label',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态(与合同保持一致)2停用，1使用中',
  `remark` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目-返渠道费规则表';

-- ----------------------------
-- Table structure for bf_voucher_accounting_rule_subject
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_accounting_rule_subject`;
CREATE TABLE `bf_voucher_accounting_rule_subject` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL COMMENT '科目编码',
  `name` varchar(64) NOT NULL COMMENT '科目名称',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父科目id',
  `show_name` varchar(128) NOT NULL COMMENT '显示名称',
  `subject_type` smallint(2) NOT NULL DEFAULT '1' COMMENT '科目类型 1:资产,2:负债,3:共同,4:权益,5:成本,6:损益',
  `direction` smallint(2) NOT NULL DEFAULT '1' COMMENT '方向 1:借,2:贷',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '级次',
  `assist_calc_type_id` json DEFAULT NULL COMMENT '辅助核算，如：1,2,3',
  `is_seal_keep` smallint(2) NOT NULL DEFAULT '0' COMMENT '是否封存 0:否,1:是',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `corp_id` bigint(20) NOT NULL COMMENT '公司id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_corp_id` (`corp_id`),
  KEY `idx_corp_group_id` (`corp_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11116 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会计准则科目表';

-- ----------------------------
-- Table structure for bf_voucher_assist_calc_type
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_assist_calc_type`;
CREATE TABLE `bf_voucher_assist_calc_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(2) DEFAULT NULL COMMENT '类型ID 1:人员档案, 2:部门档案, 3:项目辅助核算, 4:客商辅助核算, 5:银行账户',
  `u8c_code` varchar(64) NOT NULL COMMENT '用友编码',
  `u8c_name` varchar(64) NOT NULL COMMENT '用友类型名称',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `corp_id` bigint(20) NOT NULL COMMENT '公司id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_corp_id` (`corp_id`),
  KEY `idx_corp_group_id` (`corp_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='辅助核算类型编码表';

-- ----------------------------
-- Table structure for bf_voucher_corp_group_config
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_corp_group_config`;
CREATE TABLE `bf_voucher_corp_group_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_group_name` varchar(128) NOT NULL COMMENT '集团户分组名称',
  `corp_group_code` varchar(128) NOT NULL COMMENT '集团户分组code',
  `main_corp_id` bigint(20) unsigned NOT NULL COMMENT '主公司ID',
  `main_corp_name` varchar(128) NOT NULL COMMENT '主公司名称',
  `sub_corp_id_json` json DEFAULT NULL COMMENT '集团内包含公司ID，如:[1,2]',
  `share_data_json` json DEFAULT NULL COMMENT '共享数据，base_cfg:基础配置,cus_supplier_doc:客商档案,project_doc:项目档案,dept_doc:部门档案,voucher_template:凭证模板,voucher_list:凭证列表查询',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_corp_group_code` (`corp_group_code`),
  KEY `idx_main_corp_id` (`main_corp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='集团户凭证功能开通配置';

-- ----------------------------
-- Table structure for bf_voucher_corp_info
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_corp_info`;
CREATE TABLE `bf_voucher_corp_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `open_corp_id` bigint(20) NOT NULL COMMENT '开通公司id',
  `open_corp_name` varchar(128) NOT NULL COMMENT '开通公司名称',
  `is_sub_corp` smallint(2) DEFAULT NULL COMMENT '是否是分公司 0:否 1:是',
  `belong_corp_id` bigint(20) DEFAULT NULL COMMENT '归属总公司id',
  `belong_corp_name` varchar(128) DEFAULT NULL COMMENT '归属总公司名称',
  `u8c_corp_code` varchar(64) DEFAULT NULL COMMENT '用友公司编码',
  `u8c_corp_name` varchar(64) DEFAULT NULL COMMENT '用友公司名称',
  `accounting_book_no` varchar(64) DEFAULT NULL COMMENT '账簿编号',
  `accounting_book_name` varchar(64) DEFAULT NULL COMMENT '账簿名称',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `corp_id` bigint(20) NOT NULL COMMENT '公司id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_corp_id` (`corp_id`),
  KEY `idx_corp_group_id` (`corp_group_id`),
  KEY `idx_open_corp_id` (`open_corp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='集团公司信息';

-- ----------------------------
-- Table structure for bf_voucher_customer_supplier_doc
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_customer_supplier_doc`;
CREATE TABLE `bf_voucher_customer_supplier_doc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL COMMENT '公司id',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `cust_supp_id` bigint(20) unsigned NOT NULL COMMENT '客商企业ID',
  `cust_supp_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客商企业名称',
  `push_status` tinyint(4) NOT NULL COMMENT '推送状态，1待推送，2推送中，3推送成功，4推送失败，5.暂不推送',
  `u8c_ks_code` varchar(50) NOT NULL COMMENT '用友客商编码',
  `u8c_ks_name` varchar(50) NOT NULL COMMENT '用友客商名称',
  `u8c_ks_short` varchar(50) DEFAULT '' COMMENT '用友客商简称',
  `u8c_area_code` varchar(50) NOT NULL COMMENT '用友所属地区编码',
  `u8c_pstate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用友是否封存，默认为0不封存，为1时则为封存档案',
  `u8c_ksprop` tinyint(4) NOT NULL DEFAULT '2' COMMENT '用友客商属性，0：客户，1：供应商，2：客商,默认为2',
  `last_push_time` datetime DEFAULT NULL COMMENT '最近推送时间',
  `push_failure_reason` text COMMENT '推送失败原因',
  `u8c_existed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已存在用友,0否,1是',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_corpgroupid_custsuppid` (`corp_group_id`,`cust_supp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='客商档案';

-- ----------------------------
-- Table structure for bf_voucher_dept_doc
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_dept_doc`;
CREATE TABLE `bf_voucher_dept_doc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) NOT NULL COMMENT '企业ID',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `u8c_dept_name` varchar(50) NOT NULL COMMENT '用友部门名称',
  `u8c_dept_code` varchar(50) NOT NULL COMMENT '用友部门编码',
  `mock_test` tinyint(4) NOT NULL DEFAULT '0' COMMENT '测试,0否,1是',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_corpgroupid_u8cdeptcode` (`corp_group_id`,`u8c_dept_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门档案';

-- ----------------------------
-- Table structure for bf_voucher_doc_maker
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_doc_maker`;
CREATE TABLE `bf_voucher_doc_maker` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `maker_name` varchar(64) NOT NULL COMMENT '制单人姓名',
  `u8c_maker_code` varchar(64) NOT NULL COMMENT '用友制单人编码',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `corp_id` bigint(20) DEFAULT NULL COMMENT '公司id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_corp_id` (`corp_id`),
  KEY `idx_corp_group_id` (`corp_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='制单人编码表';

-- ----------------------------
-- Table structure for bf_voucher_entry
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_entry`;
CREATE TABLE `bf_voucher_entry` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` bigint(20) NOT NULL COMMENT '凭证id',
  `entry_no` varchar(128) NOT NULL COMMENT '分录号',
  `digest` varchar(128) NOT NULL COMMENT '摘要',
  `accounting_subject_id` bigint(20) NOT NULL COMMENT '会计科目id',
  `accounting_subject_show_name` varchar(256) DEFAULT NULL COMMENT '会计科目',
  `assist_calc_desc` json DEFAULT NULL COMMENT '辅助核算',
  `currency_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '币种编码，1.人民币',
  `exchange_rate` decimal(12,2) NOT NULL COMMENT '汇率',
  `local_currency` decimal(12,2) DEFAULT NULL COMMENT '本币金额',
  `original_currency` decimal(12,2) DEFAULT NULL COMMENT '原币金额，使用千分位分隔符',
  `debtor_amount` decimal(12,2) DEFAULT NULL COMMENT '借方金额，使用千分位分隔符',
  `creditor_amount` decimal(12,2) DEFAULT NULL COMMENT '贷方金额，使用千分位分隔符',
  `debit_credit` tinyint(4) DEFAULT NULL COMMENT '借贷方向,1.借方,2.贷方',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `voucher_entry_template_id` bigint(20) NOT NULL COMMENT '凭证分录模板id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_voucher_id_entry_no` (`voucher_id`,`entry_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1133 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='凭证分录表';

-- ----------------------------
-- Table structure for bf_voucher_entry_assit_calc_doc_relation
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_entry_assit_calc_doc_relation`;
CREATE TABLE `bf_voucher_entry_assit_calc_doc_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_entry_id` bigint(20) NOT NULL COMMENT '凭证分录id',
  `assit_calc_doc_id` bigint(20) NOT NULL COMMENT '辅助核算档案id',
  `assit_calc_doc_type` smallint(2) NOT NULL DEFAULT '1' COMMENT '辅助核算档案类型 1:客商 2:项目 3:部门',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_voucher_entry_id` (`voucher_entry_id`),
  KEY `idx_assit_calc_id` (`assit_calc_doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2121 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='凭证分录与辅助核算档案关联表';

-- ----------------------------
-- Table structure for bf_voucher_info
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_info`;
CREATE TABLE `bf_voucher_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sys_voucher_no` varchar(128) NOT NULL COMMENT '凭证单号(系统）',
  `voucher_no` varchar(128) DEFAULT NULL COMMENT '凭证号',
  `origin_voucher_no` varchar(128) DEFAULT NULL COMMENT '原凭证号',
  `first_voucher_type` smallint(2) NOT NULL DEFAULT '1' COMMENT '凭证类型 1:转账凭证 2:银行凭证',
  `voucher_label` smallint(2) NOT NULL DEFAULT '1' COMMENT '凭证标识 1:正常 2:红冲',
  `rel_biz_doc_no` varchar(64) NOT NULL COMMENT '关联业务单据号，订单批次号-过渡表id-收支明细编号',
  `biz_category` varchar(12) NOT NULL COMMENT '所属业务：flabor：专项职能外包 outsource：通用岗位外包  reference：企业背调',
  `accounting_period` varchar(16) DEFAULT NULL COMMENT '会计期间',
  `u8c_voucher_no` bigint(20) DEFAULT NULL COMMENT '用友凭证号',
  `digest` varchar(256) DEFAULT NULL COMMENT '摘要',
  `debtor_amount` decimal(12,2) DEFAULT NULL COMMENT '借方金额，使用千分位分隔符',
  `creditor_amount` decimal(12,2) DEFAULT NULL COMMENT '贷方金额，使用千分位分隔符',
  `make_voucher_date` varchar(64) DEFAULT NULL COMMENT '制单日期',
  `voucher_maker_id` bigint(20) NOT NULL COMMENT '制单人id',
  `voucher_maker_name` varchar(64) DEFAULT NULL COMMENT '制单人名称',
  `push_status` smallint(2) NOT NULL DEFAULT '1' COMMENT '推送状态 1:待推送 2:推送中 3:推送成功 4:推送失败 5:暂不推送',
  `push_status_reason` text COMMENT '推送状态描述',
  `latest_push_time` datetime DEFAULT NULL COMMENT '最近推送时间',
  `u8c_voucher_no_latest_pull_time` datetime DEFAULT NULL COMMENT '用友凭证号最近同步时间',
  `biz_doc_source` smallint(2) NOT NULL DEFAULT '1' COMMENT '业务单据来源 1:专职-临时个体-收支明细 2:专职-劳务报酬-收支明细',
  `account_corp_id` bigint(20) NOT NULL COMMENT '记账主体id',
  `voucher_transition_id` bigint(20) DEFAULT NULL COMMENT '凭证过渡表id',
  `voucher_template_id` bigint(20) NOT NULL COMMENT '凭证模板id',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `corp_id` bigint(20) NOT NULL COMMENT '公司id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  KEY `idx_corp_id` (`corp_id`),
  KEY `idx_account_corp_id` (`account_corp_id`,`accounting_period`),
  KEY `idx_corp_group_id` (`corp_group_id`),
  KEY `uk_rel_biz_doc_no_voucher_del` (`rel_biz_doc_no`,`voucher_transition_id`,`voucher_template_id`,`is_deleted`),
  KEY `idx_voucher_no` (`voucher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='凭证表';

-- ----------------------------
-- Table structure for bf_voucher_project_doc
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_project_doc`;
CREATE TABLE `bf_voucher_project_doc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `push_status` tinyint(4) NOT NULL COMMENT '推送状态，1待推送，2推送中，3推送成功，4推送失败，5.暂不推送',
  `gene_pro_name_condition` tinyint(4) NOT NULL DEFAULT '0' COMMENT '项目名称生成条件',
  `gene_pro_name_rule` text NOT NULL COMMENT '项目命名规则',
  `pro_code` varchar(50) DEFAULT '' COMMENT '项目档案编码（系统生成）',
  `pro_name` varchar(50) NOT NULL COMMENT '项目档案名称（系统生成）',
  `u8c_pro_type` varchar(50) NOT NULL COMMENT '用友项目档案类型,101-通用外包项目、201-业务承揽项目、301-研发项目、401-岗位外包（自营）',
  `u8c_pstate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用友是否封存，默认为0不封存，为1时则为封存档案',
  `last_push_time` datetime DEFAULT NULL COMMENT '最近推送时间',
  `push_failure_reason` text COMMENT '推送失败原因',
  `u8c_existed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已存在用友,0否,1是',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) DEFAULT '' COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目档案';

-- ----------------------------
-- Table structure for bf_voucher_project_doc_genename_variable
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_project_doc_genename_variable`;
CREATE TABLE `bf_voucher_project_doc_genename_variable` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `project_doc_id` bigint(20) unsigned NOT NULL COMMENT '项目ID',
  `type` tinyint(4) NOT NULL COMMENT '变量类型，1.客户名称，2.渠道名称',
  `value_code` varchar(50) NOT NULL COMMENT '变量值',
  `value_name` varchar(50) NOT NULL COMMENT '变量值名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='项目档案命名规则变量';

-- ----------------------------
-- Table structure for bf_voucher_template
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_template`;
CREATE TABLE `bf_voucher_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `template_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '模板状态,0已停用,1使用中',
  `template_no` varchar(100) NOT NULL COMMENT '模版编码',
  `template_name` varchar(100) NOT NULL COMMENT '模板名称',
  `business_document_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '业务单据来源,1.专职-临时个体-收支明细,2.专职-劳务报酬-收支明细',
  `remark` varchar(300) DEFAULT NULL COMMENT '模板备注',
  `accounting_subjects_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '会计科目,1.新会计准则科目表',
  `gene_voucher_condition` text NOT NULL COMMENT '凭证生成条件',
  `scope_type` tinyint(4) NOT NULL,
  `scope` text COMMENT '适用范围',
  `voucher_type` tinyint(4) NOT NULL COMMENT '凭证类型，1转账凭证',
  `prepared_code` bigint(20) NOT NULL COMMENT '制单人编码id',
  `prepared_date_type` tinyint(4) NOT NULL COMMENT '制单日期类型，1.等于记账月',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_corpgroupid_templatename` (`corp_group_id`,`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='凭证模板';

-- ----------------------------
-- Table structure for bf_voucher_template_detail
-- ----------------------------
DROP TABLE IF EXISTS `bf_voucher_template_detail`;
CREATE TABLE `bf_voucher_template_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `corp_id` bigint(20) unsigned NOT NULL COMMENT '企业ID',
  `corp_group_id` bigint(20) DEFAULT NULL COMMENT '集团户分组id',
  `seq_no` bigint(20) DEFAULT NULL COMMENT '分录序号',
  `voucher_template_id` bigint(20) unsigned NOT NULL COMMENT '模版ID',
  `gene_detail_condition_1` tinyint(4) NOT NULL COMMENT '分录生成条件1',
  `gene_detail_condition_2` text COMMENT '分录生成条件2',
  `gene_explanation_rule` varchar(500) NOT NULL DEFAULT '' COMMENT '摘要生成规则',
  `accounting_subject_id` bigint(20) NOT NULL COMMENT '会计科目编码id',
  `debit_credit` tinyint(4) NOT NULL COMMENT '借贷方向,1.借方,2.贷方',
  `dept_doc_id` bigint(20) DEFAULT NULL COMMENT '核算维度中项目档案id',
  `local_amount_formula` text NOT NULL COMMENT '本币金额公式',
  `amount_formula` tinyint(4) NOT NULL DEFAULT '1' COMMENT '原币金额公式,=本币➗汇率',
  `currency_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '币种编码，1.人民币',
  `rate` decimal(10,2) NOT NULL COMMENT '汇率',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `quantity` bigint(20) DEFAULT NULL COMMENT '数量',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(100) NOT NULL COMMENT '修改人',
  `update_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '修改人名字',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(100) NOT NULL COMMENT '创建人',
  `create_by_name` varchar(100) NOT NULL DEFAULT 'system' COMMENT '创建人名字',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态,0未删除,1已删除',
  `trace_id` varchar(100) NOT NULL COMMENT 'traceId',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '乐观锁版本号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=779 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='凭证模板分录';

SET FOREIGN_KEY_CHECKS = 1;
