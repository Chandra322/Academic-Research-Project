<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Club Management Dashboard</title>
</head>
<body class="bg-gray-100">
    <div class="flex">
        <!-- Include Sidebar -->
        <jsp:include page="clubheadsidebar.jsp" />

        <main class="ml-64 flex-1 p-10">
            <header class="mb-10">
                <div class="flex justify-between items-center">
                    <div>
                        <h1 class="text-4xl font-bold text-gray-800">Dashboard</h1>
                        <p class="text-gray-600 mt-2">Welcome to your club management overview</p>
                    </div>
                    <button class="bg-cyan-500 text-white px-6 py-2 rounded-lg hover:bg-cyan-600 transition-colors">
                        Create New Event
                    </button>
                </div>
            </header>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <!-- Event Statistics Cards -->
                <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-all">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-semibold text-indigo-800">Total Events</h3>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-indigo-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                        </svg>
                    </div>
                    <div class="text-center">
                        <p class="text-4xl font-bold text-indigo-600">145</p>
                        <p class="text-sm text-green-600 mt-2">12% increase this month</p>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-all">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-semibold text-green-800">Active Events</h3>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                        </svg>
                    </div>
                    <div class="text-center">
                        <p class="text-4xl font-bold text-green-600">37</p>
                        <p class="text-sm text-cyan-600 mt-2">5 events starting soon</p>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-all">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-semibold text-purple-800">Registrations</h3>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-purple-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                        </svg>
                    </div>
                    <div class="text-center">
                        <p class="text-4xl font-bold text-purple-600">2,345</p>
                        <p class="text-sm text-orange-600 mt-2">234 new this month</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>