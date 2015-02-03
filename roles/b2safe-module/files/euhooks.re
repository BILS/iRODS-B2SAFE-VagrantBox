acPostProcForPut {
    ON($objPath like "\*.replicate") {
        processReplicationCommandFile($objPath);
    }
}
acPostProcForPut {
    ON($objPath like "\*.pid.create") {
        processPIDCommandFile($objPath);
    }
}
