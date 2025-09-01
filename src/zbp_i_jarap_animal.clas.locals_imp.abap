CLASS lhc_Animal DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    CLASS-DATA gt_zjatanimal TYPE STANDARD TABLE OF zjatanimal.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Animal RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Animal.

    METHODS read FOR READ
      IMPORTING keys FOR READ Animal RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Animal.

ENDCLASS.

CLASS lhc_Animal IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.

    IF entities IS NOT INITIAL.

      SELECT SINGLE MAX( id ) FROM zjatanimal INTO @DATA(lv_max_id).

      LOOP AT entities INTO DATA(ls_entity).
        lv_max_id += 1.
        ls_entity-%data-Id = lv_max_id.
        INSERT CORRESPONDING #( ls_entity-%data ) INTO TABLE gt_zjatanimal.
      ENDLOOP.

    ENDIF.

  ENDMETHOD.

  METHOD read.

    SELECT *
      INTO CORRESPONDING FIELDS OF TABLE @result
      FROM zjatanimal
      FOR ALL ENTRIES IN @keys
      WHERE id = @keys-Id.

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_JARAP_ANIMAL DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_JARAP_ANIMAL IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    INSERT zjatanimal FROM TABLE @lhc_animal=>gt_zjatanimal.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
