table_map = {
    "bf_offline_payment_form": {
        "join": [
            "bf_offline_payment_form.id = bf_no_order_advance_payment_form_normal_payment.payment_form_id",
            "bf_offline_payment_form.id = bf_no_order_advance_payment_form_payment_apply.payment_form_id",
            "bf_offline_payment_form.id = bf_no_order_advance_payment_form_write_off.payment_form_id",
            "bf_offline_payment_form.id = bf_offline_payment_form_advance_back_detail.payment_form_id",
            "bf_offline_payment_form.id = bf_offline_payment_form_auditor.payment_form_id",
            "bf_offline_payment_form.id = bf_offline_payment_form_public_order.payment_form_id",
            "bf_offline_payment_form.id = bf_offline_payment_form_pay_detail.payment_form_id"
        ],
        "keyword": "线下业务-付款单相关"
    },
    "bf_no_order_advance_payment_form_normal_payment": {
        "join": [],
        "keyword": ""
    },
    "bf_no_order_advance_payment_form_payment_apply": {
        "join": [],
        "keyword": ""
    },
    "bf_no_order_advance_payment_form_write_off": {
        "join": [],
        "keyword": ""
    },
    "bf_offline_payment_form_advance_back_detail": {
        "join": [],
        "keyword": ""
    },
    "bf_offline_payment_form_auditor": {
        "join": [],
        "keyword": ""
    },
    "bf_offline_payment_form_public_order": {
        "join": [],
        "keyword": ""
    },
    "bf_offline_payment_form_pay_detail": {
        "join": [],
        "keyword": ""
    }

}

# bf_offline_payment_form.id = bf_no_order_advance_payment_form_normal_payment.payment_form_id
# bf_offline_payment_form.id = bf_no_order_advance_payment_form_payment_apply.payment_form_id    
# bf_offline_payment_form.id = bf_no_order_advance_payment_form_write_off.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_advance_back_detail.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_auditor.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_public_order.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_pay_detail.payment_form_id    