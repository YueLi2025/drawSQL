CREATE TABLE "djpaypal_billingagreement"(
    "id" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "state" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "agreement_details" jsonb NOT NULL,
    "payer" jsonb NOT NULL,
    "shipping_address" jsonb NULL,
    "override_merchant_preferences" jsonb NOT NULL,
    "override_charge_mode" jsonb NOT NULL,
    "plan" jsonb NOT NULL,
    "merchant" jsonb NULL,
    "payer_model_id" VARCHAR(255) NULL,
    "user_id" INTEGER NULL,
    "plan_model_id" VARCHAR(255) NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "djpaypal_updated" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "start_date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "end_of_period" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
CREATE TABLE "djpaypal_billingplan"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "name" VARCHAR(255) NOT NULL,
        "description" VARCHAR(255) NOT NULL,
        "type" VARCHAR(255) NOT NULL,
        "state" VARCHAR(255) NOT NULL,
        "create_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "update_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "merchant_preferences" jsonb NOT NULL
);
CREATE TABLE "djpaypal_billingplan_payment_definitions"(
    "id" INTEGER NOT NULL,
    "billingplan_id" VARCHAR(255) NOT NULL,
    "paymentdefinition_id" VARCHAR(255) NOT NULL
);
CREATE INDEX "billingplan_id_paymentdefinition_id_index" ON
    "djpaypal_billingplan_payment_definitions"(
        "billingplan_id",
        "paymentdefinition_id"
    );
ALTER TABLE
    "djpaypal_billingplan_payment_definitions" ADD PRIMARY KEY("id");
CREATE TABLE "djpaypal_chargemodel"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "type" VARCHAR(255) NOT NULL,
        "amount" jsonb NOT NULL
);
CREATE TABLE "djpaypal_dispute"(
    "dispute_id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "create_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "update_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "disputed_transactions" jsonb NOT NULL,
        "reason" VARCHAR(255) NOT NULL,
        "status" VARCHAR(255) NOT NULL,
        "dispute_amount" jsonb NOT NULL,
        "dispute_outcome" jsonb NULL,
        "messages" jsonb NULL,
        "seller_response_due_date" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "dispute_flow" VARCHAR(255) NOT NULL,
        "dispute_channel" VARCHAR(255) NOT NULL,
        "dispute_life_cycle_stage" VARCHAR(255) NOT NULL,
        "offer" jsonb NULL,
        "buyer_response_due_date" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "refund_details" jsonb NULL
);
CREATE TABLE "djpaypal_payer"(
    "id" VARCHAR(255) NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "shipping_address" jsonb NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "user_id" INTEGER NULL,
        "time_created" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL
);
CREATE TABLE "djpaypal_payment"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "intent" VARCHAR(255) NOT NULL,
        "cart" VARCHAR(255) NULL,
        "payer" jsonb NULL,
        "transactions" jsonb NOT NULL,
        "state" VARCHAR(255) NOT NULL,
        "experience_profile_id" VARCHAR(255) NOT NULL,
        "note_to_payer" VARCHAR(255) NOT NULL,
        "create_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "update_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "redirect_urls" jsonb NOT NULL,
        "failure_reason" VARCHAR(255) NOT NULL
);
CREATE TABLE "djpaypal_paymentdefinition"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "name" VARCHAR(255) NOT NULL,
        "type" VARCHAR(255) NOT NULL,
        "frequency_interval" SMALLINT NOT NULL,
        "frequency" VARCHAR(255) NOT NULL,
        "cycles" SMALLINT NOT NULL,
        "amount" jsonb NOT NULL
);
CREATE TABLE "djpaypal_paymentdefinition_charge_models"(
    "id" INTEGER NOT NULL,
    "paymentdefinition_id" VARCHAR(255) NOT NULL,
    "chargemodel_id" VARCHAR(255) NOT NULL
);
CREATE INDEX "paymentdefinition_id_chargemodel_id_index" ON
    "djpaypal_paymentdefinition_charge_models"(
        "paymentdefinition_id",
        "chargemodel_id"
    );
ALTER TABLE
    "djpaypal_paymentdefinition_charge_models" ADD PRIMARY KEY("id");
CREATE TABLE "djpaypal_preparedbillingagreement"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "data" jsonb NOT NULL,
    "executed_at" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "canceled_at" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "created" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "executed_agreement_id" VARCHAR(255) NULL,
        "user_id" INTEGER NOT NULL
);
CREATE TABLE "djpaypal_refund"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "amount" jsonb NOT NULL,
        "state" VARCHAR(255) NOT NULL,
        "reason" TEXT NOT NULL,
        "invoice_number" VARCHAR(255) NOT NULL,
        "description" TEXT NOT NULL,
        "create_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "update_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "reason_code" VARCHAR(255) NOT NULL,
        "refund_reason_code" VARCHAR(255) NOT NULL,
        "refund_funding_type" VARCHAR(255) NOT NULL,
        "parent_payment_id" VARCHAR(255) NULL,
        "sale_id" VARCHAR(255) NOT NULL,
        "refund_from_received_amount" jsonb NULL,
        "refund_from_transaction_fee" jsonb NULL,
        "total_refunded_amount" jsonb NULL,
        "refund_to_payer" jsonb NULL
);
CREATE TABLE "djpaypal_sale"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "amount" jsonb NOT NULL,
        "payment_mode" VARCHAR(255) NOT NULL,
        "state" VARCHAR(255) NOT NULL,
        "reason_code" VARCHAR(255) NOT NULL,
        "protection_eligibility" VARCHAR(255) NOT NULL,
        "protection_eligibility_type" VARCHAR(255) NOT NULL,
        "clearing_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "transaction_fee" jsonb NULL,
        "receivable_amount" jsonb NULL,
        "exchange_rate" VARCHAR(255) NOT NULL,
        "fmf_details" jsonb NULL,
        "receipt_id" VARCHAR(255) NOT NULL,
        "processor_response" jsonb NULL,
        "create_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "update_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "soft_descriptor" VARCHAR(255) NOT NULL,
        "billing_agreement_id" VARCHAR(255) NULL,
        "parent_payment_id" VARCHAR(255) NULL,
        "invoice_number" VARCHAR(255) NOT NULL,
        "payment_hold_reasons" jsonb NULL,
        "payment_hold_status" VARCHAR(255) NULL
);
CREATE TABLE "djpaypal_webhookevent"(
    "id" VARCHAR(255) NOT NULL,
    "livemode" BOOLEAN NOT NULL,
    "djpaypal_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "djpaypal_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "event_version" VARCHAR(255) NOT NULL,
        "create_time" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "event_type" VARCHAR(255) NOT NULL,
        "resource_type" VARCHAR(255) NOT NULL,
        "resource" jsonb NOT NULL,
        "status" VARCHAR(255) NOT NULL,
        "summary" VARCHAR(255) NOT NULL,
        "transmissions" jsonb NULL
);
CREATE TABLE "djpaypal_webhookeventtrigger"(
    "id" INTEGER NOT NULL,
    "remote_ip" INTEGER NOT NULL,
    "headers" jsonb NOT NULL,
    "body" TEXT NOT NULL,
    "valid" BOOLEAN NOT NULL,
    "processed" BOOLEAN NOT NULL,
    "exception" VARCHAR(255) NOT NULL,
    "traceback" TEXT NOT NULL,
    "djpaypal_version" VARCHAR(255) NOT NULL,
    "created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL,
        "webhook_event_id" VARCHAR(255) NULL
);
ALTER TABLE
    "djpaypal_webhookeventtrigger" ADD PRIMARY KEY("id");
ALTER TABLE
    "djpaypal_billingplan_payment_definitions" ADD CONSTRAINT "djpaypal_billingplan_payment_definitions_paymentdefinition_id_foreign" FOREIGN KEY("paymentdefinition_id") REFERENCES "djpaypal_paymentdefinition"("id");
ALTER TABLE
    "djpaypal_refund" ADD CONSTRAINT "djpaypal_refund_parent_payment_id_foreign" FOREIGN KEY("parent_payment_id") REFERENCES "djpaypal_payment"("id");
ALTER TABLE
    "djpaypal_refund" ADD CONSTRAINT "djpaypal_refund_sale_id_foreign" FOREIGN KEY("sale_id") REFERENCES "djpaypal_sale"("id");
ALTER TABLE
    "djpaypal_billingagreement" ADD CONSTRAINT "djpaypal_billingagreement_id_foreign" FOREIGN KEY("id") REFERENCES "djpaypal_sale"("billing_agreement_id");
ALTER TABLE
    "djpaypal_billingplan" ADD CONSTRAINT "djpaypal_billingplan_id_foreign" FOREIGN KEY("id") REFERENCES "djpaypal_billingplan_payment_definitions"("billingplan_id");
ALTER TABLE
    "djpaypal_preparedbillingagreement" ADD CONSTRAINT "djpaypal_preparedbillingagreement_executed_agreement_id_foreign" FOREIGN KEY("executed_agreement_id") REFERENCES "djpaypal_billingagreement"("id");
ALTER TABLE
    "djpaypal_billingplan" ADD CONSTRAINT "djpaypal_billingplan_id_foreign" FOREIGN KEY("id") REFERENCES "djpaypal_billingagreement"("plan_model_id");
ALTER TABLE
    "djpaypal_webhookevent" ADD CONSTRAINT "djpaypal_webhookevent_id_foreign" FOREIGN KEY("id") REFERENCES "djpaypal_webhookeventtrigger"("webhook_event_id");
ALTER TABLE
    "djpaypal_paymentdefinition_charge_models" ADD CONSTRAINT "djpaypal_paymentdefinition_charge_models_chargemodel_id_foreign" FOREIGN KEY("chargemodel_id") REFERENCES "djpaypal_chargemodel"("id");
ALTER TABLE
    "djpaypal_sale" ADD CONSTRAINT "djpaypal_sale_parent_payment_id_foreign" FOREIGN KEY("parent_payment_id") REFERENCES "djpaypal_payment"("id");
ALTER TABLE
    "djpaypal_paymentdefinition_charge_models" ADD CONSTRAINT "djpaypal_paymentdefinition_charge_models_paymentdefinition_id_foreign" FOREIGN KEY("paymentdefinition_id") REFERENCES "djpaypal_paymentdefinition"("id");
ALTER TABLE
    "djpaypal_billingagreement" ADD CONSTRAINT "djpaypal_billingagreement_payer_model_id_foreign" FOREIGN KEY("payer_model_id") REFERENCES "djpaypal_payer"("id");