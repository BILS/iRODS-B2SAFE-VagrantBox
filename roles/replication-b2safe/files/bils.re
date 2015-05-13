#
acPostProcForModifyDataObjMeta {
        ON($objPath like "\*.replicate") {
                processReplicationCommandFile($objPath);
        }
}
#
acPostProcForModifyDataObjMeta {
        ON($objPath like "\*.pid.create") {
                processPIDCommandFile($objPath);
        }
}
#
