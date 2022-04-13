from django.http import HttpRequest, HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from .models import Appointment, Doctor, Patient
# Create your views here.


def About(request):
    return render(request, 'about.html')


def Home(request):
    return render(request, 'home.html')


def Contact(request):
    return render(request, 'contact.html')


def Index(request):
    if not request.user.is_staff:
        return redirect('admin_login')
    doctors = Doctor.objects.all()
    patients = Patient.objects.all()
    appointments = Appointment.objects.all()
    d = 0
    p = 0
    a = 0
    for i in doctors:
        d+=1
    for i in patients:
        p+=1
    for i in appointments:
        a+=1
    d1 = {'d':d, 'p':p, 'a':a}
    return render(request, 'index.html', d1)


def Login(request):
    error = ""
    if request.method == "POST":
        u = request.POST['uname']
        p = request.POST['pwd']
        user = authenticate(username=u, password=p)
        try:
            if user.is_staff:
                login(request, user)
                error = "no"
            else:
                error = "yes"
        except:
            error = "yes"
    d = {'error': error}
    return render(request, 'login.html', d)


def Logout_admin(request):
    if not request.user.is_staff:
        return redirect('admin_login')

    logout(request)
    return redirect('admin_login')


def View_Doctor(request):
    if not request.user.is_staff:
        return redirect('admin_login')
    doc = Doctor.objects.all()
    d = {'doc': doc}
    return render(request, 'view_doctor.html', d)


def Delete_Doctor(request, pid):
    if not request.user.is_staff:
        return redirect('admin_login')
    doctor = Doctor.objects.get(id=pid)
    doctor.delete()
    return redirect('view_doctor')


def Add_Doctor(request):
    error = ""
    if not request.user.is_staff:
        return redirect('admin_login')
    if request.method == "POST":
        n = request.POST['name']
        m = request.POST['mobile']
        sp = request.POST['special']
        try:
            Doctor.objects.create(Name=n, mobile=m, special=sp)
            error = "no"
        except:
            error = "yes"
    d = {'error': error}
    return render(request, 'add_doctor.html', d)


def View_Patient(request):
    if not request.user.is_staff:
        return redirect('admin_login')
    doc = Patient.objects.all()
    d = {'doc': doc}
    return render(request, 'view_patient.html', d)


def Delete_Patient(request, pid):
    if not request.user.is_staff:
        return redirect('admin_login')
    patient = Patient.objects.get(id=pid)
    patient.delete()
    return redirect('view_patient')


def Add_Patient(request):
    error = ""
    if not request.user.is_staff:
        return redirect('admin_login')
    if request.method == "POST":
        n = request.POST['name']
        g = request.POST['gender']
        m = request.POST['mobile']
        ad = request.POST['address']
        try:
            Patient.objects.create(name=n, gender=g, mobile=m, address=ad)
            error = "no"
        except:
            error = "yes"
    d = {'error': error}
    return render(request, 'add_patient.html', d)


def Add_Appointment(request):
    error = ""
    if not request.user.is_staff:
        return redirect('admin_login')
    doctor1 = Doctor.objects.all()
    patient1 = Patient.objects.all()
    if request.method == "POST":
        dc = request.POST['doctor']
        p = request.POST['patient']
        dt = request.POST['date']
        t = request.POST['time']
        doctor = Doctor.objects.filter(Name=dc).first()
        patient = Patient.objects.filter(name=p).first()
        try:
            Appointment.objects.create(
                Doctor=doctor, Patient=patient, date=dt, time=t)
            error = "no"
        except:
            error = "yes"
    d = {'doctor': doctor1, 'patient': patient1, 'error': error}
    return render(request, 'add_appointment.html', d)


def View_Appointment(request):
    if not request.user.is_staff:
        return redirect('admin_login')
    doc = Appointment.objects.all()
    d = {'doc': doc}
    return render(request, 'view_appointment.html', d)


def Delete_Appointment(request, pid):
    if not request.user.is_staff:
        return redirect('admin_login')
    appointment = Appointment.objects.get(id=pid)
    appointment.delete()
    return redirect('view_appointment')
