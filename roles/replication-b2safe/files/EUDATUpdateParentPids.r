#
# Updates parent pids by querying .pid.update command files and passing them to processPIDCommandFile.
# Limits the number of processed command files per one rule run. By default, at most *MaxSuccess
# command files are processed.
#
# Required rulebases: eudat, catchError
#
# Configuration: edit the *Coll INPUT parameter to match the local zone name and the command file collection.
#
# Arguments:
#   *Coll          [INPUT]    The path to the .pid.update files
#   *Suffix        [INPUT]    The suffix of the update files
#
# Author: Jani Heikkinen, CSC
#
update_parent_pid {
        *ContInxOld = 1;
        *SuccessCount = 0;
        *FailedCount = 0;
        *MaxSuccess = 100;
        *Condition=&quot;COLL_NAME = '*Coll' AND DATA_NAME like '*Suffix'&quot;;
        msiMakeGenQuery(&quot;COLL_NAME,DATA_NAME&quot;,*Condition,*GenQInp);
        msiExecGenQuery(*GenQInp, *GenQOut);
        msiGetContInxFromGenQueryOut(*GenQOut,*ContInxNew);
        while(*ContInxOld &gt; 0) {
                if(*ContInxNew == 0) { *ContInxOld = 0; }
                foreach(*GenQOut) {
                        msiGetValByKey(*GenQOut, &quot;COLL_NAME&quot;, *Cname);
                        msiGetValByKey(*GenQOut, &quot;DATA_NAME&quot;, *Dname);
                        *CF=&quot;*Cname/*Dname&quot;;
                        if(errorcode(msiObjStat(*CF,*out)) &gt;= 0) {
                                processPIDCommandFile(*CF);
                                *SuccessCount = *SuccessCount + 1;
                        } else {
                                logInfo(&quot;*file does not exist&quot;);
                                EUDATProcessErrorUpdatePID(*CF);
                                *FailedCount = *FailedCount + 1;
                        }
                }
                *ContInxOld = *ContInxNew;
                if(*SuccessCount &gt; *MaxSuccess) { *ContInxOld = 0; }
                if(*ContInxOld &gt; 0) {msiGetMoreRows(*GenQInp,*GenQOut,*ContInxNew);}
        }
        logInfo(&quot;Updated parent PIDs: *SuccessCount . Failed updates: *FailedCount&quot;);
}
INPUT *Coll = &quot;/ebi/replicate&quot;, *Suffix=&quot;%%.pid.update&quot;
OUTPUT ruleExecOut
