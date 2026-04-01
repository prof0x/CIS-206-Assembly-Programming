#include <stdio.h>
#include "employee.h"

int main() {

    Employee emp = get_employee_from_user();

    if (is_eligible_for_overtime(emp)) {
        emp.pay = calculate_overtime_pay(emp);
    } else {
        emp.pay = calculate_regular_pay(emp);
    }

    if (is_eligible_for_bonus(emp)) {
        emp.pay = apply_bonus(emp);
    }

    display_pay_summary(emp);

    return 0;
}