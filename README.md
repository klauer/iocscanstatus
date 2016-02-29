iocscanstatus
=============

bluesky scan status IOC

Installation
============

Install to /epics/iocs/scanstatus

1. update ./config and ./iocBoot/iocscanstatus/st.cmd (search for TODO)

2. Install and enable the IOC

    ```bash
    sudo manage-iocs install scanstatus
    sudo manage-iocs enable scanstatus
    ```

3. Update conserver
    ```bash
    sudo update-iocs-cf
    sudo service conserver reload
    ```

4. Start the IOC
    ```bash
    sudo service softioc-scanstatus start
    ```

5. Check its status
    ```bash
    manage-iocs status
    console scanstatus
    ```
