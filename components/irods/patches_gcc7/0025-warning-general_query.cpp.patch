diff --git a/plugins/database/src/general_query.cpp b/plugins/database/src/general_query.cpp
index 50ee841..ee749f8 100644
--- a/plugins/database/src/general_query.cpp
+++ b/plugins/database/src/general_query.cpp
@@ -2183,7 +2183,6 @@ int chl_gen_query_access_control_setup_impl(
     int maxColSize;
     int currentMaxColSize;
     char *tResult, *tResult2;
-    static int recursiveCall = 0;
 
     if ( logSQLGenQuery ) {
         rodsLog( LOG_SQL, "chlGenQuery" );
@@ -2252,6 +2251,8 @@ int chl_gen_query_access_control_setup_impl(
             }
             cllBindVarCount = cllBindVarCountSave;
         }
+#else
+    static int recursiveCall = 0;
 #endif
 
         status = cmlGetFirstRowFromSql( combinedSQL, &statementNum,
@@ -2281,7 +2282,6 @@ int chl_gen_query_access_control_setup_impl(
         }
 
 #if ORA_ICAT
-        recursiveCall = 0; /* avoid warning */
 #else
         if ( genQueryInp.options & RETURN_TOTAL_ROW_COUNT ) {
             i = cllGetRowCount( icss, statementNum );
