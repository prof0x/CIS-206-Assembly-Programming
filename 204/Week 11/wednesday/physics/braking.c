#include <stdio.h>
#include <gsl/gsl_spline.h>
#include <gsl/gsl_odeiv2.h>
#include <gsl/gsl_errno.h>

#define GRAVITY 9.80665
#define KPH_TO_MS (1.0/3.6)
#define MS_TO_KPH 3.6

// Tire grip data (mu vs speed in km/h)
static double speed_kph[] = { 0, 30, 60, 90, 120, 150, 180, 210 };
static double mu_data[]   = { 0.95, 0.98, 0.96, 0.91, 0.85, 0.78, 0.70, 0.61 };
static int n_points = 8;

static gsl_spline *spline;
static gsl_interp_accel *acc;

// Interpolated grip as function of speed (km/h)
double grip(double v_kph){
    if(v_kph < 0) v_kph = 0;
    if(v_kph > 210) v_kph = 210;
    return gsl_spline_eval(spline, v_kph, acc);
}

// Analytical stopping distance estimate from current speed
double stopping_distance_estimate(double v_mps) {
    if (v_mps <= 0.0) return 0.0;

    double v_kph = v_mps * MS_TO_KPH;
    double mu = grip(v_kph);

    return (v_mps * v_mps) / (2 * mu * GRAVITY);
}

// ODE system:
// y[0] = velocity (m/s)
// y[1] = distance (m)
int braking_ode(double t, const double y[], double dydt[], void *params) {
    (void)t;
    (void)params;

    double v_kph = y[0] * MS_TO_KPH;

    dydt[0] = -grip(v_kph) * GRAVITY; // dv/dt
    dydt[1] = y[0];                   // dx/dt

    return GSL_SUCCESS;
}

// Numerical braking distance using ODE
double braking_distance(double start_kph) {
    double y[2] = { start_kph * KPH_TO_MS, 0.0 };

    gsl_odeiv2_system sys = { braking_ode, NULL, 2, NULL };

    gsl_odeiv2_driver *driver =
        gsl_odeiv2_driver_alloc_y_new(&sys,
            gsl_odeiv2_step_rkf45,
            1e-3,   // initial step
            1e-6,   // abs error
            1e-6);  // rel error

    double t = 0.0;

    // Print header
    printf("\n%-8s %-12s %-10s %-12s %-15s\n",
           "Time(s)", "Speed(km/h)", "Grip(mu)", "Remaining(m)", "Travelled(m)");
    printf("-----------------------------------------------------------------------\n");

    double next_print = 0.0;

    while (y[0] > 0.1) {
        if (t >= next_print) {
            double v_kph = y[0] * MS_TO_KPH;
            double remain = stopping_distance_estimate(y[0]);

            printf("%-8.1f %-12.1f %-10.3f %-12.1f %-15.1f\n",
                   t,
                   v_kph,
                   grip(v_kph),
                   remain,
                   y[1]);

            next_print += .5;
        }

        int status = gsl_odeiv2_driver_apply(driver, &t, t + 0.01, y);
        if (status != GSL_SUCCESS) {
            printf("Error: ODE solver failed.\n");
            break;
        }
    }

    // Final state
    printf("%-8.1f %-12.1f %-10.3f %-12.1f %-15.1f\n",
           t,
           0.0,
           grip(0.0),
           0.0,
           y[1]);

    printf("-----------------------------------------------------------------------\n");

    gsl_odeiv2_driver_free(driver);

    return y[1];
}

int main() {
    double speed;

    printf("Please enter a speed (km/h): ");
    scanf("%lf", &speed);

    // Initialize spline
    acc = gsl_interp_accel_alloc();
    spline = gsl_spline_alloc(gsl_interp_cspline, n_points);
    gsl_spline_init(spline, speed_kph, mu_data, n_points);

    printf("\nSpeed:                  %.0f km/h\n", speed);
    printf("Grip at entry (mu):     %.3f\n", grip(speed));

    double dist = braking_distance(speed);

    printf("Braking distance:       %.1f m\n", dist);

    // Cleanup
    gsl_spline_free(spline);
    gsl_interp_accel_free(acc);

    return 0;
}