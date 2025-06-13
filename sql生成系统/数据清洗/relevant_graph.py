tableMap = {
    "bf_offline_payment_form": {
        "join": {
            "id = bf_no_order_advance_payment_form_normal_payment.payment_form_id",
            "id = bf_no_order_advance_payment_form_payment_apply.payment_form_id",
            "id = bf_no_order_advance_payment_form_write_off.payment_form_id",
            "id = bf_offline_payment_form_advance_back_detail.payment_form_id",
            "id = bf_offline_payment_form_auditor.payment_form_id",
            "id = bf_offline_payment_form_public_order.payment_form_id",
            "id = bf_offline_payment_form_pay_detail.payment_form_id"
        },
        "keyword": "线下业务-付款单-主表"
    }
}

# bf_offline_payment_form.id = bf_no_order_advance_payment_form_normal_payment.payment_form_id
# bf_offline_payment_form.id = bf_no_order_advance_payment_form_payment_apply.payment_form_id    
# bf_offline_payment_form.id = bf_no_order_advance_payment_form_write_off.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_advance_back_detail.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_auditor.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_public_order.payment_form_id    
# bf_offline_payment_form.id = bf_offline_payment_form_pay_detail.payment_form_id    

# bf_offline_pledge.id = bf_offline_pledge_company.pledged_id
# bf_offline_pledge.id = bf_offline_pledge_customer.pledged_id
# bf_offline_pledge.id = bf_offline_pledge_detail.pledge_id
# bf_offline_pledge.id = bf_offline_pledge_discount.pledged_id
# bf_offline_pledge.id = bf_offline_pledge_history.pledge_id
# bf_offline_pledge.id = bf_offline_pledge_three.pledged_id
# bf_offline_pledge.id = bf_offline_pledge_back.pledged_id

# bf_offline_pledge_back.id = bf_offline_pledge_back_detail.pledged_back_id
# bf_offline_pledge_company.id = bf_offline_pledge_company_detail.pledged_company_id
# bf_offline_pledge_customer.id = bf_offline_pledge_customer_detail.pledge_customer_id
# bf_offline_pledge_discount.id = bf_offline_pledge_discount_detail.pledged_discount_id
# bf_offline_pledge_three.id = bf_offline_pledge_three_detail.pledged_three_id