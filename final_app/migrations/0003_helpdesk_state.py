# Generated by Django 4.0.4 on 2022-05-22 16:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('final_app', '0002_rename_student_helpdesk_additional_helpdesk_email_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='helpdesk',
            name='state',
            field=models.BooleanField(blank=True, null=True),
        ),
    ]