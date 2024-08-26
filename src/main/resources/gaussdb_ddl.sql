CREATE TABLE "payment_account" (
    "unid" VARCHAR(36) NOT NULL,
    "service_id" VARCHAR(128),
    "service_name" VARCHAR(1024),
    "dept_id" VARCHAR(128),
    "dept_name" VARCHAR(1024),
    "channel" VARCHAR(2),
    "tpv" VARCHAR(128),
    "bind" VARCHAR(2),
    "create_time" VARCHAR(32) NOT NULL,
    "modify_time" VARCHAR(32) NOT NULL
);
COMMENT ON COLUMN "payment_account"."unid" IS '主键';
COMMENT ON COLUMN "payment_account"."service_id" IS '事项ID';
COMMENT ON COLUMN "payment_account"."service_name" IS '事项名称';
COMMENT ON COLUMN "payment_account"."dept_id" IS '部门ID';
COMMENT ON COLUMN "payment_account"."dept_name" IS '部门名称';
COMMENT ON COLUMN "payment_account"."channel" IS '支付渠道';
COMMENT ON COLUMN "payment_account"."tpv" IS '终端ID';
COMMENT ON COLUMN "payment_account"."bind" IS '是否配置：0：未配置；1：已配置';
COMMENT ON COLUMN "payment_account"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_account"."modify_time" IS '修改时间';
ALTER TABLE "payment_account" ADD PRIMARY KEY ("unid");
CREATE INDEX "payment_account_service_id" ON "payment_account" ("service_id");
CREATE INDEX "payment_account_dept_id" ON "payment_account" ("dept_id");
CREATE INDEX "payment_account_bind" ON "payment_account" ("bind");

CREATE TABLE "payment_account_ardz" (
    "unid" VARCHAR(36) NOT NULL,
    "service_id" VARCHAR(128),
    "service_name" VARCHAR(1024),
    "dept_id" VARCHAR(128),
    "dept_name" VARCHAR(1024),
    "channel" VARCHAR(2),
    "tpv" VARCHAR(128),
    "bind" VARCHAR(2),
    "create_time" VARCHAR(32) NOT NULL,
    "modify_time" VARCHAR(32) NOT NULL
);
COMMENT ON COLUMN "payment_account_ardz"."unid" IS '主键';
COMMENT ON COLUMN "payment_account_ardz"."service_id" IS '事项ID';
COMMENT ON COLUMN "payment_account_ardz"."service_name" IS '事项名称';
COMMENT ON COLUMN "payment_account_ardz"."dept_id" IS '部门ID';
COMMENT ON COLUMN "payment_account_ardz"."dept_name" IS '部门名称';
COMMENT ON COLUMN "payment_account_ardz"."channel" IS '支付渠道';
COMMENT ON COLUMN "payment_account_ardz"."tpv" IS '终端ID';
COMMENT ON COLUMN "payment_account_ardz"."bind" IS '是否配置：0：未配置；1：已配置';
COMMENT ON COLUMN "payment_account_ardz"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_account_ardz"."modify_time" IS '修改时间';
ALTER TABLE "payment_account_ardz" ADD PRIMARY KEY ("unid");
CREATE INDEX "payment_account_ardz_service_id" ON "payment_account_ardz" ("service_id");
CREATE INDEX "payment_account_ardz_dept_id" ON "payment_account_ardz" ("dept_id");
CREATE INDEX "payment_account_ardz_bind" ON "payment_account_ardz" ("bind");

CREATE TABLE "payment_account_enus" (
    "unid" VARCHAR(36) NOT NULL,
    "service_id" VARCHAR(128),
    "service_name" VARCHAR(1024),
    "dept_id" VARCHAR(128),
    "dept_name" VARCHAR(1024)
);
COMMENT ON COLUMN "payment_account_enus"."unid" IS '主键';
COMMENT ON COLUMN "payment_account_enus"."service_id" IS '事项ID';
COMMENT ON COLUMN "payment_account_enus"."service_name" IS '事项名称';
COMMENT ON COLUMN "payment_account_enus"."dept_id" IS '部门ID';
COMMENT ON COLUMN "payment_account_enus"."dept_name" IS '部门名称';
ALTER TABLE "payment_account_enus" ADD PRIMARY KEY ("unid");
CREATE INDEX "payment_account_enus_service_id" ON "payment_account_enus" ("service_id");
CREATE INDEX "payment_account_enus_dept_id" ON "payment_account_enus" ("dept_id");

CREATE TABLE "payment_account_frfr" (
    "unid" VARCHAR(36) NOT NULL,
    "service_id" VARCHAR(128),
    "service_name" VARCHAR(1024),
    "dept_id" VARCHAR(128),
    "dept_name" VARCHAR(1024),
    "channel" VARCHAR(2),
    "tpv" VARCHAR(128),
    "bind" VARCHAR(2),
    "create_time" VARCHAR(32) NOT NULL,
    "modify_time" VARCHAR(32) NOT NULL
);
COMMENT ON COLUMN "payment_account_frfr"."unid" IS '主键';
COMMENT ON COLUMN "payment_account_frfr"."service_id" IS '事项ID';
COMMENT ON COLUMN "payment_account_frfr"."service_name" IS '事项名称';
COMMENT ON COLUMN "payment_account_frfr"."dept_id" IS '部门ID';
COMMENT ON COLUMN "payment_account_frfr"."dept_name" IS '部门名称';
COMMENT ON COLUMN "payment_account_frfr"."channel" IS '支付渠道';
COMMENT ON COLUMN "payment_account_frfr"."tpv" IS '终端ID';
COMMENT ON COLUMN "payment_account_frfr"."bind" IS '是否配置：0：未配置；1：已配置';
COMMENT ON COLUMN "payment_account_frfr"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_account_frfr"."modify_time" IS '修改时间';
ALTER TABLE "payment_account_frfr" ADD PRIMARY KEY ("unid");
CREATE INDEX "payment_account_frfr_service_id" ON "payment_account_frfr" ("service_id");
CREATE INDEX "payment_account_frfr_dept_id" ON "payment_account_frfr" ("dept_id");
CREATE INDEX "payment_account_frfr_bind" ON "payment_account_frfr" ("bind");

CREATE TABLE "payment_channel" (
    "unid" VARCHAR(32) NOT NULL,
    "channel" VARCHAR(2) NOT NULL,
    "account" VARCHAR(255),
    "payment_password" VARCHAR(512),
    "create_time" VARCHAR(32) NOT NULL,
    "modify_time" VARCHAR(32) NOT NULL
);
COMMENT ON COLUMN "payment_channel"."unid" IS '主键';
COMMENT ON COLUMN "payment_channel"."channel" IS '支付渠道';
COMMENT ON COLUMN "payment_channel"."account" IS '支付账号';
COMMENT ON COLUMN "payment_channel"."payment_password" IS '支付密码';
COMMENT ON COLUMN "payment_channel"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_channel"."modify_time" IS '修改时间';
ALTER TABLE "payment_channel" ADD PRIMARY KEY ("unid");

CREATE TABLE "payment_order_number" (
    "id" BIGINT NOT NULL,
    "biz_type" VARCHAR(63) NOT NULL,
    "begin_init_id" BIGINT,
    "begin_id" BIGINT NOT NULL,
    "end_init_id" BIGINT,
    "end_id" BIGINT,
    "max_id" BIGINT NOT NULL,
    "step" INTEGER,
    "delta" INTEGER NOT NULL,
    "remainder" INTEGER NOT NULL,
    "begin_string_array" VARCHAR(1000),
    "this_use_begin_index" INTEGER,
    "create_time" TIMESTAMP NOT NULL,
    "update_time" TIMESTAMP NOT NULL,
    "version" BIGINT NOT NULL
);
COMMENT ON COLUMN "payment_order_number"."id" IS '自增主键';
COMMENT ON COLUMN "payment_order_number"."biz_type" IS '业务类型，唯一';
COMMENT ON COLUMN "payment_order_number"."begin_init_id" IS '开始id，初始值原始值';
COMMENT ON COLUMN "payment_order_number"."begin_id" IS '开始id，仅记录初始值，无其他含义。初始化时begin_id和max_id应相同';
COMMENT ON COLUMN "payment_order_number"."end_init_id" IS '结束id，初始值原始值';
COMMENT ON COLUMN "payment_order_number"."end_id" IS '结束id（备注：当只为空或者0时，无穷大）';
COMMENT ON COLUMN "payment_order_number"."max_id" IS '当前最大id';
COMMENT ON COLUMN "payment_order_number"."step" IS '步长';
COMMENT ON COLUMN "payment_order_number"."delta" IS '每次id增量';
COMMENT ON COLUMN "payment_order_number"."remainder" IS '余数';
COMMENT ON COLUMN "payment_order_number"."begin_string_array" IS '开头可用的字符串数组:0,1,2,3...Y,Z';
COMMENT ON COLUMN "payment_order_number"."this_use_begin_index" IS '当前使用的开头字符串下标';
COMMENT ON COLUMN "payment_order_number"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_order_number"."update_time" IS '更新时间';
COMMENT ON COLUMN "payment_order_number"."version" IS '版本号';
ALTER TABLE "payment_order_number" ADD PRIMARY KEY ("id");

CREATE TABLE "payment_refund_order" (
    "unid" VARCHAR(32) NOT NULL,
    "payment_app_id" VARCHAR(64) NOT NULL,
    "order_id" VARCHAR(32) NOT NULL,
    "order_number" VARCHAR(32) NOT NULL,
    "refund_origin" VARCHAR(4) NOT NULL,
    "refund_ip" VARCHAR(64) NOT NULL,
    "refund_channel" VARCHAR(4) NOT NULL,
    "refund_id" VARCHAR(255),
    "refund_amount" BIGINT NOT NULL,
    "currency" VARCHAR(4) NOT NULL,
    "goods_order_id" VARCHAR(255) NOT NULL,
    "goods_order_number" VARCHAR(255),
    "goods_order_name" VARCHAR(512),
    "goods_service_id" VARCHAR(255),
    "goods_service_name" VARCHAR(512),
    "goods_dept_id" VARCHAR(255),
    "goods_dept_name" VARCHAR(255),
    "goods_area_code" VARCHAR(255),
    "goods_area_name" VARCHAR(255),
    "description" VARCHAR(512),
    "bank_order_id" VARCHAR(255),
    "success_callback_url" VARCHAR(512),
    "fail_callback_url" VARCHAR(512),
    "fail_code" VARCHAR(64),
    "fail_message" TEXT,
    "language_code" VARCHAR(8) NOT NULL,
    "refund_status" VARCHAR(4) NOT NULL,
    "refund_request" TEXT,
    "refund_response" text,
    "create_time" VARCHAR(32) NOT NULL,
    "modify_time" VARCHAR(32) NOT NULL,
    "refund_time" VARCHAR(32),
    "merchant_account" VARCHAR(255),
    "operator_id" VARCHAR(64),
    "operator_name" VARCHAR(255),
    "user_id" VARCHAR(64),
    "user_name" VARCHAR(255),
    "task_id" VARCHAR(255),
    "payee_id" VARCHAR(64),
    "payee_name" VARCHAR(255),
    "merchant_id" VARCHAR(255),
    "merchant_password" VARCHAR(512)
);
COMMENT ON COLUMN "payment_refund_order"."unid" IS '主键';
COMMENT ON COLUMN "payment_refund_order"."payment_app_id" IS '对接支付中心应用ID';
COMMENT ON COLUMN "payment_refund_order"."order_id" IS '支付中心订单ID';
COMMENT ON COLUMN "payment_refund_order"."order_number" IS '支付中心订单号';
COMMENT ON COLUMN "payment_refund_order"."refund_origin" IS '退款来源';
COMMENT ON COLUMN "payment_refund_order"."refund_ip" IS '退款IP';
COMMENT ON COLUMN "payment_refund_order"."refund_channel" IS '退款渠道';
COMMENT ON COLUMN "payment_refund_order"."refund_id" IS '退款ID或账号';
COMMENT ON COLUMN "payment_refund_order"."refund_amount" IS '退款金额，最小货币单位分';
COMMENT ON COLUMN "payment_refund_order"."currency" IS '支付货币代码';
COMMENT ON COLUMN "payment_refund_order"."goods_order_id" IS '商品ID';
COMMENT ON COLUMN "payment_refund_order"."goods_order_number" IS '商品单号';
COMMENT ON COLUMN "payment_refund_order"."goods_order_name" IS '商品名称';
COMMENT ON COLUMN "payment_refund_order"."goods_service_id" IS '事项ID';
COMMENT ON COLUMN "payment_refund_order"."goods_service_name" IS '事项名称';
COMMENT ON COLUMN "payment_refund_order"."goods_dept_id" IS '部门ID';
COMMENT ON COLUMN "payment_refund_order"."goods_dept_name" IS '部门名称';
COMMENT ON COLUMN "payment_refund_order"."goods_area_code" IS '区域编码';
COMMENT ON COLUMN "payment_refund_order"."goods_area_name" IS '区域名称';
COMMENT ON COLUMN "payment_refund_order"."description" IS '退款描述';
COMMENT ON COLUMN "payment_refund_order"."bank_order_id" IS '支付平台订单号';
COMMENT ON COLUMN "payment_refund_order"."success_callback_url" IS '成功回调地址';
COMMENT ON COLUMN "payment_refund_order"."fail_callback_url" IS '失败回调地址';
COMMENT ON COLUMN "payment_refund_order"."fail_code" IS '失败编码';
COMMENT ON COLUMN "payment_refund_order"."fail_message" IS '失败信息';
COMMENT ON COLUMN "payment_refund_order"."language_code" IS '语言编码';
COMMENT ON COLUMN "payment_refund_order"."refund_status" IS '退款状态';
COMMENT ON COLUMN "payment_refund_order"."refund_request" IS '支付平台退款请求信息';
COMMENT ON COLUMN "payment_refund_order"."refund_response" IS '支付平台退款响应信息';
COMMENT ON COLUMN "payment_refund_order"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_refund_order"."modify_time" IS '修改时间';
COMMENT ON COLUMN "payment_refund_order"."refund_time" IS '退款时间';
COMMENT ON COLUMN "payment_refund_order"."merchant_account" IS '商户账号';
COMMENT ON COLUMN "payment_refund_order"."operator_id" IS '退款操作用户ID';
COMMENT ON COLUMN "payment_refund_order"."operator_name" IS '退款操作用户姓名';
COMMENT ON COLUMN "payment_refund_order"."user_id" IS '申请者ID（付款人ID）';
COMMENT ON COLUMN "payment_refund_order"."user_name" IS '申请者姓名（付款人ID）';
COMMENT ON COLUMN "payment_refund_order"."task_id" IS '申报步骤标识';
COMMENT ON COLUMN "payment_refund_order"."payee_id" IS '收款人ID';
COMMENT ON COLUMN "payment_refund_order"."payee_name" IS '收款人姓名';
COMMENT ON COLUMN "payment_refund_order"."merchant_id" IS '商户ID';
COMMENT ON COLUMN "payment_refund_order"."merchant_password" IS '商户密码';
ALTER TABLE "payment_refund_order" ADD PRIMARY KEY ("unid");
CREATE INDEX "payment_refund_order_bank_order_id" ON "payment_refund_order" ("bank_order_id");
CREATE INDEX "payment_refund_order_goods_order_id" ON "payment_refund_order" ("goods_order_id");
CREATE INDEX "payment_refund_order_refund_status" ON "payment_refund_order" ("refund_status");
CREATE INDEX "payment_refund_order_order_id" ON "payment_refund_order" ("order_id");
CREATE INDEX "payment_refund_order_order_number" ON "payment_refund_order" ("order_number");

CREATE TABLE "payment_register_item" (
    "unid" VARCHAR(32) NOT NULL,
    "order_id" VARCHAR(32) NOT NULL,
    "item_id" VARCHAR(512),
    "item_name" VARCHAR(1024) NOT NULL,
    "amount" BIGINT NOT NULL,
    "create_time" VARCHAR(32) NOT NULL,
    "modify_time" VARCHAR(32) NOT NULL
);
COMMENT ON COLUMN "payment_register_item"."unid" IS '主键';
COMMENT ON COLUMN "payment_register_item"."order_id" IS '支付中心订单ID';
COMMENT ON COLUMN "payment_register_item"."item_id" IS '明细id';
COMMENT ON COLUMN "payment_register_item"."item_name" IS '明细名称';
COMMENT ON COLUMN "payment_register_item"."amount" IS '金额';
COMMENT ON COLUMN "payment_register_item"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_register_item"."modify_time" IS '修改时间';
ALTER TABLE "payment_register_item" ADD PRIMARY KEY ("unid");

CREATE TABLE "payment_register_order" (
    "unid" VARCHAR(32) NOT NULL,
    "payment_app_id" VARCHAR(64) NOT NULL,
    "order_number" VARCHAR(32) NOT NULL,
    "payer_origin" VARCHAR(4) NOT NULL,
    "payer_ip" VARCHAR(64) NOT NULL,
    "payer_channel" VARCHAR(4) NOT NULL,
    "payer_id" VARCHAR(255),
    "merchant_id" VARCHAR(255),
    "merchant_account" VARCHAR(255),
    "merchant_password" VARCHAR(512),
    "goods_order_id" VARCHAR(255) NOT NULL,
    "goods_order_name" VARCHAR(512),
    "goods_order_number" VARCHAR(255),
    "goods_service_id" VARCHAR(128),
    "goods_service_name" VARCHAR(512),
    "goods_dept_id" VARCHAR(128),
    "goods_dept_name" VARCHAR(255),
    "goods_area_code" VARCHAR(128),
    "goods_area_name" VARCHAR(255),
    "payment_amount" BIGINT NOT NULL,
    "refund_amount" BIGINT NOT NULL,
    "total_amount" BIGINT NOT NULL,
    "currency" VARCHAR(4) NOT NULL,
    "description" VARCHAR(512),
    "bank_order_id" VARCHAR(255),
    "success_callback_url" VARCHAR(512),
    "fail_callback_url" VARCHAR(512),
    "language_code" VARCHAR(8) NOT NULL,
    "order_status" VARCHAR(4) NOT NULL,
    "register_request" TEXT,
    "register_response" text,
    "confirm_request" TEXT,
    "confirm_response" text,
    "udf1" VARCHAR(255),
    "udf2" VARCHAR(255),
    "udf3" VARCHAR(255),
    "udf4" VARCHAR(255),
    "udf5" VARCHAR(255),
    "create_time" VARCHAR(32) NOT NULL,
    "modify_time" VARCHAR(32) NOT NULL,
    "register_time" VARCHAR(32),
    "confirm_time" VARCHAR(32),
    "data_status" CHAR(2) NOT NULL,
    "form_url" VARCHAR(512),
    "fail_code" VARCHAR(64),
    "fail_message" TEXT,
    "user_id" VARCHAR(64),
    "user_name" VARCHAR(255),
    "task_id" VARCHAR(64),
    "payee_id" VARCHAR(64),
    "payee_name" VARCHAR(255)
);
COMMENT ON COLUMN "payment_register_order"."unid" IS '主键';
COMMENT ON COLUMN "payment_register_order"."payment_app_id" IS '对接支付中心应用ID';
COMMENT ON COLUMN "payment_register_order"."order_number" IS '支付中心订单号';
COMMENT ON COLUMN "payment_register_order"."payer_origin" IS '付款来源';
COMMENT ON COLUMN "payment_register_order"."payer_ip" IS '付款IP';
COMMENT ON COLUMN "payment_register_order"."payer_channel" IS '付款渠道';
COMMENT ON COLUMN "payment_register_order"."payer_id" IS '付款ID或账号';
COMMENT ON COLUMN "payment_register_order"."merchant_id" IS '商户ID';
COMMENT ON COLUMN "payment_register_order"."merchant_account" IS '商户账号';
COMMENT ON COLUMN "payment_register_order"."merchant_password" IS '商户秘钥';
COMMENT ON COLUMN "payment_register_order"."goods_order_id" IS '商品ID';
COMMENT ON COLUMN "payment_register_order"."goods_order_name" IS '商品名称';
COMMENT ON COLUMN "payment_register_order"."goods_order_number" IS '商品单号';
COMMENT ON COLUMN "payment_register_order"."goods_service_id" IS '事项ID';
COMMENT ON COLUMN "payment_register_order"."goods_service_name" IS '事项名称';
COMMENT ON COLUMN "payment_register_order"."goods_dept_id" IS '部门ID';
COMMENT ON COLUMN "payment_register_order"."goods_dept_name" IS '部门名称';
COMMENT ON COLUMN "payment_register_order"."goods_area_code" IS '区域编码';
COMMENT ON COLUMN "payment_register_order"."goods_area_name" IS '区域名称';
COMMENT ON COLUMN "payment_register_order"."payment_amount" IS '付款金额，最小货币单位分';
COMMENT ON COLUMN "payment_register_order"."refund_amount" IS '退款金额，最小货币单位分';
COMMENT ON COLUMN "payment_register_order"."total_amount" IS '最终付款金额，最小货币单位分';
COMMENT ON COLUMN "payment_register_order"."currency" IS '支付货币代码';
COMMENT ON COLUMN "payment_register_order"."description" IS '订单描述';
COMMENT ON COLUMN "payment_register_order"."bank_order_id" IS '支付平台订单号';
COMMENT ON COLUMN "payment_register_order"."success_callback_url" IS '成功回调地址';
COMMENT ON COLUMN "payment_register_order"."fail_callback_url" IS '失败回调地址';
COMMENT ON COLUMN "payment_register_order"."language_code" IS '语言编码';
COMMENT ON COLUMN "payment_register_order"."order_status" IS '订单状态';
COMMENT ON COLUMN "payment_register_order"."register_request" IS '支付平台支付下单请求信息';
COMMENT ON COLUMN "payment_register_order"."register_response" IS '支付平台支付下单响应信息';
COMMENT ON COLUMN "payment_register_order"."confirm_request" IS '支付平台支付确认请求信息';
COMMENT ON COLUMN "payment_register_order"."confirm_response" IS '支付平台支付确认响应信息';
COMMENT ON COLUMN "payment_register_order"."udf1" IS '扩展字段1';
COMMENT ON COLUMN "payment_register_order"."udf2" IS '扩展字段2';
COMMENT ON COLUMN "payment_register_order"."udf3" IS '扩展字段3';
COMMENT ON COLUMN "payment_register_order"."udf4" IS '扩展字段4';
COMMENT ON COLUMN "payment_register_order"."udf5" IS '扩展字段5';
COMMENT ON COLUMN "payment_register_order"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_register_order"."modify_time" IS '修改时间';
COMMENT ON COLUMN "payment_register_order"."register_time" IS '下单时间';
COMMENT ON COLUMN "payment_register_order"."confirm_time" IS '确认时间';
COMMENT ON COLUMN "payment_register_order"."data_status" IS '数据状态，01正常，02撤销';
COMMENT ON COLUMN "payment_register_order"."form_url" IS '下单成功，下单接口返回的formUrl';
COMMENT ON COLUMN "payment_register_order"."fail_code" IS '失败编码';
COMMENT ON COLUMN "payment_register_order"."fail_message" IS '失败信息';
COMMENT ON COLUMN "payment_register_order"."user_id" IS '申请者ID（付款人ID）';
COMMENT ON COLUMN "payment_register_order"."user_name" IS '申请者姓名（付款人ID）';
COMMENT ON COLUMN "payment_register_order"."task_id" IS '申报步骤标识';
COMMENT ON COLUMN "payment_register_order"."payee_id" IS '收款人ID';
COMMENT ON COLUMN "payment_register_order"."payee_name" IS '收款人姓名';
ALTER TABLE "payment_register_order" ADD PRIMARY KEY ("unid");
CREATE INDEX "payment_register_order_bank_order_id" ON "payment_register_order" ("bank_order_id");
CREATE INDEX "payment_register_order_goods_order_id" ON "payment_register_order" ("goods_order_id");
CREATE INDEX "payment_register_order_order_status" ON "payment_register_order" ("order_status");

CREATE TABLE "payment_terms" (
    "unid" VARCHAR(32) NOT NULL,
    "title" VARCHAR(255),
    "subtitle" VARCHAR(255),
    "dict_value" VARCHAR(2),
    "content" text,
    "create_time" VARCHAR(32),
    "modify_time" VARCHAR(32)
);
COMMENT ON COLUMN "payment_terms"."unid" IS '主键';
COMMENT ON COLUMN "payment_terms"."title" IS '标题';
COMMENT ON COLUMN "payment_terms"."subtitle" IS '副标题';
COMMENT ON COLUMN "payment_terms"."dict_value" IS '支付渠道字典值';
COMMENT ON COLUMN "payment_terms"."content" IS '内容';
COMMENT ON COLUMN "payment_terms"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_terms"."modify_time" IS '修改时间';
ALTER TABLE "payment_terms" ADD PRIMARY KEY ("unid");

CREATE TABLE "payment_terms_ardz" (
    "unid" VARCHAR(32) NOT NULL,
    "title" VARCHAR(255),
    "subtitle" VARCHAR(255),
    "dict_value" VARCHAR(2),
    "content" text,
    "create_time" VARCHAR(32),
    "modify_time" VARCHAR(32)
);
COMMENT ON COLUMN "payment_terms_ardz"."unid" IS '主键';
COMMENT ON COLUMN "payment_terms_ardz"."title" IS '标题';
COMMENT ON COLUMN "payment_terms_ardz"."subtitle" IS '副标题';
COMMENT ON COLUMN "payment_terms_ardz"."dict_value" IS '支付渠道字典值';
COMMENT ON COLUMN "payment_terms_ardz"."content" IS '内容';
COMMENT ON COLUMN "payment_terms_ardz"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_terms_ardz"."modify_time" IS '修改时间';
ALTER TABLE "payment_terms_ardz" ADD PRIMARY KEY ("unid");

CREATE TABLE "payment_terms_enus" (
    "unid" VARCHAR(32) NOT NULL,
    "title" VARCHAR(255),
    "subtitle" VARCHAR(255),
    "dict_value" VARCHAR(2),
    "content" text,
    "create_time" VARCHAR(32),
    "modify_time" VARCHAR(32)
);
COMMENT ON COLUMN "payment_terms_enus"."unid" IS '主键';
COMMENT ON COLUMN "payment_terms_enus"."title" IS '标题';
COMMENT ON COLUMN "payment_terms_enus"."subtitle" IS '副标题';
COMMENT ON COLUMN "payment_terms_enus"."dict_value" IS '支付渠道字典值';
COMMENT ON COLUMN "payment_terms_enus"."content" IS '内容';
COMMENT ON COLUMN "payment_terms_enus"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_terms_enus"."modify_time" IS '修改时间';
ALTER TABLE "payment_terms_enus" ADD PRIMARY KEY ("unid");

CREATE TABLE "payment_terms_frfr" (
    "unid" VARCHAR(32) NOT NULL,
    "title" VARCHAR(255),
    "subtitle" VARCHAR(255),
    "dict_value" VARCHAR(2),
    "content" text,
    "create_time" VARCHAR(32),
    "modify_time" VARCHAR(32)
);
COMMENT ON COLUMN "payment_terms_frfr"."unid" IS '主键';
COMMENT ON COLUMN "payment_terms_frfr"."title" IS '标题';
COMMENT ON COLUMN "payment_terms_frfr"."subtitle" IS '副标题';
COMMENT ON COLUMN "payment_terms_frfr"."dict_value" IS '支付渠道字典值';
COMMENT ON COLUMN "payment_terms_frfr"."content" IS '内容';
COMMENT ON COLUMN "payment_terms_frfr"."create_time" IS '创建时间';
COMMENT ON COLUMN "payment_terms_frfr"."modify_time" IS '修改时间';
ALTER TABLE "payment_terms_frfr" ADD PRIMARY KEY ("unid");

