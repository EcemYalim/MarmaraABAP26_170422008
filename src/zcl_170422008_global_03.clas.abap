CLASS zcl_170422008_global_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_170422008_global_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA status TYPE i.           " Yeni eklenen alan
    DATA flight_date TYPE d.      " Yeni eklenen alan

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    " 1-)
    TRY.
        connection = NEW #( i_carrier_id = 'IH'
                            i_connection_id = '0400'
                            i_status = 1               " Örnek statü
                            i_flight_date = '20260212' ). " Örnek tarih YYYYMMDD

        APPEND connection TO connections.

        connection = NEW #( i_carrier_id = 'AA'
                            i_connection_id = '0017'
                            i_status = 2               " Örnek statü
                            i_flight_date = '20260305' ). " Örnek tarih YYYYMMDD

        APPEND connection TO connections.

       CATCH cx_ABAP_INVALID_VALUE.
          out->write( 'Method call failed' ).
     ENDTRY.

     LOOP AT connections INTO connection.
       connection->get_attributes(
         IMPORTING
           e_carrier_id = carrier_id
           e_connection_id = connection_id
           e_status = status            " Sınıftan değeri çekiyoruz
           e_flight_date = flight_date  " Sınıftan değeri çekiyoruz
       ).

       " Çıktıya yeni alanları da ekledik
       out->write( |Flight Connection { carrier_id } { connection_id } - Durum: { status } - Tarih: { flight_date }| ).
     ENDLOOP.

  ENDMETHOD.
ENDCLASS.
