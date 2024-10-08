---
layout: default
version: 
title: Methods in the thermo class
permalink: /vcurrent/thermo_methods.html
---

<!--- 
Generated at: 2024-07-25T14:16:10.431252
This is an auto-generated file, generated using the script at thermopack/addon/pyUtils/docs/markdown_from_docstrings.py
The file is created by parsing the docstrings of the methods in the 
thermo class. For instructions on how to use the parser routines, see the
file thermopack/addon/pyUtils/docs/markdown_from_docstrings.py--->

The `thermo` class, found in `addon/pycThermopack/thermopack/thermo.py`, is the core of the ThermoPack Python interface. All equation of state classes inherit from `thermo`. This is the class that contains the interface to all practical calculations that can be done from the python-side of ThermoPack. Derived classes only implement specific functions for parameter handling etc.

## Table of contents
  * [TV-property interfaces](#tv-property-interfaces)
    * [chemical_potential_tv](#chemical_potential_tvself-temp-volume-n-dmudtnone-dmudvnone-dmudnnone-property_flagir)
    * [enthalpy_tv](#enthalpy_tvself-temp-volume-n-dhdtnone-dhdvnone-dhdnnone-property_flagir)
    * [entropy_tv](#entropy_tvself-temp-volume-n-dsdtnone-dsdvnone-dsdnnone-property_flagir)
    * [fugacity_tv](#fugacity_tvself-temp-volume-n-dlnphidtnone-dlnphidvnone-dlnphidnnone)
    * [helmholtz_tv](#helmholtz_tvself-temp-volume-n-dadtnone-dadvnone-dadnnone-property_flagir)
    * [internal_energy_tv](#internal_energy_tvself-temp-volume-n-dedtnone-dedvnone-dednnone-property_flagir)
    * [pressure_tv](#pressure_tvself-temp-volume-n-dpdtnone-dpdvnone-dpdnnone-property_flagir)
    * [speed_of_sound_tv](#speed_of_sound_tvself-temp-volume-n)
  * [Tp-property interfaces](#tp-property-interfaces)
    * [enthalpy](#enthalpyself-temp-press-x-phase-dhdtnone-dhdpnone-dhdnnone-residualfalse)
    * [entropy](#entropyself-temp-press-x-phase-dsdtnone-dsdpnone-dsdnnone-residualfalse)
    * [idealenthalpysingle](#idealenthalpysingleself-temp-j-dhdtnone)
    * [idealentropysingle](#idealentropysingleself-temp-press-j-dsdtnone-dsdpnone)
    * [solid_enthalpy](#solid_enthalpyself-temp-press-x-dhdtnone-dhdpnone)
    * [solid_entropy](#solid_entropyself-temp-press-x-dsdtnone-dsdpnone)
    * [solid_volume](#solid_volumeself-temp-press-x-dvdtnone-dvdpnone)
    * [specific_volume](#specific_volumeself-temp-press-x-phase-dvdtnone-dvdpnone-dvdnnone)
    * [speed_of_sound](#speed_of_soundself-temp-press-x-y-z-betav-betal-phase)
    * [thermo](#thermoself-temp-press-x-phase-dlnfugdtnone-dlnfugdpnone-dlnfugdnnone-ophasenone-vnone)
    * [zfac](#zfacself-temp-press-x-phase-dzdtnone-dzdpnone-dzdnnone)
  * [TVp-property interfaces](#tvp-property-interfaces)
    * [enthalpy_tvp](#enthalpy_tvpself-temp-volume-n-dhdtnone-dhdpnone-dhdnnone-property_flagir)
    * [entropy_tvp](#entropy_tvpself-temp-volume-n-dsdtnone-dsdpnone-dsdnnone-property_flagir)
    * [thermo_tvp](#thermo_tvpself-temp-v-n-phasenone-dlnfugdtnone-dlnfugdpnone-dlnfugdnnone)
  * [Other property interfaces](#other-property-interfaces)
    * [density_lnf_t](#density_lnf_tself-temp-lnf-rho_initial)
    * [density_mu_t](#density_mu_tself-temp-mu-rho_initial)
    * [tv_meta_ps](#tv_meta_psself-pressure-entropy-n-volume_initial-temp_initial)
  * [Flash interfaces](#flash-interfaces)
    * [guess_phase](#guess_phaseself-temp-press-z)
    * [set_ph_tolerance](#set_ph_toleranceself-tol)
    * [two_phase_phflash](#two_phase_phflashself-press-z-enthalpy-tempnone)
    * [two_phase_psflash](#two_phase_psflashself-press-z-entropy-tempnone)
    * [two_phase_tpflash](#two_phase_tpflashself-temp-press-z)
    * [two_phase_uvflash](#two_phase_uvflashself-z-specific_energy-specific_volume-tempnone-pressnone)
  * [Saturation interfaces](#saturation-interfaces)
    * [_property_index_from_string](#_property_index_from_stringself-prop-str)
    * [binary_triple_point_pressure](#binary_triple_point_pressureself-temp-maximum_pressure150000000-minimum_pressure100000)
    * [bubble_pressure](#bubble_pressureself-temp-z)
    * [bubble_temperature](#bubble_temperatureself-press-z)
    * [dew_pressure](#dew_pressureself-temp-z)
    * [dew_temperature](#dew_temperatureself-press-z)
    * [envelope_isentrope_cross](#envelope_isentrope_crossself-entropy-initial_pressure-z-maximum_pressure150000000-minimum_temperaturenone-step_sizenone-initial_temperaturenone)
    * [get_binary_pxy](#get_binary_pxyself-temp-maximum_pressure150000000-minimum_pressure10-maximum_dz0003-maximum_dlns001)
    * [get_binary_txy](#get_binary_txyself-pressure-minimum_temperature00-maximum_dz0003-maximum_dlns0005)
    * [get_bp_term](#get_bp_termself-i_term)
    * [get_envelope_twophase](#get_envelope_twophaseself-initial_pressure-z-maximum_pressure150000000-minimum_temperaturenone-step_size_factor10-step_sizenone-calc_vfalse-initial_temperaturenone-calc_cricondenfalse)
    * [get_pure_fluid_saturation_curve](#get_pure_fluid_saturation_curveself-initial_pressure-initial_temperaturenone-inone-max_delta_press200000-nmax100-log_linear_gridfalse)
    * [global_binary_plot](#global_binary_plotself-maximum_pressure150000000-minimum_pressure1000000-minimum_temperature1500-maximum_temperature5000-include_azeotropesfalse)
    * [melting_pressure_correlation](#melting_pressure_correlationself-i-maximum_temperaturenone-nmax100-scale_to_eostrue)
    * [saturation_point_from_property_bracket_search](#saturation_point_from_property_bracket_searchself-z-prop_val-prop-temp_1-press_1-x_1-y_1-temp_2-press_2-x_2-y_2)
    * [saturation_points_from_property](#saturation_points_from_propertyself-initial_pressure-z-prop_grid-prop-maximum_pressure150000000-minimum_temperaturenone-step_sizenone)
    * [solid_envelope_plot](#solid_envelope_plotself-initial_pressure-z-maximum_pressure150000000-minimum_temperature1700-calc_esvfalse)
    * [sublimation_pressure_correlation](#sublimation_pressure_correlationself-i-minimum_temperaturenone-nmax100-scale_to_eostrue)
  * [Isolines](#isolines)
    * [get_isenthalp](#get_isenthalpself-enthalpy-z-minimum_pressure1000000-maximum_pressure150000000-minimum_temperature2000-maximum_temperature5000-nmax100)
    * [get_isentrope](#get_isentropeself-entropy-z-minimum_pressure1000000-maximum_pressure150000000-minimum_temperature2000-maximum_temperature5000-nmax100)
    * [get_isobar](#get_isobarself-press-z-minimum_temperature2000-maximum_temperature5000-nmax100)
    * [get_isotherm](#get_isothermself-temp-z-minimum_pressure1000000-maximum_pressure150000000-nmax100)
    * [map_meta_isentrope](#map_meta_isentropeself-z-initial_pressure-entropy-minimum_pressure-n_max50)
    * [map_meta_isotherm](#map_meta_isothermself-temperature-z-phase-n50)
  * [Stability interfaces](#stability-interfaces)
    * [critical](#criticalself-n-temp00-v00-tol1e-07-v_minnone)
    * [critical_pressure](#critical_pressureself-i)
    * [critical_temperature](#critical_temperatureself-i)
    * [critical_volume](#critical_volumeself-i)
    * [density_lnf_t](#density_lnf_tself-temp-lnf-rho_initial)
    * [density_mu_t](#density_mu_tself-temp-mu-rho_initial)
    * [get_critical_parameters](#get_critical_parametersself-i)
    * [map_meta_isentrope](#map_meta_isentropeself-z-initial_pressure-entropy-minimum_pressure-n_max50)
    * [map_meta_isotherm](#map_meta_isothermself-temperature-z-phase-n50)
    * [spinodal](#spinodalself-z-initial_pressure1000000-initial_liquid_temperaturenone-dlnvnone-min_temperature_vapornone)
    * [spinodal_point](#spinodal_pointself-z-pressure-phase-temperaturenone)
    * [tv_meta_ps](#tv_meta_psself-pressure-entropy-n-volume_initial-temp_initial)
  * [Virial interfaces](#virial-interfaces)
    * [binary_third_virial_matrix](#binary_third_virial_matrixself-temp)
    * [second_virial_matrix](#second_virial_matrixself-temp)
    * [virial_coeffcients](#virial_coeffcientsself-temp-n)
  * [Joule-Thompson interface](#joule-thompson-interface)
    * [joule_thompson_inversion](#joule_thompson_inversionself-z-nmax1000)
  * [Utility methods](#utility-methods)
    * [acentric_factor](#acentric_factorself-i)
    * [compmoleweight](#compmoleweightself-comp-si_unitsfalse)
    * [get_comp_name](#get_comp_nameself-index-get_comp_identifierfalse)
    * [get_comp_structure](#get_comp_structureself-comp_name)
    * [get_enthalpy_of_formation](#get_enthalpy_of_formationself-j)
    * [get_ideal_cp](#get_ideal_cpself-j)
    * [get_numerical_robustness_level](#get_numerical_robustness_levelself)
    * [get_phase_flags](#get_phase_flagsself)
    * [get_phase_type](#get_phase_typeself-i_phase)
    * [get_pmax](#get_pmaxself)
    * [get_pmin](#get_pminself)
    * [get_standard_entropy](#get_standard_entropyself-j)
    * [get_tmax](#get_tmaxself)
    * [get_tmin](#get_tminself)
    * [getcompindex](#getcompindexself-comp)
    * [moleweight](#moleweightself-z-si_unitstrue)
    * [redefine_critical_parameters](#redefine_critical_parametersself-silenttrue-tc_initialsnone-vc_initialsnone)
    * [set_enthalpy_of_formation](#set_enthalpy_of_formationself-j-h0)
    * [set_ideal_cp](#set_ideal_cpself-j-cp_correlation_type-parameters)
    * [set_numerical_robustness_level](#set_numerical_robustness_levelself-level)
    * [set_pmax](#set_pmaxself-press)
    * [set_pmin](#set_pminself-press)
    * [set_standard_entropy](#set_standard_entropyself-j-s0-reference_pressure1bar)
    * [set_tmax](#set_tmaxself-temp)
    * [set_tmin](#set_tminself-temp)
  * [Internal methods](#internal-methods)
    * [\_\_del\_\_](#__del__self)
    * [\_\_init\_\_](#__init__self)
    * [\_\_new\_\_](#__new__cls-args-kwargs)
    * [_get_true_int_value](#_get_true_int_valueself)
    * [activate](#activateself)
    * [add_eos](#add_eosself)
    * [delete_eos](#delete_eosself)
    * [disable_volume_translation](#disable_volume_translationself)
    * [get_export_name](#get_export_nameself-module-method)
    * [get_model_id](#get_model_idself)
    * [init_peneloux_volume_translation](#init_peneloux_volume_translationself-parameter_referencedefault)
    * [init_solid](#init_solidself-scomp)
    * [init_thermo](#init_thermoself-eos-mixing-alpha-comps-nphases-liq_vap_discr_methodnone-csp_eosnone-csp_ref_compnone-kij_refdefault-alpha_refdefault-saft_refdefault-b_exponentnone-trendeosforcpnone-cptypenone-silentnone)

## TV-property interfaces

Computing properties as a function of temperature and volume. Derivatives returned by methods in this section are computed as functions of (T, V, n).

### Table of contents
  * [TV-property interfaces](#tv-property-interfaces)
    * [chemical_potential_tv](#chemical_potential_tvself-temp-volume-n-dmudtnone-dmudvnone-dmudnnone-property_flagir)
    * [enthalpy_tv](#enthalpy_tvself-temp-volume-n-dhdtnone-dhdvnone-dhdnnone-property_flagir)
    * [entropy_tv](#entropy_tvself-temp-volume-n-dsdtnone-dsdvnone-dsdnnone-property_flagir)
    * [fugacity_tv](#fugacity_tvself-temp-volume-n-dlnphidtnone-dlnphidvnone-dlnphidnnone)
    * [helmholtz_tv](#helmholtz_tvself-temp-volume-n-dadtnone-dadvnone-dadnnone-property_flagir)
    * [internal_energy_tv](#internal_energy_tvself-temp-volume-n-dedtnone-dedvnone-dednnone-property_flagir)
    * [pressure_tv](#pressure_tvself-temp-volume-n-dpdtnone-dpdvnone-dpdnnone-property_flagir)
    * [speed_of_sound_tv](#speed_of_sound_tvself-temp-volume-n)


### `chemical_potential_tv(self, temp, volume, n, dmudt=None, dmudv=None, dmudn=None, property_flag='IR')`
Calculate chemical potential given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dmudt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dmudv (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dmudn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (integer, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual (R) and/or ideal (I) entropy. Defaults to IR.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Chemical potential (J/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally chemical potential differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `enthalpy_tv(self, temp, volume, n, dhdt=None, dhdv=None, dhdn=None, property_flag='IR')`
Calculate enthalpy given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dhdt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dhdv (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dhdn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (integer, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual (R) and/or ideal (I) entropy. Defaults to IR.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Enthalpy (J)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally enthalpy differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `entropy_tv(self, temp, volume, n, dsdt=None, dsdv=None, dsdn=None, property_flag='IR')`
Calculate entropy given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dsdt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdv (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (integer, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual (R) and/or ideal (I) entropy. Defaults to IR.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Entropy (J/K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally entropy differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `fugacity_tv(self, temp, volume, n, dlnphidt=None, dlnphidv=None, dlnphidn=None)`
Calculate natural logarithm of fugacity given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dlnphidt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dlnphidv (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dlnphidn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarry:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Natural logarithm of fugacity

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `helmholtz_tv(self, temp, volume, n, dadt=None, dadv=None, dadn=None, property_flag='IR')`
Calculate Helmholtz energy given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dadt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dadv (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dadn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (integer, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual (R) and/or ideal (I) entropy. Defaults to IR.

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Helmholtz energy (J)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally energy differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `internal_energy_tv(self, temp, volume, n, dedt=None, dedv=None, dedn=None, property_flag='IR')`
Calculate internal energy given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dedt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dedv (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dedn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual ('R'), ideal ('I') or total ('IR') internal energy. Defaults to 'IR'.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Energy (J)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally energy differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `pressure_tv(self, temp, volume, n, dpdt=None, dpdv=None, dpdn=None, property_flag='IR')`
Calculate pressure given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dpdt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dpdv (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dpdn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual ('R'), ideal ('I') or total ('IR') pressure. Defaults to 'IR'.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally pressure differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `speed_of_sound_tv(self, temp, volume, n)`
Calculate speed of sound for single phase fluid

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Speed of sound (m/s)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Tp-property interfaces

Computing properties as a function of temperature and pressure. Derivatives returned by methods in this section are computed as functions of (T, p, n).

### Table of contents
  * [Tp-property interfaces](#tp-property-interfaces)
    * [enthalpy](#enthalpyself-temp-press-x-phase-dhdtnone-dhdpnone-dhdnnone-residualfalse)
    * [entropy](#entropyself-temp-press-x-phase-dsdtnone-dsdpnone-dsdnnone-residualfalse)
    * [idealenthalpysingle](#idealenthalpysingleself-temp-j-dhdtnone)
    * [idealentropysingle](#idealentropysingleself-temp-press-j-dsdtnone-dsdpnone)
    * [solid_enthalpy](#solid_enthalpyself-temp-press-x-dhdtnone-dhdpnone)
    * [solid_entropy](#solid_entropyself-temp-press-x-dsdtnone-dsdpnone)
    * [solid_volume](#solid_volumeself-temp-press-x-dvdtnone-dvdpnone)
    * [specific_volume](#specific_volumeself-temp-press-x-phase-dvdtnone-dvdpnone-dvdnnone)
    * [speed_of_sound](#speed_of_soundself-temp-press-x-y-z-betav-betal-phase)
    * [thermo](#thermoself-temp-press-x-phase-dlnfugdtnone-dlnfugdpnone-dlnfugdnnone-ophasenone-vnone)
    * [zfac](#zfacself-temp-press-x-phase-dzdtnone-dzdpnone-dzdnnone)


### `enthalpy(self, temp, press, x, phase, dhdt=None, dhdp=None, dhdn=None, residual=False)`
Calculate specific single-phase enthalpy Note that the order of the output match the default order of input for the differentials. Note further that dhdt, dhdp and dhdn only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate root for specified phase

&nbsp;&nbsp;&nbsp;&nbsp; **dhdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate enthalpy differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dhdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate enthalpy differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dhdn (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate enthalpy differentials with respect to mol numbers while pressure and temperature are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **residual (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual enthalpy. Defaults to False.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific enthalpy (J/mol), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `entropy(self, temp, press, x, phase, dsdt=None, dsdp=None, dsdn=None, residual=False)`
Calculate specific single-phase entropy Note that the order of the output match the default order of input for the differentials. Note further that dsdt, dhsp and dsdn only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate root for specified phase

&nbsp;&nbsp;&nbsp;&nbsp; **dsdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate entropy differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate entropy differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdn (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate entropy differentials with respect to mol numbers while pressure and temperature are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **residual (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual entropy. Defaults to False.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific entropy (J/mol/K), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `idealenthalpysingle(self, temp, j, dhdt=None)`
Calculate specific ideal enthalpy Note that the order of the output match the default order of input for the differentials. Note further that dhdt only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **j (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index (FORTRAN)

&nbsp;&nbsp;&nbsp;&nbsp; **dhdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate ideal enthalpy differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific ideal enthalpy (J/mol), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `idealentropysingle(self, temp, press, j, dsdt=None, dsdp=None)`
Calculate specific ideal entropy Note that the order of the output match the default order of input for the differentials. Note further that dhdt, and dhdp only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **j (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index (FORTRAN)

&nbsp;&nbsp;&nbsp;&nbsp; **dsdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate ideal entropy differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate ideal entropy differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific ideal entropy (J/mol/K), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `solid_enthalpy(self, temp, press, x, dhdt=None, dhdp=None)`
Calculate specific solid-phase enthalpy Note that the order of the output match the default order of input for the differentials. Note further that dhdt, dhdp only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **dhdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate enthalpy differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dhdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate enthalpy differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific enthalpy (J/mol), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `solid_entropy(self, temp, press, x, dsdt=None, dsdp=None)`
Calculate specific solid-phase entropy Note that the order of the output match the default order of input for the differentials. Note further that dsdt, dsdp only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **dsdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate entropy differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate entropy differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific entropy (J/mol.K), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `solid_volume(self, temp, press, x, dvdt=None, dvdp=None)`
Calculate specific solid-phase volume Note that the order of the output match the default order of input for the differentials. Note further that dsdt, dsdp only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **dvdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate volume differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dvdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate volume differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific volume (m3/mol), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `specific_volume(self, temp, press, x, phase, dvdt=None, dvdp=None, dvdn=None)`
Calculate single-phase specific volume Note that the order of the output match the default order of input for the differentials. Note further that dvdt, dvdp and dvdn only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate root for specified phase

&nbsp;&nbsp;&nbsp;&nbsp; **dvdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate molar volume differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dvdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate molar volume differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dvdn (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate molar volume differentials with respect to mol numbers while pressure and temperature are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific volume (m3/mol), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `speed_of_sound(self, temp, press, x, y, z, betaV, betaL, phase)`
Calculate speed of sound for single phase or two phase mixture assuming mechanical, thermal and chemical equilibrium.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **y (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Gas molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Overall molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **betaV (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar gas phase fraction

&nbsp;&nbsp;&nbsp;&nbsp; **betaL (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar liquid phase fraction

&nbsp;&nbsp;&nbsp;&nbsp; **phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate root for specified phase

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Speed of sound (m/s)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `thermo(self, temp, press, x, phase, dlnfugdt=None, dlnfugdp=None, dlnfugdn=None, ophase=None, v=None)`
Calculate logarithm of fugacity coefficient given composition, temperature and pressure. Note that the order of the output match the default order of input for the differentials. Note further that dlnfugdt, dlnfugdp, dlnfugdn and ophase only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition (.)

&nbsp;&nbsp;&nbsp;&nbsp; **phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate root for specified phase

&nbsp;&nbsp;&nbsp;&nbsp; **dlnfugdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate fugacity coefficient differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dlnfugdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate fugacity coefficient differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dlnfugdn (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate fugacity coefficient differentials with respect to mol numbers while pressure and temperature are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **ophase (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase flag. Only set when phase=MINGIBBSPH.

&nbsp;&nbsp;&nbsp;&nbsp; **v (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific volume (m3/mol)

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  fugacity coefficient (-), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `zfac(self, temp, press, x, phase, dzdt=None, dzdp=None, dzdn=None)`
Calculate single-phase compressibility Note that the order of the output match the default order of input for the differentials. Note further that dzdt, dzdp and dzdn only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **x (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate root for specified phase

&nbsp;&nbsp;&nbsp;&nbsp; **dzdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate compressibility differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dzdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate compressibility differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dzdn (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate compressibility differentials with respect to mol numbers while pressure and temperature are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Compressibility (-), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## TVp-property interfaces

Computing properties given Temperature, volume and mole numbers, but evaluate derivatives as functions of (T, p, n). See [Advanced Usage => The different property interfaces](more_advanced.html) for further explanation.

### Table of contents
  * [TVp-property interfaces](#tvp-property-interfaces)
    * [enthalpy_tvp](#enthalpy_tvpself-temp-volume-n-dhdtnone-dhdpnone-dhdnnone-property_flagir)
    * [entropy_tvp](#entropy_tvpself-temp-volume-n-dsdtnone-dsdpnone-dsdnnone-property_flagir)
    * [thermo_tvp](#thermo_tvpself-temp-v-n-phasenone-dlnfugdtnone-dlnfugdpnone-dlnfugdnnone)


### `enthalpy_tvp(self, temp, volume, n, dhdt=None, dhdp=None, dhdn=None, property_flag='IR')`
Calculate enthalpy given temperature, volume and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dhdt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dhdp (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dhdn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (integer, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual (R) and/or ideal (I) entropy. Defaults to IR.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Enthalpy (J)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally enthalpy differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `entropy_tvp(self, temp, volume, n, dsdt=None, dsdp=None, dsdn=None, property_flag='IR')`
Calculate entropy given temperature, pressure and mol numbers.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **dsdt (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdp (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dsdn (No type, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **property_flag (integer, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate residual (R) and/or ideal (I) entropy. Defaults to IR.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Entropy (J/K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Optionally entropy differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `thermo_tvp(self, temp, v, n, phase=None, dlnfugdt=None, dlnfugdp=None, dlnfugdn=None)`
Calculate logarithm of fugacity coefficient given molar numbers, temperature and pressure. Note that the order of the output match the default order of input for the differentials. Note further that dlnfugdt, dlnfugdp, dlnfugdn and ophase only are flags to enable calculation.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **v (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3)

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **phase (Any) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Not in use, may be removed in the future.

&nbsp;&nbsp;&nbsp;&nbsp; **dlnfugdt (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate fugacity coefficient differentials with respect to temperature while pressure and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dlnfugdp (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate fugacity coefficient differentials with respect to pressure while temperature and composition are held constant. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **dlnfugdn (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate fugacity coefficient differentials with respect to mol numbers while pressure and temperature are held constant. Defaults to None.

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  fugacity coefficient (-), and optionally differentials

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Other property interfaces

Property interfaces in other variables than $TV$ or $Tp$, for example computing density given $\mu - T$.

### Table of contents
  * [Other property interfaces](#other-property-interfaces)
    * [density_lnf_t](#density_lnf_tself-temp-lnf-rho_initial)
    * [density_mu_t](#density_mu_tself-temp-mu-rho_initial)
    * [tv_meta_ps](#tv_meta_psself-pressure-entropy-n-volume_initial-temp_initial)


### `density_lnf_t(self, temp, lnf, rho_initial)`
Solve densities (lnf=lnf(T,rho)) given temperature and fugcaity coefficients.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **lnf (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Logaritm of fugacity coefficients.

&nbsp;&nbsp;&nbsp;&nbsp; **rho_initial (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **rho (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Array of component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `density_mu_t(self, temp, mu, rho_initial)`
Solve for densities (mu=mu(T,rho)) given temperature and chemical potential.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **mu (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation.

&nbsp;&nbsp;&nbsp;&nbsp; **rho_initial (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **rho (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Array of component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `tv_meta_ps(self, pressure, entropy, n, volume_initial, temp_initial)`
Solve for temperature and volume given pressure and entropy. A fair initial guess is required. No phase stability is tested, and stable/meta-stable states will be returned depending on input.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **entropy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Entropy (J/K).

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **volume_initial (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for volume (m3).

&nbsp;&nbsp;&nbsp;&nbsp; **temp_initial (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Flash interfaces

Methods for flash calculations.

### Table of contents
  * [Flash interfaces](#flash-interfaces)
    * [guess_phase](#guess_phaseself-temp-press-z)
    * [set_ph_tolerance](#set_ph_toleranceself-tol)
    * [two_phase_phflash](#two_phase_phflashself-press-z-enthalpy-tempnone)
    * [two_phase_psflash](#two_phase_psflashself-press-z-entropy-tempnone)
    * [two_phase_tpflash](#two_phase_tpflashself-temp-press-z)
    * [two_phase_uvflash](#two_phase_uvflashself-z-specific_energy-specific_volume-tempnone-pressnone)


### `guess_phase(self, temp, press, z)`
If only one root exsist for the equation of state the phase type can be determined from either the psedo-critical volume or a volume ratio to the co-volume

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **int:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase int (VAPPH or LIQPH)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_ph_tolerance(self, tol)`
Set tolerance of isobaric-isentalpic (PH) flash

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **tol (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Tolerance

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `two_phase_phflash(self, press, z, enthalpy, temp=None)`
Do isenthalpic-isobaric (HP) flash

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Overall molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **enthalpy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific enthalpy (J/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **FlashResult :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Struct holding the result of the flash (Temperature, phase fractions,

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; phase compositions and phase identifier)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `two_phase_psflash(self, press, z, entropy, temp=None)`
Do isentropic-isobaric (SP) flash

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Overall molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **entropy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific entropy (J/mol/K)

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **FlashResult :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Struct holding the result of the flash (Temperature, phase fractions,

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; phase compositions and phase identifier)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `two_phase_tpflash(self, temp, press, z)`
Do isothermal-isobaric (TP) flash

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Overall molar composition

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **FlashResult :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Struct holding the result of the flash (phase fractions, phase compositions and phase identifier)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `two_phase_uvflash(self, z, specific_energy, specific_volume, temp=None, press=None)`
Do isoenergetic-isochoric (UV) flash

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Overall molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **specific_energy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific energy (J/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **specific_volume (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **press (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **FlashResult :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Struct holding the result of the flash (Temperature, pressure, phase fractions,

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; phase compositions and phase identifier)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Saturation interfaces

Bubble- and dew point calculations and phase envelopes.

### Table of contents
  * [Saturation interfaces](#saturation-interfaces)
    * [_property_index_from_string](#_property_index_from_stringself-prop-str)
    * [binary_triple_point_pressure](#binary_triple_point_pressureself-temp-maximum_pressure150000000-minimum_pressure100000)
    * [bubble_pressure](#bubble_pressureself-temp-z)
    * [bubble_temperature](#bubble_temperatureself-press-z)
    * [dew_pressure](#dew_pressureself-temp-z)
    * [dew_temperature](#dew_temperatureself-press-z)
    * [envelope_isentrope_cross](#envelope_isentrope_crossself-entropy-initial_pressure-z-maximum_pressure150000000-minimum_temperaturenone-step_sizenone-initial_temperaturenone)
    * [get_binary_pxy](#get_binary_pxyself-temp-maximum_pressure150000000-minimum_pressure10-maximum_dz0003-maximum_dlns001)
    * [get_binary_txy](#get_binary_txyself-pressure-minimum_temperature00-maximum_dz0003-maximum_dlns0005)
    * [get_bp_term](#get_bp_termself-i_term)
    * [get_envelope_twophase](#get_envelope_twophaseself-initial_pressure-z-maximum_pressure150000000-minimum_temperaturenone-step_size_factor10-step_sizenone-calc_vfalse-initial_temperaturenone-calc_cricondenfalse)
    * [get_pure_fluid_saturation_curve](#get_pure_fluid_saturation_curveself-initial_pressure-initial_temperaturenone-inone-max_delta_press200000-nmax100-log_linear_gridfalse)
    * [global_binary_plot](#global_binary_plotself-maximum_pressure150000000-minimum_pressure1000000-minimum_temperature1500-maximum_temperature5000-include_azeotropesfalse)
    * [melting_pressure_correlation](#melting_pressure_correlationself-i-maximum_temperaturenone-nmax100-scale_to_eostrue)
    * [saturation_point_from_property_bracket_search](#saturation_point_from_property_bracket_searchself-z-prop_val-prop-temp_1-press_1-x_1-y_1-temp_2-press_2-x_2-y_2)
    * [saturation_points_from_property](#saturation_points_from_propertyself-initial_pressure-z-prop_grid-prop-maximum_pressure150000000-minimum_temperaturenone-step_sizenone)
    * [solid_envelope_plot](#solid_envelope_plotself-initial_pressure-z-maximum_pressure150000000-minimum_temperature1700-calc_esvfalse)
    * [sublimation_pressure_correlation](#sublimation_pressure_correlationself-i-minimum_temperaturenone-nmax100-scale_to_eostrue)


### `_property_index_from_string(self, prop: str)`
Get integer index corresponding to property string

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **prop (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Property (Entropy, Enthalpy, Volume, Pressure, Temperature, Joule-Thompson)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Wrong property specified

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Index of property

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `binary_triple_point_pressure(self, temp, maximum_pressure=15000000.0, minimum_pressure=10000.0)`
Calculate triple point for binary mixture at specified temperature

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on maximum pressure (Pa). Defaults to 1.5e7.

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on minimum pressure (Pa). Defaults to 1.0e4.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **has_triple_point (boolean):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Does the mixture have a triple point?

&nbsp;&nbsp;&nbsp;&nbsp; **x (np.ndarray):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 1 composition

&nbsp;&nbsp;&nbsp;&nbsp; **y (np.ndarray):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Gas composition

&nbsp;&nbsp;&nbsp;&nbsp; **w (np.ndarray):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 2 composition

&nbsp;&nbsp;&nbsp;&nbsp; **P (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `bubble_pressure(self, temp, z)`
Calculate bubble pressure given temperature and composition

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Faild to calculate

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Incipient phase composition

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `bubble_temperature(self, press, z)`
Calculate bubble temperature given pressure and composition

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Faild to calculate

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Incipient phase composition

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `dew_pressure(self, temp, z)`
Calculate dew pressure given temperature and composition

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **z (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Not able to solve for dew point

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Incipient phase composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `dew_temperature(self, press, z)`
Calculate dew temperature given pressure and composition

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **z (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Not able to solve for dew point

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Incipient phase composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `envelope_isentrope_cross(self, entropy, initial_pressure, z, maximum_pressure=15000000.0, minimum_temperature=None, step_size=None, initial_temperature=None)`
Get saturated phase having given entropy. Searches the binodal by tracing it upwards in pressure from the dew point at initial_pressure. Args: entropy (float): Entropy (J/mol/K). initial_pressure (float): Start search from dew point at initial pressure (Pa). z (array_like): Composition (-) maximum_pressure (float , optional): Stop envelope tracking at maximum pressure (Pa). Defaults to 1.5e7. minimum_temperature (float , optional): Exit envelope tracking minimumtemperature (K). Defaults to None. step_size (float , optional): Set maximum step size for envelope trace. Defaults to None. minimum_temperature (float, optional): Not in use initial_temperature (float, optional): Start search from dew point at initial temperature. Overrides initial pressure. Defaults to None (K). Returns: float: Temperature values (K) foat: Pressure values (Pa) float: Specific volume (m3/mol) int: Phase flag for main phase ndarray: Incipient composition (mol/mol) 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_binary_pxy(self, temp, maximum_pressure=15000000.0, minimum_pressure=1.0, maximum_dz=0.003, maximum_dlns=0.01)`
Calculate binary three phase envelope

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on maximum pressure (Pa). Defaults to 1.5e7.

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on minimum pressure (Pa). Defaults to 1.0.

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_dz (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum composition step. Defaults to 0.003.

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_dlns (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum step in most sensitive envelope variable (the specification variable), see `doc/memo/binaryxy` for details on usage. Defaults to 0.01.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **(XYDiagram) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Structure with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

&nbsp;&nbsp;&nbsp;&nbsp; **lle :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 1 - Liquid 2 Equilibrium (PxyEquilibrium) with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x1 -> Liquid 1 composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x2 -> Liquid 2 composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; p -> Pressure [Pa]

&nbsp;&nbsp;&nbsp;&nbsp; **l1ve :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 1 - Vapour Equilibrium (PxyEquilibrium) with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x -> Bubble line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; y -> Dew line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; p -> Pressure [Pa]

&nbsp;&nbsp;&nbsp;&nbsp; **l2ve :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 2 - Vapour Equilibrium (PxyEquilibrium) with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x -> Bubble line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; y -> Dew line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; p -> Pressure [Pa]

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; If one or more of the equilibria are not found the corresponding arrays are empty

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_binary_txy(self, pressure, minimum_temperature=0.0, maximum_dz=0.003, maximum_dlns=0.005)`
Calculate binary isobaric three phase envelope

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on minimum temperature (K).

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_dz (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum composition step. Defaults to 0.003.

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_dlns (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum step in most sensitive envelope variable (the specification variable), see `doc/memo/binaryxy` for details on usage. Defaults to 0.01.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **(XYDiagram) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Structure with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

&nbsp;&nbsp;&nbsp;&nbsp; **lle :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 1 - Liquid 2 Equilibrium (TxyEquilibrium) with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x1 -> Liquid 1 composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x2 -> Liquid 2 composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; T -> Temperature [K]

&nbsp;&nbsp;&nbsp;&nbsp; **l1ve :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 1 - Vapour Equilibrium (TxyEquilibrium) with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x -> Bubble line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; y -> Dew line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; T -> Temperature [K]

&nbsp;&nbsp;&nbsp;&nbsp; **l2ve :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid 2 - Vapour Equilibrium (TxyEquilibrium) with the attributes

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; x -> Bubble line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; y -> Dew line composition (mole fraction of component 1)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; T -> Temperature [K]

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; If one or more of the equilibria are not found the corresponding arrays are empty

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_bp_term(self, i_term)`
Get error description for binary plot error

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **i_term (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  binary plot error identifier

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **str:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Error message

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_envelope_twophase(self, initial_pressure, z, maximum_pressure=15000000.0, minimum_temperature=None, step_size_factor=1.0, step_size=None, calc_v=False, initial_temperature=None, calc_criconden=False)`
Get the phase-envelope at a given composition

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **initial_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Start mapping form dew point at initial pressure (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float , optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on maximum pressure (Pa). Defaults to 1.5e7.

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_temperature (float , optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on minimum temperature (K). Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **step_size_factor (float , optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Scale default step size for envelope trace. Defaults to 1.0. Reducing step_size_factor will give a denser grid.

&nbsp;&nbsp;&nbsp;&nbsp; **step_size (float , optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Set maximum step size for envelope trace. Overrides step_size_factor. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **calc_v (bool, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate specific volume of saturated phase? Defaults to False

&nbsp;&nbsp;&nbsp;&nbsp; **initial_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Start mapping form dew point at initial temperature.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Overrides initial pressure. Defaults to None (K).

&nbsp;&nbsp;&nbsp;&nbsp; **calc_criconden (bool, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate cricondenbar and cricondentherm?

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature values (K)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure values (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray (optional, if `calc_v=True`):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray (optional, if `calc_criconden=True`):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Cricondenbar followed by cricondentherm (T (K), P (Pa), T (K), P (Pa))

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_pure_fluid_saturation_curve(self, initial_pressure, initial_temperature=None, i=None, max_delta_press=20000.0, nmax=100, log_linear_grid=False)`
Get the pure fluid saturation line

&nbsp;&nbsp;&nbsp;&nbsp; **To start mapping from and initial temperature, use:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; get_pure_fluid_saturation_curve(None, initial_temperature=<my_temp>)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **initial_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Start mapping form dew point at initial pressure (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **initial_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Start mapping form dew point at initial temperature (K). Default None.

&nbsp;&nbsp;&nbsp;&nbsp; **i (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  FORTRAN component index. Default None. Must be given if self.nc > 1.

&nbsp;&nbsp;&nbsp;&nbsp; **max_delta_press (float , optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum delta pressure between points (Pa). Defaults to 0.2e5.

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum number of points on envelope. Defaults to 100.

&nbsp;&nbsp;&nbsp;&nbsp; **log_linear_grid (logical, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Use log-linear grid?. Defaults to False.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature values (K)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure values (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific liquid volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific gas volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `global_binary_plot(self, maximum_pressure=15000000.0, minimum_pressure=100000.0, minimum_temperature=150.0, maximum_temperature=500.0, include_azeotropes=False)`
Calculate global binary phase envelope

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on maximum pressure (Pa). Defaults to 1.5e7.

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on minimum pressure (Pa). Defaults to 1.0e5.

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Terminate phase line traceing at minimum temperature. Defaults to 150.0 K.

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Terminate phase line traceing at maximum temperature. Defaults to 500.0 K.

&nbsp;&nbsp;&nbsp;&nbsp; **include_azeotropes (bool, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Include azeotropic lines. Defaults to False.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; tuple of arrays

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `melting_pressure_correlation(self, i, maximum_temperature=None, nmax=100, scale_to_eos=True)`
Calculate melting line form correlation

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **i (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  component FORTRAN index (first index is 1)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Get values up to maximum_temperature. Defaults to correlation limit.

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Number of points in equidistant grid. Defaults to 100.

&nbsp;&nbsp;&nbsp;&nbsp; **scale_to_eos (bool, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Scale pressures to match triple point pressure? Defaults to True

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **T_melt (ndarray):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Melting temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **p_melt (ndarray):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Melting pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `saturation_point_from_property_bracket_search(self, z, prop_val, prop, temp_1, press_1, x_1, y_1, temp_2, press_2, x_2, y_2)`
Get saturated point intersecting with property given as input. Point 1 and 2 are saturation states bracketing the solution.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **prop_val (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Property value where intersect is needed

&nbsp;&nbsp;&nbsp;&nbsp; **prop (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Property (Entropy, Enthalpy, Volume, Pressure, Temperature, Joule-Thompson)

&nbsp;&nbsp;&nbsp;&nbsp; **temp_1 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature of point 1 (K).

&nbsp;&nbsp;&nbsp;&nbsp; **press_1 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure of point 1 (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **x_1 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid compozition of point 1 (mol/mol).

&nbsp;&nbsp;&nbsp;&nbsp; **y_1 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Vapour compozition of point 1 (mol/mol).

&nbsp;&nbsp;&nbsp;&nbsp; **temp_2 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature of point 2 (K).

&nbsp;&nbsp;&nbsp;&nbsp; **press_2 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure of point 2 (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **x_2 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid compozition of point 2 (mol/mol).

&nbsp;&nbsp;&nbsp;&nbsp; **y_2 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Vapour compozition of point 2 (mol/mol).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Not able to solve for property

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature values (K)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure values (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Liquid composition (mol/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Vapour composition (mol/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `saturation_points_from_property(self, initial_pressure, z, prop_grid, prop, maximum_pressure=15000000.0, minimum_temperature=None, step_size=None)`
Get saturated points intersecting with properties given as input. Args: initial_pressure (float): Start search from dew point at initial pressure (Pa). z (array_like): Composition (-) prop_grid (array like): Property values where intersect is needed prop (str): Property (Entropy, Enthalpy, Volume, Pressure, Temperature, Joule-Thompson) maximum_pressure (float , optional): Stop envelope tracking at maximum pressure (Pa). Defaults to 1.5e7. minimum_temperature (float , optional): Exit envelope tracking minimumtemperature (K). Defaults to None. step_size (float , optional): Set maximum step size for envelope trace. Defaults to None.

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature values (K)

&nbsp;&nbsp;&nbsp;&nbsp; **foat:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure values (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **int:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase flag for main phase

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Incipient composition (mol/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `solid_envelope_plot(self, initial_pressure, z, maximum_pressure=15000000.0, minimum_temperature=170.0, calc_esv=False)`
Calculate phase envelope including solid lines

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **initial_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Start mapping from initial pressure (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float , optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exit on maximum pressure (Pa). Defaults to 1.5e7.

&nbsp;&nbsp;&nbsp;&nbsp; **calc_esv (bool, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Calculate specific volume of saturated phase? Defaults to False

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; tuple of arrays

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `sublimation_pressure_correlation(self, i, minimum_temperature=None, nmax=100, scale_to_eos=True)`
Calculate melting line form correlation

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **i (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  component FORTRAN index (first index is 1)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Get values from minimum_temperature. Defaults to correlation limit.

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Number of points in equidistant grid. Defaults to 100.

&nbsp;&nbsp;&nbsp;&nbsp; **scale_to_eos (bool, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Scale pressures to match triple point pressure? Defaults to True

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **T_subl (ndarray):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Sublimation temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **p_subl (ndarray):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Sublimation pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Isolines

Computing isolines.

### Table of contents
  * [Isolines](#isolines)
    * [get_isenthalp](#get_isenthalpself-enthalpy-z-minimum_pressure1000000-maximum_pressure150000000-minimum_temperature2000-maximum_temperature5000-nmax100)
    * [get_isentrope](#get_isentropeself-entropy-z-minimum_pressure1000000-maximum_pressure150000000-minimum_temperature2000-maximum_temperature5000-nmax100)
    * [get_isobar](#get_isobarself-press-z-minimum_temperature2000-maximum_temperature5000-nmax100)
    * [get_isotherm](#get_isothermself-temp-z-minimum_pressure1000000-maximum_pressure150000000-nmax100)
    * [map_meta_isentrope](#map_meta_isentropeself-z-initial_pressure-entropy-minimum_pressure-n_max50)
    * [map_meta_isotherm](#map_meta_isothermself-temperature-z-phase-n50)


### `get_isenthalp(self, enthalpy, z, minimum_pressure=100000.0, maximum_pressure=15000000.0, minimum_temperature=200.0, maximum_temperature=500.0, nmax=100)`
Get isenthalpic line at specified enthalpy. Use as `T, p, v, s = get_isenthalp(h, z)`, where `(T, p, v, s)` is the temperature, pressure, specific volume and specific entropy along the isenthalp with specific enthalpy `h` and molar composition `z`.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **enthalpy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Enthalpy (J/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum pressure. Defaults to 1.0e5. (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum pressure. Defaults to 1.5e7. (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum temperature. Defaults to 200.0. (K)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum temperature. Defaults to 500.0. (K)

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum number of points on isenthalp. Defaults to 100.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **(tuple of arrays) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Corresponding to (temperature, pressure, specific volume, specific entropy) along the

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; isenthalp.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_isentrope(self, entropy, z, minimum_pressure=100000.0, maximum_pressure=15000000.0, minimum_temperature=200.0, maximum_temperature=500.0, nmax=100)`
Get isentrope at specified entropy. Use as `T, p, v, h = get_isenthalp(s, z)`, where `(T, p, v, h)` is the temperature, pressure, specific volume and specific enthalpy along the isentrope with specific entropy `s` and molar composition `z`.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **entropy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Entropy (J/mol/K)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum pressure. Defaults to 1.0e5. (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum pressure. Defaults to 1.5e7. (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum temperature. Defaults to 200.0. (K)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum temperature. Defaults to 500.0. (K)

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum number of points on isentrope. Defaults to 100.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **(tuple of arrays) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Corresponding to (temperature, pressure, specific volume, specific enthalpy) along the

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; isentrope.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_isobar(self, press, z, minimum_temperature=200.0, maximum_temperature=500.0, nmax=100)`
Get isobar at specified pressure. Use as `T, v, s, h = get_isobar(p, z)`, where `(T, v, s, h)` is the temperature, specific volume, specific entropy and specific enthalpy along the isobar with pressure `p` and molar composition `z`.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum temperature. Defaults to 200.0. (K)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum temperature. Defaults to 500.0. (K)

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum number of points on iso-bar. Defaults to 100.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **(tuple of arrays) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Corresponding to (temperature, specific volume, specific entropy, specific enthalpy)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; along the isobar.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_isotherm(self, temp, z, minimum_pressure=100000.0, maximum_pressure=15000000.0, nmax=100)`
Get iso-therm at specified temperature

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Map to minimum pressure. Defaults to 1.0e5. (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **maximum_pressure (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Map to maximum pressure. Defaults to 1.5e7. (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum number of points on iso-therm. Defaults to 100.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Multiple numpy arrays.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `map_meta_isentrope(self, z, initial_pressure, entropy, minimum_pressure, n_max=50)`
Trace isentrope into meta-stable region. Trace from pressure to minimum_pressure

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **initial_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **entropy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Entropy (J/mol/K).

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum pressure (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **n_max (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Number of points on curve. Default 50.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Failure to map isentrope

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `map_meta_isotherm(self, temperature, z, phase, n=50)`
Trace isotherm from saturation line to spinodal. Solve for phase in chemical and thermal equilibrium with a phase defined by z anf phase flag..

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temperature (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **phase (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase with composition z (LIQPH or VAPPH)

&nbsp;&nbsp;&nbsp;&nbsp; **n (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Number of points on curve. Default 50.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Failure to map isotherm

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume of meta-stable phase (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Density (mol/m3) of equilibrium phase in each point, dimension (n,nc).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Stability interfaces

Critical point solver.

### Table of contents
  * [Stability interfaces](#stability-interfaces)
    * [critical](#criticalself-n-temp00-v00-tol1e-07-v_minnone)
    * [critical_pressure](#critical_pressureself-i)
    * [critical_temperature](#critical_temperatureself-i)
    * [critical_volume](#critical_volumeself-i)
    * [density_lnf_t](#density_lnf_tself-temp-lnf-rho_initial)
    * [density_mu_t](#density_mu_tself-temp-mu-rho_initial)
    * [get_critical_parameters](#get_critical_parametersself-i)
    * [map_meta_isentrope](#map_meta_isentropeself-z-initial_pressure-entropy-minimum_pressure-n_max50)
    * [map_meta_isotherm](#map_meta_isothermself-temperature-z-phase-n50)
    * [spinodal](#spinodalself-z-initial_pressure1000000-initial_liquid_temperaturenone-dlnvnone-min_temperature_vapornone)
    * [spinodal_point](#spinodal_pointself-z-pressure-phase-temperaturenone)
    * [tv_meta_ps](#tv_meta_psself-pressure-entropy-n-volume_initial-temp_initial)


### `critical(self, n, temp=0.0, v=0.0, tol=1e-07, v_min=None)`
Calculate critical point in variables T and V

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for temperature (K). Defaults to 0.0.

&nbsp;&nbsp;&nbsp;&nbsp; **v (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for volume (m3/mol). Defaults to 0.0.

&nbsp;&nbsp;&nbsp;&nbsp; **tol (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Error tolerance (-). Defaults to 1.0e-8.

&nbsp;&nbsp;&nbsp;&nbsp; **v_min (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum volume for search (m3/mol). Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Failure to solve for critical point

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `critical_pressure(self, i)`
Get critical pressure of component i

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **i (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  component FORTRAN index (first index is 1)

#### returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  critical pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `critical_temperature(self, i)`
Get critical temperature of component i

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **i (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  component FORTRAN index (first index is 1)

#### returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  critical temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `critical_volume(self, i)`
Get specific critical volume of component i Args: i (int) component FORTRAN index returns: float: specific critical volume 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `density_lnf_t(self, temp, lnf, rho_initial)`
Solve densities (lnf=lnf(T,rho)) given temperature and fugcaity coefficients.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **lnf (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Logaritm of fugacity coefficients.

&nbsp;&nbsp;&nbsp;&nbsp; **rho_initial (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **rho (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Array of component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `density_mu_t(self, temp, mu, rho_initial)`
Solve for densities (mu=mu(T,rho)) given temperature and chemical potential.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **mu (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Flag to activate calculation.

&nbsp;&nbsp;&nbsp;&nbsp; **rho_initial (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **rho (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Array of component densities (mol/m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_critical_parameters(self, i)`
Get critical temperature, volume and pressure of component i

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **i (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  component FORTRAN index (first index is 1)

#### returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  critical temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  critical volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  critical pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `map_meta_isentrope(self, z, initial_pressure, entropy, minimum_pressure, n_max=50)`
Trace isentrope into meta-stable region. Trace from pressure to minimum_pressure

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **initial_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **entropy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Entropy (J/mol/K).

&nbsp;&nbsp;&nbsp;&nbsp; **minimum_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum pressure (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **n_max (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Number of points on curve. Default 50.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Failure to map isentrope

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `map_meta_isotherm(self, temperature, z, phase, n=50)`
Trace isotherm from saturation line to spinodal. Solve for phase in chemical and thermal equilibrium with a phase defined by z anf phase flag..

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temperature (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **phase (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase with composition z (LIQPH or VAPPH)

&nbsp;&nbsp;&nbsp;&nbsp; **n (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Number of points on curve. Default 50.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Failure to map isotherm

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume of meta-stable phase (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Density (mol/m3) of equilibrium phase in each point, dimension (n,nc).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `spinodal(self, z, initial_pressure=100000.0, initial_liquid_temperature=None, dlnv=None, min_temperature_vapor=None)`
Trace spinodal curve

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **initial_pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial pressure (Pa). Defaults to 1.0e5.

&nbsp;&nbsp;&nbsp;&nbsp; **initial_liquid_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial temperature on liquid spinodal (K).

&nbsp;&nbsp;&nbsp;&nbsp; **dlnv (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Override step size (-).

&nbsp;&nbsp;&nbsp;&nbsp; **min_vapor_temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Minimum temperature on vapor spinodal (K).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Failure to trace spinodal

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **np.ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `spinodal_point(self, z, pressure, phase, temperature=None)`
Solve for spinodal curve point. Not able to solve for points close to critical point. Solve for temperature if given, otherwise solve for pressure.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Composition (-)

&nbsp;&nbsp;&nbsp;&nbsp; **pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase flag (VAPPH/LIQPH)

&nbsp;&nbsp;&nbsp;&nbsp; **temperature (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K). Solve for temperature if given.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Raises:

&nbsp;&nbsp;&nbsp;&nbsp; **Exception:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Failure to solve for spinodal curve point

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `tv_meta_ps(self, pressure, entropy, n, volume_initial, temp_initial)`
Solve for temperature and volume given pressure and entropy. A fair initial guess is required. No phase stability is tested, and stable/meta-stable states will be returned depending on input.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **pressure (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa).

&nbsp;&nbsp;&nbsp;&nbsp; **entropy (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Entropy (J/K).

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; **volume_initial (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for volume (m3).

&nbsp;&nbsp;&nbsp;&nbsp; **temp_initial (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial guess for temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Volume (m3).

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Virial interfaces

Retrieve various virial coefficients.

### Table of contents
  * [Virial interfaces](#virial-interfaces)
    * [binary_third_virial_matrix](#binary_third_virial_matrixself-temp)
    * [second_virial_matrix](#second_virial_matrixself-temp)
    * [virial_coeffcients](#virial_coeffcientsself-temp-n)


### `binary_third_virial_matrix(self, temp)`
Calculate composition-independent virial coefficients C, defined as P = RT*rho + B*rho**2 + C*rho**3 + O(rho**4) as rho->0. Including cross coefficients Currently the code only support binary mixtures

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  C - Third virial coefficient matrix (m6/mol2)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `second_virial_matrix(self, temp)`
Calculate composition-independent virial coefficients B, defined as P = RT*rho + B*rho**2 + C*rho**3 + O(rho**4) as rho->0. Including cross coefficients.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  B - Second virial coefficient matrix (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `virial_coeffcients(self, temp, n)`
Calculate (composition-dependent) virial coefficients B and C, defined as P/RT = rho + B*rho**2 + C*rho**3 + O(rho**4) as rho->0.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature

&nbsp;&nbsp;&nbsp;&nbsp; **n (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mol numbers (mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  B (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  C (m6/mol2)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Joule-Thompson interface

Joule-Thompson inversion curves.

### Table of contents
  * [Joule-Thompson interface](#joule-thompson-interface)
    * [joule_thompson_inversion](#joule_thompson_inversionself-z-nmax1000)


### `joule_thompson_inversion(self, z, nmax=1000)`
Calculate Joule-Thompson inversion curve

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **z (array like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Compozition

&nbsp;&nbsp;&nbsp;&nbsp; **nmax (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Array size

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  temp - Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  press - Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  vol - Volume (m3/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Utility methods

Methods for setting ... and getting ...

### Table of contents
  * [Utility methods](#utility-methods)
    * [acentric_factor](#acentric_factorself-i)
    * [compmoleweight](#compmoleweightself-comp-si_unitsfalse)
    * [get_comp_name](#get_comp_nameself-index-get_comp_identifierfalse)
    * [get_comp_structure](#get_comp_structureself-comp_name)
    * [get_enthalpy_of_formation](#get_enthalpy_of_formationself-j)
    * [get_ideal_cp](#get_ideal_cpself-j)
    * [get_numerical_robustness_level](#get_numerical_robustness_levelself)
    * [get_phase_flags](#get_phase_flagsself)
    * [get_phase_type](#get_phase_typeself-i_phase)
    * [get_pmax](#get_pmaxself)
    * [get_pmin](#get_pminself)
    * [get_standard_entropy](#get_standard_entropyself-j)
    * [get_tmax](#get_tmaxself)
    * [get_tmin](#get_tminself)
    * [getcompindex](#getcompindexself-comp)
    * [moleweight](#moleweightself-z-si_unitstrue)
    * [redefine_critical_parameters](#redefine_critical_parametersself-silenttrue-tc_initialsnone-vc_initialsnone)
    * [set_enthalpy_of_formation](#set_enthalpy_of_formationself-j-h0)
    * [set_ideal_cp](#set_ideal_cpself-j-cp_correlation_type-parameters)
    * [set_numerical_robustness_level](#set_numerical_robustness_levelself-level)
    * [set_pmax](#set_pmaxself-press)
    * [set_pmin](#set_pminself-press)
    * [set_standard_entropy](#set_standard_entropyself-j-s0-reference_pressure1bar)
    * [set_tmax](#set_tmaxself-temp)
    * [set_tmin](#set_tminself-temp)


### `acentric_factor(self, i)`
Get acentric factor of component i Args: i (int) component FORTRAN index returns: float: acentric factor 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `compmoleweight(self, comp, si_units=False)`
Get component mole weight (g/mol)

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **comp (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component FORTRAN index

&nbsp;&nbsp;&nbsp;&nbsp; **si_units (bool, optional) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  true for output in kg/mol, false for g/mol

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component mole weight (g/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_comp_name(self, index, get_comp_identifier=False)`
Get component name/identifier

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **index (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component FORTRAN index

&nbsp;&nbsp;&nbsp;&nbsp; **get_comp_identifier (bool):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Get component identifier instead of full name? Default False.

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **comp (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component name/identifier

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_comp_structure(self, comp_name)`
Get component atom structure

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **comp_name (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component name

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **(dict):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Dict with atom as key names and number of atoms as values

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_enthalpy_of_formation(self, j)`
Get specific enthalpy of formation

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **j (integer):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific enthalpy of formation (J/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_ideal_cp(self, j)`
Get correlation parameters for ideal gas Cp

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **j (integer):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **integer:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Ideal Cp correlation identifier

&nbsp;&nbsp;&nbsp;&nbsp; **ndarray:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Parameters

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_numerical_robustness_level(self)`
Get numerical robustness level in Thermopack, where 0 is the default and higher levels increase robustness.

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **level (integer):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  robustness_level

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_phase_flags(self)`
Get phase identifiers used by thermopack

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **int:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase int  identifiers

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_phase_type(self, i_phase)`
Get phase type

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **i_phase (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase flag returned by thermopack

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **str:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Phase type

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_pmax(self)`
Get minimum pressure in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 100 MPa.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_pmin(self)`
Get minimum pressure in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 10 Pa.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_standard_entropy(self, j)`
Get standard entropy at 1bar

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **j (integer):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Specific standard entropy (J/mol/K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_tmax(self)`
Get maximum temperature in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 999 K.

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_tmin(self)`
Get minimum temperature in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 80 K.

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `getcompindex(self, comp)`
Get component index

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **comp (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component name

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **int:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component FORTRAN index

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `moleweight(self, z, si_units=True)`
Get mole weight (kg/mol)

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **z (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Molar composition

&nbsp;&nbsp;&nbsp;&nbsp; **si_units (bool, optional) :** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  true for output in kg/mol, false for g/mol

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **float:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  mixture mole weight (kg/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `redefine_critical_parameters(self, silent=True, Tc_initials=None, vc_initials=None)`
Recalculate critical properties of pure fluids

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **silent (bool):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Ignore warnings? Defaults to True

&nbsp;&nbsp;&nbsp;&nbsp; **Tc_initials (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial value for pure fluid critical temperatures (K). Negative values will trigger use of SRK values from data base.

&nbsp;&nbsp;&nbsp;&nbsp; **vc_initials (array_like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Initial value for pure fluid critical volumes (m3/mol). Negative values will trigger use of SRK values from data base.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_enthalpy_of_formation(self, j, h0)`
Set specific enthalpy of formation

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **j (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index

&nbsp;&nbsp;&nbsp;&nbsp; **h0 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Enthalpy of formation (J/mol)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_ideal_cp(self, j, cp_correlation_type, parameters)`
Set correlation parameters for ideal gas Cp To set a constant Cp value of 2.5*Rgas, simply use: set_ideal_cp(j, 8, [2.5])

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **j (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index

&nbsp;&nbsp;&nbsp;&nbsp; **cp_correlation_type (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Ideal Cp correlation identifier

&nbsp;&nbsp;&nbsp;&nbsp; **parameters (array like):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Parameters (Maximum 21 parameters used)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_numerical_robustness_level(self, level)`
Set numerical robustness level in Thermopack, where 0 is the default and higher levels increase robustness.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **level (integer):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  robustness_level

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_pmax(self, press)`
Set minimum pressure in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 100 MPa.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_pmin(self, press)`
Set minimum pressure in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 10 Pa.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **press (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Pressure (Pa)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_standard_entropy(self, j, s0, reference_pressure='1BAR')`
Set standard entropy

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **j (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component index

&nbsp;&nbsp;&nbsp;&nbsp; **s0 (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Ideal entropy reference (J/mol/K)

&nbsp;&nbsp;&nbsp;&nbsp; **reference_pressure (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Reference pressure (1BAR or 1ATM)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_tmax(self, temp)`
Set maximum temperature in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 999 K.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `set_tmin(self, temp)`
Set minimum temperature in Thermopack. Used to limit search domain for numerical solvers. Default value set on init is 80 K.

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **temp (float):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Temperature (K)

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

## Internal methods

Methods for handling communication with the Fortran library.

### Table of contents
  * [Internal methods](#internal-methods)
    * [\_\_del\_\_](#__del__self)
    * [\_\_init\_\_](#__init__self)
    * [\_\_new\_\_](#__new__cls-args-kwargs)
    * [_get_true_int_value](#_get_true_int_valueself)
    * [activate](#activateself)
    * [add_eos](#add_eosself)
    * [delete_eos](#delete_eosself)
    * [disable_volume_translation](#disable_volume_translationself)
    * [get_export_name](#get_export_nameself-module-method)
    * [get_model_id](#get_model_idself)
    * [init_peneloux_volume_translation](#init_peneloux_volume_translationself-parameter_referencedefault)
    * [init_solid](#init_solidself-scomp)
    * [init_thermo](#init_thermoself-eos-mixing-alpha-comps-nphases-liq_vap_discr_methodnone-csp_eosnone-csp_ref_compnone-kij_refdefault-alpha_refdefault-saft_refdefault-b_exponentnone-trendeosforcpnone-cptypenone-silentnone)


### `__del__(self)`
Delete FORTRAN memory allocated for this instance 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `__init__(self)`
Initialize function pointers 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `__new__(cls, *args, **kwargs)`
Get platform specifics and Load libthermopack.(so/dll/dylib) 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `_get_true_int_value(self)`
Intel FORTRAN uses True=-1, while gfortran uses True=1 Returns: int: Integer representing True of the logical value 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `activate(self)`
Activate this instance of thermopack parameters for calculation 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `add_eos(self)`
Allocate FORTRAN memory for this class instance 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `delete_eos(self)`
de-allocate FORTRAN memory for this class instance 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `disable_volume_translation(self)`
Disable volume translations

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_export_name(self, module, method)`
Generate library export name based on module and method name

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **module (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Name of module

&nbsp;&nbsp;&nbsp;&nbsp; **method (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Name of method

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **str:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Library export name

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `get_model_id(self)`
Get model identification

#### Returns:

&nbsp;&nbsp;&nbsp;&nbsp; **str:** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Eos name

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `init_peneloux_volume_translation(self, parameter_reference='Default')`
Initialize Peneloux volume translations

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **parameter_reference (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  String defining parameter set, Defaults to "Default"

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `init_solid(self, scomp)`
Initialize pure solid

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **scomp (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Component name

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

### `init_thermo(self, eos, mixing, alpha, comps, nphases, liq_vap_discr_method=None, csp_eos=None, csp_ref_comp=None, kij_ref='Default', alpha_ref='Default', saft_ref='Default', b_exponent=None, TrendEosForCp=None, cptype=None, silent=None)`
Initialize thermopack

#### Args:

&nbsp;&nbsp;&nbsp;&nbsp; **eos (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Equation of state

&nbsp;&nbsp;&nbsp;&nbsp; **mixing (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Mixture model for cubic eos

&nbsp;&nbsp;&nbsp;&nbsp; **alpha (str):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Alpha formulations for cubic EOS

&nbsp;&nbsp;&nbsp;&nbsp; **comps (string):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Comma separated list of components

&nbsp;&nbsp;&nbsp;&nbsp; **nphases (int):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Maximum number of phases considered during multi-phase flash calculations

&nbsp;&nbsp;&nbsp;&nbsp; **liq_vap_discr_method (int, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Method to discriminate between liquid and vapor in case of an undefined single phase. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **csp_eos (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Corresponding state equation. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **csp_ref_comp (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  CSP reference component. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **kij_ref (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Data set identifiers. Defaults to "Default".

&nbsp;&nbsp;&nbsp;&nbsp; **alpha_ref (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Data set identifiers. Defaults to "Default".

&nbsp;&nbsp;&nbsp;&nbsp; **saft_ref (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Data set identifiers. Defaults to "Default".

&nbsp;&nbsp;&nbsp;&nbsp; **b_exponent (float, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Exponent used in co-volume mixing. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **TrendEosForCp (str, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Option to init trend for ideal gas properties. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **cptype (int array, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Equation type number for Cp. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; **silent (bool, optional):** 

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  Suppress messages during init?. Defaults to None.

&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 

