# Generated by Django 4.0.4 on 2022-05-22 14:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('final_app', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='helpdesk',
            old_name='student',
            new_name='additional',
        ),
        migrations.AddField(
            model_name='helpdesk',
            name='email',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='helpdesk',
            name='userid',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
