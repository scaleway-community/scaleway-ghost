Official Ghost image on Online Labs
====================================

Scripts to build the official Ghost image on Online Labs

This image is built using [Image Tools](https://github.com/online-labs/image-tools) and depends on the official [Ubuntu](https://github.com/online-labs/image-ubuntu) image.

---

Commands
--------

    # build the image in a rootfs directory
    $ make rootfs
    
    # push the image on s3
    $ make publish_on_s3.tar
    
    # write the image to /dev/nbd1
    $ make install_on_disk
    
Full list of commands available at: https://github.com/online-labs/image-tools/tree/master#commands

Related projects
----------------

- https://github.com/online-labs/image-tools (Main project for building images on Online Labs)
- https://github.com/online-labs/image-builder (Old repository with full history)
- https://github.com/online-labs/ocs-scripts (Common scripts for distributions)
