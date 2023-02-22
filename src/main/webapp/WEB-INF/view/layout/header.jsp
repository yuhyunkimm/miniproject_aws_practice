<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Blog</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .width-58 {
            width: 53%;
        }

        .my-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 10px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-sm bg-light navbar-light ">

        <div class="container-fluid width-58">
            <div class="">
                <a class="navbar-brand" href="/"><i class="fa-brands fa-github-square" style="font-size: 2em;"></i></a>
            </div>

            <div class="collapse navbar-collapse ms-5" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item mx-3 fs-5">
                        <a class="nav-link text-dark" href="/jobs/intro">채용정보</a>
                    </li>
                    <li class="nav-item mx-3 fs-5">
                        <a class="nav-link text-dark" href="/user/resume">이력서</a>
                    </li>

                    <li class="nav-item mx-3 fs-5">
                        <a class="nav-link text-dark" href="/user/interest">관심기업</a>
                    </li>

                </ul>
            </div>

            <div class="d-flex">
                <div class="d-flex">
                    <div class="me-5">
                        <div class="input-group me-4">
                            <div class="form-outline me-4">
                                <input id="search-header" type="search" name="title" class="form-control"
                                    placeholder="검색" style="display: none;"
                                    onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}" />
                            </div>
                            <div class="my-auto">
                                <i class="fa-solid fa-magnifying-glass btn btn-light" onclick="searchBox()"></i>
                            </div>
                        </div>
                    </div>
                    <div class="my-auto ">
                        <a href="/user/myhome">
                            <i class="fa-regular fa-user"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </nav>