---
layout: post
title: "How GPS Actually Works: Calculating Position from Raw Android GNSS Measurements"
# date: 2020-04-21 21:24:17 -0700
draft: true
categories: technical 
---

## Introduction

GPS is one of those things that everyone uses all the time but nobody really thinks about. A recent conversation I had with friends (who happen to be aerospace engineers) turned up some surprising questions. GPS communication is two-way, right? That's why it doesn't work in cities, because too many people are trying to use it? Don't they have to keep adding satellites as more people use the system? Doesn't the government know when you use the system?

It turns out these are all common misconceptions. The genius of GPS, and the reason it is so ubiquitous, is that communication is one-way. Your device doesn't have to transmit anything to work out its location, so there is no limit to the number of users and the US government has no way of knowing when you use it.

Another fun fact about GPS is that it's the most accurate and widely available time server in the world. You can get (insert accuracy spec)-level accuracy anywhere on the world with GPS coverage, which means, well, anywhere on Earth. GPS is used by both civilian and military aircraft as the primary reference time source. In fact, time synchronization is so central to today's navigation infrastructure that GPS's governing bodies go by the acronym PNT, which stands for Positioning, Navigation and Timing.

Most people have a basic mental model for how GPS works that goes something like, "My phone finds the distance to three satellites and uses that information to triangulate its position." That covers the basics, but it turns out there are some interesting details to this process. This post aims to lay out those details in an easily digestible fashion.

## Basics

First, a few definitions. GPS stands for Global Positioning System, which was developed by the US Air Force and first became operational in 1993. Russia has its own system, called GLONASS (Global Navigation Satellite System), which has been operational since 1995. China and the EU also recently completed constellations, called BeiDou and Galileo, respectively, and Japan and India have their own systems which do not (yet) provide global coverage. The generic term for these systems is GNSS, which stands for Global Navigation Satellite System. Most modern receivers support both GPS and GLONASS, and Galileo and BeiDou have been adopted rapidly in consumer devices over the past few years. To reflect this development the remainder of this post will refer to GNSS generally rather than the US-specific GPS.
