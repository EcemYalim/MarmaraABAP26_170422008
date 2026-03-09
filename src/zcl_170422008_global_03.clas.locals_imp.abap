CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA conn_counter TYPE i.

    CLASS-METHODS class_constructor.

    " Constructor'a yeni parametreleri ekledik
    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
        i_status        TYPE i OPTIONAL
        i_flight_date   TYPE d OPTIONAL
      RAISING
        cx_abap_invalid_value.

    " Set metoduna yeni parametreleri ekledik
    METHODS set_attributes
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id OPTIONAL
        i_status        TYPE i OPTIONAL
        i_flight_date   TYPE d OPTIONAL.

    " Sınıfın kendi değişkenleri
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA status        TYPE i.
    DATA flight_date   TYPE d.

    " Get metoduna yeni parametreleri ekledik
    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id
        e_status        TYPE i
        e_flight_date   TYPE d.
ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.
  METHOD class_constructor.
  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->carrier_id    = i_carrier_id.
    me->connection_id = i_connection_id.
    me->status        = i_status.       " Yeni alan ataması
    me->flight_date   = i_flight_date.  " Yeni alan ataması

    conn_counter = conn_counter + 1.
  ENDMETHOD.

  METHOD get_attributes.
    e_carrier_id    = carrier_id.
    e_connection_id = connection_id.
    e_status        = status.           " Yeni alan ataması
    e_flight_date   = flight_date.      " Yeni alan ataması
  ENDMETHOD.

  METHOD set_attributes.
    carrier_id    = i_carrier_id.
    connection_id = i_connection_id.
    status        = i_status.           " Yeni alan ataması
    flight_date   = i_flight_date.      " Yeni alan ataması
  ENDMETHOD.
ENDCLASS.
