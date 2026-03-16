CLASS zcl_170422008_sel_table_exc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_170422008_sel_table_exc IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.

    DATA: name TYPE /dmo/carrier_name.

    SELECT SINGLE FROM /dmo/carrier
        FIELDS name
        WHERE carrier_id = 'SQ'
        INTO @name.

    OUT->WRITE( |Carrier Name is: { name }| ).

ENDMETHOD.
ENDCLASS.
