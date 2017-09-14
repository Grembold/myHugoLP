+++
title = "GitLab hinter nginx-Revers-Proxy"
description = "HTTP-Anfragen an andere Server weiterleiten."
date = "2017-09-12T16:35:00+02:00"
draft = false
weight = 60
+++

### Um GitLab unter einer relativen URL verwenden zu können

* [Install GitLab under a relative URL](https://docs.gitlab.com/ce/install/relative_url.html)

{{% alert Hinweis %}} Diese Anleitung beschreibt wie GitLab unter einer relativen URL verwendet werden kann, **nur** bei "installation from sourve". Wenn alternativ zur installation ein *Omnibus* package verwendet wurde, [sind die schritte unterschiedlich](http://docs.gitlab.com/omnibus/settings/configuration.html#configuring-a-relative-url-for-gitlab).  
Nutze diese Anleitung zusammen mit dem [installation guid](https://docs.gitlab.com/ce/install/installation.html), wenn du GitLAb das erste mal installiert.{{% /alert %}}

* [GitLab Docker mit relativen URL](https://hub.docker.com/r/sameersbn/gitlab/#deploy-to-a-subdirectory-relative-url-root)
Dieses Docker Image wird auch von der QNAP Containerstation verwendet.
