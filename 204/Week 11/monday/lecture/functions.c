#include <stdio.h>
#include <math.h>

// function prototypes
double voltage_from_pi(double power, double current);
double current_from_pv(double power, double voltage);
double power_from_vi(double voltage, double current);

int main() {
    int voltage = voltage_from_pi(100.0, 2.0); // Voltage (V)  from 100W and 2A
    int current = current_from_pv(100.0, 50.0); // Current (I) from 100W and 50V
    int power = power_from_vi(120.0, 5.0); // How much power (W) can we get from 120V and 5A
}

double voltage_from_pi(double power, double current){
    return power / current;
}

double current_from_pv(double power, double voltage){
    return power / voltage;
}

double power_from_vi(double voltage, double current){
    return voltage * current;
}